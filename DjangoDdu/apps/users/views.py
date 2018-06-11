#-*- coding:utf-8 -*-
import json

from django.shortcuts import render,HttpResponse,redirect,render_to_response
from django.views.generic import View
from django.contrib.auth import authenticate,login
from django.db.models import Q
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.contrib.auth import logout
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .forms import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm,UpLoadImgForm,UserInfoForm
from .models import UserProfile,EmailVerifyRecord,Banner
from utils.email_send import send_register_email
from operation.models import UserCourse,UserFavorite,UserMessage
from courses.models import Course,CourseOrg,Teacher


# Create your views here.


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))  # 获取到username的记录
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    def get(self,request):
        # 记住来源的url，如果没有则设置为首页('/')
        request.session['login_from'] = request.META.get('HTTP_REFERER', '/')
        return render(request,'login.html')

    def post(self,request):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(username=username,password=password)
            if user is not None:
                if user.is_active:
                    login(request,user)
                    # 重定向到来源的url
                    return redirect(request.session['login_from'])
                else:
                    return render(request, 'login.html', {'msg': '用户未激活'})
            else:
                return render(request,'login.html',{'msg':'用户名/密码错误'})
        else:
            return render(request,'login.html',{'form':form})


class LogoutView(View):
    def get(self,request):
        logout(request)
        return redirect(request.META.get('HTTP_REFERER', '/'))


class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'register.html',{'register_form':register_form})
    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['email']
            password = register_form.cleaned_data['password']
            if UserProfile.objects.filter(email=username):
                return render(request,'register.html',{'msg':"用户已存在"})
            user_profile = UserProfile()
            user_profile.username = username
            user_profile.email = username
            user_profile.password = make_password(password)
            user_profile.is_active = 0
            user_profile.save()

            send_register_email(username,"register")
            return render(request,"login.html",{'register_form':register_form})
        else:
            return render(request,'register.html',{'register_form':register_form})


class ActiveUserView(View):
    def get(self,request,active_code):
        record_email = EmailVerifyRecord.objects.filter(code=active_code)
        if record_email:

            email = record_email.first().email         # Email 表中的email
            user = UserProfile.objects.get(email=email)  # 根据email查找出User表中的对象
            user.is_active = 1
            user.save()
            return render(request,'login.html')
        else:
            return HttpResponse('激活链接不对')


## 修改用户密码
class ForgetPwdView(View):
    def get(self,request):
        forget_form = ForgetForm()
        return render(request,'forgetpwd.html',{'forget_form':forget_form})
    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = forget_form.cleaned_data['email']
            user = UserProfile.objects.filter(email=email)
            if user:
                send_register_email(email,'forget')
                return render(request,'send_success.html')
            else:
                return render(request, 'forgetpwd.html', {'forget_form': forget_form,'msg':"邮箱不存在"})
        else:
            return render(request,'forgetpwd.html',{'forget_form':forget_form})


class ResetView(View):
    def get(self,request,active_code):
        """通过激活码获取对应的邮箱"""
        record_email_query = EmailVerifyRecord.objects.filter(code=active_code)
        if record_email_query:
            email = record_email_query.first().email
            return render(request,'password_reset.html',{'email':email})
        else:
            return render(request,'email_link_fail.html')


class ModifyPwdView(View):
    def post(self, request):
        print(2)
        modify_pwd_form = ModifyPwdForm(request.POST)
        email = request.POST.get('email')
        if modify_pwd_form.is_valid():
            password = request.POST.get('password')
            password2 = request.POST.get('password2')
            if password != password2:
                return render(request,'password_reset.html',{'msg':'两次密码不一致，请重新输入','email':email})
            email = request.POST.get("email")
            user = UserProfile.objects.get(email=email)
            user.password = make_password(password)
            user.save()
            return redirect('/login/')
        else:
            return render(request,'password_reset.html',{'modify_pwd_form':modify_pwd_form,'email':email})


# 个人中心管理
class UserCenterView(View):
    def get(self,request):
        return render(request,"usercenter/usercenter-info.html")


class UserCourseView(View):
    def get(self,request):
        # 点击学习后，即为我的课程
        my_courses = UserCourse.objects.filter(user=request.user)
        return render(request,"usercenter/usercenter-mycourse.html",{"my_courses":my_courses})


class UserFavCourseView(View):
    def get(self,request):
        """用户收藏的课程在个人中心的展示"""
        fav_courses_records = UserFavorite.objects.filter(user=request.user,fav_type=1)
        fav_courses_ids = [ record.fav_id for record in fav_courses_records ]
        fav_courses = Course.objects.filter(id__in=fav_courses_ids)
        return render(request,"usercenter/usercenter-fav-course.html",{"fav_courses":fav_courses})


class UserFavOrgView(View):
    def get(self,request):
        fav_orgs_records = UserFavorite.objects.filter(user=request.user, fav_type=2)
        fav_orgs_ids = [ record.fav_id for record in fav_orgs_records ]
        fav_orgs = CourseOrg.objects.filter(id__in=fav_orgs_ids)
        return render(request,"usercenter/usercenter-fav-org.html",{"fav_orgs":fav_orgs})


