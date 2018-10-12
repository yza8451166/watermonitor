from django.shortcuts import render

# Create your views here.
from .forms import LoginForm
# from watermonitor import final_value
from django.shortcuts import HttpResponse, render, redirect
import io
from watermonito import models
from .utils import check_code as CheckCode
import time
import json

from watermonito.utils.pager import Pagination


def login_required(func):
    def inner(request,*args,**kwargs):
        print('login_requiredlogin_requiredlogin_requiredlogin_requiredlogin_required')

        # print('request.session[is_login]:',request.session['is_login'])
        # if not self.session['is_login']:
        value =request.session.get('is_login',None)
        if not value:
            return redirect('/login/')
        print('xxxxxxxxxxxxxxxxxxxxx')
        return func(request,*args,**kwargs)

    return inner









def check_code(request):
    """


    获取验证码
    :param request:
    :return:
    """
    stream = io.BytesIO()
    img, code = CheckCode.create_validate_code()
    img.save(stream, "PNG")
    request.session["CheckCode"] = code
    return HttpResponse(stream.getvalue())


def login(request):
    if request.method == 'GET':
        # print('111111111111111111111')

        return render(request, 'login.html')
    elif request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            values = form.clean()
            print('values', values)
            print('CheckCode', request.POST.get('checkcode'))
            print("request.session['CheckCode']", request.session['CheckCode'])
            if request.POST.get('checkcode').lower() == request.session['CheckCode'].lower():

                print('checkcodesuccessful')
                if models.UserInfo.objects.filter(username=values['username'], password=values['password']).exists():
                    print('redirectsuccessful')

                    request.session['username'] = values['username']
                    request.session['is_login']=True

                    return redirect('/index.html')
                else:
                    return render(request, 'login.html', {'form': form})

            else:
                return render(request, 'login.html', {'form': form})






        else:
            print('11111111111111111111111111111xcxc')

            errors = form.errors
            print(errors)
            return render(request, 'login.html', {'form': form})

@login_required
def index(request):
    print('indexindexindex')
    return render(request, 'index.html')


def getvalue(request):
    # final_value[
    #     [[0.018, '20003756'], [0.0, '20003757']], [[0.018, '20003756'], [0.0, '20003757']], [[0.018, '20003756'],
    #                                                                                          [0.0, '20003757']], [
    #         [0.018, '20003756'], [0.0, '20003757']], [[0.018, '20003756'], [0.0, '20003757']]]
    print('jinlailema2222222222222222222222222222')
    # temp =final_value.pop()

    while not final_value:
        time.sleep(1)
    fav =final_value.pop()




# print('temp',temp)
#
# fav =[]
#
#
# for i in range(len(temp)):


    print('fav', fav)

    return HttpResponse(json.dumps(fav))

@login_required
def history_data_show(request):
    return render(request, 'historydata.html')


def history_data_json(request):
    if request.method=='GET':

        page =request.GET.get('pager')


        # print('history_data_jsonhistory_data_jsonhistory_data_jsonhistory_data_json')
        # 数据库中获取数据
        table_config = [
            {
                'q': None,
                'title': "选项",
                'display': True,
                'text': {'content': "<input type='checkbox' />", "kwargs": {}},
                'attrs': {}
            },
            {
                'q': 'nid',
                'title': 'ID',
                'display': False,
                'text': {},
                'attrs': {}
            },
            {
                'q': 'nodename',
                'title': '节点名称',
                'display': True,
                'text': {},
                'attrs': {}
            },
            {
                'q': 'level',
                'title': '液位',
                'display': True,
                # 'text': {'content': "{n}", 'kwargs': {'n': "@name"}},
                'text': {},
                # 'attrs': {'edit-enable': 'true', 'edit-type': 'input', 'origin': '@name'}
            },
            {
                'q': 'rectime',
                'title': '记录时间',
                'display': True,
                'text': {},
                'attrs': {}
            },
            # {
            #     'q': 'contact__name',
            #     'title': '联系人组',
            #     'display': True,
            #     'text': {'content': "{n}", 'kwargs': {'n': "@contact__name"}},
            #     'attrs': {'edit-enable': 'true', 'edit-type': 'select', 'origin': '@contact_id',
            #               "global-name": 'contact_choices'}
            # },
            # {
            #     'q': 'manager__name',
            #     'title': '管理员组',
            #     'display': True,
            #     'text': {'content': "{n}", 'kwargs': {'n': "@manager__name"}},
            #     'attrs': {}
            # },
            # {
            #     'q': None,
            #     'title': '操作',
            #     'display': True,
            #     'text': {'content': "<a href='/assetdetail-{m}.html'>{n}</a>", 'kwargs': {'n': '查看详细', 'm': '@id'}},
            #     'attrs': {},
            # }
        ]

        q_list = []
        for i in table_config:
            if not i['q']:
                continue
            q_list.append(i['q'])

        totalcount = models.NodeRecord.objects.all().count()

        # print('toalcount',totalcount)
        page_obj =Pagination(totalcount,page)
        page_str=page_obj.page_str()

        data_list = models.NodeRecord.objects.all().values(*q_list)[page_obj.start():page_obj.end()]
        data_list = list(data_list)

        for i in data_list:
            temp =i['rectime']
            temp =temp.strftime("%Y-%m-%d %H:%M")
            i['rectime']=temp




        # print('data_list',data_list)

        result = {
            'table_config': table_config,
            'data_list': data_list,
            'global_dict': {
                # 'device_type_choices': models.Asset.device_type_choices,
                # 'device_status_choices': models.Asset.device_status_choices,
                # 'idc_choices': list(models.IDC.objects.values_list('id','name'))
                # 'contact_choices': list(models.UserGroup.objects.values_list('id', 'name'))
            },
            'pager': page_str

        }
        return HttpResponse(json.dumps(result))
