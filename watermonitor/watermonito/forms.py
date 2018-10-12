#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/10/2 19:14
# @Author  : xc
# @Site    : 
# @File    : forms.py
# @Software: PyCharm
from django.core.validators import RegexValidator


from django import forms
from django.forms import fields,widgets


class LoginForm(forms.Form):
    username =fields.CharField(validators=[RegexValidator(r'^[a-zA-Z0-9_-]{4,16}$'),],\
    error_messages={'required':'用户名不能为空','min_length':'用户名最小4位','max_length':'最大长度16位'})
    password =fields.CharField(error_messages={'invalid':'密码不正确'})

    #validators=[RegexValidator('^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])\
    # (?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/')],




