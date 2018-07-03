__author__ = 'Kevin'
# -*- coding: utf-8 -*-
import sys
import xlrd
import re
import getpass


#处理excel，生成建表语句
def open_excel(excel_schema_name,excel_tab_name):
    sheet_name_tab = excel_schema_name + '_tab_lvl'
    sheet_name_col = excel_schema_name + '_col_lvl'
    #打开表级excel，获取行值、列值
    sh_tab = work_book.sheet_by_name(sheet_name_tab)
    nrows_tab = sh_tab.nrows
    ncols_tab = sh_tab.ncols
    print("aaa")
    #打开字段级excel，获取行值、列值
    sh_col = work_book.sheet_by_name(sheet_name_col)
    nrows_col = sh_col.nrows
    ncols_col = sh_col.ncols
    insert_str = ''

    continue_flag = 0
    col_str = ''
    #字段序号标示
    col_num = 0
    col_str = ""
    join_on_str = ""
    insert_single_str =""
    select_single_str =""
    from_str=""
    left_str=""
    join_tab_flag=""
    join_col=""
    alter_str = "ALTER TABLE ODS."+excel_tab_name+" ADD ETL_TIME DATE COMMENT 'ETL加载时间';\n"
    truncate_str = "TRUNCATE TABLE ODS."+excel_tab_name+";\n"
    group_single_str=""
    index_single_str_cid =""
    index_single_str_name =""
    join_col_code=""
    join_col_nm = ""
    op=""
    op_cnt=""
    index_col_nm=""
    id_str=""
    schema_str=""
    for i in range(0,nrows_col):
        if( sh_col.cell_value(i,2) == excel_tab_name ):
            col_num = col_num + 1
            # if( (sh_col.cell_value(i,6).lower() == 'cid') or (sh_col.cell_value(i,2).lower() == 'region_id')  or (sh_col.cell_value(i,2).lower() == 'bureau_name') ):
            #     continue
            #字段类型如果为decimal的话需要特殊处理，其他直接拼接即可
            #如果有组织机构代码和身份证编号用身份证编号
            if( ( (sh_col.cell_value(i,6).lower() == 'organization_code') or (sh_col.cell_value(i,6).lower() == 'unit_name') or (sh_col.cell_value(i,6).lower() == 'legal_representative') )  and (join_tab_flag!="1")  ):
                join_tab_flag = "0"
                if( sh_col.cell_value(i,6).lower() == 'organization_code' ):
                    join_col_code = sh_col.cell_value(i,11)
                else:
                    if( op_cnt == "1"):
                        op = "      AND"
                    else:
                        op = " OR ("
                    if( (sh_col.cell_value(i,6).lower() == 'unit_name')):
                        join_col_nm =join_col_nm + "      "+ op +" "+sh_col.cell_value(i,11)+" = T2.unit_name\n"
                        index_col_nm = index_col_nm + sh_col.cell_value(i,11)+","
                        op_cnt = "1"
                    elif( (sh_col.cell_value(i,6).lower() == 'legal_representative') ):
                        join_col_nm =join_col_nm + "      "+ op +" "+sh_col.cell_value(i,11)+" = T2.CHINESE_NAME\n"
                        index_col_nm = index_col_nm + sh_col.cell_value(i,11)+","
                        op_cnt = "1"
            if( (sh_col.cell_value(i,6).lower() == 'cid') or (sh_col.cell_value(i,6).lower() == 'male_cid') ):
                join_tab_flag = "1"
                join_col_code = sh_col.cell_value(i,11)
                join_col = sh_col.cell_value(i,11)
            if( col_num == 1 ):
                schema_str = sh_col.cell_value(i,9)
                from_str = "\nFROM "+sh_col.cell_value(i,9)+"."+sh_col.cell_value(i,10)+" T1\n"
                index_single_str_cid ="CREATE INDEX "+excel_tab_name+"_cid ON "+sh_col.cell_value(i,9)+"."+sh_col.cell_value(i,10)+"("
                index_single_str_name ="CREATE INDEX "+excel_tab_name+"_name ON "+sh_col.cell_value(i,9)+"."+sh_col.cell_value(i,10)+"("


            #拼接处理
            if( (sh_col.cell_value(i,6).lower() == 'cid') or (sh_col.cell_value(i,2).lower() == 'region_id')  or (sh_col.cell_value(i,2).lower() == 'bureau_name') ):
                pass
            else:
                if ( sh_col.cell_value(i,11).lower() == 'name' ):
                    select_single_str = select_single_str + "T1."+sh_col.cell_value(i,11)+"\n       ,"
                    group_single_str = group_single_str + "T1."+sh_col.cell_value(i,11)+"\n          ,"
                    insert_single_str =insert_single_str+ "       ,"+sh_col.cell_value(i,6)+"\n"
                else:
                    select_single_str = select_single_str + sh_col.cell_value(i,11)+"\n       ,"
                    group_single_str = group_single_str + sh_col.cell_value(i,11)+"\n          ,"
                    insert_single_str =insert_single_str+ "       ,"+sh_col.cell_value(i,6)+"\n"

            continue_flag = 1

            continue
        elif( (sh_col.cell_value(i,1) != excel_tab_name) and (continue_flag == 1) ):
            break
        else:
            continue

    if( join_tab_flag=="0" ):
        join_on_str = "       ON T1."+join_col_code+" = T2.ORGANIZATION_CODE\n"+join_col_nm+"      )\n"
        left_str = "LEFT JOIN ODS.ODS_LEGAL_REPRESENT_ZJ T2\n"
        select_single_str = "SELECT '"+schema_str+"'\n       ,SUBSTR(T2.NEW_ID,1,6)\n       ,''\n       ,T2.NEW_ID\n       ,"+select_single_str
        #select_single_str = "SELECT '"+sh_col.cell_value(i,9)+"'\n       ,SUBSTR(T2."+id_str+",1,6)\n       ,''\n       ,T2."+id_str+"\n       ,"
        group_single_str = "GROUP BY " + "'" + schema_str+"'\n          ,SUBSTR(T2.NEW_ID,1,6)\n          ,''\n          ,T2.NEW_ID\n          ,"+group_single_str
        #group_single_str = group_single_str + "'" + sh_col.cell_value(i,9)+"'\n          ,SUBSTR(T2.NEW_CID,1,6)\n          ,''\n          ,T2.NEW_CID\n          ,"
    elif(  join_tab_flag=="1" ):
        join_on_str = "       ON T1."+ join_col+" = T2.CID\n";
        left_str = "LEFT JOIN ODS.ODS_BASIC_CID_LEGAL_INFO_UNION T2\n"
        select_single_str = "SELECT '"+schema_str+"'\n       ,SUBSTR(T2.NEW_CID,1,6)\n       ,''\n       ,T2.NEW_CID\n       ,"+select_single_str
      #select_single_str = "SELECT '"+sh_col.cell_value(i,9)+"'\n       ,SUBSTR(T2."+id_str+",1,6)\n       ,''\n       ,T2."+id_str+"\n       ,"
        group_single_str = "GROUP BY " + "'" + schema_str+"'\n          ,SUBSTR(T2.NEW_CID,1,6)\n          ,''\n          ,T2.NEW_CID\n          ,"+group_single_str


    replace_comma = re.compile(r',$')

    index_col_nm = replace_comma.sub('',index_col_nm)
    select_single_str = select_single_str +"SYSDATE()"
    insert_single_str = insert_single_str + "       ,ETL_TIME\n)\n"
    group_single_str = replace_comma.sub('',group_single_str) +";\n"
    index_single_str_cid = replace_comma.sub('',index_single_str_cid)+join_col_code+");\n"
    index_single_str_name = replace_comma.sub('',index_single_str_name)+index_col_nm+");\n"
    if( index_col_nm ):
        pass
    else:
        index_single_str_name=""
    #第一条有create index和alter语句，第二个没有
    # all_str = truncate_str+alter_str+index_single_str_cid+index_single_str_name+insert_str + insert_single_str + select_single_str + from_str + left_str + join_on_str + group_single_str
    all_str = truncate_str+insert_str + insert_single_str + select_single_str + from_str + left_str + join_on_str + group_single_str
    return all_str

