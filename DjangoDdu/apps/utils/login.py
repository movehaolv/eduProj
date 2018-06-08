#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/6/3 20:58'
from django.shortcuts import render,redirect,HttpResponse


def login_required(func):
    def deco(request,*args,**kwargs):
        if not request.user.is_authenticated():
            return redirect("/login/")
        return func(request,*args,**kwargs)
    return deco
