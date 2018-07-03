# -*- coding:utf-8 -*-
'''
Created on 2017年3月17日
@author:  baifendian-kevin
'''
import xlrd
import datetime
from xlrd import xldate_as_tuple
'''表描述字典'''
t_comment = {}
'''表分区字典''' 
t_partition = {}
'''hive外部表字典'''
t_hive_external = {}
'''表主键字典'''
t_key = {}
'''表分区描述字典'''
t_part_comment = {}
'''hive表分区字典'''
t_hive_partition = {}
'''hive表贮存方式字典'''
t_stored = {}
'''hive表map分隔字典'''
t_map = {}
'''hive表集合分隔字典'''
t_collection = {}
'''hive表字段分隔字典'''
t_filed = {}
'''hive表 换行分隔字典'''
t_lines = {}
'''hive表分桶字典'''
t_cluster = {}
'''hive表加载 分区字典'''
t_hive_location_part = {} 
'''hive表加载字典'''
t_hive_location = {}
'''hive表本地加载字典'''
t_hive_location_local = {} 
'''表唯一约束字典'''
t_unique = {}
data = xlrd.open_workbook('44928.xlsx')
# 没有table描述
# 选择脚本类型
loop_flag = 1
emp_part_table = []
#with open ('emp_partiton_table.txt') as emp_part :
    
    #for i in emp_part.readlines():
        #emp_part_table.append(i.strip())
#emp_part.close()
while loop_flag:  
    type_num = int(input('请输入转换类型序号\n 1...oracle \n 2...khan \n 3...hive\n 4...mysql\n'))
    if type_num == 1:
        dialect_name = 'ORACLE'
        loop_flag = 0
    elif type_num == 2 :   
        dialect_name = 'KHAN'
        loop_flag = 0   
    elif type_num == 3:
        dialect_name = 'HIVE'
        loop_flag = 0
    elif type_num == 4:
        dialect_name = 'MYSQL'
        loop_flag = 0
    else :
        print ('请输入正确的选项,请重新输入')
        loop_flag = 1
#  加载对应关键字到关键字列表
keyword_list = []
try :
    
    with open ('KEYWORD_%s.txt' % dialect_name) as file_keyword :
        for i in file_keyword.readlines():
            try:
                keyword_list.append(i.strip().upper())
            except:
                continue
    file_keyword.close()
except Exception as e :
    pass
emp_ods_list = []
type_dict_map = {}
print('加载类型映射')
try :
    with open ('%s_type_dict.txt' % dialect_name.lower()) as emp_file :
        for i in emp_file.readlines() :
            type_dict_map[i.split('\t')[0]] = i.split('\t')[1].strip()
    emp_file.close()  

except Exception as e:
    pass
print ('加载类型映射完毕')
# 读取表级别相关信息(table_sheet)  以database.table 为key 存放到 各个map中
def add_tableinfo():
    global t_unique, t_cluster, t_collection, t_comment, t_database, t_filed, t_hive_external, t_hive_location, t_hive_location_local, t_hive_location_part, t_key, t_lines, t_map, t_part_comment, t_partition, t_stored
    for i in range(1, table_info.nrows):
        t_tname = table_info.row_values(i)[1].strip().upper() 
        t_database = table_info.row_values(i)[0].strip().upper() 
        t_comment[t_database + '.' + t_tname] = table_info.row_values(i)[2].strip().upper()
    if  dialect_name == 'HIVE' :
        for i in range(1, table_info.nrows):
            t_tname = table_info.row_values(i)[1].strip().upper() 
            t_database = table_info.row_values(i)[0].strip().upper() 
            t_key = t_database + '.' + t_tname
            try:
                t_stored[t_key] = table_info.row_values(i)[8]    
                t_map[t_key] = table_info.row_values(i)[5]    
                t_filed[t_key] = table_info.row_values(i)[3]   
                t_lines[t_key] = table_info.row_values(i)[6]   
                t_hive_external[t_key] = table_info.row_values(i)[3]  
                t_hive_location[t_key] = table_info.row_values(i)[9] 
                t_hive_location_local[t_key] = table_info.row_values(i)[10]
                t_collection[t_key] = table_info.row_values(i)[5]   
                t_hive_partition[t_key] = table_info.row_values(i)[11].strip()   
            except:
                pass       
