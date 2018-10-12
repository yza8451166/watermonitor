from datetime import datetime
import requests

import os
import sys

import threading
from datetime import datetime

import time


final_value = []


def acvalue():
    temp_list = []
    ret = requests.get('http://yun.cheelink.com/wsjc/Device/getDeviceData.do?userID=test0921&userPassword=test0921')
    while not ret:
        time.sleep(1)
    count = 0
    for i in range(30):
        ret = requests.get('http://yun.cheelink.com/wsjc/Device/getDeviceData.do?userID=test0921&userPassword=test0921')
        retv = ret.json()

        count += 1
        if count == 1:
            for k in range(len(retv)):
                temp_list.append(None)

        countx = 0
        for j in range(len(retv)):

            temp_li = []
            countx += 1
            if countx <= len(retv):
                for h in range(2):
                    temp_li.append(None)

            if temp_list[j] is None:
                temp_list[j] = temp_li
            # print('temp_list[j][0]',temp_list[j][0])
            # print('temp_list',temp_list)
            if temp_list[j][0] is None:
                temp_list[j][0] = float(retv[j]['DevTempValue'])

            tv = float(retv[j]['DevTempValue'])
            temp_list[j][0] += tv
            if temp_list[j][1] is None:
                temp_list[j][1] = retv[j]['DevName']
        time.sleep(1)
    return temp_list


def gv():
    while True:
        fv = acvalue()
        # print('fv', fv)
        for i in range(len(fv)):
            a = fv[i][0]

            # print('a',a)
            fv[i][0] = float('%.3f' % a)

        # print('fv', fv)

        final_value.append(fv)
        # print('final_value',final_value)


# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'watermonitor.settings')
t = threading.Thread(target=gv, args=[])


# t.start()

import time
def loop_get_data():
    while True:
        ret = requests.get(
            'http://yun.cheelink.com/wsjc/Device/getDeviceData.do?userID=test0921&userPassword=test0921')

        ret = ret.json()

        li = []

        xtime = str(datetime.now()).rsplit(':', 1)
        xtime = xtime[0]
        print('len(ret)', len(ret))
        for i in range(len(ret)):
            data_dict = {
                'nodename': ret[i]['DevName'],
                'level': ret[i]['DevTempValue'],
                'rectime': xtime
            }
            # print('data_dict', data_dict)
            li.append(data_dict)
        print('lililili', li)

        print('3333333333333333333333')

        # for j in li:

        time.sleep(60)

if __name__ == '__main__':
    print('tttttttttttttttttttttttttttttttttttt')
    t1 = threading.Thread(target=loop_get_data, args=())
    t1.start()

