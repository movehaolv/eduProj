#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/16 12:35'
import re

from django import forms
from captcha.fields import CaptchaField

from .models import UserProfile


class LoginForm(forms.Form):
    username = forms.CharField(required=True,max_length=20)
    password = forms.CharField(required=True,min_length=5)

class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True,min_length=5)
    captcha = CaptchaField(error_messages={"invalid":u"验证码错误"})

class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid":u"验证码错误"})


class ModifyPwdForm(forms.Form):
    password = forms.CharField(required=True,min_length=5)
    password2 = forms.CharField(required=True,min_length=5)


class UpLoadImgForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name','gender','birthday','mobile','address']

    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile')
        print('asd')
        if re.match(r'^(13\d|14[5|7]|15\d|166|17[3|6|7]|18\d)\d{8}$', mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法", code='mobile invalid')


