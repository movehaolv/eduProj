#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : haolv
__data__ = '2018/5/18 14:51'

import random

from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from DjangoDdu.settings import EMAIL_FROM

def random_str(randomLength=8):
    """out random str"""
    chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
    str = ""
    for i in range(randomLength):
            j = random.randint(0,len(chars)-1)
            str += chars[j]
    return str

def send_register_email(email,send_type="register"):
    email_record = EmailVerifyRecord()
    if send_type == "update":
        code = random_str(4)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type  == "register":
        email_title = "用户注册链接"
        email_body = "点击下面链接激活账号：http://127.0.0.1:8000/active/{0}".format(code)
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass

    elif send_type == "forget":
        email_title = "重置密码连接"
        email_body = "点击下面链接进行密码重置：http://127.0.0.1:8000/reset/{0}".format(code)
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass

    elif send_type == "update":
        email_title = "邮箱验证码"
        email_body = "您的邮箱验证码为: {0}".format(code)
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass

