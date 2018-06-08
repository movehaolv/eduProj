#-*- coding:utf-8 -*-
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50,verbose_name=u'昵称',default=u"")
    birthday = models.DateField(verbose_name=u"生日",null=True,blank=True)
    gender = models.CharField(max_length=6,choices=(('male',u'男'),('female',u'女')),default='female')
    address = models.CharField(max_length=100,default=u"")
    mobile = models.CharField(max_length=11,verbose_name=u"手机",null=True,blank=True)
    image = models.ImageField(upload_to="image/%Y/%m",default="image/2018/05/default_middile_2.png",max_length=100)

    def __str(self):
        return self.username

    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name
        unique_together = (("email"),)

    def get_user_msgs(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id,has_read=0).count()

class EmailVerifyRecord(models.Model):
    code = models.CharField(verbose_name=u"验证码",max_length=100)
    email = models.EmailField(verbose_name=u"邮箱")
    send_type = models.CharField(max_length=100,verbose_name=u"验证码类型",choices=(("register","注册"),("forget","找回密码"),('update',"修改邮箱")))
    send_time = models.DateTimeField(default=datetime.now,verbose_name=u'发送时间')

    class Meta:
        verbose_name = u"邮箱验证"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{0},{1}".format(self.email,self.send_time)  # 这会在xadmin后台管理中成功添加数据后返回的导航提示


class Banner(models.Model):
    title = models.CharField(max_length=100,verbose_name=u"标题")
    image = models.ImageField(max_length=100,upload_to="banner/%Y/%m",verbose_name=u"轮播图片")
    url = models.URLField(max_length=200,verbose_name=u"访问地址")
    index = models.IntegerField(verbose_name=u"播放顺序",default=100)
    add_time = models.DateTimeField(verbose_name=u"添加时间",default=datetime.now)

    class Meta:
        verbose_name = u"轮播图片"
        verbose_name_plural = verbose_name
