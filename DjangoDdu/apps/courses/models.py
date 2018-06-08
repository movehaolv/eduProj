#-*- coding:utf-8 -*-
from datetime import datetime

from django.db import models

from organization.models import CourseOrg,Teacher
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name=u"课程机构",blank=True,null=True)
    teacher = models.ForeignKey(Teacher,verbose_name=u"教师",null=True,blank=True)
    name = models.CharField(max_length=100,verbose_name=u"课程名")
    image = models.ImageField(upload_to="courses/%Y/%m",max_length=100,verbose_name=u"封面图片")
    desc = models.CharField(max_length=100,verbose_name=u"课程描述")
    degree = models.CharField(choices=(("gj",u"高级"),("zj",u"中级"),("cj",u"低级")),max_length=2,verbose_name=u"难度")
    learn_time = models.IntegerField(verbose_name=u"学习时长（分钟数）",default=0)
    students = models.IntegerField(verbose_name=u"学习人数",default=0)
    fav_nums = models.IntegerField(verbose_name=u"收藏人数",default=0)
    click_nums = models.IntegerField(verbose_name=u"点击人数",default=0)
    detail = models.TextField(verbose_name=u"课程详情")
    category = models.CharField(max_length=20,default=u"后端开发",verbose_name=u"课程类别")
    tag = models.CharField(max_length=20,verbose_name=u"课程标签",null=True,blank=True)
    add_time = models.DateTimeField(verbose_name=u"添加时间",default=datetime.now)
    is_banner = models.BooleanField(default=False,verbose_name=u"是否轮播课程")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_user(self):
        return self.usercourse_set.all()

    def get_lesson(self):
        return self.lesson_set.all()

    def get_course_nums(self):
        # 获得课程的学习人数，上面的students字段无用
        return self.usercourse_set.all()

    def get_fav_nums(self):
        # 课程的收藏人数
        from operation.models import UserFavorite
        return UserFavorite.objects.filter(fav_id=self.id,fav_type=1)

    def __str__(self):
        return self.name


class LowLevelCourse(Course):
    class Meta:
        verbose_name = u"低级课程"
        verbose_name_plural = verbose_name
        proxy = True   # 设置True只在xadmin中生存2个model管理，不生产数据表


class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name=u"课程")
    name = models.CharField(max_length=100,verbose_name=u"章节名")
    add_time = models.DateTimeField(verbose_name=u"添加时间",default=datetime.now)

    def get_video(self):
        return self.video_set.all()

    class Meta:
        verbose_name = u"章节"
        verbose_name_plural = verbose_name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name=u"章节")
    name = models.CharField(max_length=100,verbose_name=u"视频名")
    url = models.CharField(max_length=50,verbose_name=u"观看路径",default="https://ke.qq.com/")
    learn_time = models.IntegerField(verbose_name=u"学习时长(分钟数)",default=0)
    add_time = models.DateTimeField(verbose_name=u"添加时间",default=datetime.now)

    class Meta:
        verbose_name = u"视频"
        verbose_name_plural = verbose_name


class CourseResource(models.Model):
    course = models.ForeignKey(Course,verbose_name=u"课程")
    name = models.CharField(max_length=100,verbose_name=u"名称")
    download = models.FileField(max_length=100,upload_to="course/resource/%Y%m",verbose_name=u"资源文件")
    add_time = models.DateTimeField(verbose_name=u"添加时间",default=datetime.now)

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