table_info = data.sheets()[type_num]
print( '加载表描述信息')
add_tableinfo()
print ('表描述信息加载完成')
columns_info = data.sheets()[0]
colummn_map = {}
table_column = {}
row_counts = columns_info.nrows
j = 0
'''加载字段描述信息'''
def addcolumn_info():
    # 模式名
    scheme_name = ""
    # 表名
    table_name = ""
    # 字段名
    column_name = ""
    for i in range(1, row_counts):
        column_rowsdata = columns_info.row_values(i)
        table_name = column_rowsdata[1].strip().upper()
        scheme_name = column_rowsdata[0].strip().upper()
        column_name = column_rowsdata[2].strip().upper()
        type_dict_map
        if  table_name in  keyword_list :
            table_name = '%s_%s' % ('futureland_', table_name)
            print (' 表名不能为关键字%s' % (table_name))
        if column_name in  keyword_list :
            print (' 列名不能为关键字%s' % (column_name))
            column_name = '%s_%s' % ('futureland_', column_name)
        t_key = scheme_name + '.' + table_name
        c_key = t_key + '.' + column_name
        try:
            if ""  in [scheme_name, table_name]:
                raise Exception("第%s行 模式名 表名不能为空" % str(i))
            if "" == column_name:
                raise Exception("第%s行 列名不能为空" % str(i))
            if t_key not in table_column.keys():
                table_column[t_key] = []
            colummn_map[c_key] = []
        except Exception as e:
            continue 
        # 加载分区信息   (hive)分区信息 没有在column_sheet中
            
        partition_info = str(column_rowsdata[12]).strip().upper()
        # 若有分区 , 添加 分区信息到 字典中 并将 对应字段名称加入
        if partition_info != "":
                #分区格式 range..1,2,3
                t_partition[t_key] = partition_info.replace('..', '..' + column_name + " ")
        else :
            t_partition[t_key] = ""
        # 获取关于字段的描述  长度 精度 类型  是否唯一   
        column_length = str(column_rowsdata[4]).strip().upper()
        column_type = str(column_rowsdata[3]).strip().upper()
        if column_type in type_dict_map.keys() :
            column_type = type_dict_map[column_type]
        column_precision = str(column_rowsdata[5]).strip().upper()
        column_unique = str(column_rowsdata[16]).strip().upper()
        # 根据长度精度生成对应类型的(x,y)
        if dialect_name =='KHAN' :
            if column_length == "" or column_type in [ 'DATE','TIMESTAMP','TEXT' ] :
                pass
            elif column_precision == ""  or column_precision == '0.0'     :
                column_type = column_type + '(%s)' % str(int(float(column_length)))
            else :
                column_type = column_type + '(%s,%s)' % (str(int(float(column_length))), str(int(float(column_precision))))
        # 为hive 添加分桶信息
        if str(column_rowsdata[13]).strip().upper() == 'Y':
            cluster_num = str(column_rowsdata[14]).strip().upper() 
            t_cluster[t_key] = column_name + ',' + cluster_num          
        column_default = str(column_rowsdata[6]).strip().upper()
        column_nullable = str(column_rowsdata[8]).strip().upper()
        # 添加1个或多个约束
        if column_unique == 'Y' and t_key not in t_unique.keys: 
                t_unique[t_key] = column_name
        elif column_unique == 'Y' : 
            t_unique[t_key] = t_unique[t_key] + "," + column_name
        #添加字段描述
        column_comment = str(column_rowsdata[7]).strip()
        #添加 字段的基本信息 到  map 中  
        colummn_map[c_key].append(column_type)
        colummn_map[c_key].append(column_default)
        colummn_map[c_key].append(column_comment)
        colummn_map[c_key].append(column_nullable)
        colummn_map[c_key].append(column_name)  
        # 将 每个列表 存入对应的 table_column map 中 
        table_column[t_key].append(colummn_map[c_key])
