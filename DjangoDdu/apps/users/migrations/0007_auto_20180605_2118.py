# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-06-05 21:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20180605_1326'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.CharField(choices=[('register', '注册'), ('forget', '找回密码'), ('update', '修改密码')], max_length=100, verbose_name='验证码类型'),
        ),
    ]
