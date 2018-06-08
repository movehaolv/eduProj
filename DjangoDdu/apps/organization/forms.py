#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/22 21:26'

import re

from django import forms

from operation.models import UserAsk


class UserAskForm(forms.ModelForm):
    class Meta:
        model = UserAsk
        exclude = ['add_time']

    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile')
        if re.search(r'[a-z]',mobile):
            raise forms.ValidationError(u"不能输入字母", code='mobile invalid')
        if re.match(r'^(13\d|14[5|7]|15\d|166|17[3|6|7]|18\d)\d{8}$',mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法",code='mobile invalid')

