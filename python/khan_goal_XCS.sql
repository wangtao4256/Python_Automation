DROP TABLE IF EXISTS ods.ods_t_app_goods_details ;
CREATE  TABLE ods.ods_t_app_goods_details
(   info_id  NUMERIC(22,19) NOT NULL ,
  goods_id  VARCHAR(40) ,
  info_text  TEXT ,
  info_type  NUMERIC(22,10) ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_app_goods_details  is 'app商品描述详情';
DROP TABLE IF EXISTS ods.ods_t_goods ;
CREATE  TABLE ods.ods_t_goods
(   goods_id  VARCHAR(40) NOT NULL ,
  type_id  VARCHAR(40) ,
  goods_name  VARCHAR(512) ,
  short_goods_name  VARCHAR(512) ,
  head_pic  VARCHAR(2048) ,
  head_pic_compress_image_url  VARCHAR(2048) ,
  head_pic_image_url_a  VARCHAR(2048) ,
  head_pic_image_url_b  VARCHAR(2048) ,
  head_pic_image_url_c  VARCHAR(2048) ,
  jifen  NUMERIC(22,12) ,
  refer_price  NUMERIC(22,8) ,
  goods_detail  TEXT ,
  exchange_notice  TEXT ,
  spec_notice  TEXT ,
  state  NUMERIC(22,10) ,
  remark  VARCHAR(1024) ,
  publish_time  DATE ,
  create_time  DATE ,
  is_delete  NUMERIC(22,10) ,
  goods_type  NUMERIC(22,10) ,
  goods_channel  VARCHAR(40) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_goods  is '商品表';
DROP TABLE IF EXISTS ods.ods_t_goods_type ;
CREATE  TABLE ods.ods_t_goods_type
(   type_id  VARCHAR(40) NOT NULL ,
  parent_type_id  VARCHAR(40) ,
  type_level  NUMERIC(22,10) ,
  type_name  VARCHAR(512) ,
  head_pic  VARCHAR(2048) ,
  type_icon_a  VARCHAR(2048) ,
  type_icon_b  VARCHAR(2048) ,
  type_icon_c  VARCHAR(2048) ,
  order_fld  NUMERIC(22,10) ,
  remark  VARCHAR(1024) ,
  create_time  DATE ,
  is_virtual  NUMERIC(22,10) ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_goods_type  is '商品分类表';
DROP TABLE IF EXISTS ods.ods_t_goods_type_spec ;
CREATE  TABLE ods.ods_t_goods_type_spec
(   spec_id  VARCHAR(40) NOT NULL ,
  type_id  VARCHAR(40) ,
  spec_name  VARCHAR(512) ,
  remark  VARCHAR(1024) ,
  create_time  DATE ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_goods_type_spec  is '商品分类规格表';
DROP TABLE IF EXISTS ods.ods_t_local_service_item_block ;
CREATE  TABLE ods.ods_t_local_service_item_block
(   id  NUMERIC(22,10) NOT NULL ,
  block_id  NUMERIC(22,10) ,
  service_id  NUMERIC(22,10) ,
  futureland__type  NUMERIC(22,3) ,
  sort_id  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  update_time  DATE ,
  update_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_local_service_item_block  is '小区对应服务（商品信息）关系表';
DROP TABLE IF EXISTS ods.ods_t_order_goods ;
CREATE  TABLE ods.ods_t_order_goods
(   order_goods_id  NUMERIC(22,19) NOT NULL ,
  goods_id  VARCHAR(128) ,
  order_id  VARCHAR(40) ,
  user_id  VARCHAR(40) ,
  goods_name  VARCHAR(512) ,
  goods_number  NUMERIC(22,10) ,
  goods_price  NUMERIC(22,8) ,
  jifen  NUMERIC(22,12) ,
  pay_price  NUMERIC(22,8) ,
  goods_pic  VARCHAR(1024) ,
  create_time  DATE ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_order_goods  is '订单商品快照表';
DROP TABLE IF EXISTS ods.ods_t_order_park_base ;
CREATE  TABLE ods.ods_t_order_park_base
(   id  NUMERIC(22,19) NOT NULL ,
  parkuserzid  VARCHAR(100) ,
  orderid  VARCHAR(100) ,
  ordercustid  VARCHAR(100) ,
  username  VARCHAR(100) ,
  ordercustnickname  VARCHAR(100) ,
  phone  VARCHAR(100) ,
  ordertime  DATE ,
  orderfinishtime  DATE ,
  licenseno  VARCHAR(100) ,
  parkno  VARCHAR(200) ,
  contactid  VARCHAR(200) ,
  orderstatus  NUMERIC(22,3) ,
  ordermoneystatus  NUMERIC(22,3) ,
  cityid  NUMERIC(22,19) ,
  cityname  VARCHAR(100) ,
  orgid  NUMERIC(22,19) ,
  blockname  VARCHAR(100) ,
  paymenttype  NUMERIC(22,10) ,
  paymenttypename  VARCHAR(100) ,
  paymentmoney  NUMERIC(22,10) ,
  starttime  VARCHAR(100) ,
  endtime  VARCHAR(100) ,
  serverid  VARCHAR(100) ,
  status  VARCHAR(100) ,
  createtime  DATE ,
  createname  VARCHAR(100) ,
  updatetime  DATE ,
  updatename  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_order_park_base  is '停车续费订单表';
DROP TABLE IF EXISTS ods.ods_t_park_user ;
CREATE  TABLE ods.ods_t_park_user
(   id  NUMERIC(22,19) NOT NULL ,
  custid  VARCHAR(200) ,
  userid  VARCHAR(200) ,
  username  VARCHAR(200) ,
  orgid  VARCHAR(200) ,
  orgname  VARCHAR(200) ,
  contactid  VARCHAR(200) ,
  starttime  DATE ,
  endtime  DATE ,
  parkno  VARCHAR(100) ,
  licenseno  VARCHAR(100) ,
  parkstatus  NUMERIC(22,10) ,
  status  VARCHAR(100) ,
  createtime  DATE ,
  createname  VARCHAR(100) ,
  updatetime  DATE ,
  updatename  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_park_user  is '业主停车位表';
DROP TABLE IF EXISTS ods.ods_t_public_block_base ;
CREATE  TABLE ods.ods_t_public_block_base
(   id  NUMERIC(22,19) NOT NULL ,
  block_id  NUMERIC(22,19) ,
  block_name  VARCHAR(100) ,
  block_type  NUMERIC(22,3) ,
  province_id  VARCHAR(100) ,
  city_id  VARCHAR(100) ,
  district_id  VARCHAR(100) ,
  property_id  VARCHAR(100) ,
  address  VARCHAR(100) ,
  longitude  VARCHAR(100) ,
  latitude  VARCHAR(100) ,
  radius  VARCHAR(100) ,
  hot_line  VARCHAR(100) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_block_base  is '小区/部门信息表';
DROP TABLE IF EXISTS ods.ods_t_public_city ;
CREATE  TABLE ods.ods_t_public_city
(   id  NUMERIC(22,19) NOT NULL ,
  city_id  NUMERIC(22,19) ,
  city_name  VARCHAR(200) ,
  city_zipcode  NUMERIC(22,19) ,
  city_areacode  VARCHAR(8) ,
  province_id  NUMERIC(22,19) ,
  description  TEXT ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_city  is '城市信息表';
DROP TABLE IF EXISTS ods.ods_t_public_module ;
CREATE  TABLE ods.ods_t_public_module
(   id  NUMERIC(22,10) NOT NULL ,
  title  VARCHAR(200) ,
  head_image_url  VARCHAR(4000) ,
  icon_url  VARCHAR(4000) ,
  module_type  VARCHAR(90) ,
  template_code  VARCHAR(90) ,
  template_name  VARCHAR(100) ,
  param_keys  VARCHAR(400) ,
  param_names  VARCHAR(1000) ,
  recommend_type  NUMERIC(22,3) ,
  result  TEXT ,
  app_result  TEXT ,
  cat_type  NUMERIC(22,3) ,
  first_cat_id  NUMERIC(22,10) ,
  second_cat_id  NUMERIC(22,10) ,
  futureland__position  NUMERIC(22,10) ,
  param_a  VARCHAR(40) ,
  status  NUMERIC(22,3) ,
  choose_status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(90) ,
  update_time  DATE ,
  update_name  VARCHAR(90) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_module  is '模块库和推荐位';
DROP TABLE IF EXISTS ods.ods_t_public_module_block ;
CREATE  TABLE ods.ods_t_public_module_block
(   id  NUMERIC(22,19) NOT NULL ,
  module_id  NUMERIC(22,19) ,
  city_id  NUMERIC(22,19) ,
  city_name  VARCHAR(90) ,
  block_id  NUMERIC(22,19) ,
  block_name  VARCHAR(90) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(90) ,
  update_time  DATE ,
  update_name  VARCHAR(90) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_t_public_module_block  is '推荐模块和小区的关系';
DROP TABLE IF EXISTS ods.ods_t_public_module_setting ;
CREATE  TABLE ods.ods_t_public_module_setting
(   id  NUMERIC(22,19) NOT NULL ,
  setting_key  VARCHAR(2000) ,
  module_id  NUMERIC(22,19) ,
  futureland__position  NUMERIC(22,10) ,
  fixed  NUMERIC(22,3) ,
  city_id  NUMERIC(22,10) ,
  city_name  VARCHAR(100) ,
  block_id  NUMERIC(22,10) ,
  block_name  VARCHAR(100) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(90) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_module_setting  is '模块设置';
DROP TABLE IF EXISTS ods.ods_t_public_property_base ;
CREATE  TABLE ods.ods_t_public_property_base
(   id  NUMERIC(22,19) NOT NULL ,
  property_id  NUMERIC(22,19) ,
  property_name  VARCHAR(100) ,
  property_code  VARCHAR(40) ,
  parent_id  VARCHAR(100) ,
  property_type  NUMERIC(22,3) ,
  city_id  NUMERIC(22,19) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_property_base  is '物业公司信息表';
DROP TABLE IF EXISTS ods.ods_t_public_province ;
CREATE  TABLE ods.ods_t_public_province
(   id  NUMERIC(22,19) NOT NULL ,
  province_id  NUMERIC(22,19) ,
  province_name  VARCHAR(200) ,
  province_short_name  VARCHAR(20) ,
  province_zipcode  NUMERIC(22,19) ,
  province_type  NUMERIC(22,3) ,
  description  TEXT ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_public_province  is '省份信息表';
DROP TABLE IF EXISTS ods.ods_t_replenishment_item_detail ;
CREATE  TABLE ods.ods_t_replenishment_item_detail
(   id  NUMERIC(22,10) NOT NULL ,
  rep_order_num  VARCHAR(100) ,
  item_category  VARCHAR(100) ,
  sku_item_id  NUMERIC(22,19) ,
  sku_name  VARCHAR(200) ,
  bar_code  VARCHAR(100) ,
  base  NUMERIC(22,10) ,
  multiple  NUMERIC(22,10) ,
  total  NUMERIC(22,10) ,
  check_count  NUMERIC(22,10) ,
  check_time  DATE ,
  check_man  VARCHAR(100) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_replenishment_item_detail  is '普通商品补货单详情表';
DROP TABLE IF EXISTS ods.ods_t_return_item ;
CREATE  TABLE ods.ods_t_return_item
(   id  NUMERIC(22,10) NOT NULL ,
  block_id  NUMERIC(22,19) ,
  vendor_id  NUMERIC(22,19) ,
  return_order_num  VARCHAR(100) ,
  submit_time  DATE ,
  submit_man  VARCHAR(100) ,
  return_time  DATE ,
  return_man  VARCHAR(100) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  update_time  DATE ,
  update_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_return_item  is '退货单商品列表';
DROP TABLE IF EXISTS ods.ods_t_return_item_detail ;
CREATE  TABLE ods.ods_t_return_item_detail
(   id  NUMERIC(22,10) NOT NULL ,
  first_classtype  NUMERIC(22,19) ,
  sku_item_id  NUMERIC(22,19) ,
  sku_name  VARCHAR(100) ,
  bar_code  VARCHAR(100) ,
  return_order_num  VARCHAR(100) ,
  return_count  NUMERIC(22,10) ,
  check_count  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_return_item_detail  is '退货单商品详情表';
DROP TABLE IF EXISTS ods.ods_t_sku_pic ;
CREATE  TABLE ods.ods_t_sku_pic
(   id  NUMERIC(22,19) NOT NULL ,
  sku_id  NUMERIC(22,19) ,
  sku_pic  VARCHAR(600) ,
  description  TEXT ,
  pic_type  NUMERIC(22,3) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sku_pic  is '商品之sku图片信息';
DROP TABLE IF EXISTS ods.ods_t_source ;
CREATE  TABLE ods.ods_t_source
(   source_id  NUMERIC(22,10) NOT NULL ,
  source_name  VARCHAR(512) ,
  logo  VARCHAR(2048) ,
  create_time  DATE ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_source  is '来源信息表';
DROP TABLE IF EXISTS ods.ods_t_special_replenishment_item ;
CREATE  TABLE ods.ods_t_special_replenishment_item
(   id  NUMERIC(22,10) NOT NULL ,
  block_id  NUMERIC(22,19) ,
  vendor_id  NUMERIC(22,19) ,
  rep_ordernum  VARCHAR(100) ,
  order_date  DATE ,
  status  NUMERIC(22,3) ,
  rep_date  DATE ,
  check_time  DATE ,
  check_man  VARCHAR(100) ,
  confirm_time  DATE ,
  confirm_man  VARCHAR(100) ,
  waiting_time  DATE ,
  waiting_man  VARCHAR(100) ,
  rep_time  DATE ,
  rep_man  VARCHAR(100) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_special_replenishment_item  is '特殊商品补货单列表';
DROP TABLE IF EXISTS ods.ods_t_sphere_note_n2o_relation ;
CREATE  TABLE ods.ods_t_sphere_note_n2o_relation
(   id  NUMERIC(22,10) NOT NULL ,
  old_id  NUMERIC(22,10) ,
  new_id  NUMERIC(22,10) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  update_time  DATE ,
  update_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sphere_note_n2o_relation  is '新版分类对应旧分类关系表（新旧关系一对一）';
DROP TABLE IF EXISTS ods.ods_t_sys_public_block_service ;
CREATE  TABLE ods.ods_t_sys_public_block_service
(   id  NUMERIC(22,19) NOT NULL ,
  block_id  NUMERIC(22,19) ,
  template_code  VARCHAR(40) ,
  first_cat_id  NUMERIC(22,19) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) ,
  etl_lad_dte DATE 
) 
partition by range (etl_lad_dte) 
  ( START (date '2017-05-03') INCLUSIVE 
  END (date '2019-09-23') INCLUSIVE EVERY (INTERVAL '1 month'), 
  DEFAULT PARTITION extra);
 comment on  table ods.ods_t_sys_public_block_service  is '公共之小区开通服务明细表';
DROP TABLE IF EXISTS ods.ods_t_sys_public_boot_page ;
CREATE  TABLE ods.ods_t_sys_public_boot_page
(   id  NUMERIC(22,10) NOT NULL ,
  title  VARCHAR(600) ,
  futureland__content  VARCHAR(510) ,
  pic_url  VARCHAR(600) ,
  business_type  NUMERIC(22,10) ,
  client_type  NUMERIC(22,3) ,
  resolution  VARCHAR(40) ,
  sort  NUMERIC(22,3) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_man  VARCHAR(100) ,
  update_time  DATE ,
  update_man  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_public_boot_page  is '引导页信息表';
DROP TABLE IF EXISTS ods.ods_t_sys_public_categories ;
CREATE  TABLE ods.ods_t_sys_public_categories
(   id  NUMERIC(22,19) NOT NULL ,
  categories_id  VARCHAR(100) ,
  categories_name  VARCHAR(200) ,
  categories_icon_a  VARCHAR(600) ,
  categories_icon_b  VARCHAR(600) ,
  categories_pic  VARCHAR(600) ,
  categories_type  NUMERIC(22,19) ,
  categories_level  NUMERIC(22,19) ,
  categories_parentid  VARCHAR(100) ,
  pic_html5  VARCHAR(600) ,
  pic_special  VARCHAR(600) ,
  service_description  VARCHAR(1000) ,
  description  TEXT ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_public_categories  is '公共之级别分类信息';
DROP TABLE IF EXISTS ods.ods_t_sys_public_dict_date ;
CREATE  TABLE ods.ods_t_sys_public_dict_date
(   id  NUMERIC(22,19) NOT NULL ,
  date_fld  DATE ,
  years  NUMERIC(22,10) ,
  year_days  NUMERIC(22,10) ,
  quarter  NUMERIC(22,10) ,
  months  NUMERIC(22,10) ,
  months_days  NUMERIC(22,10) ,
  weeks  NUMERIC(22,10) ,
  weeks_odbc  NUMERIC(22,10) ,
  week  NUMERIC(22,10) ,
  week_odbc  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_public_dict_date  is '日期数据字典表';
DROP TABLE IF EXISTS ods.ods_t_sys_public_service_area ;
CREATE  TABLE ods.ods_t_sys_public_service_area
(   id  NUMERIC(22,19) NOT NULL ,
  city_id  NUMERIC(22,19) ,
  area_id  NUMERIC(22,19) ,
  area_name  VARCHAR(200) ,
  latitude_east  NUMERIC(22,19) ,
  latitude_south  NUMERIC(22,19) ,
  latitude_west  NUMERIC(22,19) ,
  latitude_north  NUMERIC(22,19) ,
  sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_public_service_area  is '公共之服务区域信息';
DROP TABLE IF EXISTS ods.ods_t_sys_uic_navigation ;
CREATE  TABLE ods.ods_t_sys_uic_navigation
(   id  NUMERIC(22,19) NOT NULL ,
  nav_code  VARCHAR(100) ,
  nav_name  VARCHAR(400) ,
  nav_sort  NUMERIC(22,10) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_uic_navigation  is '系统之菜单导航信息';
DROP TABLE IF EXISTS ods.ods_t_sys_uic_resource ;
CREATE  TABLE ods.ods_t_sys_uic_resource
(   id  NUMERIC(22,19) NOT NULL ,
  resource_code  VARCHAR(100) ,
  resource_name  VARCHAR(100) ,
  resource_icon  VARCHAR(100) ,
  resource_url  VARCHAR(600) ,
  permission_control  NUMERIC(22,3) ,
  menu_show  NUMERIC(22,3) ,
  sort  NUMERIC(22,10) ,
  parent_id  NUMERIC(22,10) ,
  nav_code  VARCHAR(100) ,
  status  NUMERIC(22,3) ,
  create_time  DATE ,
  create_name  VARCHAR(100) ,
  update_time  DATE ,
  update_name  VARCHAR(100) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_sys_uic_resource  is '系统之页面信息';
DROP TABLE IF EXISTS ods.ods_t_target ;
CREATE  TABLE ods.ods_t_target
(   target_id  VARCHAR(40) NOT NULL ,
  target_num  VARCHAR(64) ,
  target_name  VARCHAR(2048) ,
  image_height  NUMERIC(22,10) ,
  image_width  NUMERIC(22,10) ,
  remark  VARCHAR(1024) ,
  max_limit  NUMERIC(22,10) ,
  create_time  DATE ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_target  is '位置信息表';
DROP TABLE IF EXISTS ods.ods_t_target_content ;
CREATE  TABLE ods.ods_t_target_content
(   content_id  VARCHAR(40) NOT NULL ,
  target_id  VARCHAR(40) ,
  title  VARCHAR(512) ,
  image_fld  VARCHAR(2048) ,
  href  VARCHAR(2048) ,
  order_fld  NUMERIC(22,10) ,
  expiration_time  DATE ,
  create_time  DATE ,
  publish_status  NUMERIC(22,10) ,
  remark  VARCHAR(1024) ,
  is_delete  NUMERIC(22,10) ,
  infa_createdate  DATE ,
  infa_updatedate  DATE ,
  infa_remark  VARCHAR(76) );
 comment on  table ods.ods_t_target_content  is '位置内容表';
