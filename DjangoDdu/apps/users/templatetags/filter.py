#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/6/6 18:20'

import re


from django import template
register = template.Library()

@register.filter
def trans(date_time):
    date_time =date_time.strftime("%Y-%m-%d")
    lst = re.findall(r"(\d+)", date_time)
    return "%s-%s-%s" % (lst[0], lst[1], lst[2])