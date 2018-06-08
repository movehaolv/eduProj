import json

from django.shortcuts import render,HttpResponse
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.utils.decorators import method_decorator
from django.db.models import Q

from organization.models import Teacher
from operation.models import UserFavorite,UserMessage,UserCourse
# Create your views here.


class TeacherListView(View):
    def get(self,request):
        all_teachers = Teacher.objects.all()
        # 点击量排序
        sort = request.GET.get("sort")
        if sort == 'hot':
            all_teachers = all_teachers.order_by("-click_nums")

        # 工作年限进行讲师排行
        recommend_teachers = all_teachers.order_by("-work_years")[:3]

        # 上部搜索框
        keywords = request.GET.get("keywords","")
        all_teachers =  all_teachers.filter(Q(name__icontains=keywords)|
                                            Q(work_years__icontains=keywords))

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers,5, request=request)   # 4 代表每页显示多少数据
        teachers = p.page(page )    # 返回Page对象，可以看这个对象里有几个元素，此时表示第page页有4条记录。可以看这个对象有没有前页，
        return render(request,'teachers-list.html',{
            "all_teachers":all_teachers,
            'teachers':teachers,
            "sort": sort,
            "recommend_teachers":recommend_teachers,
            "keywords":keywords,
        })


class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.filter(id=teacher_id).first()
        # 统计该教师被收藏的次数
        fav_users_num = UserFavorite.objects.filter(fav_type=3,fav_id=int(teacher_id)).count()
        teacher.fav_nums = fav_users_num
        # 教师点击数+1
        teacher.click_nums += 1
        teacher.save()
        # 老师教的课程
        courses = teacher.course_set.all()
        # 机构讲师排行
        org_teachers = teacher.org.teacher_set.all().order_by("-work_years")[:3]

        # 确认是否收藏
        favor_teacher = False
        favor_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(teacher_id),fav_type=3):
                favor_teacher = True
            if UserFavorite.objects.filter(user=request.user,fav_id=int(teacher.org_id),fav_type=2):
                favor_org = True
        return render(request,'teacher-detail.html',{
            "teacher":teacher,
            "courses":courses,
            "org_teachers":org_teachers,
            "favor_teacher":favor_teacher,
            "favor_org":favor_org,
        })


class AddFavView(View):
    def post(self,request):
        ret = {'status':True,'error':None,'data':None}
        fav_id = int(request.POST.get('fav_id'))
        fav_type = int(request.POST.get("fav_type"))
        if not request.user.is_authenticated():
            ret['status'] = False
            ret['data'] = "用户未登录"
            return HttpResponse(json.dumps(ret))
        # 判断是否已经收藏
        exist_record = UserFavorite.objects.filter(user=request.user,fav_id=fav_id,fav_type=fav_type)
        if exist_record: # 用户已收藏则删除记录
            exist_record.delete()
            ret['data'] = "收藏"
            return HttpResponse(json.dumps(ret))
        else:
            user_fav = UserFavorite()
            user_fav.user = request.user
            user_fav.fav_id = fav_id
            user_fav.fav_type = fav_type
            user_fav.save()
            ret['data'] = "已收藏"

            # 收藏教师后发送消息至个人中心
            user_msg = UserMessage()
            user_msg.user = request.user.id
            fav_teacher = Teacher.objects.get(id=fav_id)
            user_msg.message = "您收藏了教师 [ %s ]" %(fav_teacher.name)
            user_msg.has_read = 0
            user_msg.save()

        return HttpResponse(json.dumps(ret))

