#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/13 22:07'

from .models import Course,Lesson,Video,CourseResource,LowLevelCourse
import xadmin


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail','add_time']
    search_fields = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail']
    list_filter = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail','add_time']

    def queryset(self):
        qs = super(CourseAdmin,self).queryset()
        qs = qs.exclude(degree="cj")
        return qs

class LowLevelCourseAdmin(object):
    list_display = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail','add_time']
    search_fields = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail']
    list_filter = ['name','image','desc','degree','learn_time','students','fav_nums','click_nums','detail','add_time']

    def queryset(self):
        qs = super(LowLevelCourseAdmin,self).queryset()
        qs = qs.filter(degree="cj")
        return qs

xadmin.site.register(LowLevelCourse,LowLevelCourseAdmin)

class LessonAdmin(object):
    list_display = ['course', 'name','add_time']
    search_fields = ['course', 'name']
    list_filter = ['course','course__name','name','add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name','add_time']
    search_fields = ['course', 'name']
    list_filter = ['lesson', 'name','add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name','download','add_time']
    search_fields = ['course', 'name','download']
    list_filter = ['course', 'name','download','add_time']


xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)


