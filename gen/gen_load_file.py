__author__ = 'KD'
# -*- coding:utf-8 -*-
#!/usr/bin/python

import datetime
import time
import xlrd
import sys
import re
import codecs

#处理excel，生成执行语句
def open_excel():
    sheet_name_cfg = "load_cfg"
    #打开导入配置excel，获取详细导入配置
    sh_cfg = work_book.sheet_by_name(sheet_name_cfg)
    nrows_cfg = sh_cfg.nrows
    ncols_cfg = sh_cfg.ncols
    for i in range(1,nrows_cfg):
        des_conn_str = ""
        des_tab_str = ""
        sour_tab_str = ""
        hive_target_str = ""
        para_str = ""
        sqoop_cmd = ""
        #判断目标表链接条件
        if( sh_cfg.cell_value(i,3) == "KHan" ):
            des_conn_str = " --khan  --khan-connect " + '%s '
            des_tab_str = " --khan-schema %s --khan-table %s --delete-target-dir  --fetch-size 1000 -m 1 --null-string '0' --null-non-string '0'  --fields-terminated-by '\\\\0x7F'" %(sh_cfg.cell_value(i,4),sh_cfg.cell_value(i,5).lower())
        elif( sh_cfg.cell_value(i,3) == "Hive" ):
            des_tab_str = " --hive-import  --hive-table %s.%s --delete-target-dir  --hive-overwrite  --fetch-size 1000 -m 1 --null-string '0'  --null-non-string '0'  --fields-terminated-by '\\\\0x7F'" %(sh_cfg.cell_value(i,4),sh_cfg.cell_value(i,5))
        elif( sh_cfg.cell_value(i,3) == "HDFS" ):
            #暂时未支持
            pass
        #判断是query 还是table,先判断自定义是否有值
        if( sh_cfg.cell_value(i,9).strip() ):
            #如果是自定义中没有where条件就报错了，后期需要增加判断（可能自定义只是字段顺序的调整）
            sour_tab_str = " --query " + '\\"' + sh_cfg.cell_value(i,9) + " and \\$CONDITIONS" + '\\"'
            dt = datetime.datetime.now()
            unix_timestamp = int(time.mktime(dt.timetuple()))
            hive_target_str = " --target-dir   'sqoop-sql-import/%s.%s_query_%s'"%(sh_cfg.cell_value(i,4),sh_cfg.cell_value(i,5),unix_timestamp)
        elif(  sh_cfg.cell_value(i,6) == 0 ):
            sour_tab_str =  " --query " + '\\"' + "select * from " + sh_cfg.cell_value(i,2) + " where " + sh_cfg.cell_value(i,7) + ' >  to_date(\\\'' + sh_cfg.cell_value(i,8) + "\\',\\\'yyyy-mm-dd\\\') AND  \\$CONDITIONS\\\""
            dt = datetime.datetime.now()
            unix_timestamp = int(time.mktime(dt.timetuple()))
            hive_target_str = " --target-dir   'sqoop-sql-import/%s.%s_query_%s'"%(sh_cfg.cell_value(i,4),sh_cfg.cell_value(i,5),unix_timestamp)
        elif( sh_cfg.cell_value(i,6) == 1 ):
            sour_tab_str =  " --table "  + sh_cfg.cell_value(i,2)
        if( sh_cfg.cell_value(i,3) == "KHan"  ):
            para_str = "%(excute_date,source_conn_str,destination_conn_str,escaped_char)"
            sqoop_cmd = '    sqoop_cmd = "export HADOOP_OPTS=\' -DHADOOP_USER_NAME=futureland\';export TX_DATE=%s;sqoop import  -D mapreduce.job.queuename=hadoop01 --connect %s' + sour_tab_str + hive_target_str + des_conn_str   + des_tab_str + ''' --escaped-by '\\\\%s'" ''' + para_str
        elif( sh_cfg.cell_value(i,3) == "Hive" ):
            para_str = "%(excute_date,source_conn_str,escaped_char)"
            sqoop_cmd = '    sqoop_cmd = "export BDOS_SQOOP_HIVE_IP=\'dxtyg:2181,dxtye:2181,dxtyf:2181\';export BDOS_SQOOP_HIVE_PORT=\'\';export BDOS_SQOOP_HIVE_NAMESPACE=\'testhive\';export BDOS_SQOOP_HIVE_PARAM=\';serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2\';export BDOS_SQOOP_HIVE_USERNAME=\'futureland\';export BDOS_SQOOP_HIVE_PWD=\'\';export HADOOP_OPTS=\' -DHADOOP_USER_NAME=futureland\';export TX_DATE=%s;sqoop import  -D mapreduce.job.queuename=hadoop01 --connect %s' + sour_tab_str + hive_target_str + des_conn_str   + des_tab_str + ''' --escaped-by '\\\\%s'" ''' + para_str

        record_py_file(sh_cfg.cell_value(i,5),sqoop_cmd)


#生成py文件
def record_py_file(file_name,sqoop_cmd):
    #读取模板文件
    file = "template_load_file.py"
    file_read = codecs.open(file,'r','utf-8')
    #指定文件生成路径
    #des_file = "E://脚本生成的地方//src增量脚本//ych//%s.py" % (file_name.lower())
    des_file = "E://脚本生成的地方//SRC初始化脚本//enjoy//%s.py" % (file_name.lower())
    file_write = codecs.open(des_file,'w','utf-8')
    while( 1 ):
        line = file_read.readline()
        if line:
            if( line.find(r'    sqoop_cmd = "export') == 0 ):
                file_write.writelines(sqoop_cmd)
                file_write.writelines("\n")
            else:
                file_write.writelines(line)
        else:
            break
    file_read.close()
    file_write.close()

if __name__ == '__main__':

    #全量
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_WY.xlsx")#吾悦
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_XCS.xlsx")#新橙社
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_YDAC.xlsx")#移动案场
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_SY.xlsx")#儿童
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_QMJJR.xlsx") #全民经济人
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_SY.xlsx")#思源
    work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_ENJOY.xlsx")#昂捷
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_INIT_MYSOFT.xlsx")#明源
    #增量
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_WY.xlsx")  # 吾悦
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_XCS.xlsx")  # 新橙社
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_YDAC.xlsx")  # 移动案场
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_YCH.xlsx")  # 儿童
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_QMJJR.xlsx")  # 全民经济人
    # work_book = xlrd.open_workbook("C://Users//BFD-481//Desktop//上海项目//数据导入//gen//数据接入表//数据接入统计表_日常_SY.xlsx")  # 思源
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_日常_ENJOY.xlsx")  # 昂捷
    # work_book = xlrd.open_workbook("数据接入表//数据接入统计表_日常_YCH补充.xlsx")  # 昂捷
    #全部生成
    open_excel()