#记录SQL
def record_sql(all_str):
    #获取系统登录用户
    user = getpass.getuser()
    #指定文件生成路径
    file = "E:\\脚本生成的地方\\ODS日常增量\\INSERT"%user
    file_sql = open(file,'a+')
    try:
        file_sql.writelines(all_str)
    finally:
        file_sql.close()

#获取建表sheet页，所需建表的列表
def get_create_tab_list():
    #打开表级excel，获取行值、列值
    sheet_name_tab = "建表列表"
    sh_crt_tab = work_book.sheet_by_name(sheet_name_tab)
    nrows_crt_tab = sh_crt_tab.nrows
    ncols_crt_tab = sh_crt_tab.ncols

    create_tab_list = [([0] * ncols_crt_tab) for i in range(nrows_crt_tab-1)]

    for i in range(1,nrows_crt_tab):

        create_tab_list[i-1] = [sh_crt_tab.cell_value(i,0),sh_crt_tab.cell_value(i,1)]

    return create_tab_list


#主程序
try:
    if __name__ == '__main__':
        #判断输入参数个数，参数0为脚本名称，参数1为excel全路径，参数2为模式名，参数3为表名
        if( len(sys.argv) < 2 ):
            print("Please input the data dictionary\n")
            excel_name = input()
        else:
            excel_name = sys.argv[1]
        work_book = xlrd.open_workbook(excel_name)
        #如果有参数中有需要创建的表名，则创建制定的表名，如果没有创建excel中“建表列表”中的表
        if( len(sys.argv)>3 ):
            excel_schema_name = sys.argv[2]
            excel_tab_name = sys.argv[3]
        #create_tab_str = open_excel(work_book,excel_schema_name,excel_tab_name)
            all_str = open_excel(excel_schema_name,excel_tab_name)
            record_sql(all_str)
        else:
            crt_tab_list_arr = get_create_tab_list()
            arr_len = len(crt_tab_list_arr)
            for i in range(0,arr_len):
                #判断当列是否为空，如为空跨过
                pattern = re.compile(r'\w')
                match = pattern.match(str(crt_tab_list_arr[i][0]))
                if(match):
                    all_str = open_excel(crt_tab_list_arr[i][0],crt_tab_list_arr[i][1])
                    record_sql(all_str)
                else:
                    continue
    print("All jobs are done")
except Exception as e:
    print(Exception,":",e)
    sys.exit(1)
