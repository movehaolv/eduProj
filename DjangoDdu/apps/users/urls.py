
from django.conf.urls import url,include

from .views import UserCenterView,UserCourseView,UserFavCourseView,UserFavOrgView,UserFavTeacherView,Test
from .views import UserMsgView,UploadImgView,CenterModifyPwdView,UpdateEmailView,SendEmailCodeView,UserInfoView


urlpatterns = [
    # 个人信息
    url(r'^center/$', UserCenterView.as_view(),name="center"),
    # 用户学习的课程
    url(r'^course/$', UserCourseView.as_view(),name="course"),
    #　用户收藏的课程，机构，教师
    url(r'^fav-course/$', UserFavCourseView.as_view(),name="fav_course"),
    url(r'^fav-org/$', UserFavOrgView.as_view(),name="fav_org"),
    url(r'^fav-teacher/$', UserFavTeacherView.as_view(),name="fav_teacher"),
    #　个人中心小喇叭用户消息提示
    url(r'^msg/$', UserMsgView.as_view(),name="msg"),
    # 替换用户头像
    url(r'upload_img/$',UploadImgView.as_view(),name="upload_img"),
    # 修改密码
    url(r'modify_pwd/$',CenterModifyPwdView.as_view(),name="modify_pwd"),
    # 发送邮箱验证码
    url(r'sendemail_code/$',SendEmailCodeView.as_view(),name="sendemail_code"),
    # 重置邮箱
    url(r'update_email/$',UpdateEmailView.as_view(),name="update_email"),
    # 提交整个个人信息表单
    url(r'info/$', UserInfoView.as_view(), name="info"),

    url(r'test/$', Test.as_view(),name='test'),


]
