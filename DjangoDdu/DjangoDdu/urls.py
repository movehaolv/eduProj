"""DjangoDdu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.contrib import admin
# from t1.views import t1index,t1login
import xadmin

from django.views.generic import TemplateView
from django.conf.urls import url,include
from django.views.static import serve

from users.views import LoginView,RegisterView,ActiveUserView,ForgetPwdView,ResetView,ModifyPwdView,LogoutView,IndexView
from DjangoDdu.settings import MEDIA_ROOT,STATIC_ROOT

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$',IndexView.as_view(),name='index'),
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^logout/$',LogoutView.as_view(),name='logout'),
    url(r'^register/$',RegisterView.as_view(),name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$',ActiveUserView.as_view(),name='active'),
    url(r'^forget/$',ForgetPwdView.as_view(),name='forget'),
    url(r'reset/(?P<active_code>.*)/$',ResetView.as_view(),name='reset'),
    url(r'modify_pwd/$',ModifyPwdView.as_view(),name='modify_pwd'),
    #url(r'^t1index/$', t1index),
    # url(r'^t1login/$', t1login),
    # 课程机构
    url(r'^org/',include('organization.urls',namespace='org')),
    # 课程
    url(r'^course/',include('courses.urls',namespace='course')),
    # 教师
    url(r'^teacher/',include('teacher.urls',namespace='teacher')),
    # 个人中心
    url(r'^user/',include('users.urls',namespace='user')),
    # 文件上传路径
    url(r'^media/(?P<path>.*)$',serve,{'document_root':MEDIA_ROOT}),
    # http错误页面
    url(r'^static/(?P<path>.*)$',serve,{'document_root':STATIC_ROOT}),

]

# 全局404页面处理
handler_404 = 'users.views.page_not_found'


