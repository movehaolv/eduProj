#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/13 23:10'

from .models import UserAsk,UserCourse,UserFavorite,UserMessage,CourseCommemt
import xadmin


class  UserAskAdmin(object):
    list_display = ['name','mobile','course_name','add_time']
    search_fileds = ['name','mobile','course_name']
    list_filter = ['name','mobile','course_name','add_time']


class  UserCourseAdmin(object):
    list_display = ['user','course','add_time']
    search_fileds = ['user','course']
    list_filter = ['user','course','add_time']


class  UserFavoriteAdmin(object):
    list_display = ['user','fav_id','fav_type','add_time']
    search_fileds = ['user','fav_id','fav_type']
    list_filter = ['user','fav_id','fav_type','add_time']


class  UserMessageAdmin(object):
    list_display = ['user','message','has_read','add_time']
    search_fileds = ['user','message','has_read']
    list_filter = ['user','message','has_read','add_time']


class  CourseCommemtAdmin(object):
    list_display = ['user','course','comments','add_time']
    search_fileds = ['user','course','comments']
    list_filter = ['user','course','comments','add_time']


xadmin.site.register(UserAsk,UserAskAdmin)
xadmin.site.register(UserCourse,UserCourseAdmin)
xadmin.site.register(UserFavorite,UserFavoriteAdmin)
xadmin.site.register(UserMessage,UserMessageAdmin)
xadmin.site.register(CourseCommemt,CourseCommemtAdmin)

