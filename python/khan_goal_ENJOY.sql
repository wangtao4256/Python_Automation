DROP TABLE IF EXISTS ods.ods_tb_card ;
CREATE  TABLE ods.ods_tb_card
(   c_cardno  VARCHAR(20) ,
  c_grade  VARCHAR(10) ,
  c_cardname  VARCHAR(20) ,
  c_comsumed  NUMERIC(22,19) ,
  c_paid  NUMERIC(22,19) ,
  c_deposit  NUMERIC(22,19) ,
  c_type  VARCHAR(20) ,
  c_disc_type  VARCHAR(20) ,
  c_status  VARCHAR(20) ,
  c_mid  VARCHAR(42) ,
  c_s_date  DATE ,
  c_e_date  DATE ,
  c_customer  VARCHAR(20) ,
  c_psword  VARCHAR(30) ,
  c_verify  VARCHAR(30) ,
  c_mk_store_id  VARCHAR(10) ,
  c_store_id  VARCHAR(250) ,
  c_modified_userno  VARCHAR(10) ,
  c_modified_dt  DATE ,
  c_saved  NUMERIC(22,19) ,
  c_recycle_status  VARCHAR(20) ,
  c_recycle_dt  DATE ,
  c_recycle_userno  VARCHAR(10) ,
  c_recycle_store_id  VARCHAR(10) ,
  c_cardname_new  VARCHAR(400) ,
  c_ic_id  VARCHAR(50) ,
  c_card_note  VARCHAR(50) ,
  c_is_entity  VARCHAR(10) ,
  c_bind_psword  VARCHAR(100) ,
  c_use_scope  VARCHAR(100) ,
  c_is_once  VARCHAR(10) ,
  infa_create_date  DATE ,
  infa_update_date  DATE ,
  infa_remark  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_card  is '卡信息表';
DROP TABLE IF EXISTS ods.ods_tb_card_def ;
CREATE  TABLE ods.ods_tb_card_def
(   c_name  VARCHAR(20) ,
  c_store_id  VARCHAR(250) ,
  c_type  VARCHAR(20) ,
  c_disc_type  VARCHAR(20) ,
  c_st_no  VARCHAR(20) ,
  c_en_no  VARCHAR(20) ,
  c_media  VARCHAR(10) ,
  c_live_month  NUMERIC(22,10) ,
  c_publish  VARCHAR(10) ,
  c_cust_info  VARCHAR(20) ,
  c_password  VARCHAR(20) ,
  c_label_len  NUMERIC(22,10) ,
  c_qualification  VARCHAR(255) ,
  c_introduce_dt  DATE ,
  c_modified_userno  VARCHAR(10) ,
  c_modified_dt  DATE ,
  c_canchange_edt  VARCHAR(10) ,
  c_fix_enddt  DATE ,
  c_grade_limit  VARCHAR(20) ,
  c_verify_method  VARCHAR(50) ,
  c_verify_len  VARCHAR(50) ,
  c_cardno_mktype  VARCHAR(20) ,
  c_cardno_mkrule  VARCHAR(50) ,
  c_mid_mktype  VARCHAR(20) ,
  c_mid_mkrule  VARCHAR(50) ,
  c_face_value  NUMERIC(22,19) ,
  c_must_init_deposit  VARCHAR(10) ,
  c_deposit_type  VARCHAR(1000) ,
  c_freeze  NUMERIC(22,19) ,
  c_recycle  VARCHAR(10) ,
  c_id_method  VARCHAR(20) ,
  c_cardbin  VARCHAR(20) ,
  c_skip  VARCHAR(20) ,
  c_cardname_code  VARCHAR(10) ,
  c_cardtype_code  VARCHAR(10) ,
  c_carddef_guid  VARCHAR(36) ,
  c_is_jointly  VARCHAR(10) ,
  c_use_scope  VARCHAR(100) ,
  c_is_once  VARCHAR(10) ,
  c_init_add_score  NUMERIC(22,19) ,
  c_day_rate  NUMERIC(22,18) ,
  c_year_fee  NUMERIC(22,19) ,
  c_is_smsg_verify  VARCHAR(10) ,
  c_extend  VARCHAR(4000) ,
  c_delay_month  NUMERIC(22,10) ,
  c_fix_startdt  DATE );
 comment on  table ods.ods_tb_card_def  is '卡发行定义表';
DROP TABLE IF EXISTS ods.ods_tb_customer ;
CREATE  TABLE ods.ods_tb_customer
(   c_no  VARCHAR(20) ,
  c_name  VARCHAR(20) ,
  c_id  VARCHAR(20) ,
  c_type  VARCHAR(20) ,
  c_grade  VARCHAR(20) ,
  c_group  VARCHAR(50) ,
  c_title  VARCHAR(20) ,
  c_adress  VARCHAR(100) ,
  c_post_code  VARCHAR(10) ,
  c_tele1  VARCHAR(40) ,
  c_tele2  VARCHAR(50) ,
  c_fax  VARCHAR(20) ,
  c_email  VARCHAR(40) ,
  c_fond  VARCHAR(40) ,
  c_born_date  DATE ,
  c_sex  VARCHAR(2) ,
  c_earning  VARCHAR(20) ,
  c_educattion  VARCHAR(20) ,
  c_job  VARCHAR(20) ,
  c_score  NUMERIC(22,19) ,
  c_used_score  NUMERIC(22,19) ,
  c_cut_score  NUMERIC(22,19) ,
  c_credit  NUMERIC(22,19) ,
  c_dm_status  VARCHAR(20) ,
  c_dm_reason  VARCHAR(50) ,
  c_p_userno  VARCHAR(10) ,
  c_introduce_date  DATE ,
  c_mk_store_id  VARCHAR(10) ,
  c_store_id  VARCHAR(10) ,
  c_comments  VARCHAR(50) ,
  c_note  VARCHAR(200) ,
  c_modify_userno  VARCHAR(10) ,
  c_modify_dt  DATE ,
  c_sms_status  VARCHAR(20) ,
  c_sms_reason  VARCHAR(50) ,
  c_join_type  VARCHAR(20) ,
  c_corp  VARCHAR(50) ,
  c_corp_address  VARCHAR(50) ,
  c_corp_tele  VARCHAR(40) ,
  c_corp_depart  VARCHAR(20) ,
  c_guid  VARCHAR(36) ,
  c_note2  VARCHAR(200) ,
  c_note3  VARCHAR(200) ,
  c_hope_prom_action  VARCHAR(250) ,
  c_hope_prom_info  VARCHAR(250) ,
  c_join_id  VARCHAR(250) ,
  c_join_amount  NUMERIC(22,19) ,
  c_cust_status  VARCHAR(20) ,
  c_s_guid  VARCHAR(36) ,
  c_notice_info  VARCHAR(200) ,
  c_id_type  VARCHAR(20) ,
  c_account_no  VARCHAR(80) ,
  c_account_bank  VARCHAR(100) ,
  c_account_name  VARCHAR(120) ,
  c_valuecard_flag  VARCHAR(10) ,
  c_company  VARCHAR(120) ,
  c_company_address  VARCHAR(200) ,
  c_category  VARCHAR(50) ,
  c_consume_type  VARCHAR(100) ,
  c_p_userno2  VARCHAR(10) ,
  c_last_score  NUMERIC(22,19) ,
  c_last_used_score  NUMERIC(22,19) ,
  c_last_cut_score  NUMERIC(22,19) ,
  c_last_score_dt  DATE ,
  c_extend  VARCHAR(4000) ,
  c_cust_comsumed  NUMERIC(22,19) ,
  c_last_cust_comsumed  NUMERIC(22,19) ,
  c_nation  VARCHAR(20) ,
  c_qq  VARCHAR(50) ,
  c_msn  VARCHAR(150) ,
  c_ecno  VARCHAR(20) ,
  c_micromsg_id  VARCHAR(100) ,
  c_micromsg_dt  DATE ,
  c_first_dt  DATE ,
  c_last_dt  DATE ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_customer  is '顾客信息表';
DROP TABLE IF EXISTS ods.ods_tb_import_customer ;
CREATE  TABLE ods.ods_tb_import_customer
(   c_sort  NUMERIC(22,10) ,
  c_cardno  VARCHAR(30) ,
  c_id  VARCHAR(20) ,
  c_name  VARCHAR(20) ,
  c_cardname  VARCHAR(20) ,
  c_type  VARCHAR(20) ,
  c_requ_money  NUMERIC(22,19) ,
  c_group  VARCHAR(20) ,
  c_born_date  DATE ,
  c_sex  VARCHAR(2) ,
  c_mobile  VARCHAR(40) ,
  c_phone  VARCHAR(40) ,
  c_post_code  VARCHAR(10) ,
  c_address  VARCHAR(50) ,
  c_corp_tele  VARCHAR(40) ,
  c_educattion  VARCHAR(20) ,
  c_corp  VARCHAR(50) ,
  c_corp_address  VARCHAR(50) ,
  c_note  VARCHAR(200) ,
  c_year_earning  VARCHAR(20) ,
  c_cust_type  VARCHAR(20) ,
  c_recommender  VARCHAR(10) ,
  c_in_no  VARCHAR(50) ,
  c_modified_dt  DATE ,
  c_modified_userno  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_import_customer  is '会员信息导入表';
DROP TABLE IF EXISTS ods.ods_tb_log_module ;
CREATE  TABLE ods.ods_tb_log_module
(   c_userno  VARCHAR(10) ,
  c_username  VARCHAR(20) ,
  c_mdcode  VARCHAR(60) ,
  c_mdname  VARCHAR(255) ,
  c_mdcname  VARCHAR(100) ,
  c_enter_dt  DATE ,
  c_leave_dt  DATE ,
  c_computername  VARCHAR(30) ,
  c_ip  VARCHAR(15) ,
  c_note  VARCHAR(255) ,
  c_menu_code  VARCHAR(30) ,
  c_menu_role  VARCHAR(30) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_log_module  is '用户功能使用日志：在退出模块时计入';
DROP TABLE IF EXISTS ods.ods_tb_mpos_o_card ;
CREATE  TABLE ods.ods_tb_mpos_o_card
(   c_identity  NUMERIC(22,10) ,
  c_guid  VARCHAR(36) ,
  c_dt  DATE ,
  c_mpos_no  VARCHAR(20) ,
  c_mpos_storeno  VARCHAR(20) ,
  c_mpos_id  VARCHAR(20) ,
  c_batch_no  VARCHAR(20) ,
  c_cardno  VARCHAR(20) ,
  c_mid  VARCHAR(200) ,
  c_type  VARCHAR(20) ,
  c_amount  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_src_id  NUMERIC(22,10) ,
  c_if_reverse  VARCHAR(10) ,
  c_rand  VARCHAR(20) ,
  c_store_id  VARCHAR(10) ,
  c_note  VARCHAR(100) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_mpos_o_card  is 'mpos交易流水';
DROP TABLE IF EXISTS ods.ods_tb_mpos_pay ;
CREATE  TABLE ods.ods_tb_mpos_pay
(   c_id  VARCHAR(20) ,
  c_sno  VARCHAR(20) ,
  c_mk_dt  DATE ,
  c_mk_userno  VARCHAR(10) ,
  c_au_dt  DATE ,
  c_au_userno  VARCHAR(10) ,
  c_charge_userno  VARCHAR(10) ,
  c_status  VARCHAR(20) ,
  c_cur_amount  NUMERIC(22,19) ,
  c_cur_score  NUMERIC(22,19) ,
  c_type  VARCHAR(20) ,
  c_amount  NUMERIC(22,19) ,
  c_store_id  VARCHAR(10) ,
  c_note  VARCHAR(1000) ,
  c_start_dt  DATE ,
  c_end_dt  DATE ,
  c_deduct  NUMERIC(22,19) ,
  c_approve_status  VARCHAR(20) ,
  c_approve_dt  DATE ,
  c_print_status  VARCHAR(50) ,
  c_pass_in  NUMERIC(22,19) ,
  c_pass_out  NUMERIC(22,19) ,
  c_pay_status  VARCHAR(20) ,
  c_period  NUMERIC(22,10) ,
  c_delay_day  NUMERIC(22,10) ,
  c_bank_rate  NUMERIC(22,10) ,
  c_fee_rate  NUMERIC(22,10) ,
  c_bank_deduct  NUMERIC(22,19) ,
  c_pay_type  VARCHAR(20) ,
  c_alter  NUMERIC(22,19) ,
  c_approve_detail  VARCHAR(2000) ,
  c_data_source  VARCHAR(100) ,
  c_pay_userno  VARCHAR(10) ,
  c_pay_dt  DATE ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_mpos_pay  is '商户结算单';
DROP TABLE IF EXISTS ods.ods_tb_mpos_payg ;
CREATE  TABLE ods.ods_tb_mpos_payg
(   c_id  VARCHAR(20) ,
  c_sort  NUMERIC(22,10) ,
  c_store_id  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_amount  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_count  NUMERIC(22,18) ,
  c_note  VARCHAR(100) );
 comment on  table ods.ods_tb_mpos_payg  is '非自营供应商结算单（副表）';
DROP TABLE IF EXISTS ods.ods_tb_mpos_store ;
CREATE  TABLE ods.ods_tb_mpos_store
(   c_guid  VARCHAR(50) ,
  c_no  VARCHAR(40) ,
  c_name  VARCHAR(60) ,
  c_address  VARCHAR(60) ,
  c_tele  VARCHAR(50) ,
  c_mobile  VARCHAR(50) ,
  c_email  VARCHAR(50) ,
  c_link_man  VARCHAR(20) ,
  c_identity  VARCHAR(20) ,
  c_account_bank  VARCHAR(40) ,
  c_account_name  VARCHAR(60) ,
  c_account_no  VARCHAR(80) ,
  c_pay_status  VARCHAR(20) ,
  c_status  VARCHAR(20) ,
  c_score_rate  NUMERIC(22,10) ,
  c_fee  NUMERIC(22,19) ,
  c_amount  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_paid  NUMERIC(22,19) ,
  c_added_score  NUMERIC(22,19) ,
  c_last_paydt  DATE ,
  c_store_id  VARCHAR(10) ,
  c_note  VARCHAR(100) ,
  c_modified_dt  DATE ,
  c_modified_userno  VARCHAR(10) ,
  c_fee_formula  VARCHAR(4000) ,
  c_period  NUMERIC(22,10) ,
  c_delay_day  NUMERIC(22,10) ,
  c_type  VARCHAR(20) ,
  c_bank_rate  NUMERIC(22,10) ,
  c_fee_rate  NUMERIC(22,10) ,
  c_pay_type  VARCHAR(20) ,
  c_provider  VARCHAR(20) ,
  c_con_no  VARCHAR(20) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_mpos_store  is '移动pos商户表';
DROP TABLE IF EXISTS ods.ods_tb_msg ;
CREATE  TABLE ods.ods_tb_msg
(   c_guid  VARCHAR(72) ,
  c_source_guid  VARCHAR(72) ,
  c_type  VARCHAR(100) ,
  c_title  VARCHAR(4000) ,
  c_content  VARCHAR(4000) ,
  c_content_type  VARCHAR(100) ,
  c_status  VARCHAR(100) ,
  c_key1  VARCHAR(100) ,
  c_key2  VARCHAR(100) ,
  c_key3  VARCHAR(100) ,
  c_key4  VARCHAR(1000) ,
  c_dt  DATE ,
  c_store_id  VARCHAR(100) ,
  c_userno  VARCHAR(100) ,
  c_username  VARCHAR(120) ,
  c_ip  VARCHAR(100) ,
  c_computer_name  VARCHAR(100) ,
  c_origin  VARCHAR(100) ,
  c_web_page  VARCHAR(400) ,
  c_note  VARCHAR(400) ,
  c_key5  VARCHAR(100) ,
  c_key6  VARCHAR(100) ,
  c_xml_content  VARCHAR(4000) ,
  c_template_mobile  VARCHAR(4000) ,
  c_local_server_ip  VARCHAR(400) ,
  c_data_ip  VARCHAR(400) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_msg  is '消息内容表';
DROP TABLE IF EXISTS ods.ods_tb_o_card ;
CREATE  TABLE ods.ods_tb_o_card
(   c_guid  VARCHAR(36) ,
  c_store_id  VARCHAR(10) ,
  c_cardno  VARCHAR(20) ,
  c_customer  VARCHAR(20) ,
  c_mid  VARCHAR(42) ,
  c_type  VARCHAR(20) ,
  c_id  VARCHAR(20) ,
  c_a  NUMERIC(22,19) ,
  c_datetime  DATE ,
  c_userno  VARCHAR(10) ,
  c_note  VARCHAR(200) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_card  is '卡变动表';
DROP TABLE IF EXISTS ods.ods_tb_o_card_use ;
CREATE  TABLE ods.ods_tb_o_card_use
(   c_id  VARCHAR(20) ,
  c_s_store_id  VARCHAR(10) ,
  c_d_store_id  VARCHAR(50) ,
  c_s_adno  VARCHAR(20) ,
  c_d_adno  VARCHAR(20) ,
  c_mk_dt  DATE ,
  c_mk_userno  VARCHAR(20) ,
  c_mk_store_id  VARCHAR(10) ,
  c_au_userno  VARCHAR(20) ,
  c_au_dt  DATE ,
  c_status  VARCHAR(20) ,
  c_amount  NUMERIC(22,19) ,
  c_number  NUMERIC(22,10) ,
  c_note  VARCHAR(50) ,
  c_approve_status  VARCHAR(20) ,
  c_approve_dt  DATE ,
  c_charger_in  VARCHAR(20) ,
  c_charger_out  VARCHAR(20) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_card_use  is '无';
DROP TABLE IF EXISTS ods.ods_tb_o_card_useg ;
CREATE  TABLE ods.ods_tb_o_card_useg
(   c_id  VARCHAR(20) ,
  c_sort  NUMERIC(22,10) ,
  c_st_cardno  VARCHAR(20) ,
  c_en_cardno  VARCHAR(20) ,
  c_amount  NUMERIC(22,19) ,
  c_number  NUMERIC(22,10) ,
  c_note  VARCHAR(50) ,
  c_packno  VARCHAR(20) );
 comment on  table ods.ods_tb_o_card_useg  is '无';
DROP TABLE IF EXISTS ods.ods_tb_o_check ;
CREATE  TABLE ods.ods_tb_o_check
(   c_guid  VARCHAR(36) ,
  c_store_id  VARCHAR(10) ,
  c_check_no  VARCHAR(40) ,
  c_type  VARCHAR(20) ,
  c_source_id  VARCHAR(20) ,
  c_no  VARCHAR(20) ,
  c_name  VARCHAR(100) ,
  c_account_bank  VARCHAR(40) ,
  c_account_no  VARCHAR(80) ,
  c_link_man  VARCHAR(10) ,
  c_link_tele  VARCHAR(100) ,
  c_link_info  VARCHAR(100) ,
  c_amount  NUMERIC(22,19) ,
  c_status  VARCHAR(20) ,
  c_mk_type  VARCHAR(20) ,
  c_mk_userno  VARCHAR(10) ,
  c_mk_dt  DATE ,
  c_mk_store_id  VARCHAR(10) ,
  c_au_userno  VARCHAR(10) ,
  c_au_dt  DATE ,
  c_ac_userno  VARCHAR(10) ,
  c_ac_dt  DATE ,
  c_end_userno  VARCHAR(10) ,
  c_end_dt  DATE ,
  c_end_store_id  VARCHAR(10) ,
  c_note  VARCHAR(100) ,
  c_s_account_bank  VARCHAR(40) ,
  c_retbill_status  VARCHAR(20) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_check  is '支票登记表';
DROP TABLE IF EXISTS ods.ods_tb_o_d ;
CREATE  TABLE ods.ods_tb_o_d
(   c_id  VARCHAR(20) ,
  c_source_id  VARCHAR(20) ,
  c_store_id  VARCHAR(10) ,
  c_adno  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_mk_dt  DATE ,
  c_mk_userno  VARCHAR(10) ,
  c_mk_store_id  VARCHAR(10) ,
  c_au_dt  DATE ,
  c_au_userno  VARCHAR(10) ,
  c_charge_userno  VARCHAR(10) ,
  c_status  VARCHAR(20) ,
  c_present_type  VARCHAR(20) ,
  c_present_status  VARCHAR(20) ,
  c_present_amount  NUMERIC(22,19) ,
  c_present_cardno  VARCHAR(20) ,
  c_present_dt  DATE ,
  c_present_userno  VARCHAR(10) ,
  c_customer  VARCHAR(100) ,
  c_approve_status  VARCHAR(20) ,
  c_approve_dt  DATE ,
  c_note  VARCHAR(1000) ,
  c_m_type  VARCHAR(20) ,
  c_m_no  VARCHAR(50) ,
  c_deposit_type  VARCHAR(40) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_d  is '储值卡存款单';
DROP TABLE IF EXISTS ods.ods_tb_o_d_batch ;
CREATE  TABLE ods.ods_tb_o_d_batch
(   c_id  VARCHAR(20) ,
  c_source_id  VARCHAR(250) ,
  c_mk_no  VARCHAR(20) ,
  c_store_id  VARCHAR(10) ,
  c_adno  VARCHAR(20) ,
  c_type  VARCHAR(20) ,
  c_m_type  VARCHAR(20) ,
  c_m_no  VARCHAR(50) ,
  c_count  NUMERIC(22,10) ,
  c_amount  NUMERIC(22,19) ,
  c_advice_disc  NUMERIC(22,19) ,
  c_fact_disc  NUMERIC(22,19) ,
  c_status  VARCHAR(20) ,
  c_customer  VARCHAR(20) ,
  c_customer_tele  VARCHAR(50) ,
  c_customer_company  VARCHAR(50) ,
  c_comment  VARCHAR(300) ,
  c_mk_dt  DATE ,
  c_mk_userno  VARCHAR(10) ,
  c_mk_store_id  VARCHAR(10) ,
  c_au_dt  DATE ,
  c_au_userno  VARCHAR(10) ,
  c_end_dt  DATE ,
  c_end_userno  VARCHAR(10) ,
  c_charge_userno  VARCHAR(10) ,
  c_print_status  VARCHAR(50) ,
  c_approve_status  VARCHAR(20) ,
  c_approve_dt  DATE ,
  c_note  VARCHAR(100) ,
  c_pay_dt  DATE ,
  c_pay_userno  VARCHAR(10) ,
  c_account_bank  VARCHAR(40) ,
  c_account_name  VARCHAR(60) ,
  c_account_no  VARCHAR(80) ,
  c_is_new_cust  VARCHAR(20) ,
  c_check_dt  DATE ,
  c_check_userno  VARCHAR(10) ,
  c_score_card  VARCHAR(20) ,
  c_deposit_type  VARCHAR(40) ,
  c_ret_flag  VARCHAR(10) ,
  c_input_amount  NUMERIC(22,19) ,
  c_original_id  VARCHAR(20) ,
  c_guid  VARCHAR(36) ,
  c_source_advice_disc  NUMERIC(22,19) ,
  c_invoice_status  VARCHAR(20) ,
  c_invoice_userno  VARCHAR(10) ,
  c_invoice_dt  DATE ,
  c_invoice_amount  NUMERIC(22,19) ,
  c_invoice_id  VARCHAR(50) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_d_batch  is '储值卡批量存取款单';
DROP TABLE IF EXISTS ods.ods_tb_o_d_batch_paylist ;
CREATE  TABLE ods.ods_tb_o_d_batch_paylist
(   c_guid  VARCHAR(36) ,
  c_id  VARCHAR(20) ,
  c_type  VARCHAR(50) ,
  c_amount  NUMERIC(22,19) ,
  c_dt  DATE ,
  c_userno  VARCHAR(10) ,
  c_cardno  VARCHAR(20) ,
  c_note  VARCHAR(100) ,
  c_customer  VARCHAR(20) ,
  c_customer_tele  VARCHAR(50) ,
  c_customer_company  VARCHAR(50) ,
  c_account_bank  VARCHAR(40) ,
  c_account_name  VARCHAR(60) ,
  c_account_no  VARCHAR(80) ,
  c_bill_type  VARCHAR(20) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_d_batch_paylist  is '批量存款单付款表';
DROP TABLE IF EXISTS ods.ods_tb_o_d_batchg ;
CREATE  TABLE ods.ods_tb_o_d_batchg
(   c_id  VARCHAR(20) ,
  c_sort  NUMERIC(22,10) ,
  c_st_cardno  VARCHAR(20) ,
  c_en_cardno  VARCHAR(20) ,
  c_count  NUMERIC(22,10) ,
  c_save_per_card  NUMERIC(22,19) ,
  c_amount  NUMERIC(22,19) ,
  c_orig_deposit  NUMERIC(22,19) ,
  c_note  VARCHAR(100) ,
  c_packno  VARCHAR(20) ,
  c_deposit_type  VARCHAR(40) ,
  c_deposit_sdt  DATE ,
  c_deposit_edt  DATE ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_d_batchg  is '储值卡批量存款单（副表）';
DROP TABLE IF EXISTS ods.ods_tb_o_dg ;
CREATE  TABLE ods.ods_tb_o_dg
(   c_id  VARCHAR(20) ,
  c_sort  NUMERIC(22,10) ,
  c_cardno  VARCHAR(20) ,
  c_orig_deposit  NUMERIC(22,19) ,
  c_amount  NUMERIC(22,19) ,
  c_deposit  NUMERIC(22,19) ,
  c_customer  VARCHAR(20) ,
  c_use_score  NUMERIC(22,19) ,
  c_note  VARCHAR(100) ,
  c_verify  VARCHAR(50) ,
  c_verify_new  VARCHAR(50) ,
  c_status  VARCHAR(20) ,
  c_s_date  DATE ,
  c_e_date  DATE ,
  c_deposit_type  VARCHAR(40) ,
  c_deposit_sdt  DATE ,
  c_deposit_edt  DATE ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_dg  is '储值卡存款单（副表）';
DROP TABLE IF EXISTS ods.ods_tb_o_sg_card ;
CREATE  TABLE ods.ods_tb_o_sg_card
(   c_guid  VARCHAR(38) ,
  c_identity  NUMERIC(22,10) ,
  c_store_id  VARCHAR(10) ,
  c_id  NUMERIC(22,10) ,
  c_computer_id  NUMERIC(22,10) ,
  c_datetime  DATE ,
  c_cashier  VARCHAR(10) ,
  c_cardno  VARCHAR(20) ,
  c_adno  VARCHAR(10) ,
  c_gcode  VARCHAR(13) ,
  c_subcode  VARCHAR(10) ,
  c_name  VARCHAR(50) ,
  c_ccode  VARCHAR(20) ,
  c_provider  VARCHAR(10) ,
  c_con_no  VARCHAR(20) ,
  c_trademark  VARCHAR(40) ,
  c_model  VARCHAR(20) ,
  c_pt_cost  NUMERIC(22,19) ,
  c_price  NUMERIC(22,19) ,
  c_price_pro  NUMERIC(22,19) ,
  c_price_disc  NUMERIC(22,19) ,
  c_qtty  NUMERIC(22,12) ,
  c_amount  NUMERIC(22,19) ,
  c_deduct_rate  NUMERIC(22,6) ,
  c_score  NUMERIC(22,19) ,
  c_gds_type  VARCHAR(20) ,
  c_pro_status  VARCHAR(20) ,
  c_present_name  VARCHAR(40) ,
  c_type  VARCHAR(20) ,
  c_seller  VARCHAR(10) ,
  c_charger  VARCHAR(10) ,
  c_in_code  VARCHAR(20) ,
  c_note  VARCHAR(200) ,
  c_gds_brand  VARCHAR(40) ,
  c_ctype  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_o_sg_card  is '使用会员卡的销售商品流水表';
DROP TABLE IF EXISTS ods.ods_tb_partner ;
CREATE  TABLE ods.ods_tb_partner
(   c_guid  VARCHAR(50) ,
  c_no  VARCHAR(10) ,
  c_name  VARCHAR(60) ,
  c_pycode  VARCHAR(10) ,
  c_allude_no  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_grade  VARCHAR(20) ,
  c_category  VARCHAR(50) ,
  c_property  VARCHAR(50) ,
  c_stock_measured  VARCHAR(2) ,
  c_area  VARCHAR(20) ,
  c_postcode  VARCHAR(6) ,
  c_address  VARCHAR(120) ,
  c_generalmanager  VARCHAR(10) ,
  c_link_man  VARCHAR(10) ,
  c_link_man_title  VARCHAR(10) ,
  c_link_tele  VARCHAR(100) ,
  c_link_fax  VARCHAR(60) ,
  c_link_email  VARCHAR(30) ,
  c_order_method  VARCHAR(20) ,
  c_order_tele  VARCHAR(20) ,
  c_order_fax  VARCHAR(20) ,
  c_order_email  VARCHAR(20) ,
  c_tax_regno  VARCHAR(20) ,
  c_tax_rate  NUMERIC(22,6) ,
  c_invoice_type  VARCHAR(20) ,
  c_account_bank  VARCHAR(40) ,
  c_account_name  VARCHAR(60) ,
  c_account_no  VARCHAR(80) ,
  c_buy_weekday  VARCHAR(7) ,
  c_buy_weeks  NUMERIC(22,3) ,
  c_delivery_day  NUMERIC(22,3) ,
  c_cancel_day  NUMERIC(22,3) ,
  c_deliver_time  NUMERIC(22,3) ,
  c_pay_mode  VARCHAR(20) ,
  c_pay_cycle  NUMERIC(22,5) ,
  c_code_store_id  VARCHAR(10) ,
  c_store_id_scope  VARCHAR(10) ,
  c_status  VARCHAR(20) ,
  c_pay_status  VARCHAR(20) ,
  c_intro  VARCHAR(1000) ,
  c_trade_scope  VARCHAR(100) ,
  c_trade_area  VARCHAR(100) ,
  c_local_partner  VARCHAR(100) ,
  c_trademarks  VARCHAR(100) ,
  c_incharge_userno  VARCHAR(10) ,
  c_web_page  VARCHAR(200) ,
  c_remark  VARCHAR(1000) ,
  c_au_userno  VARCHAR(10) ,
  c_introduce_date  DATE ,
  c_rec_date  DATE ,
  c_test_day  NUMERIC(22,10) ,
  c_test_plan  NUMERIC(22,19) ,
  c_disuse_date  DATE ,
  c_modified_dt  DATE ,
  c_modified_userno  VARCHAR(10) ,
  c_init_password  VARCHAR(20) ,
  c_pay_memo  VARCHAR(200) ,
  c_mobile_phone  VARCHAR(50) ,
  c_distr_store_id  VARCHAR(10) ,
  c_token  VARCHAR(2) ,
  c_delivery_type  VARCHAR(20) ,
  c_min_order  NUMERIC(22,19) ,
  c_ret_notpay  NUMERIC(22,19) ,
  c_pay_delay_days  NUMERIC(22,10) ,
  c_scm_limit_group  VARCHAR(50) ,
  c_approve_status  VARCHAR(20) ,
  c_approve_dt  DATE ,
  c_approve_detail  VARCHAR(500) ,
  c_distr_wno  VARCHAR(20) ,
  c_distr_exit_wno  VARCHAR(20) ,
  c_min_order_pack  NUMERIC(22,10) ,
  c_booking_type  VARCHAR(20) ,
  c_de_pay_day  VARCHAR(50) ,
  c_storage_mode  VARCHAR(20) );
 comment on  table ods.ods_tb_partner  is '供应商信息表';
DROP TABLE IF EXISTS ods.ods_tb_partner_req_record ;
CREATE  TABLE ods.ods_tb_partner_req_record
(   c_guid  VARCHAR(36) ,
  c_type  VARCHAR(20) ,
  c_partner_guid  VARCHAR(36) ,
  c_partner_charger  VARCHAR(50) ,
  c_partner_tele  VARCHAR(50) ,
  c_dt  DATE ,
  c_use_hours  NUMERIC(22,6) ,
  c_talk_type  VARCHAR(50) ,
  c_charger  VARCHAR(250) ,
  c_detail  VARCHAR(2000) ,
  c_result  VARCHAR(200) ,
  c_note  VARCHAR(2000) ,
  c_record_type  VARCHAR(20) ,
  c_mk_dt  DATE ,
  c_mk_userno  VARCHAR(10) ,
  c_source  VARCHAR(20) ,
  c_mk_store_id  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_partner_req_record  is '潜在商户、商户谈判过程记录表';
DROP TABLE IF EXISTS ods.ods_tb_qry_conditionold ;
CREATE  TABLE ods.ods_tb_qry_conditionold
(   c_guid  VARCHAR(38) ,
  c_qry_guid  VARCHAR(510) ,
  c_condition_id  NUMERIC(22) ,
  c_sort  NUMERIC(22) ,
  c_param_name  VARCHAR(510) ,
  c_bracket_left  VARCHAR(510) ,
  c_table_name_left  VARCHAR(510) ,
  c_table_note_left  VARCHAR(510) ,
  c_col_name  VARCHAR(510) ,
  c_col_cname  VARCHAR(510) ,
  c_data_type  VARCHAR(510) ,
  c_operator  VARCHAR(510) ,
  c_table_name_right  VARCHAR(510) ,
  c_table_note_right  VARCHAR(510) ,
  c_value_cname  VARCHAR(510) ,
  c_value  VARCHAR(510) ,
  c_bracket_right  VARCHAR(510) ,
  c_logic  VARCHAR(510) ,
  c_is_usersel  VARCHAR(510) ,
  c_default_value  VARCHAR(510) ,
  c_input_method  VARCHAR(510) ,
  c_param1  VARCHAR(510) ,
  c_param2  VARCHAR(510) ,
  c_param3  VARCHAR(510) ,
  c_param4  VARCHAR(510) ,
  c_param5  VARCHAR(510) ,
  c_complex_condition  VARCHAR(510) ,
  c_allow_null  VARCHAR(510) );
 comment on  table ods.ods_tb_qry_conditionold  is '无';
DROP TABLE IF EXISTS ods.ods_tb_region ;
CREATE  TABLE ods.ods_tb_region
(   c_guid  VARCHAR(36) ,
  c_no  VARCHAR(20) ,
  c_city  VARCHAR(40) ,
  c_province  VARCHAR(40) ,
  c_note  VARCHAR(100) ,
  c_modify_userno  VARCHAR(20) ,
  c_modify_dt  DATE ,
  c_region_type  VARCHAR(20) );
 comment on  table ods.ods_tb_region  is '地区定义表';
DROP TABLE IF EXISTS ods.ods_tb_score_to_money_list ;
CREATE  TABLE ods.ods_tb_score_to_money_list
(   c_guid  VARCHAR(50) ,
  c_cardno  VARCHAR(20) ,
  c_sdt  DATE ,
  c_edt  DATE ,
  c_amount  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_ret_amount  NUMERIC(22,19) ,
  c_ret_amount_fact  NUMERIC(22,19) ,
  c_ret_cardno  VARCHAR(20) ,
  c_status  VARCHAR(20) ,
  c_au_dt  DATE ,
  c_au_userno  VARCHAR(20) ,
  c_modify_dt  DATE ,
  c_modify_userno  VARCHAR(20) ,
  c_note  VARCHAR(200) ,
  c_note1  VARCHAR(200) ,
  c_gift_type  VARCHAR(20) ,
  c_gift_name  VARCHAR(100) ,
  c_qtty  NUMERIC(22,12) ,
  c_score_method  VARCHAR(20) ,
  c_d_store_id  VARCHAR(10) ,
  c_d_dt  DATE ,
  c_d_userno  VARCHAR(10) ,
  c_customer  VARCHAR(20) ,
  c_mk_store_id  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_policy_guid  VARCHAR(36) ,
  c_cardname  VARCHAR(40) ,
  c_deposit_type  VARCHAR(80) ,
  c_deposit_sdt  DATE ,
  c_deposit_edt  DATE ,
  c_print_count  NUMERIC(22,10) ,
  c_print_dt  DATE ,
  c_print_userno  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_score_to_money_list  is '无';
DROP TABLE IF EXISTS ods.ods_tb_sum_dt ;
CREATE  TABLE ods.ods_tb_sum_dt
(   c_guid  VARCHAR(36) ,
  c_type  VARCHAR(50) ,
  c_dt  DATE ,
  c_store_id  VARCHAR(20) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_sum_dt  is '无';
DROP TABLE IF EXISTS ods.ods_tb_user ;
CREATE  TABLE ods.ods_tb_user
(   c_guid  VARCHAR(36) ,
  c_userno  VARCHAR(10) ,
  c_pycode  VARCHAR(10) ,
  c_name  VARCHAR(10) ,
  c_cardno  VARCHAR(30) ,
  c_adno  VARCHAR(10) ,
  c_title  VARCHAR(20) ,
  c_drate  NUMERIC(22,6) ,
  c_type  VARCHAR(20) ,
  c_flag  VARCHAR(2) ,
  c_psword  VARCHAR(30) ,
  c_psword_wk  VARCHAR(30) ,
  c_email  VARCHAR(60) ,
  c_status  VARCHAR(20) ,
  c_modified_dt  DATE ,
  c_phone  VARCHAR(60) ,
  c_mobile_phone  VARCHAR(20) ,
  c_b_limit  NUMERIC(22,19) ,
  c_store_id  VARCHAR(10) ,
  c_modified_userno  VARCHAR(10) ,
  c_token  VARCHAR(2) ,
  c_imsi  VARCHAR(50) ,
  c_login_types  VARCHAR(100) ,
  c_uid  VARCHAR(20) ,
  c_brand  VARCHAR(200) ,
  c_provider  VARCHAR(200) ,
  c_trademark  VARCHAR(200) ,
  c_disc_type  VARCHAR(20) ,
  c_use_ad  VARCHAR(50) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tb_user  is '系统用户';
DROP TABLE IF EXISTS ods.ods_tbc_lottery_pool ;
CREATE  TABLE ods.ods_tbc_lottery_pool
(   c_def_guid  VARCHAR(50) ,
  c_group  VARCHAR(20) ,
  c_guid  VARCHAR(36) ,
  c_sort  NUMERIC(22,10) ,
  c_sale_id  VARCHAR(20) ,
  c_win_cardno  VARCHAR(20) ,
  c_cust_name  VARCHAR(10) ,
  c_amount  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_checked  VARCHAR(10) ,
  c_check_dt  DATE ,
  c_insert_dt  DATE ,
  c_note  VARCHAR(100) ,
  c_input_cardno  VARCHAR(50) ,
  c_store_id  VARCHAR(10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbc_lottery_pool  is '无';
DROP TABLE IF EXISTS ods.ods_tbs_d_card ;
CREATE  TABLE ods.ods_tbs_d_card
(   c_guid  VARCHAR(36) ,
  c_cardno  VARCHAR(20) ,
  c_store_id  VARCHAR(10) ,
  c_dt  DATE ,
  c_customer  VARCHAR(20) ,
  c_grade  VARCHAR(10) ,
  c_cardname  VARCHAR(20) ,
  c_cardtype  VARCHAR(20) ,
  c_disc_type  VARCHAR(20) ,
  c_status  VARCHAR(20) ,
  c_consumed  NUMERIC(22,19) ,
  c_paid  NUMERIC(22,19) ,
  c_deposit  NUMERIC(22,19) ,
  c_saved  NUMERIC(22,19) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_d_card  is '卡日结算表';
DROP TABLE IF EXISTS ods.ods_tbs_d_card_a ;
CREATE  TABLE ods.ods_tbs_d_card_a
(   c_guid  VARCHAR(36) ,
  c_store_id  VARCHAR(10) ,
  c_cardno  VARCHAR(20) ,
  c_cardname  VARCHAR(20) ,
  c_cardtype  VARCHAR(20) ,
  c_customer  VARCHAR(20) ,
  c_mid  VARCHAR(42) ,
  c_type  VARCHAR(20) ,
  c_id  VARCHAR(20) ,
  c_a  NUMERIC(22,19) ,
  c_datetime  DATE ,
  c_userno  VARCHAR(10) ,
  c_note  VARCHAR(200) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_d_card_a  is '卡变动结算表';
DROP TABLE IF EXISTS ods.ods_tbs_d_card_deposit ;
CREATE  TABLE ods.ods_tbs_d_card_deposit
(   c_dt  DATE ,
  c_cardno  VARCHAR(20) ,
  c_deposit_type  VARCHAR(40) ,
  c_sdt  DATE ,
  c_edt  DATE ,
  c_save  NUMERIC(22,19) ,
  c_deposit  NUMERIC(22,19) ,
  c_paid  NUMERIC(22,19) ,
  c_status  VARCHAR(20) ,
  c_verify  VARCHAR(30) ,
  c_source  VARCHAR(100) ,
  c_note  VARCHAR(100) ,
  c_modified_dt  DATE ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_d_card_deposit  is '卡附属账户日结表，只保留变化的数据';
DROP TABLE IF EXISTS ods.ods_tbs_d_cust ;
CREATE  TABLE ods.ods_tbs_d_cust
(   c_guid  VARCHAR(36) ,
  c_store_id  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_grade  VARCHAR(20) ,
  c_group  VARCHAR(50) ,
  c_title  VARCHAR(20) ,
  c_sex  VARCHAR(2) ,
  c_age  NUMERIC(22,10) ,
  c_earning  VARCHAR(20) ,
  c_educattion  VARCHAR(20) ,
  c_job  VARCHAR(20) ,
  c_dt  DATE ,
  c_sale  NUMERIC(22,19) ,
  c_sale_count  NUMERIC(22,10) ,
  c_count  NUMERIC(22,10) ,
  c_score_add  NUMERIC(22,19) ,
  c_score_use  NUMERIC(22,19) ,
  c_score_cut  NUMERIC(22,19) ,
  c_score  NUMERIC(22,19) ,
  c_used_score  NUMERIC(22,19) ,
  c_cut_score  NUMERIC(22,19) ,
  c_gds_number  NUMERIC(22,19) ,
  c_gds_count  NUMERIC(22,10) ,
  c_customer_count  NUMERIC(22,10) ,
  c_mk_store_id  VARCHAR(10) ,
  c_at_sale  NUMERIC(22,19) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_d_cust  is '顾客购买力结算表';
DROP TABLE IF EXISTS ods.ods_tbs_d_cust_object ;
CREATE  TABLE ods.ods_tbs_d_cust_object
(   c_guid  VARCHAR(36) ,
  c_store_id  VARCHAR(10) ,
  c_type  VARCHAR(20) ,
  c_grade  VARCHAR(20) ,
  c_group  VARCHAR(50) ,
  c_title  VARCHAR(20) ,
  c_sex  VARCHAR(2) ,
  c_age  NUMERIC(22,10) ,
  c_earning  VARCHAR(20) ,
  c_educattion  VARCHAR(20) ,
  c_job  VARCHAR(20) ,
  c_object_type  VARCHAR(20) ,
  c_object_id  VARCHAR(40) ,
  c_dt  DATE ,
  c_sale  NUMERIC(22,19) ,
  c_sale_count  NUMERIC(22,10) ,
  c_gds_number  NUMERIC(22,19) ,
  c_gds_count  NUMERIC(22,10) ,
  c_customer_count  NUMERIC(22,10) ,
  c_mk_store_id  VARCHAR(10) ,
  c_at_sale  NUMERIC(22,19) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_d_cust_object  is '顾客购买力结算表';
DROP TABLE IF EXISTS ods.ods_tbs_m_customer ;
CREATE  TABLE ods.ods_tbs_m_customer
(   c_store_id  VARCHAR(10) ,
  c_dt  DATE ,
  c_year  NUMERIC(22,10) ,
  c_month  NUMERIC(22,10) ,
  c_no  VARCHAR(20) ,
  c_add_score  NUMERIC(22,19) ,
  c_used_score  NUMERIC(22,19) ,
  c_cut_score  NUMERIC(22,19) ,
  c_comsumed  NUMERIC(22,19) ,
  c_comsumed_count  NUMERIC(22,10) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_tbs_m_customer  is '会员顾客月结表';