print ('添加列描述信息' )
addcolumn_info()
emp_flag = True
print( '添加列描述信息完成')
#  传入某个表对应key 输出某个表的sql
def getsql(key_name):  
    tname = key_name;
    scheme_name = tname.split('.')[0].lower()
    table_name = tname.split('.')[1].lower()
    column_list = []
    comment_list = []
    hive_sort_list = [] 
    try :
        if t_hive_external[tname] == 'Y' :
            external_info  = 'EXTERNAL '
        else :
            raise Exception()
    except :
        external_info  = ''
        pass
    if dialect_name in ['KHAN','HIVE','MYSQL']:
        table_sql = 'DROP TABLE IF EXISTS %s ;\nCREATE %s TABLE %s\n' % (tname.lower(),external_info, tname.lower()); 
    elif dialect_name =='ORACLE' :
        table_sql = 'CREATE TABLE %s\n' % tname.lower();
    c = 0;
    # 获取表中字段个数 
    columns_len = 0
    for col_key in colummn_map.keys():
        if col_key.startswith(key_name+'.'):
            columns_len = columns_len + 1
    #取出每张表的所有字段列表基本信息
    table_sql = table_sql + '( '
    for  col_info_list in table_column[key_name]:
        #字段名
        _col_name = col_info_list[4]
        #字段类型
        _col_type = col_info_list[0]  
        #字段默认值
        _col_default = col_info_list[1]                       
        #字段描述
        _col_comment = col_info_list[2]
        #字段是否可为空
        _col_nullable = col_info_list[3]
        #取出 字段描述 
        if _col_comment != '' :
            comment_list.append([_col_comment, [key_name.split('.')[0], key_name.split('.')[1], _col_name], _col_type])
        # comment_list.append([_col_comment, _col_name, _col_type])
        flag_null = True
        if _col_nullable == 'Y' or _col_nullable =="" :
                flag_null = False
        # 拼接  字段,字段类型,是否可为空
        if flag_null and dialect_name != 'HIVE':
            table_sql = table_sql + '  %s  %s NOT NULL ,\n' % (_col_name.lower(), _col_type.upper())
        else :
            table_sql = table_sql + '  %s  %s ,\n' % (_col_name.lower(), _col_type.upper())
        c = c + 1; 
        # 判断是否)结尾
        #为字段添加默认值 (根据不同方言有不同的规则)
        if dialect_name != 'HIVE' and _col_default != '':
            replace_vc = " " + _col_name.lower() + " " + _col_type.upper()
            if 'NUMBER'  in _col_type.upper():
                table_sql = table_sql.replace(replace_vc, replace_vc + " default " + _col_default)
            elif 'CHAR'.upper() in _col_type.upper():
                table_sql = table_sql.replace(replace_vc, replace_vc + " default '" + _col_default + "'")
            elif 'DATE'.upper()   in _col_type.upper():
                if dialect_name == 'ORACLE':
                    table_sql = table_sql.replace(replace_vc, replace_vc + " default to_date('" + str(datetime(*xldate_as_tuple(_col_default, 0)))[0:10] + "','yyyy-mm-dd')")
                elif dialect_name == 'KHAN':
                    table_sql = table_sql.replace(replace_vc, replace_vc + " default '" + str(datetime(*xldate_as_tuple(_col_default, 0)))[0:10] + "'")
            elif 'TIMESTAMP' in _col_type.upper():
                table_sql = table_sql.replace(replace_vc, replace_vc + " default to_timestamp('" + str(datetime(*xldate_as_tuple(_col_type, 0)))[0:10] + "','yyyy-mm-dd')")