class UserFavTeacherView(View):
    def get(self,request):
        fav_teachers_records = UserFavorite.objects.filter(user=request.user, fav_type=3)
        fav_teachers_ids = [ record.fav_id for record in fav_teachers_records ]
        fav_teachers = Teacher.objects.filter(id__in=fav_teachers_ids)
        return render(request,"usercenter/usercenter-fav-teacher.html",{"fav_teachers":fav_teachers})


class UserMsgView(View):
    def get(self,request):
        all_msgs = UserMessage.objects.filter(user=request.user.id).order_by("has_read")

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_msgs, 5, request=request)  # 4 代表每页显示多少数据
        msgs = p.page(page)  # 返回Page对象，可以看这个对象里有几个元素，此时表示第page页有4条记录。可以看这个对象有没有前页，

        return render(request,"usercenter/usercenter-message.html",{"msgs":msgs})

    def post(self,request):
        read_status = request.POST.get('read_status')
        msg_id = int(request.POST.get("msg_id"))
        if read_status == "已读":
            return HttpResponse(json.dumps({}))
        else:
            # 如果消息未读，则数据库保存为已读
            msg = UserMessage.objects.filter(id=msg_id).first()
            msg.has_read = 1
            msg.save()
            return HttpResponse(json.dumps({'data':"已读"}))


class UploadImgView(View):
    """替换头像"""
    def post(self,request):
        # upload_form = UpLoadImgForm(request.POST,request.FILES,instance=request.user)  # a
        upload_form = UpLoadImgForm(request.POST,request.FILES)  # b
        if upload_form.is_valid():
            # upload_form.save()  # a
            # request.user.image = request.FILES['image']  # b
            request.user.image = upload_form.cleaned_data['image']  # b
            request.user.save()


class CenterModifyPwdView(View):
    """js用的提供的"""
    def get(self,request):
        return HttpResponse('ok')
    def post(self, request):
        print(1)
        ret = {'status':"success",'error':None,'msg':None}
        modify_pwd_form = ModifyPwdForm(request.POST)
        if modify_pwd_form.is_valid():
            password = request.POST.get('password')
            password2 = request.POST.get('password2')
            if password != password2:
                ret['status'] = "fail"
                ret['msg'] = "两次密码不一致，请重新输入"
                return HttpResponse(json.dumps(ret))
            request.user.password = make_password(password)
            request.user.save()
            return HttpResponse(json.dumps(ret))
        else:
            return HttpResponse(json.dumps(modify_pwd_form.errors))


class SendEmailCodeView(View):
    def get(self,request):
        email = request.GET.get('email','')
        if UserProfile.objects.filter(email=email):
            return HttpResponse(json.dumps({"email":"邮箱已经存在"}))
        send_register_email(email,'update')
        return HttpResponse(json.dumps({'status':'success'}))


class UpdateEmailView(View):
    """个人中心邮箱重置"""
    def post(self,request):
        email = request.POST.get('email',"")
        code = request.POST.get('code',"")
        exist_record = EmailVerifyRecord.objects.filter(email=email,code=code)
        if exist_record:
            request.user.email = email
            request.user.save()
            return HttpResponse(json.dumps({'status':'success'}))
        else:
            return HttpResponse(json.dumps({'email':'验证码错误'}))


class UserInfoView(View):
    def post(self,request):
        userinfo_form = UserInfoForm(request.POST,instance=request.user)
        if userinfo_form.is_valid():
               userinfo_form.save()
               return HttpResponse(json.dumps({'status':'success'}))
        else:
            return HttpResponse(json.dumps({'status':'failure','msg':userinfo_form.errors}))


class Test(View):
    def get(self,request):
        userinfo_form = UserInfoForm()
        obj = UserProfile.objects.filter(id=1).first()
        return render(request,'asd.html',{'userinfo_form':userinfo_form,"obj":obj})
    def post(self,request):
        obj = UserProfile.objects.filter(id=1).first()
        userinfo_form = UserInfoForm(request.POST,instance=obj)
        if userinfo_form.is_valid():
            userinfo_form.save()
            return render(request,'asd.html',{'userinfo_form':userinfo_form,"obj":obj})
        else:
            print(userinfo_form.errors,123)
            return render(request, 'asd.html', {'userinfo_form': userinfo_form, "obj": obj})


class IndexView(View):
    def get(self,request):
        # 主轮播图
        banners = Banner.objects.all()
        # 课程轮播图
        banner_courses = Course.objects.filter(is_banner=True)
        # 课程非轮播图
        nobanner_courses = Course.objects.filter(is_banner=False)[:6]
        # 课程机构
        all_orgs = CourseOrg.objects.all()
        lst = [10,11,12,13,14,15]
        return render(request,'index.html',{"banners":banners,
                                            "banner_courses":banner_courses,
                                            "nobanner_courses":nobanner_courses,
                                            "all_orgs":all_orgs,
                                            "lst":lst,
                                            })


def page_not_found(request):
    response = render_to_response('404.html',{})
    # response = render(request,'excepion/404.html',{})
    response.status_code = 404   # 该状态码会影响浏览器的显示
    return response

