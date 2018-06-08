import json

from django.shortcuts import render,redirect,HttpResponse,render_to_response
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.utils.decorators import method_decorator
from django.db.models import Q

from .models import Course,CourseResource
from operation.models import UserCourse,UserFavorite,CourseCommemt,UserMessage


def login_required(func):
    def deco(request,*args,**kwargs):
        if not request.user.is_authenticated():
            return redirect("/login/")
        return func(request,*args,**kwargs)
    return deco


class CourseListView(View):
    def get(self,request):
        sort = request.GET.get('sort')
        all_courses = Course.objects.all().order_by("-add_time")
        # 按热度排名
        if sort == 'hot':
            all_courses = all_courses.order_by("-click_nums")
        # 按学习人数排名
        if sort == "students":
            all_courses = all_courses.order_by("-students")

        # 热门课程推荐
        recommend_courses = Course.objects.all().order_by("-click_nums")[:3]

        # 上部搜索框
        keywords = request.GET.get("keywords","")
        all_courses =  all_courses.filter(Q(name__icontains=keywords)|
                                        Q(desc__icontains=keywords)|
                                       Q(detail__icontains=keywords)|
                                       Q(category__icontains=keywords))

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses,6, request=request)   # 4 代表每页显示多少数据
        courses = p.page(page)    # 返回Page对象，可以看这个对象里有几个元素，此时有4个元素。可以看这个对象有没有前页，

        return render(request,'course-list.html',{
                                                "keywords":keywords,
                                                "all_courses":all_courses,
                                                "courses":courses,
                                                'sort':sort,
                                                'recommend_courses':recommend_courses,
                                                })


class CourseDetailView(View):
    """点击课程进入课程详情页"""
    def get(self,request,course_id):
        course = Course.objects.filter(id=course_id).first()

        # 点击人数
        course.click_nums += 1
        course.save()

        # 学习人数
        learn_stds = course.get_user()[:3]

        # 统计课时数
        video_nums = sum([len(x.get_video()) for x in course.get_lesson()])

        # 统计课程的学习人数
        study_nums = UserCourse.objects.filter(course_id=course_id).count()

        # 根据tag进行课程推荐
        tag = course.tag
        recommend_course =  Course.objects.filter(tag=tag).exclude(id=course_id).order_by("-click_nums").first()

        # 课程收藏状态
        fav_course_status = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course.id,fav_type=1,user=request.user):
                fav_course_status = True

        # 课程机构收藏状态
        fav_org_status = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course.course_org_id,fav_type=2,user=request.user):
                fav_org_status = True

        return render(request,'course-detail.html',
                      {
                        "course":course,
                       "learn_stds":learn_stds,
                       "video_nums":video_nums,
                       "recommend_course":recommend_course,
                       "fav_course_status":fav_course_status,
                       "fav_org_status":fav_org_status,
                        "study_nums":study_nums,
                       })



class CourseAddFav(View):
    """课程收藏"""
    def post(self,request):
        ret = {'status':True,'error':None,'data':None}
        fav_id = int(request.POST.get("fav_id"))
        fav_type = int(request.POST.get("fav_type"))
        fav_record = UserFavorite.objects.filter(fav_id=fav_id,fav_type=fav_type)
        if not request.user.is_authenticated():
            ret['status'] = False
            ret['data'] = "用户未登录"
            return HttpResponse(json.dumps(ret))
        if fav_record:
            fav_record.delete()
            ret['data'] = "收藏"
            return HttpResponse(json.dumps(ret))
        else:
            obj = UserFavorite()
            obj.fav_id = fav_id
            obj.fav_type = fav_type
            obj.user = request.user
            obj.save()

            # 收藏课程后发送消息至个人中心
            user_msg = UserMessage()
            user_msg.user = request.user.id
            fav_course = Course.objects.get(id=fav_id)
            user_msg.message = "您收藏了课程机构 [ %s ] 的课程: [ %s ]" %(fav_course.course_org.name,fav_course.name)
            user_msg.has_read = 0
            user_msg.save()

            ret['data'] = "已收藏"
            return HttpResponse(json.dumps(ret))


class CourseInfoView(View):
    @method_decorator(login_required)
    def get(self,request,course_id):
        cur_page1 = "video"
        # 点击我要学习后，给表添加用户课程关系
        if not UserCourse.objects.filter(user=request.user,course_id=course_id):
            user_course = UserCourse()
            user_course.user = request.user
            user_course.course_id = course_id
            user_course.save()

        course = Course.objects.filter(id=course_id).first()
        lessons = course.get_lesson()

        # 课程资源
        course_resource = CourseResource.objects.filter(course_id=course_id).first()
        # 学过该课程的同学还学过的课程
        user_courses = UserCourse.objects.filter(course_id=course_id)
        user_ids = [ user_course.user_id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)   # 获取相关用户所有课程
        course_ids = [user_course.course_id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-students")[:3]

        return render(request,'course-video.html',{
            "cur_page1":cur_page1,
            "course":course,
            "lessons":lessons,
            "course_resource":course_resource,
            "user_courses":user_courses,
            "relate_courses":relate_courses,
        })


# @method_decorator(login_required,name='dispatch')
class CommentView(View):
    @method_decorator(login_required)
    def get(self,request,course_id):
        # 点击我要学习后，给表添加用户课程关系
        cur_page1 = "comment"
        course = Course.objects.filter(id=course_id).first()
        lessons = course.get_lesson()

        # 课程资源
        course_resource = CourseResource.objects.filter(course_id=course_id).first()
        # 学过该课程的同学还学过的课程
        user_courses = UserCourse.objects.filter(course_id=course_id)
        user_ids = [ user_course.user_id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)   # 获取相关用户所有课程
        course_ids = [user_course.course_id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-students")[:3]

        # 添加课程评价
        course_comment = CourseCommemt.objects.filter(course_id=course_id)
        return render(request,'course-comment.html',{
            "cur_page1": cur_page1,
            "course":course,
            "course_comment":course_comment,
            "course_resource": course_resource,
            "user_courses": user_courses,
            "relate_courses": relate_courses,
        })

    def post(self,request,course_id):
        ret = {'status':True,'error':None,'data':None}
        comment = request.POST.get('comment')
        if int(course_id) > 0:
            course_comment = CourseCommemt()
            course_comment.user = request.user
            course_comment.course_id = course_id
            course_comment.comments = comment
            course_comment.save()
            return HttpResponse(json.dumps(ret))
        else: # 可能有后端删除该课程
            ret['status'] = False
            ret['error'] = "添加失败"
            return HttpResponse(json.dumps(ret))




