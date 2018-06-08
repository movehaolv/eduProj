#-*- coding:utf-8 -*-
from datetime import datetime

from django.db import models

# Create your models here.


class CityDict(models.Model):
    name = models.CharField(max_length=20,verbose_name=u"城市名称")
    desc = models.CharField(max_length=200,verbose_name=u"城市描述")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u"城市"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseOrg(models.Model):
    city = models.ForeignKey(CityDict,verbose_name=u"所在城市")
    name = models.CharField(max_length=100,verbose_name=u"机构名称")
    category = models.CharField(default='pxjg',choices=(("pxjg",u"培训机构"),("gx",u"高校"),("gr",u"个人")),max_length=10,verbose_name=u"机构类别")
    desc = models.TextField(verbose_name=u"机构描述")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏人数")
    click_nums = models.IntegerField(default=0,verbose_name=u"点击人数")
    addr = models.CharField(max_length=100,verbose_name=u"机构地址")
    courses_num = models.IntegerField(verbose_name=u"课程数",default=0)
    students_num = models.IntegerField(verbose_name=u"学习人数",default=0)
    image = models.ImageField(upload_to="org/%Y%m",verbose_name="logo")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')
    tag = models.CharField(default=u'全国知名',verbose_name=u"机构标签",max_length=10)

    def get_course(self):
        return self.course_set.all()

    def get_teacher(self):
        return self.teacher_set.all()

    class Meta:
        verbose_name = u"课程机构"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name=u"所属机构")
    name = models.CharField(max_length=100,verbose_name=u"教师名")
    points = models.CharField(max_length=100,verbose_name=u"教学特点")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏人数")
    click_nums = models.IntegerField(default=0,verbose_name=u"点击人数")
    work_years = models.IntegerField(verbose_name=u"工作年限")
    work_position = models.CharField(max_length=100,verbose_name=u"公司职位")
    work_company = models.CharField(max_length=100,verbose_name=u"就职公司")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')
    image = models.ImageField(upload_to="teacher/%Y%m", verbose_name=u"头像",null=True,blank=True)

    class Meta:
        verbose_name = u"教师"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
