import json

from django.shortcuts import render,redirect,HttpResponse
from django.views.generic import View
from django.db.models import Q

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .models import CityDict,CourseOrg

from operation.models import UserFavorite,UserMessage
from .forms import UserAskForm

# Create your views here.


class OrgView(View):
    def get(self,request):
        Citys = CityDict.objects.all()
        Orgs =  CourseOrg.objects.all()

        # 城市筛选
        cur_city = request.GET.get('city','')
        if cur_city:
            Orgs = Orgs.filter(city__id=int(cur_city))

        # 类别筛选
        cur_category = request.GET.get('category',"")
        if cur_category:
            Orgs = Orgs.filter(category=cur_category)

        # 点击数排名
        hot_orgs = Orgs.order_by("-click_nums")[:3]

        # 按学生人数进行倒序
        sort = request.GET.get('sort', '')
        if sort == 'students':
            Orgs = Orgs.order_by("-students_num")
        # 按课程数倒序
        if sort == 'courses':
            Orgs = Orgs.order_by("-courses_num")

        # 上部搜索框
        keywords = request.GET.get("keywords","")
        Orgs =  Orgs.filter( Q(name__icontains=keywords)|
                                Q(desc__icontains=keywords)|
                                Q(addr__icontains=keywords)|
                                Q(category__icontains=keywords))

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # Orgs = [x for x in range(100)]
        p = Paginator(Orgs,4, request=request)
        orgs = p.page(page )

        # 统计所有机构
        OrgsNum = Orgs.count()

        return render(request,'org-list.html',{
                                                "keywords":keywords,
                                                "Citys":Citys,
                                               "orgs":orgs,
                                               'OrgsNum':OrgsNum,
                                               "cur_city":cur_city,
                                               "cur_category":cur_category,
                                               "hot_orgs":hot_orgs,
                                               'sort':sort,
                                               })


class AddUserAskView(View):
    def post(self,request):
        ret = {'status': True, 'error': None, 'data': None}
        userAsk_form = UserAskForm(request.POST)
        if userAsk_form.is_valid():
            userAsk_form.save()
            ret['data'] = "您的咨询已收到，我们会马上与您联系"
            return HttpResponse(json.dumps(ret))
        else:
            ret['error'] = userAsk_form.errors['mobile'][0]
            ret['status'] = False
            return HttpResponse(json.dumps(ret))


class OrgHomeView(View):
    def get(self,request,org_id):
        favor = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(org_id),fav_type=2):
                favor = True
        course_org = CourseOrg.objects.get(id=int(org_id))
        courses = course_org.course_set.all()[:3]
        #
        teachers = course_org.teacher_set.all()[:2]
        return render(request,'org-detail-homepage.html',{"courses":courses,
                                                          "course_org":course_org,
                                                          "teachers":teachers,
                                                          "favor":favor,
                                                          })


class OrgCourseView(View):
    def get(self,request,org_id):
        favor = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(org_id),fav_type=2):
                favor = True
        course_org = CourseOrg.objects.get(id=int(org_id))
        courses = course_org.course_set.all()
        return render(request,'org-detail-course.html',{"courses":courses,
                                                        "course_org":course_org,
                                                        "favor": favor,
                                                        })


class OrgDescView(View):
    def get(self,request,org_id):
        favor = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(org_id),fav_type=2):
                favor = True
        course_org = CourseOrg.objects.get(id=int(org_id))
        return render(request,'org-detail-desc.html',{"course_org":course_org,
                                                      "favor": favor,
                                                      })


class OrgTeacherView(View):
    def get(self,request,org_id):
        favor = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(org_id),fav_type=2):
                favor = True
        course_org = CourseOrg.objects.get(id=int(org_id))
        teachers = course_org.teacher_set.all()
        return render(request,'org-detail-teachers.html',{"course_org":course_org,
                                                          "teachers":teachers,
                                                          })


class AddFavView(View):
    def post(self,request):
        ret = {'status':True,'data':None,'error':None}
        if not request.user.is_authenticated():
            ret['status'] = False
            return HttpResponse(json.dumps(ret))
        # 判断该机构是否已经被收藏，如果已收藏：数据库删除该记录，变成未收藏
        org_id = request.POST.get("fav_id",0)   # 如果不写0，如果未取到fav_id则为None，下面的filter中fav_id=None的话会错
        fav_type = request.POST.get("fav_type",0)
        exist_record = UserFavorite.objects.filter(user=request.user,fav_id=int(org_id),fav_type=int(fav_type))
        # 该机构已经被用户收藏则取消收藏
        if exist_record:
            exist_record.delete()
            ret['data'] = "收藏"
            return HttpResponse(json.dumps(ret))
        # 该机构未被用户收藏
        else:
            if int(org_id) > 0 and int(fav_type) > 0:
                userFav = UserFavorite()
                userFav.user = request.user
                userFav.fav_id = int(org_id)
                userFav.fav_type = int(fav_type)
                userFav.save()
                ret['data'] = "已收藏"

                # 收藏机构后发送消息至个人中心
                user_msg = UserMessage()
                user_msg.user = request.user.id
                fav_org = CourseOrg.objects.get(id=org_id)
                user_msg.message = "您收藏了课程机构 [ %s ] " % (fav_org.name)
                user_msg.has_read = 0
                user_msg.save()

                return HttpResponse(json.dumps(ret))
            else:
                ret['status'] = False
                ret['data'] = "收藏出错"
                return HttpResponse(json.dumps(ret))


