__author__ = 'KD'
# -*- coding:utf-8 -*-
#!/usr/bin/python

import uuid
import xml.dom.minidom
import os
import re
import sys
import codecs

#获取指定文件夹下所有脚本名称
def get_file_name(dir):
    files = os.listdir(dir)
    return files

def gen_job_xml(files):
    file_str = ""
    for file in files:
        code = str(uuid.uuid3(uuid.NAMESPACE_DNS, file)).replace("-",'')
        type_code = ""
        #替换.py字符
        if( file.find(r".py") != -1 ):
            replace_py = re.compile(r'.py')
            type_code = "2"
        elif(  file.find(r".hql") != -1  ):
            replace_py = re.compile(r'.hql')
            type_code = "3"
        elif(  file.find(r".kh") != -1  ):
            replace_py = re.compile(r'.kh')
            type_code = "11"
        file_no_suffix = replace_py.sub('',file)
        info_code = str(uuid.uuid3(uuid.NAMESPACE_DNS, file_no_suffix)).replace("-",'')
        #指定父目录位置  /INIT/SRC/ENJOY
        dir_name = "0f0c5bc4f63743349b63823280584d83"
       #KHan
        file_str = file_str + "      <file code=\"%s\" pid_code=\"%s\" info_code=\"%s\" tree_name=\"%s\" type=\"2\" del=\"0\" type_code=\"%s\" includeRootNode=\"true\" name=\"%s\" mr=\"0\" queue=\"\" priority=\"\" remark=\"\"/>\n"%(code,dir_name,info_code,file,type_code,file)
    return file_str

#生成py文件
def record_py_file(file_str):
    #读取模板文件
    file = "template_job.xml"
    file_read = codecs.open(file,'r','utf-8')
    #指定文件生成路径(aed5cfd61c54440c812affddc327b803 为SRC/DPR/路径,c2dc363212f94b01867f91f6f831cf02为INIT/DRP路径 d403a6c019584d62984902162a339f0e INIT/DRP目录 9317c2e2f03144ba9973fa822e754852 为SRC/DRP）
    file_name = "0f0c5bc4f63743349b63823280584d83.xml"
    des_file = "E://脚本生成的地方//SRC初始化xml//xml//%s"%(file_name)
    file_write = codecs.open(des_file,'w','utf-8')
    while( 1 ):
        line = file_read.readline()
        if line:
            if( line.find(r'      <file code') == 0 ):
                file_write.writelines(file_str)
            else:
                file_write.writelines(line)
        else:
            break
    file_read.close()
    file_write.close()

#主程序
try:
    if __name__ == '__main__':
        #ENJOY初始化脚本生成的位置
        scripts = get_file_name("E://脚本生成的地方//SRC初始化脚本//enjoy")
        file_str = gen_job_xml(scripts)
        record_py_file(file_str)
except Exception as e:
    print(Exception,":",e)
    sys.exit(1)