#     if not unique_list and emp_flag:
#         i = table_sql.rfind(',\n') 
#         table_sql = table_sql[:i - 1] + "" + table_sql[i + 1:]
    if not table_sql.endswith(')') :
            table_sql = table_sql[:-2] + ');'
    # 添加 unique 约束       
    if dialect_name != 'HIVE' :
        if tname.upper() in t_unique.keys():
            unique_info = ""
            len_unique = len(t_unique[tname.upper()].split(','))
            if len_unique == 1:
                unique_info = t_unique[tname.upper()]
            else :
                for i in t_unique[tname.upper()].split(','):
                    unique_info = unique_info + i + ','
                unique_info = unique_info[:-1]
            table_sql = table_sql[:table_sql.find('\n', -1)] + ', \n CONSTRAINT %s_%s_unique UNIQUE  (%s ) ) \n' % (tname.split('.')[0].lower(), tname.split('.')[1].lower(), unique_info)
            
    #为表添加分区信息
    partition_dict = {}
    #range_list分区
    #h_flag = []
    if table_name.upper() in emp_part_table :
        ''' 添加临时需要的的分区'''
        pass
        # now_time = datetime.datetime.now()
        # before_time = datetime_offset_by_month(now_time, -36)
        # later_time = datetime_offset_by_month(now_time, 12)
        # before_time_nyr = before_time.strftime('%Y-%m-%d')
        # later_time_nyr = later_time.strftime('%Y-%m-%d')
        # range_sql = " \n partition by range (etl_lad_dte) \n   ( START (date '%s') INCLUSIVE \n  END (date '%s') INCLUSIVE EVERY (INTERVAL '1 month'), \n  DEFAULT PARTITION extra) " % (before_time_nyr, later_time_nyr)
        # partition_dict["info"].append(range_sql)
    if  t_partition[tname].strip().startswith('HASH'):
        count = int(t_partition[tname].split(" ")[1])
        col_name = t_partition[tname].split("..")[1]
        hash_sql = " partition by hash (" + col_name + ")\n   ("
        for i  in range (1, (count) + 1):
            if  i < int(count):
                    hash_sql = hash_sql + '\t partition part_hash_' + str(i) + ',\n'
            else :
                    hash_sql = hash_sql + '\t partition part_hash_' + str(i) + "\n   )"
        partition_dict["info"].append(hash_sql)    
    elif t_partition[tname].strip().startswith('LIST'): 
        valuelist = t_partition[tname].split(" ")[1:]
        col_name = t_partition[tname].split("..")[1].split(' ')[0]
        list_sql = " partition by list(" + col_name + ") ("
        k = 0;
        for i in valuelist:
            k = k + 1 
            list_sql = list_sql + "partition list_" + str(i) + " values  (" + valuelist[k - 1] + ") ,\n" 
        list_sql = list_sql + "partition list_other" + " values  (default) )"   
        partition_dict["info"].append(list_sql)  
    try : 
        table_sql = table_sql + partition_dict['info'][0] 
    except :
        pass
