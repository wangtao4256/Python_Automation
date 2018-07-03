#!/usr/bin/python
# -*- coding:utf-8 -*-
__author__ = 'KD'

import uuid
import datetime
import time
import xlrd
import sys
import re
import codecs

#生成线段连接及图表
def gen_line():
    sheet_name_cfg = "依赖关系设置"
    #打开导入配置excel，获取详细导入配置
    sh_cfg = work_book.sheet_by_name(sheet_name_cfg)
    nrows_cfg = sh_cfg.nrows

    #初始化数据导入
    sequenceFlow = '''<definitions id="review-definitions" typeLanguage="http://www.w3.org/2001/XMLSchema" expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://activiti.org/bpmn20" xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn">\n  
                    <process id="workflow_dataimport_init_enjoy" name="初始化数据导入_昂捷">\n'''
    bpmndi = '''  <bpmndi:BPMNDiagram id="BPMNPlane_workflow_dataimport_init_enjoy">\n    
                 <bpmndi:BPMNPlane bpmnElement="workflow_dataimport_init_enjoy" id="BPMNPlane_workflow_dataimport_init_enjoy">\n'''

    #增量数据导入
    #sequenceFlow = '''<definitions id="review-definitions" typeLanguage="http://www.w3.org/2001/XMLSchema" expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://activiti.org/bpmn20" xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn">\n
                    #<process id="workflow_dataimport_enjoy" name="SRC增量数据导入_昂捷">\n'''
    #bpmndi = '''  <bpmndi:BPMNDiagram id="BPMNDiagram_workflow_dataimport_enjoy">\n
                #<bpmndi:BPMNPlane bpmnElement="workflow_dataimport_enjoy" id="BPMNPlane_workflow_dataimport_enjoy">\n'''


    for i in range(1,nrows_cfg):
        #判断依赖节点是否为空
        if( sh_cfg.cell_value(i,2) ):
            line_name = "线段_" + str(i)
            #jbpm规则大写字母开头，位数应该也有限制，具体多少不太清楚
            sourceRef = 'A' + str(uuid.uuid3(uuid.NAMESPACE_DNS, sh_cfg.cell_value(i,1).lower())).replace("-",'').upper()[1:9]
            targetRef = 'A' + str(uuid.uuid3(uuid.NAMESPACE_DNS, sh_cfg.cell_value(i,2).lower())).replace("-",'').upper()[1:9]
            line_id = 'A' + str(uuid.uuid3(uuid.NAMESPACE_DNS, line_name)).replace("-",'').upper()[1:9]
            sequenceFlow = sequenceFlow + '    <sequenceFlow sourceRef="' + sourceRef +'" targetRef="' + targetRef + '" id="' + line_id + '" name="' + line_name + '"/>\n'
            bpmndi = bpmndi + '''      <bpmndi:BPMNEdge id="BPMNEdge_%s" bpmnElement="%s">\n        <omgdi:waypoint x="100" y="100"/>\n        <omgdi:waypoint x="100" y="100"/>\n      </bpmndi:BPMNEdge>\n'''%(line_id,line_id)
    return (sequenceFlow,bpmndi)

