# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-28 20:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0006_auto_20180528_2019'),
    ]

    operations = [
        migrations.AlterField(
            model_name='video',
            name='url',
            field=models.CharField(default='https://ke.qq.com/', max_length=50, verbose_name='观看路径'),
        ),
    ]