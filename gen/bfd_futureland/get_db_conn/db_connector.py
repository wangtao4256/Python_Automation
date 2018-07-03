# -*- coding:utf-8 -*-
#!/usr/bin/python

import sys,os
import configparser
from bfd_futureland.encryption import encrypt
def Db_Connector(item):
    #定位配置文件位置
    config_file_path = "/opt/Python-2.7.8/lib/python2.7/site-packages/bfd_futureland/get_db_conn/db_cfg.ini"
    #configparser读取ini配置文件模块
    cf = configparser.ConfigParser()
    #读取section为item的键值
    cf.read(config_file_path)
    db_jdbc = cf.get(item, "jdbc")
    db_user = cf.get(item, "usr")
    db_pwd = cf.get(item, "pwd")
    # 判断是否有encrypt配置
    if "encrypt" in cf.options(item):
        db_encrypt = cf.getint(item, "encrypt")
        if (db_encrypt == 1):
            db_pwd = str(encrypt.decrypt(db_pwd), encoding='utf-8')

    if( item.find("KHAN") == -1 ):
        conn_str = "'"+db_jdbc+"'" +" --username " + db_user + " --password " + db_pwd
    else:
        #默认免密登录
        conn_str = "'"+db_jdbc+"'" +" --khan-username " + db_user + " --khan-password " + db_pwd

    return (conn_str)