#生成线段连接及图表
def gen_job():
    sheet_name_cfg = "作业属性设置"
    #打开导入配置excel，获取详细导入配置
    sh_cfg = work_book.sheet_by_name(sheet_name_cfg)
    nrows_cfg = sh_cfg.nrows
    ncols_cfg = sh_cfg.ncols
    start_job_name = "开始节点"
    start_job_id = 'A' + str(uuid.uuid3(uuid.NAMESPACE_DNS, start_job_name)).replace("-",'').upper()[1:9]
    job_str = '''    <startEvent id="%s" name="%s"/>\n'''%(start_job_id,start_job_name)
    start_job_name = ""
    bpmndi = '''      <bpmndi:BPMNShape id="BPMNShape_%s" bpmnElement="%s">
        <omgdc:Bounds height="25" width="25" x="400" y="100"/>
      </bpmndi:BPMNShape>\n'''%(start_job_id,start_job_id)
    #定义x轴，y轴初始化位置
    x = "400"
    y = "100"
    #定义x轴，y轴的间隔
    x_interval = "60"
    y_interval = "60"
    for i in range(1,nrows_cfg):
        job_scripttypeid = ""
        #判断作业节点是否为空
        if( sh_cfg.cell_value(i,4) ):
            job_name = sh_cfg.cell_value(i,5).lower()
            job_id = 'A' + str(uuid.uuid3(uuid.NAMESPACE_DNS, job_name)).replace("-",'').upper()[1:9]
            job_type = sh_cfg.cell_value(i,1)
            job_project_name = sh_cfg.cell_value(i,2)
            job_scripttype = sh_cfg.cell_value(i,4)
            job_taskid = str(uuid.uuid3(uuid.NAMESPACE_DNS, sh_cfg.cell_value(i,5).lower())).replace("-",'')
            if( sh_cfg.cell_value(i,4).upper() == 'PYTHON' ):
                job_scripttypeid = "2"
            elif( sh_cfg.cell_value(i,3).upper() == 'KHAN' ):
                job_scripttypeid = "11"
            elif( sh_cfg.cell_value(i,4).upper() == 'HIVE' ):
                job_scripttypeid = "1"
            elif( sh_cfg.cell_value(i,3).upper() == 'SHELL' ):
                job_scripttypeid = "0"
            job_projectid = sh_cfg.cell_value(i,3)
            job_nodeErrorRepeatTimes = sh_cfg.cell_value(i,7)
            job_scriptPara = sh_cfg.cell_value(i,8)
            x_site = int(x) + int(i)*int(x_interval)
            y_site = int(y) + int(i)*int(y_interval)
            job_str = job_str + '''    <serviceTask id="%s" name="%s" activiti:async="true" activiti:exclusive="false">
      <extensionElements>
        <activiti:field name="type">
          <activiti:expression>%s</activiti:expression>
        </activiti:field>
        <activiti:field name="params">
          <activiti:expression>{"projectName":"%s","scriptType":"%s","resultName":"","taskId":"%s","scriptTypeId":"%s","projectId":"%s","nodeErrorRepeatTimes":%s,"resultInfo":"","scriptPara":"%s"}</activiti:expression>
        </activiti:field>
        <activiti:field name="remark">
          <activiti:expression></activiti:expression>
        </activiti:field>
        <activiti:field name="message">
          <activiti:expression>{"messageType":"","executionTime":0,"mailGroup":0,"monitorType":"","smsGroup":0}</activiti:expression>
        </activiti:field>
      </extensionElements>
    </serviceTask>\n'''%(job_id,job_name,job_type,job_project_name,job_scripttype,job_taskid,job_scripttypeid,job_projectid,job_nodeErrorRepeatTimes,job_scriptPara)
            bpmndi = bpmndi +  '''      <bpmndi:BPMNShape id="BPMNShape_%s" bpmnElement="%s">
        <omgdc:Bounds height="30" width="30" x="%s" y="%s"/>
      </bpmndi:BPMNShape>\n'''%(job_id,job_id,x_site,y_site)
    bpmndi = bpmndi + '''    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>'''
    job_str = job_str + '  </process>\n'
    return (job_str,bpmndi)

#生成py文件
def record_xml_file(sequenceFlow,bpmndi_start,job_str,bpmndi_end):
    #指定文件生成路径
    des_file = "E://脚本生成的地方//SRC工作流导出//SRC初始化工作流//workflow_dataimport_init_enjoy.xml"
    file_write = codecs.open(des_file,'w','utf-8')
    file_write.writelines(sequenceFlow)
    file_write.writelines(job_str)
    file_write.writelines(bpmndi_start)
    file_write.writelines(bpmndi_end)
    file_write.close()

if __name__ == '__main__':

    work_book = xlrd.open_workbook("工作流配置表//工作流配置统计表_INIT_ENJOY.xlsx")

    #全部生成
    (sequenceFlow,bpmndi_start) = gen_line()
    (job_str,bpmndi_end) = gen_job()
    record_xml_file(sequenceFlow,bpmndi_start,job_str,bpmndi_end)

