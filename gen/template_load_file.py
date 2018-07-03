# -*- coding:utf-8 -*-
#!/usr/bin/python
__author__ = 'KD'


import os
import sys
import datetime
from bfd_futureland.get_db_conn import db_connector


#获取数据库连接字符串
def get_conn_str(conn_name):
    section = conn_name
    conn_str = db_connector.Db_Connector(section)
    return conn_str

#执行导入命令
def sqoop_test(excute_date):
    # source_conn_str = get_conn_str("FUTURELAND_WY")
    # source_conn_str = get_conn_str("FUTURELAND_XCS")
    # source_conn_str = get_conn_str("FUTURELAND_YDAC")
    # source_conn_str = get_conn_str("FUTURELAND_YCH")
    # source_conn_str = get_conn_str("FUTURELAND_QMJJR")
    # source_conn_str = get_conn_str("FUTURELAND_SY")
    source_conn_str = get_conn_str("FUTURELAND_ENJOY")
    # source_conn_str = get_conn_str("FUTURELAND_MYSOFT")
    destination_conn_str = get_conn_str("FUTURELAND_KHAN")
    escaped_char = '"'
    sqoop_cmd = "export HADOOP_OPTS=' -DHADOOP_USER_NAME=futureland';export TX_DATE=%s;sqoop import  -D mapreduce.job.queuename=hadoop01 --connect %s --table M_PRODUCT --khan  --khan-connect %s --khan-schema testkhan --khan-table m_product --delete-target-dir --fetch-size 1000 -m 1 --null-string '0' --null-non-string '0' --escaped-by '\\%s' --fields-terminated-by '\\0x7F'" %(excute_date,source_conn_str,destination_conn_str,escaped_char)
    # ret = os.popen(sqoop_cmd).readlines()
    ret = os.system(sqoop_cmd)
    return ret

#主程序
try:
    if __name__ == '__main__':
        if( len(sys.argv) > 1 ):
            TX_DATE = sys.argv[1]
        else:
            today = datetime.date.today()
            TX_DATE = today - datetime.timedelta(days=1)
        ret = sqoop_test(TX_DATE)
        if( ret == 0 ):
            print("The sqoop job %s is complete")%(sys.argv[0])
            sys.exit(0)
        else:
            print("The sqoop job %s has failed")%(sys.argv[0])
            sys.exit(1)
except Exception as e:
    print(Exception,":",e)
    sys.exit(1)