#     if h_flag <> []:
#         table_sql = table_sql.replace('partition by range(' + emp_v1 + ')', 'partition by range(' + emp_v1 + ')subpartition by hash(' + h_flag[0] + ')  subpartitions ' + h_flag[1])
    c_n = 0  
    #添加关于hive DML建表信息
    if dialect_name == 'HIVE':
        if tname.upper() in t_comment.keys():
            table_sql = table_sql + "\n comment '%s'\n" % t_comment[tname]
        try:
            hive_part_info = t_partition[tname]
            try:
                hive_part_info = hive_part_info + " comment '" + t_part_comment[tname] + "'"
            except :
                pass
            if hive_part_info !="" :
                table_sql = table_sql + 'partitioned by (%s)' % hive_part_info 
        except :
            pass
        try:
            table_sql = table_sql + '\n clustered by (%s)   into %s buckets' % (t_cluster[tname].split(',')[0], int(t_cluster[tname].split(',')[1])) 
        except :
            pass
        if hive_sort_list != []:
            sort_info = ""
            for i in column_list:
                if i[1] == hive_sort_list[1]:
                    sort_info = i[0] + ' ' + hive_sort_list[0]
            if sort_info != "":
                table_sql = table_sql.replace(')   into', ')  sorted by(%s)   into' % sort_info)
        try :
            if t_filed[tname] != '' :
                table_sql = table_sql + '\n' + r"row format delimited fields terminated by '%s'" % t_filed[tname] + " \n"
            if t_collection[tname] != '' :
                table_sql = table_sql + "collection items terminated by '%s' \n " % t_collection[tname]
            if t_map[tname] != '' :
                table_sql = table_sql + "map keys terminated by '%s' \n " % t_map[tname]
            if t_lines[tname] != '' :
                table_sql = table_sql + "lines terminated by  '%s' \n " % t_lines[tname]
            if t_stored[tname] != '' :
                if int(float(t_stored[tname])) == 1:
                    _storeType = 'TEXTFILE'
                elif int(float(t_stored[tname])) == 2:
                    _storeType = 'SEQUENCEFILE'
                elif int(float(t_stored[tname])) == 3:
                    _storeType = 'RCFILE'
                table_sql = table_sql + 'stored as %s' % _storeType
        except :
            pass
    #####  添加hive 表描述  添加 格式说明  写几个小脚本 对应格式转化  
    if tname in t_hive_location_local.keys():
        location_partition = ""
        if tname in t_hive_location_part.keys():
            # load 分区
            location_partition = 'partition(' + t_hive_location_part[tname] + ')'
        if location_partition != '' :
            table_sql = table_sql + " \n location   '%s'   %s " % (t_hive_location_local[tname], location_partition)
    if dialect_name in ['KHAN','ORACLE'] :  
        for comment in comment_list:
            if str(comment[0]) == "":
                continue
            comment_info = "'" + str(comment[0]) + "'"
            table_sql = table_sql + '\n comment on column %s.%s.%s ' % (comment[1][0].lower(), comment[1][1].lower(), comment[1][2].lower()) + ' is ' + comment_info + ";"
            c_n = c_n + 1
    if dialect_name == "MYSQL" :  
        for comment in comment_list:
            #alter table md_custom modify md_custom.code int comment 'the column is auto_increment';
            if str(comment[0]) == "":
                continue
            comment_info = "'" + str(comment[0]) + "'"
            table_sql = table_sql + '\n alter table %s modify %s.%s %s comment %s ;' % (comment[1][1].lower(), comment[1][1].lower(),comment[1][2].lower(), comment[2].lower(),comment_info )
            c_n = c_n + 1
    if dialect_name !='HIVE' :
        #ALTER TABLE table_name COMMENT='这是表的注释';  
        if dialect_name in ['KHAN','ORACLE'] and tname.upper() in t_comment.keys() :
            table_sql = table_sql + "\n comment on  table %s  is '%s'" % (tname.lower(), t_comment[tname.upper()].lower())
        elif dialect_name == "MYSQL" and tname.upper() in t_comment.keys() :
            try :
                table_sql = table_sql + "\n alter table %s  comment= '%s'" % (tname.lower(), t_comment[tname.upper()].lower())
            except Exception as e :
                print (e,123)
    if tname in t_hive_location.keys():
        location_partition = ''
        if tname in t_hive_location_part.keys():
            # load 分区
            location_partition = 'partition(' + t_hive_location_part[tname] + ')'
        if location_partition != '' :
            table_sql = table_sql + ";  \nLOAD DATA INPATH '%s' INTO TABLE '%s'  %s   \n" % (t_hive_location[tname] , tname.lower(), location_partition)
   
    return table_sql;
#类型替换字典
sql_over = ""
for key_name  in table_column.keys():
        sql_over = sql_over + getsql(key_name) + ";\n" 
        sql_over = sql_over.replace(';;',  ';')
with open ('%s_goal.sql'% dialect_name.lower(), 'w') as file_goal :
    file_goal.write(sql_over)
file_goal.close()
try :
    exit()
    print( '脚本执行完毕')
except:
    exit(1)
    print ('程序异常退出')
