#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/13 23:00'

from .models import CourseOrg,CityDict,Teacher
import xadmin


class CityDictAdmin(object):
    list_display = ['name','desc','add_time']
    search_fileds = ['name','desc']
    list_filter = ['name','desc','add_time']


class CourseOrgAdmin(object):
    list_display = ['city','name','desc','fav_nums','click_nums','addr','image','add_time']
    search_fileds = ['city','name','desc','fav_nums','click_nums','addr','image']
    list_filter = ['city','city__name','name','desc','fav_nums','click_nums','addr','image']


class TeacherAdmin(object):
    list_display = ['org','name','points','fav_nums','click_nums','work_years','work_position','work_company','add_time']
    search_fileds = ['org','name','points','fav_nums','click_nums','work_years','work_position','work_company']
    list_filter = ['org__name','name','points','fav_nums','click_nums','work_years','work_position','work_company','add_time']


xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(Teacher,TeacherAdmin)

