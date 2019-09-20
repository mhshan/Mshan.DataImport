
  CREATE TABLE "CCENSE"."BASE_ACC_GROUP" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TYPENAME" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	"IFCARD" NUMBER NOT NULL ENABLE, 
	"OPSUMFARE" NUMBER(*,0) NOT NULL ENABLE, 
	"OPELECTRODDFARE" NUMBER(*,0) NOT NULL ENABLE, 
	"OPMONTICKETODDFARE" NUMBER(*,0) NOT NULL ENABLE, 
	"OPSUMADDFARE" NUMBER(*,0) NOT NULL ENABLE, 
	"OPSUMCONSUME" NUMBER(*,0) NOT NULL ENABLE, 
	"DIR" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SORTID" NUMBER, 
	"LOCATION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE, 
	"ISVISIBLE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_ACC_GROUP" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_acc_group is '科目大类'
/
comment on column base_acc_group.id is '主健'
/
comment on column base_acc_group.typename is '交易类别名称'
/
comment on column base_acc_group.describe is '描述'
/
comment on column base_acc_group.ifcard is '与卡有关'
/
comment on column base_acc_group.opsumfare is '卡总额操作0:不变 1:加 -1:减'
/
comment on column base_acc_group.opelectroddfare is '电子钱包余额操作0:不变 1:加 -1:减'
/
comment on column base_acc_group.opmonticketoddfare is '月票钱包余额操作0:不变 1:加 -1:减'
/
comment on column base_acc_group.opsumaddfare is '总加款额操作0:不变 1:加 -1:减'
/
comment on column base_acc_group.opsumconsume is '消费累加额操作0:不变 1:加 -1:减'
/
comment on column base_acc_group.dir is '交易类型（收入或支出）0:不变 1:加 -1:减'
/
comment on column base_acc_group.sortid is '排序顺序 越小越优先'
/
comment on column base_acc_group.location is '显示位置　1:收入类 -1:支出类 0:不显示'
/
comment on column base_acc_group.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_acc_group.isvisible is '是否可见（0不可见，1可见）'
/
comment on column base_acc_group.ver is '版本号'
/


  CREATE TABLE "CCENSE"."BASE_ACC_TYPE" 
   (	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"GROUPID" NUMBER NOT NULL ENABLE, 
	"ACCDSCRP" VARCHAR2(20) NOT NULL ENABLE, 
	"ISSHOW" NUMBER NOT NULL ENABLE, 
	"SORTID" NUMBER, 
	"DIR" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE, 
	"ISVISIBLE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_ACC_TYPE" PRIMARY KEY ("ACCCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_acc_type is '帐目科目代码'
/
comment on column base_acc_type.acccode is '科目代码'
/
comment on column base_acc_type.groupid is '所属交易大类'
/
comment on column base_acc_type.accdscrp is '科目描述'
/
comment on column base_acc_type.isshow is '系统平衡是否显示 0-不显示 1-显示'
/
comment on column base_acc_type.sortid is '排序顺序 越小越优先'
/
comment on column base_acc_type.dir is '针对此科目所属大类的方向：加 1 或 减-1'
/
comment on column base_acc_type.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_acc_type.isvisible is '是否可见（0不可见，1可见）'
/
comment on column base_acc_type.ver is '版本号'
/
comment on column base_acc_type.id is ''
/


  CREATE TABLE "CCENSE"."BASE_APP_INFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"APPTYPEID" NUMBER NOT NULL ENABLE, 
	"IPADDESS" VARCHAR2(20) DEFAULT '0.0.0.0' NOT NULL ENABLE, 
	"APPVER" VARCHAR2(20) DEFAULT '0.0.0.0' NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ISUSED" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TIMESTAMP" NUMBER DEFAULT 300 NOT NULL ENABLE, 
	"SALTKEY" VARCHAR2(16) DEFAULT '123456789ABCDEFG' NOT NULL ENABLE, 
	"MEMO" VARCHAR2(100), 
	"STATIONID" NUMBER NOT NULL ENABLE, 
	"LASTREGISTERDATE" DATE DEFAULT sysdate, 
	"ISENABLEMONITOR" NUMBER DEFAULT 0, 
	"VER" NUMBER DEFAULT 0, 
	"MONITORPWD" VARCHAR2(6) DEFAULT '123456', 
	"APPNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_APP_INFO" PRIMARY KEY ("ID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_APP_INFO" UNIQUE ("APPTYPEID", "STATIONID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "FK_BASE_APP_STATIONID" FOREIGN KEY ("STATIONID", "CUSTOMERUNITCODE")
	  REFERENCES "CCENSE"."BASE_STATION" ("STATIONID", "CUSTOMERUNITCODE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_app_info is '应用程序信息管理表'
/
comment on column base_app_info.id is '主键id，自增长'
/
comment on column base_app_info.apptypeid is '应用类别编码'
/
comment on column base_app_info.ipaddess is '应用所在工作站的ip地址'
/
comment on column base_app_info.appver is '本地服务版本：仅自动统计使用'
/
comment on column base_app_info.createdate is '记录产生时间'
/
comment on column base_app_info.lastupdatedate is '最后一次修改更新时间'
/
comment on column base_app_info.isused is '是否启用（1启用 0禁用）'
/
comment on column base_app_info.timestamp is '允许的时间误差.单位（秒）'
/
comment on column base_app_info.saltkey is '访问的混淆key'
/
comment on column base_app_info.memo is '备注信息'
/
comment on column base_app_info.stationid is '工作站编号'
/
comment on column base_app_info.lastregisterdate is '最后一次注册时间'
/
comment on column base_app_info.isenablemonitor is '是否允许监控： 0不允许 1-允许'
/
comment on column base_app_info.ver is '版本'
/
comment on column base_app_info.monitorpwd is '监控密码'
/
comment on column base_app_info.appname is '应用程序名称'
/
comment on column base_app_info.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_APP_PORT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"APPID" NUMBER NOT NULL ENABLE, 
	"PORT" NUMBER NOT NULL ENABLE, 
	"PORTNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"IPADDR" VARCHAR2(20), 
	"PORTPTY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_APP_PORT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_APP_PORT" UNIQUE ("APPID", "PORT", "PORTPTY", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 393216 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_app_port is '应用端口'
/
comment on column base_app_port.id is '主键'
/
comment on column base_app_port.appid is '应用编号'
/
comment on column base_app_port.port is '端口'
/
comment on column base_app_port.portname is '端口名称：无线com1等比较明确的名称'
/
comment on column base_app_port.ipaddr is 'ip地址：以太网侦听模式必须填写，串口模式不填写'
/
comment on column base_app_port.portpty is '"通讯方式(0:无线串口)"'
/
comment on column base_app_port.ver is ''
/
comment on column base_app_port.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_APP_TERM" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"APPID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"CREATEDATE" DATE NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_APP_TERM" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_APP_TERM" UNIQUE ("APPID", "POSCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_app_term is '应用终端对应关系表'
/
comment on column base_app_term.id is '主键'
/
comment on column base_app_term.appid is '采集终端数据的应用id：appid+poscode唯一约束'
/
comment on column base_app_term.poscode is '终端运营唯一编号'
/
comment on column base_app_term.createdate is '记录建立日期'
/
comment on column base_app_term.ver is '版本'
/
comment on column base_app_term.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_APP_TYPE" 
   (	"APPTYPEID" NUMBER NOT NULL ENABLE, 
	"APPTYPENAME" VARCHAR2(20) NOT NULL ENABLE, 
	"IFALONE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"APPVER" VARCHAR2(20) DEFAULT '0.0.0.0' NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"REMARKS" VARCHAR2(100), 
	"ISVISIBLE" NUMBER DEFAULT 1, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"ISADDPORT" NUMBER, 
	 CONSTRAINT "UK_APP_TYPE_ID" UNIQUE ("APPTYPEID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_APP_TYPE_NAME" UNIQUE ("CUSTOMERUNITCODE", "APPTYPENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_app_type is '应用程序类字典表'
/
comment on column base_app_type.apptypeid is '应用程序类别id'
/
comment on column base_app_type.apptypename is '应用程序名称'
/
comment on column base_app_type.ifalone is '是否运行多个实例 0：禁用 n：允许运行n个实例'
/
comment on column base_app_type.appver is '应用程序版本号'
/
comment on column base_app_type.lastupdatedate is '最的一次更新时间'
/
comment on column base_app_type.remarks is '备注信息'
/
comment on column base_app_type.isvisible is '是否在界面显示。0-界面不可见该应用类型，1-允许界面可见该应用类型'
/
comment on column base_app_type.customerunitcode is '客户代码'
/
comment on column base_app_type.isaddport is '能否添加终端 0：不能 1：能'
/


  CREATE TABLE "CCENSE"."BASE_APPSERVICE_ACCREDIT" 
   (	"SYSCODE" VARCHAR2(32) NOT NULL ENABLE, 
	"ACCREDITEDCODE" VARCHAR2(512) NOT NULL ENABLE, 
	"IP" VARCHAR2(20), 
	"DESCRIPTION" VARCHAR2(2000), 
	"WEBPATH" VARCHAR2(512) DEFAULT '未配置' NOT NULL ENABLE, 
	"EXCHANGETIMEOUT" NUMBER(*,0) DEFAULT 100000 NOT NULL ENABLE, 
	"ISHOST" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER(*,0), 
	"AREAID" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"REGDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VER" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUBSYSCODE" VARCHAR2(512) DEFAULT '0', 
	 CONSTRAINT "PK_BASE_APPSERVICE_ACCREDIT" PRIMARY KEY ("SYSCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_appservice_accredit is '应用服务器注册认证信息表'
/
comment on column base_appservice_accredit.syscode is '应用服务器webservice(的系统特征码。如：e62dd75f42be'
/
comment on column base_appservice_accredit.accreditedcode is '从公司获取的系统授权码'
/
comment on column base_appservice_accredit.ip is '应用服务器的ip'
/
comment on column base_appservice_accredit.description is '关于此应用服务器的描述'
/
comment on column base_appservice_accredit.webpath is 'web服务路径，例如：http://192.168.0.101/ecardwebservice'
/
comment on column base_appservice_accredit.exchangetimeout is '访问超时时长，单位：毫秒'
/
comment on column base_appservice_accredit.ishost is '是否为开通系统的主服务器'
/
comment on column base_appservice_accredit.empid is '注册职员编号'
/
comment on column base_appservice_accredit.areaid is '分区标识'
/
comment on column base_appservice_accredit.regdate is '注册时间'
/
comment on column base_appservice_accredit.ver is '版本'
/
comment on column base_appservice_accredit.subsyscode is '子系统特征码'
/


  CREATE TABLE "CCENSE"."BASE_BIKE_APP" 
   (	"ID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"ASN" NUMBER, 
	"DEPOSITLEVEL" NUMBER, 
	"DEPOSIT" NUMBER, 
	"EMPID" NUMBER, 
	"STATUS" NUMBER, 
	"OPDT" DATE, 
	"CUSTOMERUNITCODE" NVARCHAR2(12), 
	"OPENSTATUS" NUMBER DEFAULT 0, 
	"DETAILID" NUMBER, 
	 CONSTRAINT "PK_BASE_BIKE_APP" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 23068672 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_BIKE_APP" UNIQUE ("CUSTOMERID", "ASN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 33554432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 109051904 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  CACHE 
 
/
comment on table base_bike_app is '自行车应用'
/
comment on column base_bike_app.id is '自增id'
/
comment on column base_bike_app.customerid is '发卡流水'
/
comment on column base_bike_app.asn is '密钥分散因子'
/
comment on column base_bike_app.depositlevel is '押金等级'
/
comment on column base_bike_app.deposit is '押金'
/
comment on column base_bike_app.empid is '职员empid'
/
comment on column base_bike_app.status is '状态：1开启，0关闭，2已转卡，3挂失'
/
comment on column base_bike_app.opdt is '最后操作时间'
/
comment on column base_bike_app.customerunitcode is '客户编号'
/
comment on column base_bike_app.openstatus is '自行车状态0，关闭；77，在租'
/
comment on column base_bike_app.detailid is '卡类型'
/


  CREATE TABLE "CCENSE"."BASE_BUS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"BUSNO" NUMBER NOT NULL ENABLE, 
	"BUSNUMBER" VARCHAR2(12) NOT NULL ENABLE, 
	"BUSTYPE" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER DEFAULT 0, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ISUSE" NUMBER, 
	"SALETYPE" NUMBER, 
	"SORTID" NUMBER, 
	"VER" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"BUSCODE" VARCHAR2(20) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_BUS" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_BUS" UNIQUE ("BUSNO", "CUSTOMERUNITCODE", "LASTUPDATEDATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_BUSNUM" UNIQUE ("BUSNUMBER", "LASTUPDATEDATE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_bus is '车辆信息表'
/
comment on column base_bus.id is '主键'
/
comment on column base_bus.busno is '唯一号，系统结算使用，不允许修改'
/
comment on column base_bus.busnumber is '车辆编号，用户可以修改'
/
comment on column base_bus.bustype is '车辆类型（0：汽油车 1：柴油车 2：燃气车）'
/
comment on column base_bus.lineid is '线路编号：0-备用线路'
/
comment on column base_bus.empid is '职员账号,录入的职员账号'
/
comment on column base_bus.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_bus.isuse is '是否启用 0：启用 1：禁用 2：维修中 3：报废 4:备用'
/
comment on column base_bus.saletype is '售票类型 （0：无人 1：有人）'
/
comment on column base_bus.sortid is '排序字段'
/
comment on column base_bus.ver is '版本号'
/
comment on column base_bus.customerunitcode is '客户代码'
/
comment on column base_bus.buscode is '车辆唯一编号'
/


  CREATE TABLE "CCENSE"."BASE_BUS_BANKLIST" 
   (	"BANKCARDCODE" VARCHAR2(32) NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DETAILID" NUMBER NOT NULL ENABLE, 
	"DISCOUNTSTARTTIME" DATE DEFAULT SYSDATE, 
	"DISCOUNTENDTIME" DATE DEFAULT SYSDATE, 
	"ISUSE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "UK_BASE_BUS_BANKLIST" UNIQUE ("CUSTOMERUNITCODE", "BANKCARDCODE", "DETAILID", "ISUSE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_bus_banklist is '银行bin号'
/
comment on column base_bus_banklist.bankcardcode is '银行卡号前六位'
/
comment on column base_bus_banklist.ver is '版本 '
/
comment on column base_bus_banklist.detailid is '卡类型'
/
comment on column base_bus_banklist.discountstarttime is '折扣开始时间'
/
comment on column base_bus_banklist.discountendtime is '折扣结束时间'
/
comment on column base_bus_banklist.isuse is '是否启用 255表示打折  其他值表示限制  一个客户法人下面要不就是打折，要不就是限制，不能并存'
/
comment on column base_bus_banklist.customerunitcode is '客户法人'
/


  CREATE TABLE "CCENSE"."BASE_BUSINESS_MODEL" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MODELNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"MODELDESC" VARCHAR2(200) NOT NULL ENABLE, 
	"MENUIDSTR" VARCHAR2(4000) NOT NULL ENABLE, 
	"REMARK" VARCHAR2(200), 
	 CONSTRAINT "PK_BASE_BUSINESS_MODEL" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_business_model is '业务功能模块设置'
/
comment on column base_business_model.id is '自动增长'
/
comment on column base_business_model.modelname is '业务模块名称'
/
comment on column base_business_model.modeldesc is '业务模块描述'
/
comment on column base_business_model.menuidstr is '业务模块功能项（00000000|00000001|...），以菜单项的id存放一个串'
/
comment on column base_business_model.remark is '备注'
/


  CREATE TABLE "CCENSE"."BASE_BUSLINE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER NOT NULL ENABLE, 
	"LINENAME" VARCHAR2(20) NOT NULL ENABLE, 
	"PRICE" NUMBER DEFAULT 1.00 NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"DISABLECARDTYPE" VARCHAR2(100), 
	"ESPECIALCARDFARE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ESPECIALCARDTYPE" VARCHAR2(64), 
	"ISUSE" NUMBER DEFAULT 1, 
	"FLEEPRICE" NUMBER DEFAULT 0.00, 
	"CHARGETYPEID" NUMBER DEFAULT 0, 
	"CHARGEMODESTR" VARCHAR2(200) DEFAULT 0, 
	"PRICEVER" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"STOPVER" NUMBER DEFAULT 0, 
	"LINECARDVER" NUMBER DEFAULT 1, 
	"LINECARDUPDATETIME" DATE, 
	"OLDDPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"NEWAVAILDATETIME" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"LINECODE" VARCHAR2(20) NOT NULL ENABLE, 
	"ZHYDLINECODE" VARCHAR2(10), 
	 CONSTRAINT "PK_BASE_BUSLINE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_BUSLINE" UNIQUE ("ID", "LINEID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_busline is '线路信息表'
/
comment on column base_busline.id is '主键'
/
comment on column base_busline.lineid is '线路id'
/
comment on column base_busline.linename is '线路名称'
/
comment on column base_busline.price is '单价'
/
comment on column base_busline.dptcode is '所属部门'
/
comment on column base_busline.sortid is '排序字段'
/
comment on column base_busline.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_busline.ver is '版本号'
/
comment on column base_busline.disablecardtype is '字段已弃用'
/
comment on column base_busline.especialcardfare is '特定卡打折率'
/
comment on column base_busline.especialcardtype is '特定卡类型，用逗号(,)分隔'
/
comment on column base_busline.isuse is '统一票价启用标识：0-不启用、1-启用 ；（针对分段计费功能，正在使用的系统默认1）'
/
comment on column base_busline.fleeprice is '逃票票价'
/
comment on column base_busline.chargetypeid is '计费方式'
/
comment on column base_busline.chargemodestr is '票价模板，组合多种模板用,隔开存放'
/
comment on column base_busline.pricever is '分段计费票价版本号(计费模式是1和4时，票价信息改变更新该版本)'
/
comment on column base_busline.customerunitcode is '客户代码'
/
comment on column base_busline.stopver is '线路站点版本号：线路中的站点删除或者修改排序时进行修改'
/
comment on column base_busline.linecardver is '线路票价卡版本号：票价卡中线路对应信息和卡类型对应的参数信息变化时都更新改版本号'
/
comment on column base_busline.linecardupdatetime is '票价卡版本最后更新时间（和下发参数最大版本号更新的时间对应）'
/
comment on column base_busline.olddptcode is '旧所属部门'
/
comment on column base_busline.newavaildatetime is '所属部门生效时间'
/
comment on column base_busline.linecode is '线路唯一编号'
/
comment on column base_busline.zhydlinecode is ''
/


  CREATE TABLE "CCENSE"."BASE_BUSLINE_TOUBI" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER NOT NULL ENABLE, 
	"LINENAME" VARCHAR2(20) NOT NULL ENABLE, 
	"PRICE" NUMBER NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"SORTID" NUMBER NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE NOT NULL ENABLE, 
	"VER" NUMBER, 
	"DISABLECARDTYPE" VARCHAR2(100), 
	"ESPECIALCARDFARE" NUMBER NOT NULL ENABLE, 
	"ESPECIALCARDTYPE" VARCHAR2(64), 
	"ISUSE" NUMBER, 
	"FLEEPRICE" NUMBER, 
	"CHARGETYPEID" NUMBER, 
	"CHARGEMODESTR" VARCHAR2(200), 
	"PRICEVER" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"STOPVER" NUMBER, 
	"LINECARDVER" NUMBER, 
	"LINECARDUPDATETIME" DATE, 
	"OLDDPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"NEWAVAILDATETIME" DATE NOT NULL ENABLE, 
	"LINECODE" VARCHAR2(20) NOT NULL ENABLE, 
	"ZHYDLINECODE" VARCHAR2(10)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_busline_toubi is ''
/
comment on column base_busline_toubi.id is ''
/
comment on column base_busline_toubi.lineid is ''
/
comment on column base_busline_toubi.linename is ''
/
comment on column base_busline_toubi.price is ''
/
comment on column base_busline_toubi.dptcode is ''
/
comment on column base_busline_toubi.sortid is ''
/
comment on column base_busline_toubi.lastupdatedate is ''
/
comment on column base_busline_toubi.ver is ''
/
comment on column base_busline_toubi.disablecardtype is ''
/
comment on column base_busline_toubi.especialcardfare is ''
/
comment on column base_busline_toubi.especialcardtype is ''
/
comment on column base_busline_toubi.isuse is ''
/
comment on column base_busline_toubi.fleeprice is ''
/
comment on column base_busline_toubi.chargetypeid is ''
/
comment on column base_busline_toubi.chargemodestr is ''
/
comment on column base_busline_toubi.pricever is ''
/
comment on column base_busline_toubi.customerunitcode is ''
/
comment on column base_busline_toubi.stopver is ''
/
comment on column base_busline_toubi.linecardver is ''
/
comment on column base_busline_toubi.linecardupdatetime is ''
/
comment on column base_busline_toubi.olddptcode is ''
/
comment on column base_busline_toubi.newavaildatetime is ''
/
comment on column base_busline_toubi.linecode is ''
/
comment on column base_busline_toubi.zhydlinecode is ''
/


  CREATE TABLE "CCENSE"."BASE_BUSROUTE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER NOT NULL ENABLE, 
	"STOPID" NUMBER NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"ISDELETE" NUMBER DEFAULT 0, 
	"DELETEDATE" DATE DEFAULT SYSDATE, 
	"ISSHOW" NUMBER DEFAULT 1, 
	"FLAG" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"DOWNSORTID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_BUSROUTE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_busroute is '路线信息表（线路-站点）'
/
comment on column base_busroute.id is '自动编号'
/
comment on column base_busroute.lineid is '线路编号'
/
comment on column base_busroute.stopid is '站点编号'
/
comment on column base_busroute.sortid is '不同线路上面站点排列顺序（越小上行越靠前）'
/
comment on column base_busroute.ver is '版本号'
/
comment on column base_busroute.opdt is '操作时间'
/
comment on column base_busroute.isdelete is '是否删除 0：正常站点 1：已经删除的站点'
/
comment on column base_busroute.deletedate is '删除时间'
/
comment on column base_busroute.isshow is '是否显示 0：不显示 1：显示'
/
comment on column base_busroute.flag is '站点上下行：1 隶属上行 2 隶属下行 3 同属上下行'
/
comment on column base_busroute.customerunitcode is '客户代码'
/
comment on column base_busroute.downsortid is '下行排序好顺序(越小越靠前)'
/


  CREATE TABLE "CCENSE"."BASE_BUSSTOP" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STOPID" NUMBER NOT NULL ENABLE, 
	"STOPNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"LONGITUDE" VARCHAR2(12) DEFAULT 0 NOT NULL ENABLE, 
	"LATITUDE" VARCHAR2(12) DEFAULT 0 NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"ISDELETE" NUMBER DEFAULT 0, 
	"DELETEDATE" DATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_BUSSTOP" PRIMARY KEY ("CUSTOMERUNITCODE", "STOPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_busstop is '站点信息表'
/
comment on column base_busstop.id is '自动编号'
/
comment on column base_busstop.stopid is '站点编号'
/
comment on column base_busstop.stopname is '站点名称'
/
comment on column base_busstop.longitude is '经度（第一位是  0东经、1西经）'
/
comment on column base_busstop.latitude is '纬度（第一位是 0南纬、1北纬）'
/
comment on column base_busstop.collectdt is '采集时间（上传gps信息时更新）'
/
comment on column base_busstop.opdt is '最后一次操作时间（针对平台上面的维护管理操作）'
/
comment on column base_busstop.ver is '版本号'
/
comment on column base_busstop.isdelete is '是否删除 0：正常站点 1：删除的站点'
/
comment on column base_busstop.deletedate is '删除时间'
/
comment on column base_busstop.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_CARD_REGIST" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT sysdate, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"EMPCODE" VARCHAR2(32) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER, 
	"DETAILID" NUMBER, 
	 CONSTRAINT "PK_BASE_CARD_REGIST" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_card_regist is '卡登记信息表'
/
comment on column base_card_regist.id is '自动编号（主键）'
/
comment on column base_card_regist.cardkind is '卡类型 （1m1卡 2cpu卡）'
/
comment on column base_card_regist.opdt is '卡登记时间'
/
comment on column base_card_regist.scardsnr is '卡唯一号'
/
comment on column base_card_regist.empcode is '操作员'
/
comment on column base_card_regist.customerunitcode is '客户代码'
/
comment on column base_card_regist.status is '状态： 0 初始状态 1：售卡成功  2：售卡失败'
/
comment on column base_card_regist.customerid is '账号（售卡成功更新此字段）'
/
comment on column base_card_regist.detailid is '卡类型'
/


  CREATE TABLE "CCENSE"."BASE_CARDID" 
   (	"CARDID" NUMBER(8,0) NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CARDID" PRIMARY KEY ("CARDID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_CARDID" UNIQUE ("SCARDSNR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 983040 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 983040 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_cardid is '生成和存储所有卡的流水号'
/
comment on column base_cardid.cardid is '卡流水号，自动生成'
/
comment on column base_cardid.scardsnr is '卡唯一号'
/


  CREATE TABLE "CCENSE"."BASE_CARDTYPE_DETAIL" 
   (	"DETAILID" NUMBER NOT NULL ENABLE, 
	"DETAILNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"GROUPID" NUMBER NOT NULL ENABLE, 
	"SORTID" NUMBER, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PARAGROUPID" NUMBER NOT NULL ENABLE, 
	"WALLETUSETYPE" VARCHAR2(3) DEFAULT 10 NOT NULL ENABLE, 
	"ISVISIBLE" VARCHAR2(1) DEFAULT 1 NOT NULL ENABLE, 
	"CASHYEARCHECKMONS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CARDTYPE_DETAIL" PRIMARY KEY ("DETAILID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_CARDTYPE_DETAIL" UNIQUE ("DETAILNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_cardtype_detail is '卡类别信息（系统标准卡类型信息）'
/
comment on column base_cardtype_detail.detailid is '卡类别小类编号（0~224乘车卡编号范围，225以后属于功能卡编号）'
/
comment on column base_cardtype_detail.detailname is '卡类别小类名称'
/
comment on column base_cardtype_detail.groupid is '卡类别大类编号'
/
comment on column base_cardtype_detail.sortid is '排序id'
/
comment on column base_cardtype_detail.ver is '版本号'
/
comment on column base_cardtype_detail.paragroupid is '对应的参数组id'
/
comment on column base_cardtype_detail.walletusetype is '钱包启用类型：第一位，电子钱包0禁用、非零启用 如虚充则用双位头位2开头次位置提供终端优先级；第二位，月票钱包0禁用、1启用；第三位，次卡0禁用、1启用、2虚充'
/
comment on column base_cardtype_detail.isvisible is '是否显示，0不显示，1显示'
/
comment on column base_cardtype_detail.cashyearcheckmons is '定额类卡、充值自动增加年检月数'
/


  CREATE TABLE "CCENSE"."BASE_CARDTYPE_DETAIL_TEMP" 
   (	"DETAILID" NUMBER NOT NULL ENABLE, 
	"DETAILNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"GROUPID" NUMBER NOT NULL ENABLE, 
	"SORTID" NUMBER, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PARAGROUPID" NUMBER NOT NULL ENABLE, 
	"WALLETUSETYPE" VARCHAR2(3) DEFAULT 10 NOT NULL ENABLE, 
	"ISVISIBLE" VARCHAR2(1) DEFAULT 1 NOT NULL ENABLE, 
	"CASHYEARCHECKMONS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CARDTYPE_TEMP" PRIMARY KEY ("DETAILID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_CARDTYPE_TEMP" UNIQUE ("DETAILNAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_cardtype_detail_temp is '卡类别信息'
/
comment on column base_cardtype_detail_temp.detailid is '卡类别小类编号'
/
comment on column base_cardtype_detail_temp.detailname is '卡类别小类名称'
/
comment on column base_cardtype_detail_temp.groupid is '卡类别大类编号'
/
comment on column base_cardtype_detail_temp.sortid is '排序id'
/
comment on column base_cardtype_detail_temp.ver is '版本号'
/
comment on column base_cardtype_detail_temp.paragroupid is '对应的参数组id'
/
comment on column base_cardtype_detail_temp.walletusetype is '钱包启用类型：第一位，电子钱包0禁用、1启用；第二位，0禁用、1启用月票、2启用次票,3月票虚冲,4次卡虚冲'
/
comment on column base_cardtype_detail_temp.isvisible is '是否显示，0不显示，1显示'
/
comment on column base_cardtype_detail_temp.cashyearcheckmons is '定额类卡、充值自动增加年检月数'
/
comment on column base_cardtype_detail_temp.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_CARDTYPE_GROUP" 
   (	"GROUPID" NUMBER NOT NULL ENABLE, 
	"GROUPNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"SORTID" NUMBER NOT NULL ENABLE, 
	"KIND" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_BASE_CARDTYPE_GROUP" PRIMARY KEY ("GROUPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_cardtype_group is '用户卡类别大类'
/
comment on column base_cardtype_group.groupid is '卡类别大类编号'
/
comment on column base_cardtype_group.groupname is '卡类别大类名称'
/
comment on column base_cardtype_group.sortid is '排序id'
/
comment on column base_cardtype_group.kind is '卡种类  0乘车卡  1管理卡'
/
comment on column base_cardtype_group.ver is '版本号'
/


  CREATE TABLE "CCENSE"."BASE_CERTIFICATETYPE" 
   (	"CERTIFICATEID" NUMBER NOT NULL ENABLE, 
	"CERTIFICATENAME" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CERTIFICATETYPE" PRIMARY KEY ("CERTIFICATEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_certificatetype is '证件类型表'
/
comment on column base_certificatetype.certificateid is '证件编号'
/
comment on column base_certificatetype.certificatename is '证件类型名称'
/


  CREATE TABLE "CCENSE"."BASE_CHARGEAUTH" 
   (	"AUTHCODE" NUMBER NOT NULL ENABLE, 
	"BUSINESSPOINT" VARCHAR2(12) NOT NULL ENABLE, 
	"CURODDFARE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"AUTHTIME" DATE DEFAULT SYSDATE, 
	"ALLOWOVERDRAFTFARE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MAXLIMITDATE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISUSE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WORKSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LIMITENDDATE" DATE DEFAULT SYSDATE, 
	"MAXLIMITFARE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMFARE" NUMBER(20,2) DEFAULT 0.00, 
	"ALLOWOVERDRAFTOPDT" DATE DEFAULT SYSDATE, 
	"ALLOWOVERDRAFTSUMFARE" NUMBER(20,2) DEFAULT 0.00, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT sysdate, 
	 CONSTRAINT "PK_BASE_CHARGEAUTH" PRIMARY KEY ("AUTHCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_CHARGEAUTH" UNIQUE ("BUSINESSPOINT", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_chargeauth is '充值授权信息表'
/
comment on column base_chargeauth.authcode is '充值授权码'
/
comment on column base_chargeauth.businesspoint is '代理点编号（部门代码）'
/
comment on column base_chargeauth.curoddfare is '当前授权额度'
/
comment on column base_chargeauth.authtime is '授权时间（记录最近一次授权额度的操作时间）'
/
comment on column base_chargeauth.allowoverdraftfare is '允许透支金额'
/
comment on column base_chargeauth.maxlimitdate is '最大逾期（天）'
/
comment on column base_chargeauth.isuse is '是否启用充值授权额度，0：不启用，1：启用'
/
comment on column base_chargeauth.workstatus is '状态：0正常状态，1透支状态'
/
comment on column base_chargeauth.limitenddate is '允许透支截止日期'
/
comment on column base_chargeauth.maxlimitfare is '最大授权额度（上级网点对下级网点授权金额）'
/
comment on column base_chargeauth.sumfare is '授权额度累计'
/
comment on column base_chargeauth.allowoverdraftopdt is '允许透支金额最近一次操作时间（更新透支金额最后一次操作时间）'
/
comment on column base_chargeauth.allowoverdraftsumfare is '网点使用透支额度累计'
/
comment on column base_chargeauth.customerunitcode is '客户代码'
/
comment on column base_chargeauth.opdt is '第一次授权时间（初始化 第一次授权的时候记录该时间，其他任何操作都不在改变）'
/


  CREATE TABLE "CCENSE"."BASE_CHARGINGMODE" 
   (	"TYPEID" NUMBER NOT NULL ENABLE, 
	"TYPENAME" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100), 
	 CONSTRAINT "PK_BASE_CHARGEINGMODE" PRIMARY KEY ("TYPEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_chargingmode is '计费方式类型表'
/
comment on column base_chargingmode.typeid is '计费方式编号'
/
comment on column base_chargingmode.typename is '计费方式名称'
/
comment on column base_chargingmode.description is '计费方式描述'
/


  CREATE TABLE "CCENSE"."BASE_CITY_ERRORCODE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ERRORCODE" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "REC_CITY_ERRORCODE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_city_errorcode is '本地自定义 交通部对接文件入库错误代码'
/
comment on column base_city_errorcode.id is ''
/
comment on column base_city_errorcode.errorcode is '错误代码'
/
comment on column base_city_errorcode.describe is '描述'
/


  CREATE TABLE "CCENSE"."BASE_CITY_ERRORDEALTYPE" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"ISLOCALCARD" NUMBER, 
	"ISLOCALCONSUME" NUMBER, 
	"ADJUSTMENTTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ADJUSTTYPEDESC" VARCHAR2(20), 
	"ERRORTYPE" VARCHAR2(4) DEFAULT '0000' NOT NULL ENABLE, 
	"ERRORTYPEDESC" VARCHAR2(50), 
	"REASONCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"REASONCODEDESC" VARCHAR2(50), 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CITY_ERRORDEALTYPE" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 109051904 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_city_errordealtype is '差错处理调整差错类型管理'
/
comment on column base_city_errordealtype.cstaccfc is '流水号'
/
comment on column base_city_errordealtype.islocalcard is '是否是本地卡 0非本地卡 1本地卡'
/
comment on column base_city_errordealtype.islocalconsume is '是否是本地消费 0非本地消费 1本地消费'
/
comment on column base_city_errordealtype.adjustmenttype is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款)'
/
comment on column base_city_errordealtype.adjusttypedesc is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款)'
/
comment on column base_city_errordealtype.errortype is '差错类型 0000初始状态 其他参考ed文件'
/
comment on column base_city_errordealtype.errortypedesc is '差错类型 0000初始状态 其他参考ed文件'
/
comment on column base_city_errordealtype.reasoncode is '原因码'
/
comment on column base_city_errordealtype.reasoncodedesc is '原因码描述'
/
comment on column base_city_errordealtype.uploaddate is '上传时间'
/
comment on column base_city_errordealtype.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_COMMUNICATION_LOG" 
   (	"ID" NUMBER, 
	"POSCODE" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT sysdate, 
	"JL_CSTACCFC" VARCHAR2(20) DEFAULT '', 
	"JL_TYPE" NUMBER DEFAULT -1, 
	"CREATEDATETIME" DATE DEFAULT sysdate, 
	"JL_STANDBY" VARCHAR2(500), 
	"BUSCODE" VARCHAR2(10), 
	 CONSTRAINT "BASE_COMMUNICATION_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16777216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 92274688 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_communication_log is '通讯信息'
/
comment on column base_communication_log.id is 'id'
/
comment on column base_communication_log.poscode is '终端编号'
/
comment on column base_communication_log.opdt is '日期'
/
comment on column base_communication_log.jl_cstaccfc is '记录流水号'
/
comment on column base_communication_log.jl_type is '交易类型'
/
comment on column base_communication_log.createdatetime is '入库时间'
/
comment on column base_communication_log.jl_standby is '备用'
/
comment on column base_communication_log.buscode is '车辆唯一编号'
/


  CREATE TABLE "CCENSE"."BASE_COUNTRY" 
   (	"COUNTRYID" CHAR(3) NOT NULL ENABLE, 
	"COUNTRYNAME" VARCHAR2(40) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_COUNTRY" PRIMARY KEY ("COUNTRYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_country is '国别列表，142代表中国'
/
comment on column base_country.countryid is '国家编号'
/
comment on column base_country.countryname is '国家名称'
/


  CREATE TABLE "CCENSE"."BASE_CUSTOMERS" 
   (	"ID" VARCHAR2(8) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER NOT NULL ENABLE, 
	"QUERYPWD" VARCHAR2(32), 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"COUNTRYID" NUMBER DEFAULT '142' NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"SUMELECTRADDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMDISCOUNT" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"NOUSEDATE" DATE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"YEARCHECKS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CHECKBEGINDAY" DATE, 
	"CHECKENDDAY" DATE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"SUMELECTRADDDUMMYFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"REFUNDDUMPFARE" NUMBER DEFAULT 0, 
	"REFUNDLIMITCONSUMFARE" NUMBER DEFAULT 0, 
	"NONAMEFLAG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEID" NUMBER, 
	"PRODUCTID" NUMBER, 
	"ASN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEPEOPLEID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CARDTYPECITYID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"SERVERID" NUMBER, 
	"NUMBEROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"NUMBERSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"NUMBERODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"NUMBERODDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ISNEWCAPECSYS" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMANGEFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MANGEFARELASTDATE" DATE DEFAULT SYSDATE, 
	"SUMFREEMANGEFARE" NUMBER DEFAULT 0.00, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"SUMVICERUSHFARE" NUMBER(20,2) DEFAULT 0.00, 
	"ELECASHTYPE" VARCHAR2(1) DEFAULT 0 NOT NULL ENABLE, 
	"VICEVALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VIDEVALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VICESAVEPLANID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELESAVEPLANID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ECOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ODDFARELASTTIME" DATE DEFAULT TO_DATE ('2000-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 
	"CODE" VARCHAR2(20), 
	 CHECK ("CARDNO" IS NOT NULL) ENABLE, 
	 CONSTRAINT "PK_BASE_CUSTOMERS_CARDNO" PRIMARY KEY ("CARDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 243269632 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN_INDEX"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL KEEP FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("CUSTOMERID") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART5000000"  VALUES LESS THAN (5000000) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL KEEP FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB500"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB500"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART10000000"  VALUES LESS THAN (10000000) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL KEEP FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB1000"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB1000"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
  CACHE 
 
/
comment on table base_customers is '客户卡账户信息表-记录持卡人卡相关信息'
/
comment on column base_customers.id is '发卡流水号（主键）'
/
comment on column base_customers.customerid is '账号'
/
comment on column base_customers.scardsnr is '卡唯一号'
/
comment on column base_customers.cardtypedetailid is '卡类别小类'
/
comment on column base_customers.cardsn is '持卡序号'
/
comment on column base_customers.status is '卡状态：1--正常，3--挂失，4--冻结，5--灰色，6--停用,20--登记入库中间状态，21--已登记状态'
/
comment on column base_customers.querypwd is '查询密码'
/
comment on column base_customers.cardkind is '卡类型 （1m1卡 2cpu卡）'
/
comment on column base_customers.countryid is '国家编号'
/
comment on column base_customers.electropcount is '电子钱包消费计数'
/
comment on column base_customers.electrsaveopcount is '电子钱包充值计数'
/
comment on column base_customers.sumelectraddfareacc is '电子钱包总加款额系统值'
/
comment on column base_customers.sumelectraddfare is '电子钱包总加款额'
/
comment on column base_customers.sumconsumfare is '总消费额'
/
comment on column base_customers.sumelectrconsumfare is '电子钱包消费累计总额'
/
comment on column base_customers.sumelectrdummyfare is '电子钱包虚充总额'
/
comment on column base_customers.sumdiscount is '总打折额'
/
comment on column base_customers.electroddfare is '电子钱包卡余额'
/
comment on column base_customers.electroddfareacc is '电子钱包账户余额系统值'
/
comment on column base_customers.nousedate is '失效日期'
/
comment on column base_customers.empid is '职员编号'
/
comment on column base_customers.yearchecks is '是否需要年检（0不年检，1年检）'
/
comment on column base_customers.checkbeginday is '年检开始时间'
/
comment on column base_customers.checkendday is '年检结束时间'
/
comment on column base_customers.ver is '版本号'
/
comment on column base_customers.depreciatefare is '最后一次收取的折旧费，用于销户时计算退款'
/
comment on column base_customers.depreciatedate is '最后一次收取折旧费日期，用于销户时计算退款，格式yyyy-mm-dd hh24:mi:ss'
/
comment on column base_customers.sumelectradddummyfare is '电子钱包虚充加款时现金金额，如充100送20时此值累加100，不送不累加'
/
comment on column base_customers.refunddumpfare is '未消费完的虚充金额，退卡时从余额扣除'
/
comment on column base_customers.refundlimitconsumfare is '最低消费限额，否则退卡时虚充金额要从余额扣除'
/
comment on column base_customers.nonameflag is '不记名标记（0：记名；1：不记名）'
/
comment on column base_customers.cardtypeid is '发卡类型：普通卡和手机卡,银行卡：3'
/
comment on column base_customers.productid is '卡供应商：移动、联通、电信'
/
comment on column base_customers.asn is 'm1：卡唯一序列号；cpu卡：卡应用序列号'
/
comment on column base_customers.outid is '市民卡号'
/
comment on column base_customers.cardtypepeopleid is '市民用途，市民类、管理卡类'
/
comment on column base_customers.cardtypecityid is '卡类型，普通卡、管理卡等'
/
comment on column base_customers.serverid is ''
/
comment on column base_customers.numberopcount is '次钱包消费交易计数'
/
comment on column base_customers.numbersaveopcount is '次钱包充值交易计数'
/
comment on column base_customers.numberoddfare is '次钱包卡余额'
/
comment on column base_customers.numberoddfareacc is '次钱包系统余额'
/
comment on column base_customers.isnewcapecsys is '新旧系统（0第一次发卡系统是新开普系统，1第一次发卡系统是其它公司系统）'
/
comment on column base_customers.summangefare is '收取管理费累计，用于销户时计算退款（和卡上有效期结合）'
/
comment on column base_customers.mangefarelastdate is '最后一次收取管理费日期，格式yyyy-mm-dd hh24:mi:ss'
/
comment on column base_customers.sumfreemangefare is '免收管理费累计，用户销户时计算退款'
/
comment on column base_customers.customerunitcode is '客户代码'
/
comment on column base_customers.opdt is '开卡时间'
/
comment on column base_customers.cardno is '卡号'
/
comment on column base_customers.sumvicerushfare is '次卡冲零金额累计'
/
comment on column base_customers.elecashtype is '电子现金启用状态，0不用1启用'
/
comment on column base_customers.vicevalidtimestart is '次卡有效起日'
/
comment on column base_customers.videvalidtimeend is '次卡有效止日'
/
comment on column base_customers.vicesaveplanid is '次卡最大充值计划id'
/
comment on column base_customers.elesaveplanid is '钱包最大充值计划id'
/
comment on column base_customers.ecopcount is '电子现金消费计数'
/
comment on column base_customers.oddfarelasttime is '制卡中心老卡同步'
/
comment on column base_customers.code is '员工编号'
/


  CREATE TABLE "CCENSE"."BASE_CUSTOMERS_INFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(50), 
	"SEX" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"NATION" VARCHAR2(2) DEFAULT '01' NOT NULL ENABLE, 
	"TELPHONENUM" VARCHAR2(20), 
	"IDCARDNO" VARCHAR2(18), 
	"CERTIFICATEID" NUMBER DEFAULT 3 NOT NULL ENABLE, 
	"CUSTDEPT" VARCHAR2(12), 
	"OPENDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(500), 
	"BIRTHDAY" DATE, 
	"RREMARK" VARCHAR2(500), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CUSTSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CUSTOMERS_INFO_CUSTID" PRIMARY KEY ("CUSTOMERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 159383552 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN_INDEX"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 377487360 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  CACHE 
 
/
comment on table base_customers_info is '客户基本信息表'
/
comment on column base_customers_info.id is '自动增长'
/
comment on column base_customers_info.customerid is '账号'
/
comment on column base_customers_info.name is '姓名'
/
comment on column base_customers_info.sex is '性别，1是男，其它女'
/
comment on column base_customers_info.nation is '民族编号'
/
comment on column base_customers_info.telphonenum is '联系电话'
/
comment on column base_customers_info.idcardno is '证件号码'
/
comment on column base_customers_info.certificateid is '证件类型'
/
comment on column base_customers_info.custdept is '预留，暂时无用'
/
comment on column base_customers_info.opendt is '开户日期'
/
comment on column base_customers_info.address is '地址'
/
comment on column base_customers_info.birthday is '出生日期'
/
comment on column base_customers_info.rremark is '备注'
/
comment on column base_customers_info.customerunitcode is '客户代码'
/
comment on column base_customers_info.custstatus is '客户状态：0-注销 1：正常（用户的卡都注销后，改标记为0，可以转储基本信息到客户基本信息注销表）'
/


  CREATE TABLE "CCENSE"."BASE_CUSTOMERS_VICECARD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"SUMCONSUMEFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMRDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMADDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMADDDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"REFUNDDUMPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"REFUNDLIMITCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDASN" NUMBER NOT NULL ENABLE, 
	"VICEHANGDATE" DATE, 
	"HANGTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_CUSTOMERS_NUMBER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_CUSTOMERS_NUMBER_1" UNIQUE ("CUSTOMERID", "CUSTOMERUNITCODE", "CARDASN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 655360 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_customers_vicecard is '客户次卡钱包信息表'
/
comment on column base_customers_vicecard.id is '自动增长'
/
comment on column base_customers_vicecard.customerid is '账号'
/
comment on column base_customers_vicecard.sumconsumefare is '次卡钱包消费累计总额'
/
comment on column base_customers_vicecard.sumrdummyfare is '次卡钱包虚充总额'
/
comment on column base_customers_vicecard.sumaddfare is '次卡钱包总加款额'
/
comment on column base_customers_vicecard.sumaddfareacc is '次卡钱包总加款额系统值'
/
comment on column base_customers_vicecard.sumadddummyfare is '次卡钱包虚充'
/
comment on column base_customers_vicecard.refunddumpfare is '未消费完的虚充金额，退卡时从余额扣除'
/
comment on column base_customers_vicecard.refundlimitconsumfare is '最低消费限额，否则退卡时虚充金额要从余额扣除'
/
comment on column base_customers_vicecard.ver is ''
/
comment on column base_customers_vicecard.customerunitcode is '客户代码'
/
comment on column base_customers_vicecard.cardasn is '卡应用序列号'
/
comment on column base_customers_vicecard.vicehangdate is '冲零/清零 日期'
/
comment on column base_customers_vicecard.hangtype is '冲零/清零 方式  0为固定日期  1为月末清零'
/


  CREATE TABLE "CCENSE"."BASE_DATETIME_LOG" 
   (	"ID" NUMBER, 
	"POSCODE" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT sysdate, 
	"JL_CSTACCFC" VARCHAR2(20) DEFAULT '', 
	"JL_TYPE" NUMBER DEFAULT -1, 
	"CREATEDATETIME" DATE DEFAULT sysdate, 
	"JL_STANDBY" VARCHAR2(500), 
	"BUSCODE" VARCHAR2(10), 
	 CONSTRAINT "BASE_DATETIME_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_datetime_log is '时间信息'
/
comment on column base_datetime_log.id is 'id'
/
comment on column base_datetime_log.poscode is '终端编号'
/
comment on column base_datetime_log.opdt is '终端时钟时间'
/
comment on column base_datetime_log.jl_cstaccfc is '记录流水号'
/
comment on column base_datetime_log.jl_type is '交易类型'
/
comment on column base_datetime_log.createdatetime is '入库时间'
/
comment on column base_datetime_log.jl_standby is '备用'
/
comment on column base_datetime_log.buscode is '车辆唯一编号'
/


  CREATE TABLE "CCENSE"."BASE_DEPOSITLEVEL" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(200 CHAR) NOT NULL ENABLE, 
	"DEPOSIT" NUMBER NOT NULL ENABLE, 
	"VISIBLE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_DEPOSITLEVEL" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_depositlevel is '自行车开启类别'
/
comment on column base_depositlevel.id is '编号'
/
comment on column base_depositlevel.description is '描述'
/
comment on column base_depositlevel.deposit is '押金'
/
comment on column base_depositlevel.visible is '是否可见'
/


  CREATE TABLE "CCENSE"."BASE_DEPT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"DPTNAME" NVARCHAR2(20) NOT NULL ENABLE, 
	"DPTCODE_P" VARCHAR2(9) NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ISVISIBLE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISDELETE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DELETEDATE" DATE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISSUBCOMPANY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SERVERID" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) DEFAULT '00000000000' NOT NULL ENABLE, 
	"DEPTTYPE" NUMBER DEFAULT 2 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	"DPTBANKCARDNO" VARCHAR2(30), 
	"DPTBANKCARDOWNER" VARCHAR2(50), 
	"TRANSACCOUNTNO" VARCHAR2(30), 
	"DPTBANKCARDADDRESS" VARCHAR2(200), 
	"DPTTELEPHONE" VARCHAR2(13), 
	"DPTBANKCODE" NUMBER DEFAULT 1, 
	"ACCOUNTTYPE" NUMBER DEFAULT 6 NOT NULL ENABLE, 
	"TRANSACCOUTBANKCODE" NUMBER DEFAULT 1, 
	 CONSTRAINT "PK_BASE_DEPT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_DEPT" UNIQUE ("DPTCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_dept is '业务部门：和卡业务有关的部门
'
/
comment on column base_dept.id is '主键'
/
comment on column base_dept.dptcode is '业务部门编号'
/
comment on column base_dept.dptname is '业务部门名称'
/
comment on column base_dept.dptcode_p is '上级业务部门'
/
comment on column base_dept.sortid is '排序id'
/
comment on column base_dept.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_dept.isvisible is '是否可见（0不可见，1可见）'
/
comment on column base_dept.isdelete is '是否删除（0未删除，1已删除）'
/
comment on column base_dept.deletedate is '删除日期'
/
comment on column base_dept.ver is '版本号'
/
comment on column base_dept.issubcompany is '是否为分公司，1为分公司，0为其他部门'
/
comment on column base_dept.serverid is '停用字段'
/
comment on column base_dept.customerunitcode is '客户代码'
/
comment on column base_dept.depttype is '部门属性 1：充值类  2：消费类  0：综合类（充值和消费）'
/
comment on column base_dept.flag is '停用字段'
/
comment on column base_dept.dptbankcardno is '停用字段'
/
comment on column base_dept.dptbankcardowner is '停用字段'
/
comment on column base_dept.transaccountno is '停用字段'
/
comment on column base_dept.dptbankcardaddress is '停用字段'
/
comment on column base_dept.dpttelephone is '停用字段'
/
comment on column base_dept.dptbankcode is '停用字段'
/
comment on column base_dept.accounttype is '停用字段'
/
comment on column base_dept.transaccoutbankcode is '停用字段'
/


  CREATE TABLE "CCENSE"."BASE_EMP" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(10,0) DEFAULT 0 NOT NULL ENABLE, 
	"EMPCODE" VARCHAR2(32) NOT NULL ENABLE, 
	"EMPNAME" VARCHAR2(10) NOT NULL ENABLE, 
	"EMPPWD" VARCHAR2(64) DEFAULT '21218cca77804d2ba1922c33e0151105' NOT NULL ENABLE, 
	"EMPPOS" VARCHAR2(2) DEFAULT 0 NOT NULL ENABLE, 
	"EMPEMAIL" VARCHAR2(40), 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"IDCARDNO" VARCHAR2(18) NOT NULL ENABLE, 
	"CERTIFICATEID" NUMBER NOT NULL ENABLE, 
	"TELPHONENUM" VARCHAR2(20), 
	"SEX" NUMBER NOT NULL ENABLE, 
	"POSTID" NUMBER NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(50) DEFAULT '' NOT NULL ENABLE, 
	"NATION" VARCHAR2(2) NOT NULL ENABLE, 
	"INCOMEDATE" DATE, 
	"USERID" VARCHAR2(20) NOT NULL ENABLE, 
	"LOGINST" NUMBER NOT NULL ENABLE, 
	"ROLECODE" VARCHAR2(160) NOT NULL ENABLE, 
	"ISSYSTEMUSER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CASHCARDTYPE" VARCHAR2(500), 
	"SALECARDTYPE" VARCHAR2(500), 
	"PRIVILEGELOGON" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"YEARCHECK" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CHECKBEGINDAY" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CHECKENDDAY" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"THEMES" VARCHAR2(30) DEFAULT 'capec' NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AREAID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EXCEPTIVEEMP" NUMBER, 
	"ISDELETE" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(12) DEFAULT '00000000000' NOT NULL ENABLE, 
	"BANKCODE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"BANKCARDNO" VARCHAR2(30), 
	"LANGUAGE" VARCHAR2(50) DEFAULT 'zh', 
	"DELETEDATE" DATE, 
	"ACCOUNTTYPE" NUMBER DEFAULT 3, 
	 CONSTRAINT "PK_BASE_EMP" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_EMP_EMPCODE" UNIQUE ("EMPCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_EMP_EMPID" UNIQUE ("EMPID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_EMP_USERID" UNIQUE ("USERID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_emp is '员工表'
/
comment on column base_emp.id is '主键'
/
comment on column base_emp.empid is '职员帐号'
/
comment on column base_emp.empcode is '操作员编号（登录名）'
/
comment on column base_emp.empname is '职员姓名'
/
comment on column base_emp.emppwd is '职员密码（sha1）'
/
comment on column base_emp.emppos is '职员权限限制（0-普通职员, 1-系统管理, ，2-部门领导）'
/
comment on column base_emp.empemail is '电子邮件'
/
comment on column base_emp.dptcode is '业务部门编号'
/
comment on column base_emp.idcardno is '证件号码'
/
comment on column base_emp.certificateid is '证件类型'
/
comment on column base_emp.telphonenum is '电话号码'
/
comment on column base_emp.sex is '性别'
/
comment on column base_emp.postid is '职务id'
/
comment on column base_emp.address is '家庭住址'
/
comment on column base_emp.nation is '民族'
/
comment on column base_emp.incomedate is '入职时间'
/
comment on column base_emp.userid is '工号'
/
comment on column base_emp.loginst is '登录限制 0-无限制 1-ip限制 ;不配置卡的使用，充值必须使用充值员卡'
/
comment on column base_emp.rolecode is '操作员角色'
/
comment on column base_emp.issystemuser is '是否是系统保留用户(0:不是系统用户，1:是系统用户)'
/
comment on column base_emp.cashcardtype is '职员允许充值卡类型，如（1，2），不允许值为0。'
/
comment on column base_emp.salecardtype is '职员允许销售卡类型，如（1，2），不允许值为0。'
/
comment on column base_emp.privilegelogon is '软件登陆权限(0:禁止登录软件；1:允许登陆软件)'
/
comment on column base_emp.yearcheck is '是否需要年检 0不需要 1需要'
/
comment on column base_emp.checkbeginday is '年检开始时间'
/
comment on column base_emp.checkendday is '结束时间'
/
comment on column base_emp.themes is '主题样式'
/
comment on column base_emp.ver is '版本号'
/
comment on column base_emp.areaid is '分区id'
/
comment on column base_emp.status is '帐号状态 -1：禁用 0-初始状态 1-正常状态'
/
comment on column base_emp.exceptiveemp is '0-普通职员 1-特殊职员'
/
comment on column base_emp.isdelete is '是否删除（0未删除，1 删除）'
/
comment on column base_emp.customerunitcode is '客户代码'
/
comment on column base_emp.bankcode is '银行代码（base_bank）'
/
comment on column base_emp.bankcardno is '银行账号 交账使用'
/
comment on column base_emp.language is '职员使用语言'
/
comment on column base_emp.deletedate is '删除时间：删除职员时更新此字段'
/
comment on column base_emp.accounttype is '账户类型（和base_accounttype对应）'
/


  CREATE TABLE "CCENSE"."BASE_EMP_CARD" 
   (	"EMPID" NUMBER NOT NULL ENABLE, 
	"EMPCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDSTATUS" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(8) NOT NULL ENABLE, 
	"CARDSN" NUMBER(6,0) DEFAULT 1 NOT NULL ENABLE, 
	"PWD" VARCHAR2(32), 
	"NOUSEDATE" DATE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPERATIONEMPID" NUMBER NOT NULL ENABLE, 
	"YEARCHECK" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CHECKBEGINDAY" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CHECKENDDAY" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"CARDID" VARCHAR2(8) NOT NULL ENABLE, 
	"CUSTOMERUINTCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"LINEID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CLASSES" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_BASE_EMP_CARD" PRIMARY KEY ("EMPID", "CARDDETAILID", "SCARDSNR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_EMP_CARD_CARDID" UNIQUE ("CARDID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_EMP_SCARDNR" UNIQUE ("SCARDSNR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_emp_card is '职员卡记录表'
/
comment on column base_emp_card.empid is '职员帐号'
/
comment on column base_emp_card.empcardno is '职员卡号'
/
comment on column base_emp_card.carddetailid is '卡种类'
/
comment on column base_emp_card.cardstatus is '状态（1：正常 ，3：挂失）'
/
comment on column base_emp_card.scardsnr is '卡唯一号'
/
comment on column base_emp_card.cardsn is '持卡序号（第几张卡）'
/
comment on column base_emp_card.pwd is '卡密码'
/
comment on column base_emp_card.nousedate is '卡失效日期'
/
comment on column base_emp_card.cardkind is '卡类型 1m1卡2 cpu卡'
/
comment on column base_emp_card.ver is '版本号'
/
comment on column base_emp_card.operationempid is '对此卡进行发卡的操作员id'
/
comment on column base_emp_card.yearcheck is '是否需要年检 0不需要 1需要'
/
comment on column base_emp_card.checkbeginday is '年检开始时间'
/
comment on column base_emp_card.checkendday is '年检结束时间'
/
comment on column base_emp_card.opdt is '卡户时间'
/
comment on column base_emp_card.cardid is '卡流水号'
/
comment on column base_emp_card.customeruintcode is '客户代码'
/
comment on column base_emp_card.lineid is '线路卡时对应id，0为空'
/
comment on column base_emp_card.classes is '班次0，甲班；1，乙班'
/


  CREATE TABLE "CCENSE"."BASE_EMP_CARD_HISTORY" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDNO" NUMBER DEFAULT 0, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDSN" NUMBER DEFAULT 0, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"LOSSFC" NUMBER, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"AREAID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PTY" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ID" VARCHAR2(8) DEFAULT 0 NOT NULL ENABLE, 
	"OPERATIONEMPID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUINTCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_emp_card_history is '职员卡历史记录表'
/
comment on column base_emp_card_history.cardfc is '流水：主键，自增长'
/
comment on column base_emp_card_history.scardsnr is '卡唯一号'
/
comment on column base_emp_card_history.cardno is '卡号'
/
comment on column base_emp_card_history.oldcardno is '老卡号'
/
comment on column base_emp_card_history.cardtypedetailid is '卡类型'
/
comment on column base_emp_card_history.cardsn is '持卡序号（第几张卡）'
/
comment on column base_emp_card_history.oldcardsn is '老卜序号'
/
comment on column base_emp_card_history.cardkind is '卡类型 1m1卡2 cpu卡'
/
comment on column base_emp_card_history.opdt is '操作日期'
/
comment on column base_emp_card_history.lossfc is '挂失流水：挂失表的流水号'
/
comment on column base_emp_card_history.empid is '持有卡的职员帐号'
/
comment on column base_emp_card_history.areaid is '分区编号'
/
comment on column base_emp_card_history.pty is '发放性质 0=新卡，1=补发，2=换卡'
/
comment on column base_emp_card_history.ver is '版本号'
/
comment on column base_emp_card_history.id is '卡上流水号：来源于密钥系统的发卡流水号'
/
comment on column base_emp_card_history.operationempid is '对此卡进行发卡的操作员id'
/
comment on column base_emp_card_history.customeruintcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_EMP_MENU" 
   (	"EMP_PRMID" NUMBER NOT NULL ENABLE, 
	"ROLEID" NUMBER NOT NULL ENABLE, 
	"MENUID" VARCHAR2(8) NOT NULL ENABLE, 
	"EMP_PRM" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) DEFAULT '08600000000' NOT NULL ENABLE, 
	"MODELID" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_BASE_EMP_MENU" PRIMARY KEY ("EMP_PRMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_emp_menu is '业务职员菜单授权'
/
comment on column base_emp_menu.emp_prmid is '授权号（自动产生的）
'
/
comment on column base_emp_menu.roleid is '角色编号'
/
comment on column base_emp_menu.menuid is '菜单标识'
/
comment on column base_emp_menu.emp_prm is '授权（0=收回，1=授权，null=忽略）'
/
comment on column base_emp_menu.customerunitcode is '客户代码'
/
comment on column base_emp_menu.modelid is '业务模块id号'
/


  CREATE TABLE "CCENSE"."BASE_ERRORDICTIONARY" 
   (	"ERRORCODE" VARCHAR2(20), 
	"ERRORMESSAGE" VARCHAR2(1000), 
	"BODY" VARCHAR2(1000)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_errordictionary is ''
/
comment on column base_errordictionary.errorcode is ''
/
comment on column base_errordictionary.errormessage is ''
/
comment on column base_errordictionary.body is ''
/


  CREATE TABLE "CCENSE"."BASE_INFO_XFKYBK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(50), 
	"SEX" NUMBER NOT NULL ENABLE, 
	"NATION" VARCHAR2(2) NOT NULL ENABLE, 
	"TELPHONENUM" VARCHAR2(20), 
	"IDCARDNO" VARCHAR2(18), 
	"CERTIFICATEID" NUMBER NOT NULL ENABLE, 
	"CUSTDEPT" VARCHAR2(12), 
	"OPENDT" DATE NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(500), 
	"BIRTHDAY" DATE, 
	"RREMARK" VARCHAR2(500), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CUSTSTATUS" NUMBER NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_info_xfkybk is ''
/
comment on column base_info_xfkybk.id is ''
/
comment on column base_info_xfkybk.customerid is ''
/
comment on column base_info_xfkybk.name is ''
/
comment on column base_info_xfkybk.sex is ''
/
comment on column base_info_xfkybk.nation is ''
/
comment on column base_info_xfkybk.telphonenum is ''
/
comment on column base_info_xfkybk.idcardno is ''
/
comment on column base_info_xfkybk.certificateid is ''
/
comment on column base_info_xfkybk.custdept is ''
/
comment on column base_info_xfkybk.opendt is ''
/
comment on column base_info_xfkybk.address is ''
/
comment on column base_info_xfkybk.birthday is ''
/
comment on column base_info_xfkybk.rremark is ''
/
comment on column base_info_xfkybk.customerunitcode is ''
/
comment on column base_info_xfkybk.custstatus is ''
/


  CREATE TABLE "CCENSE"."BASE_JTB_ERRORCODE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ERRORCODE" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_JTB_ERRORCODE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_jtb_errorcode is '交通部对接错误代码表'
/
comment on column base_jtb_errorcode.id is ''
/
comment on column base_jtb_errorcode.errorcode is '错误代码'
/
comment on column base_jtb_errorcode.describe is '描述'
/


  CREATE TABLE "CCENSE"."BASE_LEGAL_PERSON" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CUSTOMERNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"CUSTOMERNAMEJP" VARCHAR2(100) NOT NULL ENABLE, 
	"LINKMAN" VARCHAR2(100), 
	"TELEPHONE" VARCHAR2(13), 
	"ADDRESS" VARCHAR2(200), 
	"EMAIL" VARCHAR2(200), 
	"BANKCODE" NUMBER DEFAULT 1, 
	"BANKCARDNO" VARCHAR2(30), 
	"DATABASESTR" VARCHAR2(200), 
	"WEBURL" VARCHAR2(200), 
	"OPDT" DATE DEFAULT sysdate, 
	"OPENDT" DATE DEFAULT sysdate, 
	"RREMARK" VARCHAR2(200), 
	"STATUS" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISRELEVANCE" NUMBER DEFAULT 0, 
	"MANAGELEGAL" VARCHAR2(200), 
	"ISDELETE" NUMBER DEFAULT 0, 
	"ISBALANCE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPERATORCODE" VARCHAR2(10) DEFAULT '10000000' NOT NULL ENABLE, 
	"OWNERCITYCODE" VARCHAR2(10) DEFAULT '00000000' NOT NULL ENABLE, 
	"CITYCODE" VARCHAR2(11) DEFAULT '', 
	"INDUSTRYCODE" VARCHAR2(11), 
	"BALANCEDATE" DATE, 
	 CONSTRAINT "PK_BASE_LEGAL_PERSON" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_LEGAL_PERSON" UNIQUE ("CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_legal_person is '客户（法人）信息表'
/
comment on column base_legal_person.id is '自动编号'
/
comment on column base_legal_person.customerunitcode is '客户代码（国家地区编号（3）+预留（5）+分配序号（3）），如08600000001'
/
comment on column base_legal_person.customername is '客户名称'
/
comment on column base_legal_person.customernamejp is '客户名称简称'
/
comment on column base_legal_person.linkman is '联系人'
/
comment on column base_legal_person.telephone is '联系电话'
/
comment on column base_legal_person.address is '客户地址'
/
comment on column base_legal_person.email is '邮箱'
/
comment on column base_legal_person.bankcode is '所属银行(base_bank)'
/
comment on column base_legal_person.bankcardno is '转账卡号（银行卡号）'
/
comment on column base_legal_person.databasestr is '数据存储数据库连接字符串（预留）'
/
comment on column base_legal_person.weburl is '访问web服务地址'
/
comment on column base_legal_person.opdt is '最后一次操作时间（每次操作都更新）'
/
comment on column base_legal_person.opendt is '客户注册时间（添加时候更新，其他时间不维护）'
/
comment on column base_legal_person.rremark is '备注信息'
/
comment on column base_legal_person.status is '0：禁用状态 1：未授权 2：已授权'
/
comment on column base_legal_person.isrelevance is '是否拥有级联管理 0：无级联管理关系 1：有级联管理关系'
/
comment on column base_legal_person.managelegal is '级联管理客户编号，使用1,2,3,4......形式存储（1,2代表该表的id字段）'
/
comment on column base_legal_person.isdelete is '逻辑删除字段（0未删除，1 删除）'
/
comment on column base_legal_person.isbalance is '是否正在结帐（0：否；1：是 2：准备结账 非0状态不允许执行日结操作）'
/
comment on column base_legal_person.operatorcode is '交通部收单机构代码'
/
comment on column base_legal_person.ownercitycode is '交通部发卡方机构代码'
/
comment on column base_legal_person.citycode is '城市代码，用于指定秘钥'
/
comment on column base_legal_person.industrycode is '行业编号（oda和一卡通对接）'
/
comment on column base_legal_person.balancedate is '日结成功日期'
/


  CREATE TABLE "CCENSE"."BASE_LEGAL_PERSON_MENU" 
   (	"PRMID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"MODELID" NUMBER NOT NULL ENABLE, 
	"MENUID" VARCHAR2(4000) NOT NULL ENABLE, 
	"CUS_PRM" NUMBER DEFAULT 1, 
	 CONSTRAINT "PK_BASE_LEGAL_PERSON_MENU" PRIMARY KEY ("PRMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_LEGAL_PERSON_MENU" UNIQUE ("CUSTOMERUNITCODE", "MODELID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_legal_person_menu is '客户法人-业务授权信息表'
/
comment on column base_legal_person_menu.prmid is '授权号(自动产生)'
/
comment on column base_legal_person_menu.customerunitcode is '客户代码'
/
comment on column base_legal_person_menu.modelid is '业务模块编号'
/
comment on column base_legal_person_menu.menuid is '业务模块功能项（00000000|00000001|...），以菜单项的id存放一个串'
/
comment on column base_legal_person_menu.cus_prm is '授权（0=收回，1=授权，null=忽略）'
/


  CREATE TABLE "CCENSE"."BASE_LINEPARAM" 
   (	"LINEID" NUMBER NOT NULL ENABLE, 
	"PARAMNAME" VARCHAR2(50), 
	"PARAMVALUE" VARCHAR2(1024), 
	"ISUSE" NUMBER DEFAULT 1, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"VER" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT sysdate, 
	"ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_LINEPARAM" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_LINEPARAM" UNIQUE ("LINEID", "PARAMNAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_lineparam is '线路参数信息（线路票价卡参数-和线路相关的参数）'
/
comment on column base_lineparam.lineid is '线路id'
/
comment on column base_lineparam.paramname is '参数名称'
/
comment on column base_lineparam.paramvalue is '参数值'
/
comment on column base_lineparam.isuse is '是否启用 0 不启用 1 启用'
/
comment on column base_lineparam.customerunitcode is '客户代码'
/
comment on column base_lineparam.ver is '版本号'
/
comment on column base_lineparam.opdt is '操作时间'
/
comment on column base_lineparam.id is '自增长'
/


  CREATE TABLE "CCENSE"."BASE_LINEPARAM_CARDTYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"PARAMNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(1024) NOT NULL ENABLE, 
	"ISUSE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT sysdate, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	 CONSTRAINT "PK_BASE_LINEPARAM_CARDTYPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_LINEPARAM_CARDTYPE" UNIQUE ("LINEID", "CARDTYPE", "PARAMNAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_lineparam_cardtype is '线路票价卡-卡类型相关参数信息'
/
comment on column base_lineparam_cardtype.id is '编号'
/
comment on column base_lineparam_cardtype.lineid is '线路编号'
/
comment on column base_lineparam_cardtype.cardtype is '卡类型编号'
/
comment on column base_lineparam_cardtype.paramname is '参数名称'
/
comment on column base_lineparam_cardtype.paramvalue is '参数值'
/
comment on column base_lineparam_cardtype.isuse is '是否启用 0 不启用 1 启用'
/
comment on column base_lineparam_cardtype.ver is '版本号'
/
comment on column base_lineparam_cardtype.opdt is '最后一次操作时间'
/
comment on column base_lineparam_cardtype.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_MAINCARDTYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(30), 
	"ISUSE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE, 
	 CONSTRAINT "PK_BASE_MAINCARDTYPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_MAINCARDTYPE" UNIQUE ("MAINCARDTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_maincardtype is '主卡类型'
/
comment on column base_maincardtype.id is '自增主键'
/
comment on column base_maincardtype.maincardtype is '主卡类型值'
/
comment on column base_maincardtype.name is '主卡类型名称'
/
comment on column base_maincardtype.isuse is '是否可见（0不可见，1可见）'
/
comment on column base_maincardtype.customerunitcode is '客户法人'
/
comment on column base_maincardtype.createdate is '最后一次修改时间'
/


  CREATE TABLE "CCENSE"."BASE_MENU" 
   (	"MENUID" VARCHAR2(8) NOT NULL ENABLE, 
	"MENUNAME" VARCHAR2(32) NOT NULL ENABLE, 
	"SMALLICON" VARCHAR2(80), 
	"NAVLINK" VARCHAR2(80), 
	"DESCRIPTION" VARCHAR2(100), 
	"LARGEICON" VARCHAR2(88), 
	"PARENTMENUID" VARCHAR2(8), 
	"SUBSYSTEMID" VARCHAR2(32), 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISVISIBLE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_MENU" PRIMARY KEY ("MENUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_menu is '业务菜单目录'
/
comment on column base_menu.menuid is '菜单标识'
/
comment on column base_menu.menuname is '菜单名称'
/
comment on column base_menu.smallicon is '小图标文件名(url)'
/
comment on column base_menu.navlink is '导航链接(url)'
/
comment on column base_menu.description is '描述'
/
comment on column base_menu.largeicon is '大图标文件名(url)'
/
comment on column base_menu.parentmenuid is '上级菜单标识(空表示顶级菜单，顶级菜单为自系统列表)'
/
comment on column base_menu.subsystemid is '所属子系统（存储加密后的密文）'
/
comment on column base_menu.sortid is '排序id'
/
comment on column base_menu.isvisible is '是否显示（0不显示。1显示）'
/


  CREATE TABLE "CCENSE"."BASE_NATION" 
   (	"NATIONID" VARCHAR2(2) NOT NULL ENABLE, 
	"NATIONNAME" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_NATION" PRIMARY KEY ("NATIONID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_nation is '中国民族列表，01代表汉族'
/
comment on column base_nation.nationid is '名族编号'
/
comment on column base_nation.nationname is '民族名称'
/


  CREATE TABLE "CCENSE"."BASE_OPERATION_PROCEDURE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PROCENAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PROCEDESC" VARCHAR2(200) NOT NULL ENABLE, 
	"MENUIDSTR" VARCHAR2(4000) NOT NULL ENABLE, 
	"REMARK" VARCHAR2(1000), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_OPERATION_PROCEDURE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_OPERATION_PROCEDURE" UNIQUE ("PROCENAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_operation_procedure is '操作流程设置'
/
comment on column base_operation_procedure.id is '自动编号'
/
comment on column base_operation_procedure.procename is '操作流程名称'
/
comment on column base_operation_procedure.procedesc is '操作流程简述'
/
comment on column base_operation_procedure.menuidstr is '操作功能串（00000000|00000001|...），以菜单项的id存放，存放的位置按照操作流程中的先后顺序存'
/
comment on column base_operation_procedure.remark is '备注'
/
comment on column base_operation_procedure.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_ORGANIZATION_INFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ORGCODE" VARCHAR2(100) NOT NULL ENABLE, 
	"ORGNAME" VARCHAR2(500) NOT NULL ENABLE, 
	"ORGBANK" VARCHAR2(100) NOT NULL ENABLE, 
	"ORGBANKNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"ORGBANKCODE" VARCHAR2(50) NOT NULL ENABLE, 
	"PROPORTION" NUMBER NOT NULL ENABLE, 
	"DATETIMER" DATE NOT NULL ENABLE, 
	"C_NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"ORG_MERCHANTCODE" VARCHAR2(20), 
	"INFLASTOPDT" VARCHAR2(8), 
	"ACOMALASTOPDT" VARCHAR2(8), 
	 CONSTRAINT "PK_BASE_ORGANIZATION_INFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_ORGANIZATION_INFO" UNIQUE ("ORGCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_organization_info is '维护机构信息表'
/
comment on column base_organization_info.id is '编号，自动增长'
/
comment on column base_organization_info.orgcode is '维护机构代码'
/
comment on column base_organization_info.orgname is '维护机构名称'
/
comment on column base_organization_info.orgbank is '维护机构开户行'
/
comment on column base_organization_info.orgbankname is '维护机构开户名'
/
comment on column base_organization_info.orgbankcode is '维护机构账号'
/
comment on column base_organization_info.proportion is '分成比例'
/
comment on column base_organization_info.datetimer is '添加时间'
/
comment on column base_organization_info.c_name is '添加人'
/
comment on column base_organization_info.org_merchantcode is '主账户'
/
comment on column base_organization_info.inflastopdt is '银联电子现金51b文件最后一次生成日期'
/
comment on column base_organization_info.acomalastopdt is '银联第三方acoma文件最后一次生成日期'
/


  CREATE TABLE "CCENSE"."BASE_PARAM" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PARAMGROUPID" NUMBER NOT NULL ENABLE, 
	"PARAMNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(1024), 
	"VER" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISUSE" NUMBER DEFAULT 1, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"UPDATEVERTIME" DATE DEFAULT SYSDATE, 
	"FLAG" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_BASE_PARAM" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_PARAM" UNIQUE ("PARAMGROUPID", "PARAMNAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param is '系统参数表'
/
comment on column base_param.id is 'id'
/
comment on column base_param.paramgroupid is '参数组编号（根据设计，此编号对应卡类型大类）'
/
comment on column base_param.paramname is '参数名'
/
comment on column base_param.paramvalue is '参数值'
/
comment on column base_param.ver is '记录版本'
/
comment on column base_param.isuse is '是否启用 0 不启用 1 启用'
/
comment on column base_param.customerunitcode is '客户代码'
/
comment on column base_param.updatevertime is ''
/
comment on column base_param.flag is '标记：0 代表paramgroupid关联的是卡类型信息表，1 代表paramgroupid关联的是参数大类信息表'
/


  CREATE TABLE "CCENSE"."BASE_PARAM_GROUP" 
   (	"PARAMGROUPID" NUMBER NOT NULL ENABLE, 
	"PARAMGROUPNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100) DEFAULT '没发现此参数组的描述' NOT NULL ENABLE, 
	"MODELID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_PARAM_GROUP" PRIMARY KEY ("PARAMGROUPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_PARAM_GROUP" UNIQUE ("PARAMGROUPNAME", "MODELID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param_group is '参数组'
/
comment on column base_param_group.paramgroupid is '参数组编号'
/
comment on column base_param_group.paramgroupname is '参数组名称'
/
comment on column base_param_group.description is '参数组描述'
/
comment on column base_param_group.modelid is '参数组模版id'
/
comment on column base_param_group.ver is '版本号'
/


  CREATE TABLE "CCENSE"."BASE_PARAM_GROUP_MODEL" 
   (	"MODELID" NUMBER NOT NULL ENABLE, 
	"MODELNAME" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100) DEFAULT '' NOT NULL ENABLE, 
	"TYPEID" NUMBER NOT NULL ENABLE, 
	"ISENABLECREATE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_PARAM_GROUP_MODEL" PRIMARY KEY ("MODELID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_PARAM_GROUP_MODEL" UNIQUE ("MODELNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "FK_PARAM_GROUP_MODEL_TYPE" FOREIGN KEY ("TYPEID")
	  REFERENCES "CCENSE"."BASE_PARAM_GROUP_MODEL_TYPE" ("PARAMTYPEID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param_group_model is '参数组模版'
/
comment on column base_param_group_model.modelid is '模版参数组编号'
/
comment on column base_param_group_model.modelname is '模版参数组名称'
/
comment on column base_param_group_model.description is '描述'
/
comment on column base_param_group_model.typeid is '模版参数组类别'
/
comment on column base_param_group_model.isenablecreate is '是否允许继承'
/
comment on column base_param_group_model.ver is '模版记录版本'
/


  CREATE TABLE "CCENSE"."BASE_PARAM_GROUP_MODEL_TYPE" 
   (	"PARAMTYPEID" NUMBER NOT NULL ENABLE, 
	"PARAMTYPENAME" VARCHAR2(30) NOT NULL ENABLE, 
	"PARAMTYPEDESC" VARCHAR2(100) DEFAULT '无此参数类型描述' NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_PARAM_TYPE" PRIMARY KEY ("PARAMTYPEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_PARAM_GROUP_MODEL_TYPE" UNIQUE ("PARAMTYPENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param_group_model_type is '参数组模版类型'
/
comment on column base_param_group_model_type.paramtypeid is '参数类型编号：对应1..n个参数组模版'
/
comment on column base_param_group_model_type.paramtypename is '参数类型名称'
/
comment on column base_param_group_model_type.paramtypedesc is '参数类型描述'
/
comment on column base_param_group_model_type.sortid is '显示顺序'
/


  CREATE TABLE "CCENSE"."BASE_PARAM_LIB" 
   (	"PARAMID" NUMBER NOT NULL ENABLE, 
	"PARAMNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(128) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(300), 
	"ISENABLECHANGE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"DISPLAYNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALUETYPE" VARCHAR2(100) NOT NULL ENABLE, 
	"PARAMTYPEID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISVISIBLE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"PARATYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_SYS_PARAM_LIB" PRIMARY KEY ("PARAMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "AK_PARAMNAME_BASE_SYS" UNIQUE ("PARAMNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param_lib is '参数字典'
/
comment on column base_param_lib.paramid is '参数编号'
/
comment on column base_param_lib.paramname is '参数名：英文代码'
/
comment on column base_param_lib.paramvalue is '参数值'
/
comment on column base_param_lib.description is '职务名称'
/
comment on column base_param_lib.isenablechange is '允许更改标志'
/
comment on column base_param_lib.displayname is '显示名称'
/
comment on column base_param_lib.sortid is '显示顺序'
/
comment on column base_param_lib.valuetype is '参数值类型:填表达式'
/
comment on column base_param_lib.paramtypeid is '参数类型编号'
/
comment on column base_param_lib.isvisible is '是否显示：1-可见，0-不可见'
/
comment on column base_param_lib.paratype is '参数类型：0 卡务参数 1 pos参数 3 参数卡参数'
/


  CREATE TABLE "CCENSE"."BASE_PARAM_MODEL" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MODELID" NUMBER NOT NULL ENABLE, 
	"PARAMNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(1024) NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_PARAM_MODEL" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "AK_PARAM_MODEL" UNIQUE ("MODELID", "PARAMNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "FK_PARAM_MODEL_MODEL" FOREIGN KEY ("MODELID")
	  REFERENCES "CCENSE"."BASE_PARAM_GROUP_MODEL" ("MODELID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_param_model is '参数模版'
/
comment on column base_param_model.id is '标识'
/
comment on column base_param_model.modelid is '模版编号'
/
comment on column base_param_model.paramname is '参数名称'
/
comment on column base_param_model.paramvalue is '值'
/
comment on column base_param_model.ver is '记录版本'
/


  CREATE TABLE "CCENSE"."BASE_POSITIONS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSTID" NUMBER NOT NULL ENABLE, 
	"POSTNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	 CONSTRAINT "PK_BASE_POSTIONS" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_POSITIONS" UNIQUE ("POSTID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_positions is '岗位信息'
/
comment on column base_positions.id is '主键'
/
comment on column base_positions.postid is '职务id'
/
comment on column base_positions.postname is '职务名称'
/
comment on column base_positions.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_PREMIUMCOMPANY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"COMPANYNAME" VARCHAR2(200), 
	 CONSTRAINT "PK_BASE_PREMIUMCOMPANY" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_premiumcompany is ''
/
comment on column base_premiumcompany.id is 'id流水'
/
comment on column base_premiumcompany.companyname is '公司名称'
/


  CREATE TABLE "CCENSE"."BASE_PSAMCARD_LOG" 
   (	"ID" NUMBER, 
	"POSCODE" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT sysdate, 
	"JL_CSTACCFC" VARCHAR2(20) DEFAULT '', 
	"JL_TYPE" NUMBER DEFAULT -1, 
	"PSAM_TYPE" NUMBER DEFAULT -1, 
	"PSAMCARDNUMBER" VARCHAR2(20), 
	"CREATEDATETIME" DATE DEFAULT sysdate, 
	"JL_STANDBY" VARCHAR2(500), 
	"BUSCODE" VARCHAR2(10), 
	 CONSTRAINT "BASE_PSAMCARD_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_psamcard_log is 'psam卡信息'
/
comment on column base_psamcard_log.id is 'id'
/
comment on column base_psamcard_log.poscode is '终端编号'
/
comment on column base_psamcard_log.opdt is '日期'
/
comment on column base_psamcard_log.jl_cstaccfc is '记录流水号'
/
comment on column base_psamcard_log.jl_type is '交易类型'
/
comment on column base_psamcard_log.psam_type is 'psam卡类型'
/
comment on column base_psamcard_log.psamcardnumber is 'psam卡号'
/
comment on column base_psamcard_log.createdatetime is '入库时间'
/
comment on column base_psamcard_log.jl_standby is '备用'
/
comment on column base_psamcard_log.buscode is '车辆唯一编号'
/


  CREATE TABLE "CCENSE"."BASE_RANDOMPOSCODE" 
   (	"ASN" NUMBER NOT NULL ENABLE, 
	"RANDOMPOSCODE" VARCHAR2(12), 
	"LASTTIME" DATE, 
	"POSCODE" NUMBER, 
	"EMPID" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_RANDOMPOSCODE" PRIMARY KEY ("ASN", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_randomposcode is '申请随机终端表'
/
comment on column base_randomposcode.asn is '卡号'
/
comment on column base_randomposcode.randomposcode is '随机终端号'
/
comment on column base_randomposcode.lasttime is '最后时间'
/
comment on column base_randomposcode.poscode is '申请终端'
/
comment on column base_randomposcode.empid is '申请职员id'
/
comment on column base_randomposcode.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_REC_BAD_TYPE" 
   (	"BADID" NUMBER NOT NULL ENABLE, 
	"BADDESC" VARCHAR2(50) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_rec_bad_type is '坏账类型-字典表'
/
comment on column base_rec_bad_type.badid is '坏账类型编号'
/
comment on column base_rec_bad_type.baddesc is '坏账类型描述'
/


  CREATE TABLE "CCENSE"."BASE_REMAKECARD" 
   (	"ID" NUMBER, 
	"OUTID" VARCHAR2(20), 
	"ASN" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"NAME" VARCHAR2(30), 
	"IDCARDNO" VARCHAR2(32), 
	"SELLTIME" DATE, 
	"CARDFARE" NUMBER, 
	"DEPOSIT" NUMBER, 
	"OPDT" DATE, 
	"EMPID" NUMBER, 
	"POSCODE" NUMBER, 
	"DPTCODE" VARCHAR2(30), 
	"LASTTIME" DATE, 
	"STATUS" NUMBER DEFAULT 0, 
	"DETAILID" NUMBER, 
	"OPTYPE" NUMBER DEFAULT 0, 
	"CARDKIND" NUMBER, 
	 CONSTRAINT "PK_BASE_REMAKECARD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 32505856 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_remakecard is ''
/
comment on column base_remakecard.id is '流水'
/
comment on column base_remakecard.outid is '市民卡号'
/
comment on column base_remakecard.asn is '卡号'
/
comment on column base_remakecard.customerid is '发卡流水'
/
comment on column base_remakecard.name is '姓名'
/
comment on column base_remakecard.idcardno is '身份证号'
/
comment on column base_remakecard.selltime is '售卡流水'
/
comment on column base_remakecard.cardfare is '卡成本'
/
comment on column base_remakecard.deposit is '押金'
/
comment on column base_remakecard.opdt is '操作时间'
/
comment on column base_remakecard.empid is '职员id'
/
comment on column base_remakecard.poscode is '终端编号'
/
comment on column base_remakecard.dptcode is '部门编号'
/
comment on column base_remakecard.lasttime is '最后操作时间'
/
comment on column base_remakecard.status is '卡状态，0已经补卡，7，已经退卡押金'
/
comment on column base_remakecard.detailid is '卡类型'
/
comment on column base_remakecard.optype is '操作类型0补卡，1退卡'
/
comment on column base_remakecard.cardkind is '卡种类1：m1,2:cpu'
/


  CREATE TABLE "CCENSE"."BASE_ROLE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ROLEID" NUMBER NOT NULL ENABLE, 
	"ROLENMAE" VARCHAR2(30) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"ISVISIBLE" NUMBER DEFAULT 1, 
	 CONSTRAINT "PK_BASE_ROLE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_ROLE_UNITCODE" UNIQUE ("ROLEID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_role is '角色'
/
comment on column base_role.id is '编号（主键）'
/
comment on column base_role.roleid is '角色编号'
/
comment on column base_role.rolenmae is '角色名称'
/
comment on column base_role.customerunitcode is '客户代码'
/
comment on column base_role.isvisible is '是否启用 0:不启用 1:启用'
/


  CREATE TABLE "CCENSE"."BASE_SAMCARD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMCARDNAME" VARCHAR2(12), 
	"SAMCARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDSNR" VARCHAR2(20) NOT NULL ENABLE, 
	"STATE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STARTDATE" DATE NOT NULL ENABLE, 
	"ENDDATE" DATE NOT NULL ENABLE, 
	"LOSSDATE" DATE, 
	"LOSSRECNO" NUMBER, 
	"LASTUPDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ADDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDTYPE" NUMBER NOT NULL ENABLE, 
	"PRINTCODE" VARCHAR2(20) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_SAMCARD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_SAMCARDNO" UNIQUE ("SAMCARDNO", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_SAMCARDSNR" UNIQUE ("SAMCARDSNR", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_samcard is ''
/
comment on column base_samcard.id is '主键'
/
comment on column base_samcard.samcardno is 'psam卡号:samcardname转换成的数字。'
/
comment on column base_samcard.samcardname is 'psam卡号，来源于密钥系统的原始终端编号数据，6字节的数字'
/
comment on column base_samcard.samcardsn is '密钥系统的psam卡序列号（发卡流水号），4字节的数字'
/
comment on column base_samcard.samcardsnr is 'psam卡编号：10个字节的应用代码，公司自定义规则'
/
comment on column base_samcard.state is '状态：0-初始状态，1-正在使用，10-挂失，11-损坏。12-注销'
/
comment on column base_samcard.startdate is '卡上的有效起始日期'
/
comment on column base_samcard.enddate is '卡上的有效截止日期'
/
comment on column base_samcard.lossdate is '挂失日期'
/
comment on column base_samcard.lossrecno is '挂失时记录编号'
/
comment on column base_samcard.lastupdate is '最后一次更新日期'
/
comment on column base_samcard.createdate is 'psam卡登记入库日期'
/
comment on column base_samcard.ver is '版本'
/
comment on column base_samcard.addtype is '0为导入，1为手工录入，2为采集上传'
/
comment on column base_samcard.samcardtype is '0消费终端sam卡类型，2制卡中心sam卡类型'
/
comment on column base_samcard.printcode is '出厂打印号'
/
comment on column base_samcard.customerunitcode is '客户代码'
/
comment on column base_samcard.flag is 'psam卡来源：0 默认公司psam卡连密钥前置 1 第三方psam卡'
/


  CREATE TABLE "CCENSE"."BASE_SAVEMONEY_CONFIG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"SAVEMONEYMN" NUMBER(10,2) NOT NULL ENABLE, 
	"NUMBERDUMMYMN" NUMBER(10,2) NOT NULL ENABLE, 
	"GROUPTYPE" VARCHAR2(1) DEFAULT 1 NOT NULL ENABLE, 
	"SORTNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_SAVEMONEY_CONFIG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_SAVEMONEY_CONFIG" UNIQUE ("SAVEMONEYMN", "GROUPTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_savemoney_config is '充值金额送次数配置表（放参数表实现）'
/
comment on column base_savemoney_config.id is '编号，自动增长'
/
comment on column base_savemoney_config.savemoneymn is '充值金额'
/
comment on column base_savemoney_config.numberdummymn is '虚充金额'
/
comment on column base_savemoney_config.grouptype is '组类型：1次钱包类型，2定额钱包类型'
/
comment on column base_savemoney_config.sortno is '显示序号'
/


  CREATE TABLE "CCENSE"."BASE_SEQUENCE_NO" 
   (	"CODE" VARCHAR2(100) NOT NULL ENABLE, 
	"MAX_NO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CONTENTMES" VARCHAR2(100), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_sequence_no is '索引信息表'
/
comment on column base_sequence_no.code is '代码类型'
/
comment on column base_sequence_no.max_no is '目前最大索引号'
/
comment on column base_sequence_no.contentmes is '描述'
/
comment on column base_sequence_no.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_SHIFTS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_shifts is '班次码表'
/
comment on column base_shifts.id is 'id'
/
comment on column base_shifts.name is '名称'
/


  CREATE TABLE "CCENSE"."BASE_SLOTCARD_LOG" 
   (	"ID" NUMBER, 
	"POSCODE" NUMBER DEFAULT 0, 
	"LINEID" VARCHAR2(10) DEFAULT '', 
	"OPDT" DATE DEFAULT sysdate, 
	"JL_CSTACCFC" VARCHAR2(20) DEFAULT '', 
	"PHYSICALCARDNUMBER" VARCHAR2(20) DEFAULT '', 
	"CARDKIND" NUMBER DEFAULT 0, 
	"OPFARE" NUMBER DEFAULT 0, 
	"MAINCARDTYPE" VARCHAR2(10) DEFAULT '', 
	"CARDTYPE" NUMBER DEFAULT 0, 
	"BUSID" VARCHAR2(20) DEFAULT '', 
	"CREATEDATETIME" DATE DEFAULT sysdate, 
	"JL_STANDBY" VARCHAR2(500), 
	 CONSTRAINT "BASE_SLOTCARD_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 15728640 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_slotcard_log is '刷卡信息'
/
comment on column base_slotcard_log.id is 'id'
/
comment on column base_slotcard_log.poscode is '终端编号'
/
comment on column base_slotcard_log.lineid is '线路编号'
/
comment on column base_slotcard_log.opdt is '日期'
/
comment on column base_slotcard_log.jl_cstaccfc is '记录流水号'
/
comment on column base_slotcard_log.physicalcardnumber is '物理卡号'
/
comment on column base_slotcard_log.cardkind is '卡类别 1m1卡，2cpu卡'
/
comment on column base_slotcard_log.opfare is '交易金额'
/
comment on column base_slotcard_log.maincardtype is '主卡类型'
/
comment on column base_slotcard_log.cardtype is '子卡类型'
/
comment on column base_slotcard_log.busid is '车辆编号'
/
comment on column base_slotcard_log.createdatetime is '入库时间'
/
comment on column base_slotcard_log.jl_standby is '备用'
/


  CREATE TABLE "CCENSE"."BASE_STATION" 
   (	"STATIONID" NUMBER NOT NULL ENABLE, 
	"STATIONNAME" VARCHAR2(40) NOT NULL ENABLE, 
	"STATIONTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"IPADDR" VARCHAR2(40) NOT NULL ENABLE, 
	"ENABLEMONITOR" NUMBER DEFAULT 1, 
	"MONITORPWD" VARCHAR2(32) DEFAULT '1234', 
	"VER" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_STATION" PRIMARY KEY ("STATIONID", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_STATION_IP" UNIQUE ("IPADDR", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UN_BASE_STATION_NAME" UNIQUE ("STATIONNAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "FK_STATION_TYPEID" FOREIGN KEY ("STATIONTYPE")
	  REFERENCES "CCENSE"."BASE_STATION_TYPE" ("TYPEID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_station is '工作站信息'
/
comment on column base_station.stationid is '工作站编号'
/
comment on column base_station.stationname is '工作站名称'
/
comment on column base_station.stationtype is '工作站类型(0：不限制  其他值，暂不定义)'
/
comment on column base_station.ipaddr is '工作站ip地址'
/
comment on column base_station.enablemonitor is '是否允许监控（0不允许 1允许）'
/
comment on column base_station.monitorpwd is '监控密码'
/
comment on column base_station.ver is '版本'
/
comment on column base_station.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_STATION_TYPE" 
   (	"TYPEID" NUMBER NOT NULL ENABLE, 
	"TYPENAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100), 
	"ENABLEMONITOR" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"APPTYPE" VARCHAR2(40), 
	 CONSTRAINT "PK_BASE_STATION_TYPE" PRIMARY KEY ("TYPEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_station_type is '工作站类型'
/
comment on column base_station_type.typeid is '工作站类型编号'
/
comment on column base_station_type.typename is '工作站类型名称'
/
comment on column base_station_type.description is '描述'
/
comment on column base_station_type.enablemonitor is '是否允许监控'
/
comment on column base_station_type.ver is '版本'
/
comment on column base_station_type.apptype is '应用类型id'
/


  CREATE TABLE "CCENSE"."BASE_SUBSYSTEM" 
   (	"SUBSYSID" NUMBER NOT NULL ENABLE, 
	"SUBSYSSCPT" VARCHAR2(20), 
	"TERMTYPE" NUMBER, 
	"AUTHENTICATION_CODE" VARCHAR2(64), 
	"VER" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_BASE_SUBSYSTEM" PRIMARY KEY ("SUBSYSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_subsystem is '子系统目录信息'
/
comment on column base_subsystem.subsysid is '子系统id'
/
comment on column base_subsystem.subsysscpt is '子系统描述'
/
comment on column base_subsystem.termtype is '终端类型'
/
comment on column base_subsystem.authentication_code is '授权码'
/
comment on column base_subsystem.ver is '版本号'
/


  CREATE TABLE "CCENSE"."BASE_SYSPARA" 
   (	"DPID" NUMBER NOT NULL ENABLE, 
	"DPNAME" VARCHAR2(40) NOT NULL ENABLE, 
	"DPPWD" VARCHAR2(32) NOT NULL ENABLE, 
	"SYSSTARTDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"ISUIA" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REGCODE" VARCHAR2(6) DEFAULT '123456' NOT NULL ENABLE, 
	"ISBALANCE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TEMPREGISTEREDCODE" VARCHAR2(256) DEFAULT '', 
	"ISAUTHTERM" NUMBER, 
	"INDUSTRYCODE" VARCHAR2(10) NOT NULL ENABLE, 
	"FREEZEFARELIMIT" NUMBER DEFAULT 4 NOT NULL ENABLE, 
	"BALANCEDATE" DATE, 
	 CONSTRAINT "PK_BASE_SYSPARA" PRIMARY KEY ("DPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_syspara is '系统基本参数'
/
comment on column base_syspara.dpid is '系统编号'
/
comment on column base_syspara.dpname is '系统名称'
/
comment on column base_syspara.dppwd is '系统密码'
/
comment on column base_syspara.sysstartdt is '系统开通日期'
/
comment on column base_syspara.isuia is '是否采用统一身份认证（0：否；1：是）'
/
comment on column base_syspara.regcode is '系统注册码'
/
comment on column base_syspara.isbalance is '是否正在结帐（0：否；1：是 2：准备结账 非0状态不允许交易记录上传）'
/
comment on column base_syspara.tempregisteredcode is '应急注册码（当ukey损坏后，使用应急注册提供的注册码）'
/
comment on column base_syspara.isauthterm is '是否启用终端认'
/
comment on column base_syspara.industrycode is '行业代码'
/
comment on column base_syspara.freezefarelimit is '领取冻结金额时间限制,单位为天'
/
comment on column base_syspara.balancedate is '日结成功日期'
/


  CREATE TABLE "CCENSE"."BASE_TAKEBACK" 
   (	"ASN" NUMBER, 
	"OUTID" NUMBER, 
	"OPTYPE" NUMBER, 
	"POSCODE" VARCHAR2(32), 
	"EMPID" NUMBER, 
	"OPDT" DATE, 
	"CARDKIND" NUMBER, 
	"DETAILID" NUMBER, 
	"DPTNAME" VARCHAR2(100), 
	"DPTCODE" VARCHAR2(20), 
	 CONSTRAINT "PK_BASE_TAKEBACK" PRIMARY KEY ("ASN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_takeback is ''
/
comment on column base_takeback.asn is '秘钥分散因子'
/
comment on column base_takeback.outid is '市民卡号'
/
comment on column base_takeback.optype is '操作类型1：交卡，2：领卡'
/
comment on column base_takeback.poscode is '终端编号'
/
comment on column base_takeback.empid is '职员id'
/
comment on column base_takeback.opdt is '操作时间'
/
comment on column base_takeback.cardkind is '卡种类1：m1卡，2：cpu卡'
/
comment on column base_takeback.detailid is '卡类型'
/
comment on column base_takeback.dptname is '部门名称'
/
comment on column base_takeback.dptcode is '部门'
/


  CREATE TABLE "CCENSE"."BASE_TERM" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TERMNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9), 
	"ISUSE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"TYPEID" NUMBER NOT NULL ENABLE, 
	"LASTCOLLECTDATE" DATE DEFAULT SYSDATE, 
	"PSAMCARDNO" NUMBER, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SWITCHKEY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PRIMARYKEY" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISSWITCH" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISSECURITYTRANSPORT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ISFLAG" NUMBER DEFAULT 0, 
	"PSAMCARDSTR" VARCHAR2(500), 
	"MAINTAINDATE" DATE, 
	"MAINTAINEMPCODE" VARCHAR2(32), 
	"BUSCODE" VARCHAR2(20), 
	"APPID" VARCHAR2(10), 
	 CONSTRAINT "PK_BASE_TERM" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_TERM_POSCODE" UNIQUE ("POSCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "FK_TERM_TYPE" FOREIGN KEY ("TYPEID")
	  REFERENCES "CCENSE"."BASE_TERM_TYPE" ("TYPEID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term is '终端目录'
/
comment on column base_term.id is '编号（主键）'
/
comment on column base_term.termname is '终端名称'
/
comment on column base_term.dptcode is '业务部门编号：分公司'
/
comment on column base_term.isuse is '是否使用：0-禁用，1-启用，2-维修停用，3-损坏，4...：改成非启用状态后，不可以再启用'
/
comment on column base_term.poscode is '设备运营唯一编号：初始值和生产编号相同,最大6个字节，唯一确定termid。采集上传，上层允许输入。'
/
comment on column base_term.typeid is '终端类型编号'
/
comment on column base_term.lastcollectdate is '最后一次采集数据时间：采集上传'
/
comment on column base_term.psamcardno is 'psam卡号（即psam上的终端编号，6个字节）。对于没有psam卡的设备，填入运营唯一编号：采集上传'
/
comment on column base_term.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_term.sortid is '显示顺序'
/
comment on column base_term.ver is '记录版本'
/
comment on column base_term.switchkey is '开通密钥'
/
comment on column base_term.primarykey is '主密钥'
/
comment on column base_term.isswitch is '终端是否接入 0：等待接入 1：已接入'
/
comment on column base_term.issecuritytransport is '是否加密数据传输 0：否  1：是'
/
comment on column base_term.customerunitcode is '客户代码'
/
comment on column base_term.isflag is '一个终端是否支持多张psam卡 0：不支持 1：支持'
/
comment on column base_term.psamcardstr is '支持多张psam卡时，psam卡号存此字段，以,形式格式，isflag值为1 ，单张psam时此字段为空，使用原来的字段存放'
/
comment on column base_term.maintaindate is '维修登记时间，只有操作维修登记时改字段才赋值，系统当前时间'
/
comment on column base_term.maintainempcode is '维修登记人员，记录登录的用户名（登录名）'
/
comment on column base_term.buscode is '车辆唯一编号'
/
comment on column base_term.appid is '采集工作站应用id'
/


  CREATE TABLE "CCENSE"."BASE_TERM_DELETE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TERMNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ISUSE" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"ISAUTH" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"PARAMGROUPID" NUMBER, 
	"TYPEID" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER, 
	"LASTCOLLECTDATE" DATE DEFAULT SYSDATE, 
	"PSAMCARDNO" NUMBER, 
	"CPUTYPE" NUMBER DEFAULT 0, 
	"LASTUPDATEDATE" DATE DEFAULT SYSDATE, 
	"ISDELETE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DELETEDATE" DATE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEFAULTACCCODE" NUMBER, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SWITCHKEY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PRIMARYKEY" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"ISSWITCH" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISSECURITYTRANSPORT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MERCHANTCODE" VARCHAR2(20) DEFAULT 888059540000002, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ISFLAG" NUMBER DEFAULT 0, 
	"PSAMCARDSTR" VARCHAR2(500), 
	"UNIONTERMID" VARCHAR2(8) DEFAULT 0 NOT NULL ENABLE, 
	"DELETEEMPCODE" VARCHAR2(32) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_delete is '终端目录删除历史表'
/
comment on column base_term_delete.id is '编号（主键）'
/
comment on column base_term_delete.termname is '终端名称'
/
comment on column base_term_delete.dptcode is '业务部门编号：分公司'
/
comment on column base_term_delete.isuse is '是否使用：0-禁用，1-启用，2-维修停用，3-损坏，4...：改成非启用状态后，不可以再启用'
/
comment on column base_term_delete.poscode is '设备运营唯一编号：初始值和生产编号相同,最大6个字节，唯一确定termid。采集上传，上层允许输入。'
/
comment on column base_term_delete.isauth is '是否启用终端授权。南阳项目必须启用=1'
/
comment on column base_term_delete.paramgroupid is '参数组编号'
/
comment on column base_term_delete.typeid is '终端类型编号'
/
comment on column base_term_delete.status is '工作状态：采集填充的终端状态，备用'
/
comment on column base_term_delete.lastcollectdate is '最后一次采集数据时间：采集上传'
/
comment on column base_term_delete.psamcardno is 'psam卡号（即psam上的终端编号，6个字节）。对于没有psam卡的设备，填入运营唯一编号：采集上传'
/
comment on column base_term_delete.cputype is '处理器类型：默认值=0未知设备类型  1-c51设备  2-ram设备,...：采集上传更新，预留字段，上层不允许修改'
/
comment on column base_term_delete.lastupdatedate is '最后一次修改时间：更新此字段时，只有时间大于上次时间，才允许更新'
/
comment on column base_term_delete.isdelete is '是否删除（0未删除，1已删除）'
/
comment on column base_term_delete.deletedate is '删除日期'
/
comment on column base_term_delete.sortid is '显示顺序'
/
comment on column base_term_delete.defaultacccode is '默认的科目，如果交易记录的记录类型分析不出来科目，那么就以这个科目为准'
/
comment on column base_term_delete.ver is '记录版本'
/
comment on column base_term_delete.switchkey is '开通密钥'
/
comment on column base_term_delete.primarykey is '主密钥'
/
comment on column base_term_delete.isswitch is '终端是否接入 0：等待接入 1：已接入'
/
comment on column base_term_delete.issecuritytransport is '是否加密数据传输 0：否  1：是'
/
comment on column base_term_delete.merchantcode is '联动优势提供的商户号信息'
/
comment on column base_term_delete.customerunitcode is '客户代码'
/
comment on column base_term_delete.isflag is '一个终端是否支持多张psam卡 0：不支持 1：支持'
/
comment on column base_term_delete.psamcardstr is '支持多张psam卡时，psam卡号存此字段，以,形式格式，isflag值为1 ，单张psam时此字段为空，使用原来的字段存放'
/
comment on column base_term_delete.uniontermid is '银联终端编号'
/
comment on column base_term_delete.deleteempcode is '删除人'
/


  CREATE TABLE "CCENSE"."BASE_TERM_PUBLICKEY_PARAM" 
   (	"GROUPID" VARCHAR2(20) NOT NULL ENABLE, 
	"PARAMTAG" VARCHAR2(20) NOT NULL ENABLE, 
	"PARAMLENGTH" NUMBER NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(1000) NOT NULL ENABLE, 
	"VER" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	 CONSTRAINT "UK_TERM_PUBLICKEY_PARAM" UNIQUE ("GROUPID", "PARAMTAG", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_publickey_param is '银联认证中心公钥参数'
/
comment on column base_term_publickey_param.groupid is '组名'
/
comment on column base_term_publickey_param.paramtag is '参数tag'
/
comment on column base_term_publickey_param.paramlength is '参数长度'
/
comment on column base_term_publickey_param.paramvalue is '参数值'
/
comment on column base_term_publickey_param.ver is '参数版本'
/
comment on column base_term_publickey_param.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_TERM_STATUS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"LINEID" NUMBER NOT NULL ENABLE, 
	"PORTPTY" VARCHAR2(2) NOT NULL ENABLE, 
	"HARDWAREVER" VARCHAR2(100) NOT NULL ENABLE, 
	"SOFTWAREVER" VARCHAR2(100) NOT NULL ENABLE, 
	"NCOLLECTRECORDNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BLLTVER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BLLTNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"GPSSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"GPSLONGITUDE" VARCHAR2(12), 
	"GPSLATITUDE" VARCHAR2(12), 
	"GPSVER" NUMBER DEFAULT 0, 
	"STOPPRICEVER" NUMBER DEFAULT 0, 
	"PARAMCARDVER" NUMBER DEFAULT 0, 
	"LINECARDVER" NUMBER DEFAULT 0, 
	"CITYTRADEVER" NUMBER DEFAULT 0, 
	"TERMTIME" DATE DEFAULT sysdate, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OPDT" DATE, 
	"COLLECTDT" DATE, 
	"UNIONCARDPARAMVER" NUMBER, 
	"PUBLICPARAMVER" NUMBER, 
	"VOICEACTIONVER" NUMBER, 
	"BANKPOSCODE" VARCHAR2(20), 
	"MERCHANTCODE" VARCHAR2(20), 
	"KEYNOUSEDATE" DATE, 
	"BUSCODE" VARCHAR2(20), 
	"APPID" VARCHAR2(10), 
	"KERNELVER" VARCHAR2(20), 
	"UPDATEFLAG" VARCHAR2(20), 
	"TERMSN" VARCHAR2(20), 
	"EXTENDSTR" VARCHAR2(50), 
	"PSAMSTATUS" VARCHAR2(8), 
	"TYPEID" NUMBER, 
	"XMLCVER" VARCHAR2(30), 
	 CONSTRAINT "PK_BASE_TERM_STATUS" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_TERM_STATUS" UNIQUE ("POSCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 983040 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_status is '终端各状态和版本信息'
/
comment on column base_term_status.id is '编号（自动增长）'
/
comment on column base_term_status.poscode is '终端唯一编号'
/
comment on column base_term_status.lineid is '线路编号'
/
comment on column base_term_status.portpty is '通讯方式："g"=gprs,"c"=cdma,"z"=zigbee,"t"=tcp,"m"=modem,"a"=can,"r"=485,"w"=wifi'
/
comment on column base_term_status.hardwarever is '终端硬件版本号'
/
comment on column base_term_status.softwarever is '应用软件版本号'
/
comment on column base_term_status.ncollectrecordnum is '未采集记录个数'
/
comment on column base_term_status.blltver is '增量黑名单版本号'
/
comment on column base_term_status.blltnum is '终端内实际的黑名单个数'
/
comment on column base_term_status.gpsstatus is '0：终端不支持gps，其他值：支持gps'
/
comment on column base_term_status.gpslongitude is '当前gps经度（第一位是  0东经、1西经）'
/
comment on column base_term_status.gpslatitude is '当前gps纬度（第一位是 0南纬、1北纬）'
/
comment on column base_term_status.gpsver is 'gps版本号'
/
comment on column base_term_status.stoppricever is '站点间票价版本号'
/
comment on column base_term_status.paramcardver is '参数卡版本号'
/
comment on column base_term_status.linecardver is '线路票价卡版本号'
/
comment on column base_term_status.citytradever is '互联互通版本号'
/
comment on column base_term_status.termtime is '终端时间'
/
comment on column base_term_status.customerunitcode is '客户代码'
/
comment on column base_term_status.opdt is '接入时间'
/
comment on column base_term_status.collectdt is '最后一次联机时间'
/
comment on column base_term_status.unioncardparamver is '银联ic 卡其他参数版本'
/
comment on column base_term_status.publicparamver is '银联认证中心密钥版本'
/
comment on column base_term_status.voiceactionver is '语音包版本号'
/
comment on column base_term_status.bankposcode is '终端编号'
/
comment on column base_term_status.merchantcode is '商户编号'
/
comment on column base_term_status.keynousedate is '银联密钥失效时间 格式：yyyy-mm-dd'
/
comment on column base_term_status.buscode is '车辆唯一编号'
/
comment on column base_term_status.appid is '采集工作站应用id'
/
comment on column base_term_status.kernelver is '内核版本'
/
comment on column base_term_status.updateflag is '更新标记'
/
comment on column base_term_status.termsn is '设备序列更号'
/
comment on column base_term_status.extendstr is '扩展字段'
/
comment on column base_term_status.psamstatus is 'psam状态'
/
comment on column base_term_status.typeid is '终端类型（关联base_term_type表里的数据：2：车载机；4：查询机）'
/
comment on column base_term_status.xmlcver is '小码联城程序版本号'
/


  CREATE TABLE "CCENSE"."BASE_TERM_TYPE" 
   (	"TYPEID" NUMBER NOT NULL ENABLE, 
	"TYPENAME" VARCHAR2(60) NOT NULL ENABLE, 
	"TYPECLASS" NUMBER NOT NULL ENABLE, 
	"SORTID" NUMBER, 
	 CONSTRAINT "PK_BASE_TERM_TYPE" PRIMARY KEY ("TYPEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_type is '终端类型表'
/
comment on column base_term_type.typeid is '终端类型编号'
/
comment on column base_term_type.typename is '终端类型名称'
/
comment on column base_term_type.typeclass is '终端分类(1=交易设备，2=认证设备，3=跟踪设备)'
/
comment on column base_term_type.sortid is '排序号'
/


  CREATE TABLE "CCENSE"."BASE_TERM_UNIONCARD_PARAM" 
   (	"GROUPID" VARCHAR2(20) NOT NULL ENABLE, 
	"PARAMTAG" VARCHAR2(20) NOT NULL ENABLE, 
	"PARAMLENGTH" NUMBER NOT NULL ENABLE, 
	"PARAMVALUE" VARCHAR2(1000) NOT NULL ENABLE, 
	"VER" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	 CONSTRAINT "UK_TERM_UNIONCARD_PARAM" UNIQUE ("GROUPID", "PARAMTAG", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_unioncard_param is '银联ic卡其他参数'
/
comment on column base_term_unioncard_param.groupid is '组名'
/
comment on column base_term_unioncard_param.paramtag is '参数tag'
/
comment on column base_term_unioncard_param.paramlength is '参数长度'
/
comment on column base_term_unioncard_param.paramvalue is '参数值'
/
comment on column base_term_unioncard_param.ver is '参数版本'
/
comment on column base_term_unioncard_param.customerunitcode is ''
/


  CREATE TABLE "CCENSE"."BASE_TERM_UPGRADE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" VARCHAR2(20) NOT NULL ENABLE, 
	"FILEID" NUMBER NOT NULL ENABLE, 
	"UPGRADEENDTIME" DATE, 
	"STATUS" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"VER" NUMBER, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"ISERASUREFLASH" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"APPLICATIONVER" VARCHAR2(50), 
	"SYSTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_TERM_UPGRADE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_TERM_UPGRADE" UNIQUE ("POSCODE", "FILEID", "SYSTYPE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_upgrade is '升级终端与升级文件绑定关系表'
/
comment on column base_term_upgrade.id is '自动增长'
/
comment on column base_term_upgrade.poscode is '设备运营唯一编号/应用程序编号（根据systype决定）'
/
comment on column base_term_upgrade.fileid is '升级文件id'
/
comment on column base_term_upgrade.upgradeendtime is '终端升级结束时间'
/
comment on column base_term_upgrade.status is '终端升级控制（0：重定向  1：允许升级 2：最新,无需升级 3：禁止升级  4：取消升级 >4其他）'
/
comment on column base_term_upgrade.ver is '版本号（终端升级使用）'
/
comment on column base_term_upgrade.opdt is '操作时间'
/
comment on column base_term_upgrade.iserasureflash is '升级时指定否擦除flash 0：不擦除 1：擦除'
/
comment on column base_term_upgrade.applicationver is '应用程序版本号（终端升级用）'
/
comment on column base_term_upgrade.systype is '系统类型，0：终端，1：卡务 2：语音包 3：语言包 4：查询机 5：手持机'
/
comment on column base_term_upgrade.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_TERM_UPGRADE_BAK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(100) NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"FILEURL" VARCHAR2(300) NOT NULL ENABLE, 
	"FILEVER" VARCHAR2(50) NOT NULL ENABLE, 
	"SYSTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_upgrade_bak is '终端升级文件导入表'
/
comment on column base_term_upgrade_bak.id is '自动增长'
/
comment on column base_term_upgrade_bak.filename is '升级文件名'
/
comment on column base_term_upgrade_bak.opdt is '上传时间'
/
comment on column base_term_upgrade_bak.fileurl is '升级文件存放路径'
/
comment on column base_term_upgrade_bak.filever is '升级文件版本号'
/
comment on column base_term_upgrade_bak.systype is '系统类型 0：终端 1：卡务 2：语音包 3：语言包'
/
comment on column base_term_upgrade_bak.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_TERM_UPGRADE_IMPORT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(100) NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"FILEURL" VARCHAR2(300) NOT NULL ENABLE, 
	"FILEVER" VARCHAR2(50) NOT NULL ENABLE, 
	"SYSTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_TERM_IMPORT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_upgrade_import is '终端升级文件导入表'
/
comment on column base_term_upgrade_import.id is '自动增长'
/
comment on column base_term_upgrade_import.filename is '升级文件名'
/
comment on column base_term_upgrade_import.opdt is '上传时间'
/
comment on column base_term_upgrade_import.fileurl is '升级文件存放路径'
/
comment on column base_term_upgrade_import.filever is '升级文件版本号'
/
comment on column base_term_upgrade_import.systype is '系统类型，0：终端，1：卡务 2：语音包 3：语言包'
/
comment on column base_term_upgrade_import.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_TERM_UPGRADE_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" VARCHAR2(20) NOT NULL ENABLE, 
	"FILEID" NUMBER NOT NULL ENABLE, 
	"UPGRADEENDTIME" DATE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER, 
	"CREATEDATE" DATE DEFAULT SYSDATE, 
	"ISERASUREFLASH" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FILEVER" VARCHAR2(50) NOT NULL ENABLE, 
	"SYSTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PROGRESS" VARCHAR2(10) DEFAULT 0, 
	"APPVER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_TERM_UPGRADELOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term_upgrade_log is '终端升级日志表'
/
comment on column base_term_upgrade_log.id is '自动增长'
/
comment on column base_term_upgrade_log.poscode is '设备运营唯一编号：初始值和生产编号相同,最大6个字节，唯一确定termid。采集上传，上层允许输入。(卡务对应appid)'
/
comment on column base_term_upgrade_log.fileid is '升级文件id'
/
comment on column base_term_upgrade_log.upgradeendtime is '终端升级结束时间'
/
comment on column base_term_upgrade_log.status is '终端升级状态（0：开始升级 1：正在升级 2：升级完成 3：升级失败  >3：其它）'
/
comment on column base_term_upgrade_log.ver is '版本号'
/
comment on column base_term_upgrade_log.createdate is '操作时间'
/
comment on column base_term_upgrade_log.iserasureflash is '升级时指定否擦除flash 0：不擦除 1：擦除（只针对终端升级用，卡务升级无关）'
/
comment on column base_term_upgrade_log.filever is '升级文件版本号'
/
comment on column base_term_upgrade_log.systype is '系统类型，0：终端，1：卡务  2：语音包 3：语言包'
/
comment on column base_term_upgrade_log.progress is '升级进度（下载文件进度）'
/
comment on column base_term_upgrade_log.appver is '卡务应用程序版本号（卡务使用）'
/
comment on column base_term_upgrade_log.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_TERM10" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TERMNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9), 
	"ISUSE" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"TYPEID" NUMBER NOT NULL ENABLE, 
	"LASTCOLLECTDATE" DATE, 
	"PSAMCARDNO" NUMBER, 
	"LASTUPDATEDATE" DATE, 
	"SORTID" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER NOT NULL ENABLE, 
	"SWITCHKEY" NUMBER NOT NULL ENABLE, 
	"PRIMARYKEY" NUMBER NOT NULL ENABLE, 
	"ISSWITCH" NUMBER NOT NULL ENABLE, 
	"ISSECURITYTRANSPORT" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ISFLAG" NUMBER, 
	"PSAMCARDSTR" VARCHAR2(500), 
	"MAINTAINDATE" DATE, 
	"MAINTAINEMPCODE" VARCHAR2(32), 
	"BUSCODE" VARCHAR2(20), 
	"APPID" VARCHAR2(10)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_term10 is ''
/
comment on column base_term10.id is ''
/
comment on column base_term10.termname is ''
/
comment on column base_term10.dptcode is ''
/
comment on column base_term10.isuse is ''
/
comment on column base_term10.poscode is ''
/
comment on column base_term10.typeid is ''
/
comment on column base_term10.lastcollectdate is ''
/
comment on column base_term10.psamcardno is ''
/
comment on column base_term10.lastupdatedate is ''
/
comment on column base_term10.sortid is ''
/
comment on column base_term10.ver is ''
/
comment on column base_term10.switchkey is ''
/
comment on column base_term10.primarykey is ''
/
comment on column base_term10.isswitch is ''
/
comment on column base_term10.issecuritytransport is ''
/
comment on column base_term10.customerunitcode is ''
/
comment on column base_term10.isflag is ''
/
comment on column base_term10.psamcardstr is ''
/
comment on column base_term10.maintaindate is ''
/
comment on column base_term10.maintainempcode is ''
/
comment on column base_term10.buscode is ''
/
comment on column base_term10.appid is ''
/


  CREATE TABLE "CCENSE"."BASE_TERMUSE_LOG" 
   (	"ID" NUMBER, 
	"POSCODE" NUMBER DEFAULT 0, 
	"LINEID" VARCHAR2(9) DEFAULT '', 
	"OPDT" DATE DEFAULT sysdate, 
	"JL_CSTACCFC" VARCHAR2(20) DEFAULT '', 
	"LINEDPTCODE" VARCHAR2(10) DEFAULT '', 
	"BUSCODE" VARCHAR2(20), 
	"DRIVERID" VARCHAR2(20), 
	"CREATEDATETIME" DATE DEFAULT sysdate, 
	"JL_STANDBY" VARCHAR2(500), 
	 CONSTRAINT "BASE_TERMINALSHUTDOWN_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 29360128 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_termuse_log is '终端日志记录'
/
comment on column base_termuse_log.id is 'id'
/
comment on column base_termuse_log.poscode is '终端编号'
/
comment on column base_termuse_log.lineid is '线路编号'
/
comment on column base_termuse_log.opdt is '开关机时间（取终端时钟时间）'
/
comment on column base_termuse_log.jl_cstaccfc is '记录流水号'
/
comment on column base_termuse_log.linedptcode is '分公司标识'
/
comment on column base_termuse_log.buscode is '车辆编号'
/
comment on column base_termuse_log.driverid is '司机编号'
/
comment on column base_termuse_log.createdatetime is '入库时间'
/
comment on column base_termuse_log.jl_standby is '备用'
/


  CREATE TABLE "CCENSE"."BASE_TICKET_PRICE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CHARGETYPEID" NUMBER NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(200) NOT NULL ENABLE, 
	"PRICE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VALUETYPE" VARCHAR2(100) NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BASE_TICKET_PRICE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_ticket_price is '票价信息表'
/
comment on column base_ticket_price.id is '编号'
/
comment on column base_ticket_price.chargetypeid is '计费方式'
/
comment on column base_ticket_price.description is '票价描述'
/
comment on column base_ticket_price.price is '票价（元）'
/
comment on column base_ticket_price.valuetype is '票价规则'
/
comment on column base_ticket_price.ver is '版本号'
/
comment on column base_ticket_price.opdt is '最后一次操作时间'
/
comment on column base_ticket_price.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."BASE_UNIONPAY_PARAM" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"MERCHANTCODE" VARCHAR2(15) NOT NULL ENABLE, 
	"UNIONTERMID" VARCHAR2(8) NOT NULL ENABLE, 
	"WEBSERVICEURL" VARCHAR2(300) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(20) NOT NULL ENABLE, 
	"UNIONKEY" VARCHAR2(32) NOT NULL ENABLE, 
	"MACFLAG" NUMBER DEFAULT 4, 
	"OPDT" DATE DEFAULT sysdate, 
	"STATUS" NUMBER DEFAULT 1, 
	"REMOTEHOST" VARCHAR2(20), 
	"REMOTEPORT" NUMBER, 
	"REMOTEFTPUPPATH" VARCHAR2(200), 
	"REMOTEFTPDOWNPATH" VARCHAR2(200), 
	"REMOTEUSER" VARCHAR2(20), 
	"REMOTEPASS" VARCHAR2(20), 
	 CONSTRAINT "PK_BASE_UNIONPAY_PARAM" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_UNIONPAY_PARAM" UNIQUE ("CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_unionpay_param is '银联对账服务参数(不同的客户法人参数不一样)'
/
comment on column base_unionpay_param.cstaccfc is '流水号'
/
comment on column base_unionpay_param.customerunitcode is '客户法人'
/
comment on column base_unionpay_param.merchantcode is '银联商户号'
/
comment on column base_unionpay_param.uniontermid is '银联终端编号'
/
comment on column base_unionpay_param.webserviceurl is '对账web服务地址'
/
comment on column base_unionpay_param.username is '对账用户名'
/
comment on column base_unionpay_param.password is '对账密码'
/
comment on column base_unionpay_param.unionkey is '银联通讯密钥'
/
comment on column base_unionpay_param.macflag is 'mac校验和加密标志 默认为4，银联提供，切勿修改'
/
comment on column base_unionpay_param.opdt is '最后修改时间,第一次的话，则是添加时间'
/
comment on column base_unionpay_param.status is '是否启用 1:启用 0：不启用'
/
comment on column base_unionpay_param.remotehost is '银联手续费下载ftp地址'
/
comment on column base_unionpay_param.remoteport is '手续费ftp端口'
/
comment on column base_unionpay_param.remoteftpuppath is '手续费上传目录(未用)'
/
comment on column base_unionpay_param.remoteftpdownpath is '手续费下载目录(银联收单代码)'
/
comment on column base_unionpay_param.remoteuser is '手续费ftp用户名'
/
comment on column base_unionpay_param.remotepass is '手续费ftp密码'
/


  CREATE TABLE "CCENSE"."BASE_WRITEOFF" 
   (	"ID" VARCHAR2(8) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER NOT NULL ENABLE, 
	"QUERYPWD" VARCHAR2(32), 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"COUNTRYID" NUMBER DEFAULT '142' NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"SUMELECTRADDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMELECTRDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMDISCOUNT" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"NOUSEDATE" DATE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"YEARCHECKS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CHECKBEGINDAY" DATE, 
	"CHECKENDDAY" DATE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"SUMELECTRADDDUMMYFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"REFUNDDUMPFARE" NUMBER DEFAULT 0, 
	"REFUNDLIMITCONSUMFARE" NUMBER DEFAULT 0, 
	"NONAMEFLAG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEID" NUMBER, 
	"PRODUCTID" NUMBER, 
	"ASN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEPEOPLEID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CARDTYPECITYID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"SERVERID" NUMBER, 
	"NUMBEROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"NUMBERSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"NUMBERODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"NUMBERODDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ISNEWCAPECSYS" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMANGEFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MANGEFARELASTDATE" DATE DEFAULT SYSDATE, 
	"SUMFREEMANGEFARE" NUMBER DEFAULT 0.00, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"SUMVICERUSHFARE" NUMBER(20,2) DEFAULT 0.00, 
	"WRITEOFFDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"HASCARD" VARCHAR2(1) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 33554432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_writeoff is '客户卡账户信息表-记录持卡人卡相关信息'
/
comment on column base_writeoff.id is '发卡流水号（主键）'
/
comment on column base_writeoff.customerid is '账号'
/
comment on column base_writeoff.scardsnr is '卡唯一号'
/
comment on column base_writeoff.cardtypedetailid is '卡类别小类'
/
comment on column base_writeoff.cardsn is '持卡序号'
/
comment on column base_writeoff.status is '卡状态：1--正常，3--挂失，4--冻结，5--灰色，6--停用,20--登记入库中间状态，21--已登记状态'
/
comment on column base_writeoff.querypwd is '查询密码'
/
comment on column base_writeoff.cardkind is '卡类型 （1m1卡 2cpu卡）'
/
comment on column base_writeoff.countryid is '国家编号'
/
comment on column base_writeoff.electropcount is '电子钱包消费计数'
/
comment on column base_writeoff.electrsaveopcount is '电子钱包充值计数'
/
comment on column base_writeoff.sumelectraddfareacc is '电子钱包总加款额系统值'
/
comment on column base_writeoff.sumelectraddfare is '电子钱包总加款额'
/
comment on column base_writeoff.sumconsumfare is '总消费额'
/
comment on column base_writeoff.sumelectrconsumfare is '电子钱包消费累计总额'
/
comment on column base_writeoff.sumelectrdummyfare is '电子钱包虚充总额'
/
comment on column base_writeoff.sumdiscount is '总打折额'
/
comment on column base_writeoff.electroddfare is '电子钱包卡余额'
/
comment on column base_writeoff.electroddfareacc is '电子钱包账户余额系统值'
/
comment on column base_writeoff.nousedate is '失效日期'
/
comment on column base_writeoff.empid is '职员编号'
/
comment on column base_writeoff.yearchecks is '是否需要年检（0不年检，1年检）'
/
comment on column base_writeoff.checkbeginday is '年检开始时间'
/
comment on column base_writeoff.checkendday is '年检结束时间'
/
comment on column base_writeoff.ver is '版本号'
/
comment on column base_writeoff.depreciatefare is '最后一次收取的折旧费，用于销户时计算退款'
/
comment on column base_writeoff.depreciatedate is '最后一次收取折旧费日期，用于销户时计算退款，格式yyyy-mm-dd hh24:mi:ss'
/
comment on column base_writeoff.sumelectradddummyfare is '电子钱包虚充加款时现金金额，如充100送20时此值累加100，不送不累加'
/
comment on column base_writeoff.refunddumpfare is '未消费完的虚充金额，退卡时从余额扣除'
/
comment on column base_writeoff.refundlimitconsumfare is '最低消费限额，否则退卡时虚充金额要从余额扣除'
/
comment on column base_writeoff.nonameflag is '不记名标记（0：记名；1：不记名）'
/
comment on column base_writeoff.cardtypeid is '发卡类型：普通卡和手机卡'
/
comment on column base_writeoff.productid is '卡供应商：移动、联通、电信'
/
comment on column base_writeoff.asn is 'm1：卡唯一序列号；cpu卡：卡应用序列号'
/
comment on column base_writeoff.outid is '市民卡号'
/
comment on column base_writeoff.cardtypepeopleid is '市民用途，市民类、管理卡类'
/
comment on column base_writeoff.cardtypecityid is '卡类型，普通卡、管理卡等'
/
comment on column base_writeoff.serverid is ''
/
comment on column base_writeoff.numberopcount is '次钱包消费交易计数'
/
comment on column base_writeoff.numbersaveopcount is '次钱包充值交易计数'
/
comment on column base_writeoff.numberoddfare is '次钱包卡余额'
/
comment on column base_writeoff.numberoddfareacc is '次钱包系统余额'
/
comment on column base_writeoff.isnewcapecsys is '新旧系统（0第一次发卡系统是新开普系统，1第一次发卡系统是其它公司系统）'
/
comment on column base_writeoff.summangefare is '收取管理费累计，用于销户时计算退款（和卡上有效期结合）'
/
comment on column base_writeoff.mangefarelastdate is '最后一次收取管理费日期，格式yyyy-mm-dd hh24:mi:ss'
/
comment on column base_writeoff.sumfreemangefare is '免收管理费累计，用户销户时计算退款'
/
comment on column base_writeoff.customerunitcode is '客户代码'
/
comment on column base_writeoff.opdt is '开卡时间'
/
comment on column base_writeoff.cardno is '卡号'
/
comment on column base_writeoff.sumvicerushfare is '次卡冲零金额累计'
/
comment on column base_writeoff.writeoffdate is '销户日期'
/
comment on column base_writeoff.hascard is '1有卡0无卡'
/


  CREATE TABLE "CCENSE"."BASE_WRITEOFF_INFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(50), 
	"SEX" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"NATION" VARCHAR2(2) DEFAULT '01' NOT NULL ENABLE, 
	"TELPHONENUM" VARCHAR2(20), 
	"IDCARDNO" VARCHAR2(18), 
	"CERTIFICATEID" NUMBER DEFAULT 3 NOT NULL ENABLE, 
	"CUSTDEPT" VARCHAR2(12), 
	"OPENDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(500), 
	"BIRTHDAY" DATE, 
	"RREMARK" VARCHAR2(500), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CUSTSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_writeoff_info is '客户基本信息注销表'
/
comment on column base_writeoff_info.id is '自动增长'
/
comment on column base_writeoff_info.customerid is '账号'
/
comment on column base_writeoff_info.name is '姓名'
/
comment on column base_writeoff_info.sex is '性别，1是男，其它女'
/
comment on column base_writeoff_info.nation is '民族编号'
/
comment on column base_writeoff_info.telphonenum is '联系电话'
/
comment on column base_writeoff_info.idcardno is '证件号码'
/
comment on column base_writeoff_info.certificateid is '证件类型'
/
comment on column base_writeoff_info.custdept is '客户所属单位（预留，暂时无用）'
/
comment on column base_writeoff_info.opendt is '开户日期'
/
comment on column base_writeoff_info.address is '地址'
/
comment on column base_writeoff_info.birthday is '出生日期'
/
comment on column base_writeoff_info.rremark is '备注'
/
comment on column base_writeoff_info.customerunitcode is '客户代码'
/
comment on column base_writeoff_info.custstatus is '客户状态：0-注销 1：正常（用户的卡都注销后，改标记为0，可以转储基本信息到客户基本信息注销表）'
/


  CREATE TABLE "CCENSE"."BASE_WRITEOFF_VICECARD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"SUMCONSUMEFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMRDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"SUMADDFAREACC" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"REFUNDDUMPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"REFUNDLIMITCONSUMFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"SUMADDDUMMYFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDASN" NUMBER, 
	 CONSTRAINT "PK_BASE_WRITEOFF_VICECARD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_BASE_WRITEOFF_VICECARD" UNIQUE ("CUSTOMERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table base_writeoff_vicecard is '客户次卡钱包信息表'
/
comment on column base_writeoff_vicecard.id is '自动增长'
/
comment on column base_writeoff_vicecard.customerid is '账号'
/
comment on column base_writeoff_vicecard.sumconsumefare is '次卡钱包消费累计总额'
/
comment on column base_writeoff_vicecard.sumrdummyfare is '次卡钱包虚充总额'
/
comment on column base_writeoff_vicecard.sumaddfare is '次卡钱包总加款额'
/
comment on column base_writeoff_vicecard.sumaddfareacc is '次卡钱包总加款额系统值'
/
comment on column base_writeoff_vicecard.refunddumpfare is '未消费完的虚充金额，退卡时从余额扣除'
/
comment on column base_writeoff_vicecard.refundlimitconsumfare is '最低消费限额，否则退卡时虚充金额要从余额扣除'
/
comment on column base_writeoff_vicecard.ver is ''
/
comment on column base_writeoff_vicecard.sumadddummyfare is '次卡钱包虚充加款时现金金额，如充100送20时此值累加100，不送不累加'
/
comment on column base_writeoff_vicecard.customerunitcode is '客户代码'
/
comment on column base_writeoff_vicecard.cardasn is '卡应用序列号'
/


  CREATE TABLE "CCENSE"."ERP_BATCH" 
   (	"BATCHNO" VARCHAR2(10) NOT NULL ENABLE, 
	"FILETYPE" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(20), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT sysdate NOT NULL ENABLE, 
	 CONSTRAINT "UK_ERP_BATCH" UNIQUE ("BATCHNO", "FILETYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table erp_batch is 'oa对接文件信息表'
/
comment on column erp_batch.batchno is '批次'
/
comment on column erp_batch.filetype is '文件类型(1：xjx消费卡刷卡按天汇总文件；2：zkx消费卡新售和充值按天汇总文件；3：kq自行车开启按天汇总文件)'
/
comment on column erp_batch.filename is '文件名'
/
comment on column erp_batch.status is '文件状态：0：未生成；1：已生成'
/
comment on column erp_batch.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."ERSHI" 
   (	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table ershi is ''
/
comment on column ershi.systracenum is ''
/


  CREATE TABLE "CCENSE"."LOG_LEVEL" 
   (	"LEVELCODE" VARCHAR2(20) NOT NULL ENABLE, 
	"LEVELNAME" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_LOG_LEVEL" PRIMARY KEY ("LEVELCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_level is '日志级别字典表'
/
comment on column log_level.levelcode is '日志级别编号'
/
comment on column log_level.levelname is '日志级别名称'
/


  CREATE TABLE "CCENSE"."LOG_LOGIN" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATIONID" VARCHAR2(30), 
	"SYSTEMID" VARCHAR2(30), 
	"APPID" VARCHAR2(30) DEFAULT '未知', 
	"USERCODE" VARCHAR2(30) DEFAULT '未知', 
	"MESSAGE" VARCHAR2(2000), 
	"LOGINDATE" DATE, 
	"IP" VARCHAR2(32), 
	"ISWARN" NUMBER, 
	"LOGINTYPE" NUMBER, 
	"RECORDLEVEL" NUMBER, 
	"CREATEDATE" DATE DEFAULT SYSDATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_LOG_LOGIN" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_login is '系统登录日志'
/
comment on column log_login.id is '主键，自增'
/
comment on column log_login.stationid is ''
/
comment on column log_login.systemid is ''
/
comment on column log_login.appid is '应用名称'
/
comment on column log_login.usercode is '登陆用户'
/
comment on column log_login.message is '登陆信息'
/
comment on column log_login.logindate is '登陆日期'
/
comment on column log_login.ip is '登陆ip'
/
comment on column log_login.iswarn is '是否报警'
/
comment on column log_login.logintype is '登陆类型'
/
comment on column log_login.recordlevel is '记录级别'
/
comment on column log_login.createdate is '记录建立日期'
/
comment on column log_login.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."LOG_OPERATION" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATIONID" VARCHAR2(30) DEFAULT '0' NOT NULL ENABLE, 
	"SYSTEMID" VARCHAR2(30) DEFAULT '0' NOT NULL ENABLE, 
	"MESSAGE" VARCHAR2(2000) DEFAULT 0 NOT NULL ENABLE, 
	"LOGTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDLEVEL" NUMBER DEFAULT 4 NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20), 
	"NAME" VARCHAR2(20), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"EMPCODE" VARCHAR2(30), 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_LOG_OPERATION" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 7340032 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 94371840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_operation is '操作日志表'
/
comment on column log_operation.id is '主键，触发器'
/
comment on column log_operation.stationid is '工作站标识'
/
comment on column log_operation.systemid is '子系统标识'
/
comment on column log_operation.message is '业务日志详细信息'
/
comment on column log_operation.logtype is '日志类型 对应type中的id'
/
comment on column log_operation.recordlevel is '日志级别 0：错误 1：报警 2：正常信息 3：调试信息 4：跟踪信息'
/
comment on column log_operation.createdate is '建立日志'
/
comment on column log_operation.outid is '工号（如果操作的是乘车卡，此处填写乘车卡对应的市民卡号，如果是职员，此处填写职员的工号）'
/
comment on column log_operation.name is '姓名'
/
comment on column log_operation.customerunitcode is '客户代码'
/
comment on column log_operation.empcode is '操作员（登录用户名）'
/
comment on column log_operation.empid is '职员编号'
/


  CREATE TABLE "CCENSE"."LOG_SERVICEMONITORING" 
   (	"ID" NUMBER, 
	"MESSAGE" NVARCHAR2(200), 
	"MESSAGETYPE" NUMBER, 
	"APPID" NUMBER, 
	"UPLOADDATE" DATE DEFAULT sysdate, 
	"DETAIL" NVARCHAR2(1000), 
	"ISREAD" NUMBER DEFAULT 0, 
	"CUSTOMERUNITCODE" VARCHAR2(15), 
	 CONSTRAINT "PK_SERVICEMONITORING_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_servicemonitoring is '服务监控日志'
/
comment on column log_servicemonitoring.id is '主键'
/
comment on column log_servicemonitoring.message is '服务器消息'
/
comment on column log_servicemonitoring.messagetype is '消息类型:0,提示信息；1，警告；2，异常；3，4,服务器状态上送'
/
comment on column log_servicemonitoring.appid is '服务id'
/
comment on column log_servicemonitoring.uploaddate is '消息时间'
/
comment on column log_servicemonitoring.detail is '消息当前状态'
/
comment on column log_servicemonitoring.isread is '是否已读'
/
comment on column log_servicemonitoring.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."LOG_STEP" 
   (	"STEPCODE" VARCHAR2(30) NOT NULL ENABLE, 
	"STEPNAME" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_LOG_STEP" PRIMARY KEY ("STEPCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_step is '日志级别字典表'
/
comment on column log_step.stepcode is '日志级别编号'
/
comment on column log_step.stepname is '日志级别名称'
/


  CREATE TABLE "CCENSE"."LOG_TYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"SYSTEMID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100) DEFAULT '无详细描述' NOT NULL ENABLE, 
	"SORTID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_LOG_TYPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_type is '操作日志类别表'
/
comment on column log_type.id is '编号'
/
comment on column log_type.systemid is '所属子系统'
/
comment on column log_type.name is '日志类型'
/
comment on column log_type.description is '日志类型描述'
/
comment on column log_type.sortid is '显示顺序'
/


  CREATE TABLE "CCENSE"."LOG_UPDATECUSTOMERINFO" 
   (	"ID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"ASN" NUMBER, 
	"NAME" VARCHAR2(100), 
	"IDCARD" VARCHAR2(30), 
	"PHONE" VARCHAR2(30), 
	"DETAILS" VARCHAR2(500), 
	"OLDNAME" VARCHAR2(100), 
	"OLDIDCARD" VARCHAR2(100), 
	"OLDPHONE" VARCHAR2(30), 
	"OLDDETAILS" VARCHAR2(500), 
	"EMPID" NUMBER, 
	"DPTCODE" VARCHAR2(30), 
	"OPDT" DATE, 
	"AUTHEMPID" NUMBER, 
	"OPTYPE" NUMBER, 
	 CONSTRAINT "PK_LOG_UPDATECUSTOMERINFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table log_updatecustomerinfo is ''
/
comment on column log_updatecustomerinfo.id is '流水id'
/
comment on column log_updatecustomerinfo.customerid is '售卡流水'
/
comment on column log_updatecustomerinfo.asn is '密钥分散因子'
/
comment on column log_updatecustomerinfo.name is '新用户名'
/
comment on column log_updatecustomerinfo.idcard is '身份证号'
/
comment on column log_updatecustomerinfo.phone is '手机号'
/
comment on column log_updatecustomerinfo.details is '备注'
/
comment on column log_updatecustomerinfo.oldname is '老姓名'
/
comment on column log_updatecustomerinfo.oldidcard is '老卡身份证'
/
comment on column log_updatecustomerinfo.oldphone is '老卡手机号'
/
comment on column log_updatecustomerinfo.olddetails is '老卡备注'
/
comment on column log_updatecustomerinfo.empid is '职员id'
/
comment on column log_updatecustomerinfo.dptcode is '部门信息'
/
comment on column log_updatecustomerinfo.opdt is '操作时间'
/
comment on column log_updatecustomerinfo.authempid is '授权管理员id'
/
comment on column log_updatecustomerinfo.optype is '0:有卡修改 1:有卡新增 2:无卡修改 3:无卡新增'
/


  CREATE TABLE "CCENSE"."MONITOR_BUSCOMPANY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERNAME" VARCHAR2(60) NOT NULL ENABLE, 
	"CREATEDT" DATE, 
	 CONSTRAINT "PK_MONITOR_BUSCOMPANY" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 16384 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645)
  TABLESPACE "CCEN" 
 
/
comment on table monitor_buscompany is '公交公司信息表'
/
comment on column monitor_buscompany.id is '流水号'
/
comment on column monitor_buscompany.customername is '文件名称'
/
comment on column monitor_buscompany.createdt is '入库时间'
/


  CREATE TABLE "CCENSE"."ODBC_IMPORT" 
   (	"交易流水号_小码交易_" VARCHAR2(100), 
	"支付网关流水号" VARCHAR2(100), 
	"扣款渠道流水号" VARCHAR2(100), 
	"支付渠道" VARCHAR2(100), 
	"渠道用户号" VARCHAR2(100), 
	"支付类型" VARCHAR2(100), 
	"APP渠道" VARCHAR2(100), 
	"APP用户号" VARCHAR2(100), 
	"卡号" VARCHAR2(100), 
	"交易金额" VARCHAR2(100), 
	"交易时间" VARCHAR2(100), 
	"支付时间" VARCHAR2(100), 
	"通知状态" VARCHAR2(100), 
	"交易状态" VARCHAR2(100), 
	"错误码" VARCHAR2(100), 
	"POSCODE" VARCHAR2(100), 
	"OPDT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table odbc_import is ''
/
comment on column odbc_import.交易流水号_小码交易_ is ''
/
comment on column odbc_import.支付网关流水号 is ''
/
comment on column odbc_import.扣款渠道流水号 is ''
/
comment on column odbc_import.支付渠道 is ''
/
comment on column odbc_import.渠道用户号 is ''
/
comment on column odbc_import.支付类型 is ''
/
comment on column odbc_import.app渠道 is ''
/
comment on column odbc_import.app用户号 is ''
/
comment on column odbc_import.卡号 is ''
/
comment on column odbc_import.交易金额 is ''
/
comment on column odbc_import.交易时间 is ''
/
comment on column odbc_import.支付时间 is ''
/
comment on column odbc_import.通知状态 is ''
/
comment on column odbc_import.交易状态 is ''
/
comment on column odbc_import.错误码 is ''
/
comment on column odbc_import.poscode is ''
/
comment on column odbc_import.opdt is ''
/


  CREATE TABLE "CCENSE"."ODBC_IMPORT_BAI" 
   (	"ID" NUMBER, 
	"CARDNO" VARCHAR2(255), 
	"LOSSDT" DATE, 
	"SUORCETYPE" NUMBER, 
	"SUORCEIP" VARCHAR2(255), 
	"NOUSEDATE" DATE, 
	"LOSSCOUNT" NUMBER, 
	"STATE" NUMBER, 
	"CARDASN" VARCHAR2(255), 
	"VER" NUMBER, 
	"CARDOWNBUSINESS" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(255), 
	"ISINTEROPERABILITY" NUMBER, 
	"OUTID" VARCHAR2(255), 
	"CARDKIND" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table odbc_import_bai is ''
/
comment on column odbc_import_bai.id is ''
/
comment on column odbc_import_bai.cardno is ''
/
comment on column odbc_import_bai.lossdt is ''
/
comment on column odbc_import_bai.suorcetype is ''
/
comment on column odbc_import_bai.suorceip is ''
/
comment on column odbc_import_bai.nousedate is ''
/
comment on column odbc_import_bai.losscount is ''
/
comment on column odbc_import_bai.state is ''
/
comment on column odbc_import_bai.cardasn is ''
/
comment on column odbc_import_bai.ver is ''
/
comment on column odbc_import_bai.cardownbusiness is ''
/
comment on column odbc_import_bai.customerunitcode is ''
/
comment on column odbc_import_bai.isinteroperability is ''
/
comment on column odbc_import_bai.outid is ''
/
comment on column odbc_import_bai.cardkind is ''
/


  CREATE TABLE "CCENSE"."ODBC_IMPORT_HEI" 
   (	"ID" NUMBER, 
	"CARDNO" VARCHAR2(255), 
	"LOSSDT" DATE, 
	"SUORCETYPE" NUMBER, 
	"SUORCEIP" VARCHAR2(255), 
	"NOUSEDATE" DATE, 
	"LOSSCOUNT" NUMBER, 
	"STATE" NUMBER, 
	"CARDASN" VARCHAR2(255), 
	"VER" NUMBER, 
	"CARDOWNBUSINESS" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(255), 
	"ISINTEROPERABILITY" NUMBER, 
	"OUTID" VARCHAR2(255), 
	"CARDKIND" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table odbc_import_hei is ''
/
comment on column odbc_import_hei.id is ''
/
comment on column odbc_import_hei.cardno is ''
/
comment on column odbc_import_hei.lossdt is ''
/
comment on column odbc_import_hei.suorcetype is ''
/
comment on column odbc_import_hei.suorceip is ''
/
comment on column odbc_import_hei.nousedate is ''
/
comment on column odbc_import_hei.losscount is ''
/
comment on column odbc_import_hei.state is ''
/
comment on column odbc_import_hei.cardasn is ''
/
comment on column odbc_import_hei.ver is ''
/
comment on column odbc_import_hei.cardownbusiness is ''
/
comment on column odbc_import_hei.customerunitcode is ''
/
comment on column odbc_import_hei.isinteroperability is ''
/
comment on column odbc_import_hei.outid is ''
/
comment on column odbc_import_hei.cardkind is ''
/


  CREATE TABLE "CCENSE"."REC_ACTUAL_TRIPS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"LINEID" NUMBER(*,0) NOT NULL ENABLE, 
	"SHIFTS" NUMBER(*,0) NOT NULL ENABLE, 
	"TRIPS" NUMBER NOT NULL ENABLE, 
	"CASHINCOME" VARCHAR2(20) NOT NULL ENABLE, 
	"BUSID" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"AUDITSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AUDITDATE" DATE, 
	"EMPID" NUMBER(*,0) DEFAULT NULL NOT NULL ENABLE, 
	"AUDITEMPID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_actual_trips is '实际趟次'
/
comment on column rec_actual_trips.id is '自增id'
/
comment on column rec_actual_trips.dptcode is '公司编号'
/
comment on column rec_actual_trips.lineid is '线路编号 '
/
comment on column rec_actual_trips.shifts is '班次'
/
comment on column rec_actual_trips.trips is '趟次'
/
comment on column rec_actual_trips.cashincome is '现金收入'
/
comment on column rec_actual_trips.busid is '汽车编号'
/
comment on column rec_actual_trips.accdate is '数据时间'
/
comment on column rec_actual_trips.opdt is '操作时间'
/
comment on column rec_actual_trips.auditstatus is '是否审核 0 未审核 1 已审核'
/
comment on column rec_actual_trips.auditdate is '审核时间'
/
comment on column rec_actual_trips.empid is '操作员id'
/
comment on column rec_actual_trips.auditempid is '审核员id'
/


  CREATE TABLE "CCENSE"."REC_BIKE_APP" 
   (	"ID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"ASN" NUMBER, 
	"DEPOSITLEVEL" NUMBER, 
	"DEPOSIT" NUMBER, 
	"EMPID" NUMBER, 
	"OPDT" DATE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" NVARCHAR2(12), 
	"ISSPECIAL" NUMBER DEFAULT 0, 
	"SPECIALEMPID" NUMBER, 
	"DETAILID" NUMBER, 
	"EMPCODE" VARCHAR2(20), 
	 CONSTRAINT "PK_REC_BIKE_APP" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 26214400 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 150994944 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  CACHE 
 
/
comment on table rec_bike_app is '自行车应用开通明细'
/
comment on column rec_bike_app.id is '自增id'
/
comment on column rec_bike_app.customerid is '发卡流水'
/
comment on column rec_bike_app.asn is '密钥分散因子'
/
comment on column rec_bike_app.depositlevel is '押金等级'
/
comment on column rec_bike_app.deposit is '押金'
/
comment on column rec_bike_app.empid is '职员empid'
/
comment on column rec_bike_app.opdt is '最后操作时间'
/
comment on column rec_bike_app.acccode is '交易科目'
/
comment on column rec_bike_app.dscrp is '交易科目描述'
/
comment on column rec_bike_app.poscode is '交易终端设备唯一编号'
/
comment on column rec_bike_app.customerunitcode is '客户编号'
/
comment on column rec_bike_app.isspecial is '特殊开启：0，正常；1特殊'
/
comment on column rec_bike_app.specialempid is '特殊开启授权职员'
/
comment on column rec_bike_app.detailid is '卡类型'
/
comment on column rec_bike_app.empcode is '职员编号'
/


  CREATE TABLE "CCENSE"."REC_BIKE_FILEINFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(25) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(2), 
	"FILESIZE" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"SYSTEMID" VARCHAR2(6), 
	"FILERECORDNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"NEXTROWINDEX" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LASTROWINDEX" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FILEBUILDTIME" DATE NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(12), 
	"RESERVE" VARCHAR2(20), 
	"MAC" VARCHAR2(20), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISDEALLAST" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ISACCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BIKE_FILEINFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_BIKE_FILEINFO" UNIQUE ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bike_fileinfo is '自行车对接文件信息表'
/
comment on column rec_bike_fileinfo.id is '主键'
/
comment on column rec_bike_fileinfo.filename is '文件名'
/
comment on column rec_bike_fileinfo.filetype is '文件类型'
/
comment on column rec_bike_fileinfo.filesize is '文件大小'
/
comment on column rec_bike_fileinfo.accdate is '交易日期'
/
comment on column rec_bike_fileinfo.systemid is '前置通讯系统编号或清算系统编号'
/
comment on column rec_bike_fileinfo.filerecordnum is '文件记录条数'
/
comment on column rec_bike_fileinfo.nextrowindex is '将要处理行索引'
/
comment on column rec_bike_fileinfo.lastrowindex is '最后一行行索引'
/
comment on column rec_bike_fileinfo.filebuildtime is '文件生成时间'
/
comment on column rec_bike_fileinfo.batchno is '（数据页号）批次编号'
/
comment on column rec_bike_fileinfo.reserve is '预留'
/
comment on column rec_bike_fileinfo.mac is 'mac'
/
comment on column rec_bike_fileinfo.status is '文件记录是否入库完成状态：0：初始状态；1：已完成'
/
comment on column rec_bike_fileinfo.isdeallast is '是否处理该文件里每个卡号的最后一笔记录：0：未完成；1：已完成'
/
comment on column rec_bike_fileinfo.customerunitcode is '客户代码'
/
comment on column rec_bike_fileinfo.createtime is '入库时间'
/
comment on column rec_bike_fileinfo.isaccount is '该文件里的所有付款记录是否已经清算完成：0：未清算，1：清算完成'
/


  CREATE TABLE "CCENSE"."REC_BIKE_FILEINFOERROR" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(25) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(2), 
	"ERRORROWNO" NUMBER NOT NULL ENABLE, 
	"ERRORROWINDEX" NUMBER NOT NULL ENABLE, 
	"ERRORROWCONTENT" VARCHAR2(200), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BIKE_FILEINFOERROR" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_BIKE_FILEINFOERROR" UNIQUE ("FILENAME", "ERRORROWINDEX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bike_fileinfoerror is '自行车对接文件内容解析错误信息表'
/
comment on column rec_bike_fileinfoerror.id is '主键'
/
comment on column rec_bike_fileinfoerror.filename is '文件名'
/
comment on column rec_bike_fileinfoerror.filetype is '文件类型'
/
comment on column rec_bike_fileinfoerror.errorrowno is '解析错误行号'
/
comment on column rec_bike_fileinfoerror.errorrowindex is '解析错误行索引'
/
comment on column rec_bike_fileinfoerror.errorrowcontent is '解析错误行内容'
/
comment on column rec_bike_fileinfoerror.status is '是否处理成正常记录状态：0：初始状态；1：已处理完成'
/
comment on column rec_bike_fileinfoerror.customerunitcode is '客户代码'
/
comment on column rec_bike_fileinfoerror.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_BIKE_LASTRENT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TRADECODE" VARCHAR2(6), 
	"SERIALNUMBER" VARCHAR2(20), 
	"MAINCARDTYPE" VARCHAR2(2), 
	"ASSOCARDTYPE" VARCHAR2(4), 
	"CARDCATEGORY" VARCHAR2(2), 
	"SCARDSNR" VARCHAR2(10), 
	"CARDNO" NUMBER, 
	"OUTID" VARCHAR2(10), 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"OPPROPERTY" NUMBER, 
	"OPCOUNT" NUMBER, 
	"SAMTRADENO" NUMBER, 
	"TAC" NUMBER, 
	"LOCKNUMBER1" VARCHAR2(6), 
	"LOCKNUMBER2" VARCHAR2(6), 
	"BIKENO" VARCHAR2(8), 
	"VENDORCODE" VARCHAR2(6), 
	"AUTHSIGN" VARCHAR2(4), 
	"MERCHANTCODE" VARCHAR2(4), 
	"CITYCODE" VARCHAR2(4), 
	"POSCODE" VARCHAR2(15), 
	"SAMCARDNO" VARCHAR2(20), 
	"SAMCARDVER" VARCHAR2(2), 
	"CARDPROPERTY" VARCHAR2(2), 
	"MAC" VARCHAR2(4), 
	"FILENAME" VARCHAR2(25) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"ISPAYMONEY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISACCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BIKE_LASTRENT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 15728640 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_BIKE_LASTRENT" UNIQUE ("CARDNO", "FILETYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 26214400 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 63963136 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bike_lastrent is '自行车最后一笔租车还车交易信息表'
/
comment on column rec_bike_lastrent.id is '主键'
/
comment on column rec_bike_lastrent.tradecode is '交易类型码'
/
comment on column rec_bike_lastrent.serialnumber is '记录流水号'
/
comment on column rec_bike_lastrent.maincardtype is '主卡类型'
/
comment on column rec_bike_lastrent.assocardtype is '子卡类型'
/
comment on column rec_bike_lastrent.cardcategory is '卡类别(hex)(f1:旧结构m1卡；f2:新结构m1卡；f3:住建部标准cpu卡；f4:pboc2.0卡；)'
/
comment on column rec_bike_lastrent.scardsnr is '卡唯一号(hex)'
/
comment on column rec_bike_lastrent.cardno is '应用卡号(bcd)'
/
comment on column rec_bike_lastrent.outid is '应用卡号(bcd)'
/
comment on column rec_bike_lastrent.opfare is '交易金额,单位分'
/
comment on column rec_bike_lastrent.oddfarepre is '交易前余额，单位分'
/
comment on column rec_bike_lastrent.opdt is '交易日期'
/
comment on column rec_bike_lastrent.opproperty is '交易属性'
/
comment on column rec_bike_lastrent.opcount is '脱机交易序号'
/
comment on column rec_bike_lastrent.samtradeno is '终端交易序号'
/
comment on column rec_bike_lastrent.tac is '交易认证码tac'
/
comment on column rec_bike_lastrent.locknumber1 is '锁止器编号1(bcd)'
/
comment on column rec_bike_lastrent.locknumber2 is '锁止器编号2(bcd)'
/
comment on column rec_bike_lastrent.bikeno is '车辆编号(bcd)'
/
comment on column rec_bike_lastrent.vendorcode is '厂商代码(bcd)'
/
comment on column rec_bike_lastrent.authsign is '授权标识(hex)'
/
comment on column rec_bike_lastrent.merchantcode is '商户代码(bcd)'
/
comment on column rec_bike_lastrent.citycode is '城市代码(bcd)'
/
comment on column rec_bike_lastrent.poscode is '终端机编号'
/
comment on column rec_bike_lastrent.samcardno is 'psam卡编号'
/
comment on column rec_bike_lastrent.samcardver is 'psam卡版本号(hex)'
/
comment on column rec_bike_lastrent.cardproperty is '用户卡属性(hex)'
/
comment on column rec_bike_lastrent.mac is 'mac码(hex)'
/
comment on column rec_bike_lastrent.filename is '文件名'
/
comment on column rec_bike_lastrent.filetype is '文件类型（zc:租车；hc:还车；）'
/
comment on column rec_bike_lastrent.ispaymoney is '本次还车交易是否免费：0：免费；1：扣钱'
/
comment on column rec_bike_lastrent.isaccount is '还车记录是否形成本地账目'
/
comment on column rec_bike_lastrent.status is '状态：0：初始状态；1：已完成'
/
comment on column rec_bike_lastrent.customerunitcode is '客户法人'
/
comment on column rec_bike_lastrent.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_BIKE_RENT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TRADECODE" VARCHAR2(6), 
	"SERIALNUMBER" VARCHAR2(20), 
	"MAINCARDTYPE" VARCHAR2(2), 
	"ASSOCARDTYPE" VARCHAR2(4), 
	"CARDCATEGORY" VARCHAR2(2), 
	"SCARDSNR" VARCHAR2(10), 
	"CARDNO" NUMBER, 
	"OUTID" VARCHAR2(10), 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"OPPROPERTY" NUMBER, 
	"OPCOUNT" NUMBER, 
	"SAMTRADENO" NUMBER, 
	"TAC" NUMBER, 
	"LOCKNUMBER1" VARCHAR2(6), 
	"LOCKNUMBER2" VARCHAR2(6), 
	"BIKENO" VARCHAR2(8), 
	"VENDORCODE" VARCHAR2(6), 
	"AUTHSIGN" VARCHAR2(4), 
	"MERCHANTCODE" VARCHAR2(4), 
	"CITYCODE" VARCHAR2(4), 
	"POSCODE" VARCHAR2(15), 
	"SAMCARDNO" VARCHAR2(20), 
	"SAMCARDVER" VARCHAR2(2), 
	"CARDPROPERTY" VARCHAR2(2), 
	"MAC" VARCHAR2(4), 
	"FILENAME" VARCHAR2(25) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"ISPAYMONEY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISACCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISDEALLAST" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BIKE_RENT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 56623104 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 1301282816 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bike_rent is '自行车租车还车交易信息表'
/
comment on column rec_bike_rent.id is '主键'
/
comment on column rec_bike_rent.tradecode is '交易类型码'
/
comment on column rec_bike_rent.serialnumber is '记录流水号'
/
comment on column rec_bike_rent.maincardtype is '主卡类型'
/
comment on column rec_bike_rent.assocardtype is '子卡类型'
/
comment on column rec_bike_rent.cardcategory is '卡类别(hex)(f1:旧结构m1卡；f2:新结构m1卡；f3:住建部标准cpu卡；f4:pboc2.0卡；)'
/
comment on column rec_bike_rent.scardsnr is '卡唯一号(hex)'
/
comment on column rec_bike_rent.cardno is '应用卡号(bcd)'
/
comment on column rec_bike_rent.outid is '应用卡号(bcd)'
/
comment on column rec_bike_rent.opfare is '交易金额,单位分'
/
comment on column rec_bike_rent.oddfarepre is '交易前余额，单位分'
/
comment on column rec_bike_rent.opdt is '交易日期'
/
comment on column rec_bike_rent.opproperty is '交易属性'
/
comment on column rec_bike_rent.opcount is '脱机交易序号'
/
comment on column rec_bike_rent.samtradeno is '终端交易序号'
/
comment on column rec_bike_rent.tac is '交易认证码tac'
/
comment on column rec_bike_rent.locknumber1 is '锁止器编号1(bcd)'
/
comment on column rec_bike_rent.locknumber2 is '锁止器编号2(bcd)'
/
comment on column rec_bike_rent.bikeno is '车辆编号(bcd)'
/
comment on column rec_bike_rent.vendorcode is '厂商代码(bcd)'
/
comment on column rec_bike_rent.authsign is '授权标识(hex)'
/
comment on column rec_bike_rent.merchantcode is '商户代码(bcd)'
/
comment on column rec_bike_rent.citycode is '城市代码(bcd)'
/
comment on column rec_bike_rent.poscode is '终端机编号'
/
comment on column rec_bike_rent.samcardno is 'psam卡编号'
/
comment on column rec_bike_rent.samcardver is 'psam卡版本号(hex)'
/
comment on column rec_bike_rent.cardproperty is '用户卡属性(hex)'
/
comment on column rec_bike_rent.mac is 'mac码(hex)'
/
comment on column rec_bike_rent.filename is '文件名'
/
comment on column rec_bike_rent.filetype is '文件类型（zc:租车；hc:还车）'
/
comment on column rec_bike_rent.ispaymoney is '本次还车交易是否免费：0：免费；1：扣钱'
/
comment on column rec_bike_rent.isaccount is '还车记录是否形成本地账目，只有扣钱的还车记录才进行本地账目处理'
/
comment on column rec_bike_rent.status is '状态：0：初始状态；1：已完成'
/
comment on column rec_bike_rent.isdeallast is '是否处理为该卡号的最后一笔记录状态：0：初始状态；1：已处理'
/
comment on column rec_bike_rent.customerunitcode is '客户法人'
/
comment on column rec_bike_rent.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_BKJLK" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"NEWCARDNO" NUMBER, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE, 
	"NEWOUTID" VARCHAR2(20), 
	"LISTNO" VARCHAR2(50), 
	"OPENDT" DATE NOT NULL ENABLE, 
	"IDCARDNO" VARCHAR2(20), 
	"DEPOSIT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDFARE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPCODE" VARCHAR2(20), 
	"NAME" VARCHAR2(30), 
	"DATATYPE" VARCHAR2(20), 
	"MSGINFO" VARCHAR2(50), 
	 CONSTRAINT "UK_REC_BKJLK" UNIQUE ("CARDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 24117248 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN_INDEX"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 253755392 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bkjlk is ''
/
comment on column rec_bkjlk.cardfc is '流水号'
/
comment on column rec_bkjlk.cardno is '原卡号'
/
comment on column rec_bkjlk.newcardno is '新卡号'
/
comment on column rec_bkjlk.cardtypedetailid is '新系统卡类型'
/
comment on column rec_bkjlk.opdt is '同步时间'
/
comment on column rec_bkjlk.empid is '同步职员'
/
comment on column rec_bkjlk.customerunitcode is ''
/
comment on column rec_bkjlk.outid is '卡面号'
/
comment on column rec_bkjlk.newoutid is '新卡面号'
/
comment on column rec_bkjlk.listno is '原系统订单号'
/
comment on column rec_bkjlk.opendt is '原系统制卡时间'
/
comment on column rec_bkjlk.idcardno is '原系统身份证号'
/
comment on column rec_bkjlk.deposit is '卡押金'
/
comment on column rec_bkjlk.cardfare is '折旧费'
/
comment on column rec_bkjlk.empcode is '原系统职员编号'
/
comment on column rec_bkjlk.name is '原系统姓名'
/
comment on column rec_bkjlk.datatype is '数据类型'
/
comment on column rec_bkjlk.msginfo is '提示内容'
/


  CREATE TABLE "CCENSE"."REC_BLLT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"LOSSDT" DATE NOT NULL ENABLE, 
	"SUORCETYPE" NUMBER, 
	"SUORCEIP" VARCHAR2(20), 
	"NOUSEDATE" DATE, 
	"LOSSCOUNT" NUMBER DEFAULT 0, 
	"STATE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDASN" NUMBER, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDOWNBUSINESS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ISINTEROPERABILITY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BLLT" PRIMARY KEY ("CARDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 29360128 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 117440512 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bllt is '黑名单'
/
comment on column rec_bllt.id is '序号'
/
comment on column rec_bllt.cardno is '卡号'
/
comment on column rec_bllt.lossdt is '生成时间（挂失时间）'
/
comment on column rec_bllt.suorcetype is '黑名单来源（1：制卡中心；2：自助；3：记录上传；4：其他；5：oda；6，自行车客服挂失  7第三方对接挂失）'
/
comment on column rec_bllt.suorceip is '黑名单来源ip'
/
comment on column rec_bllt.nousedate is '有效期'
/
comment on column rec_bllt.losscount is '挂失次数，挂失一次加1'
/
comment on column rec_bllt.state is '操作类型 0挂失 1解挂'
/
comment on column rec_bllt.cardasn is '卡应用号'
/
comment on column rec_bllt.ver is '板本号'
/
comment on column rec_bllt.cardownbusiness is '卡所属行业，0市民卡，1银联卡，2岭南通卡'
/
comment on column rec_bllt.customerunitcode is '客户代码'
/
comment on column rec_bllt.isinteroperability is '是否互通标识(0:不是，即分客户下载 1：是，即不分客户下载)'
/
comment on column rec_bllt.outid is '市民卡号'
/
comment on column rec_bllt.cardkind is '卡类型[1m1卡 2cpu卡]'
/


  CREATE TABLE "CCENSE"."REC_BLLT_0321" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"LOSSDT" DATE NOT NULL ENABLE, 
	"SUORCETYPE" NUMBER, 
	"SUORCEIP" VARCHAR2(20), 
	"NOUSEDATE" DATE, 
	"LOSSCOUNT" NUMBER, 
	"STATE" NUMBER NOT NULL ENABLE, 
	"CARDASN" NUMBER, 
	"VER" NUMBER NOT NULL ENABLE, 
	"CARDOWNBUSINESS" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ISINTEROPERABILITY" NUMBER NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 117440512 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bllt_0321 is ''
/
comment on column rec_bllt_0321.id is ''
/
comment on column rec_bllt_0321.cardno is ''
/
comment on column rec_bllt_0321.lossdt is ''
/
comment on column rec_bllt_0321.suorcetype is ''
/
comment on column rec_bllt_0321.suorceip is ''
/
comment on column rec_bllt_0321.nousedate is ''
/
comment on column rec_bllt_0321.losscount is ''
/
comment on column rec_bllt_0321.state is ''
/
comment on column rec_bllt_0321.cardasn is ''
/
comment on column rec_bllt_0321.ver is ''
/
comment on column rec_bllt_0321.cardownbusiness is ''
/
comment on column rec_bllt_0321.customerunitcode is ''
/
comment on column rec_bllt_0321.isinteroperability is ''
/
comment on column rec_bllt_0321.outid is ''
/
comment on column rec_bllt_0321.cardkind is ''
/


  CREATE TABLE "CCENSE"."REC_BLLT_SAFE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"LOSSDT" DATE NOT NULL ENABLE, 
	"FINDDT" DATE, 
	"OPPSN" NUMBER DEFAULT 0, 
	"SUORCETYPE" NUMBER, 
	"SUORCEIP" VARCHAR2(20), 
	"SYSTEMID" NUMBER, 
	"NOUSEDATE" DATE, 
	"BLLTVER" NUMBER, 
	"POSCODE" NUMBER, 
	"POSRECNO" NUMBER, 
	"CARDASN" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_BLLT_SAFE" PRIMARY KEY ("CARDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_bllt_safe is '安全黑名单'
/
comment on column rec_bllt_safe.id is '序号'
/
comment on column rec_bllt_safe.cardno is '卡号'
/
comment on column rec_bllt_safe.lossdt is '挂失时间'
/
comment on column rec_bllt_safe.finddt is '捕获时间'
/
comment on column rec_bllt_safe.oppsn is '对应的黑明单序号'
/
comment on column rec_bllt_safe.suorcetype is '黑名单来源（1：制卡中心；2：自助查询；3：领款机；4：圈存机；5记录上传；6：其他）'
/
comment on column rec_bllt_safe.suorceip is '黑名单来源ip'
/
comment on column rec_bllt_safe.systemid is '系统id（具体定义见base_system）'
/
comment on column rec_bllt_safe.nousedate is '有效期'
/
comment on column rec_bllt_safe.blltver is '转移到安全黑名单前的版本号'
/
comment on column rec_bllt_safe.poscode is '捕获黑名单的终端：设备运营编号'
/
comment on column rec_bllt_safe.posrecno is 'pos记录编号'
/
comment on column rec_bllt_safe.cardasn is '卡应用号'
/
comment on column rec_bllt_safe.customerunitcode is '客户代码'
/
comment on column rec_bllt_safe.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CARD_MAKE_ACC" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDNO" NUMBER DEFAULT 0, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDSN" NUMBER DEFAULT 0, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDMONOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"LOSSFC" NUMBER, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"STAG_BAN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AREAID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PTY" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ID" VARCHAR2(8) DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"MONSAVEOPCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMONTHODDFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMONTHODDFAREACC" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"REMAKECARDTYPE" VARCHAR2(1) DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"ENABLE" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 662700032 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  CACHE 
 
/
comment on table rec_card_make_acc is '制卡明细记录表'
/
comment on column rec_card_make_acc.cardfc is '编号'
/
comment on column rec_card_make_acc.customerid is '账号'
/
comment on column rec_card_make_acc.scardsnr is '唯一序列号'
/
comment on column rec_card_make_acc.cardno is '卡号'
/
comment on column rec_card_make_acc.oldcardno is '旧卡卡号'
/
comment on column rec_card_make_acc.cardtypedetailid is '卡类型小类id'
/
comment on column rec_card_make_acc.cardsn is '卡序号'
/
comment on column rec_card_make_acc.oldcardsn is '旧卡持卡序号'
/
comment on column rec_card_make_acc.cardkind is '卡种类 1m1卡2cpu卡'
/
comment on column rec_card_make_acc.oldelectropcount is '旧电子钱包消费计数'
/
comment on column rec_card_make_acc.oldelectrsaveopcount is '旧电子钱包充值计数'
/
comment on column rec_card_make_acc.oldmonopcount is '旧月票钱包消费计数'
/
comment on column rec_card_make_acc.oldelectroddfare is '旧电子钱包余额'
/
comment on column rec_card_make_acc.opdt is '操作时间'
/
comment on column rec_card_make_acc.lossfc is '挂失流水'
/
comment on column rec_card_make_acc.empid is '操作员'
/
comment on column rec_card_make_acc.stag_ban is '统计标示'
/
comment on column rec_card_make_acc.areaid is '所属分区'
/
comment on column rec_card_make_acc.pty is '发放性质 0=新卡，1=补发，2=换卡 10:新卡坏账 11：补卡坏卡 12：换卡坏卡'
/
comment on column rec_card_make_acc.ver is '版本'
/
comment on column rec_card_make_acc.id is '卡上流水号'
/
comment on column rec_card_make_acc.poscode is '终端唯一编号'
/
comment on column rec_card_make_acc.monsaveopcount is '旧月票钱包充值计数'
/
comment on column rec_card_make_acc.summonthoddfare is '旧月票钱包总余额'
/
comment on column rec_card_make_acc.summonthoddfareacc is '旧月票钱包总余额系统值'
/
comment on column rec_card_make_acc.depreciatefare is '最后一次收取的折旧费，用于销户时计算退款'
/
comment on column rec_card_make_acc.depreciatedate is '最后一次收取折旧费日期，用于销户时计算退款，格式yyyy-mm-dd hh24:mi:ss'
/
comment on column rec_card_make_acc.remakecardtype is '补卡类型：1丢失，2人为损坏，3非人为损坏'
/
comment on column rec_card_make_acc.customerunitcode is '客户代码'
/
comment on column rec_card_make_acc.outid is ''
/
comment on column rec_card_make_acc.enable is '开启'
/


  CREATE TABLE "CCENSE"."REC_CARD_SELL" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"STAG_BAN" NUMBER NOT NULL ENABLE, 
	"AREAID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CARD_SELL" PRIMARY KEY ("CARDFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 176160768 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 478150656 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_card_sell is '卡入库信息表'
/
comment on column rec_card_sell.cardfc is '入库流水号'
/
comment on column rec_card_sell.customerid is '客户编号'
/
comment on column rec_card_sell.cardno is '卡号'
/
comment on column rec_card_sell.opdt is '操作日期'
/
comment on column rec_card_sell.stag_ban is '结账汇总标记,用于班结账或日结账'
/
comment on column rec_card_sell.areaid is '所属分区'
/
comment on column rec_card_sell.scardsnr is '卡唯一号'
/
comment on column rec_card_sell.empid is '操作员id'
/
comment on column rec_card_sell.cardtypedetailid is '售卡卡类型id'
/
comment on column rec_card_sell.poscode is '终端唯一编号'
/
comment on column rec_card_sell.psamcardno is 'psam卡唯一编号'
/
comment on column rec_card_sell.cardkind is '卡种类 1：m1卡 2：cpu卡'
/
comment on column rec_card_sell.customerunitcode is '客户代码'
/
comment on column rec_card_sell.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CARD_SELL_BAK" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"STAG_BAN" NUMBER NOT NULL ENABLE, 
	"AREAID" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_card_sell_bak is ''
/
comment on column rec_card_sell_bak.cardfc is ''
/
comment on column rec_card_sell_bak.customerid is ''
/
comment on column rec_card_sell_bak.cardno is ''
/
comment on column rec_card_sell_bak.opdt is ''
/
comment on column rec_card_sell_bak.stag_ban is ''
/
comment on column rec_card_sell_bak.areaid is ''
/
comment on column rec_card_sell_bak.scardsnr is ''
/
comment on column rec_card_sell_bak.empid is ''
/
comment on column rec_card_sell_bak.cardtypedetailid is ''
/
comment on column rec_card_sell_bak.poscode is ''
/
comment on column rec_card_sell_bak.psamcardno is ''
/
comment on column rec_card_sell_bak.cardkind is ''
/
comment on column rec_card_sell_bak.customerunitcode is ''
/
comment on column rec_card_sell_bak.outid is ''
/


  CREATE TABLE "CCENSE"."REC_CASH_REQUEST" 
   (	"REQUESTID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"MONOPCOUNT" NUMBER NOT NULL ENABLE, 
	"MONSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"SUMFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MONODDFARE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CASH_REQUEST" PRIMARY KEY ("REQUESTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 18874368 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 110100480 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_cash_request is '充值申请记录表（用以处理未决记录）'
/
comment on column rec_cash_request.requestid is '申请流水号'
/
comment on column rec_cash_request.customerid is '账号'
/
comment on column rec_cash_request.cardno is '卡号'
/
comment on column rec_cash_request.cardsn is '卡序号'
/
comment on column rec_cash_request.opdt is '交易日期'
/
comment on column rec_cash_request.cardtypedetailid is '卡类型小类'
/
comment on column rec_cash_request.cardkind is '卡种类'
/
comment on column rec_cash_request.electropcount is '电子钱包交易计数'
/
comment on column rec_cash_request.electrsaveopcount is '电子钱包充值计数'
/
comment on column rec_cash_request.monopcount is '月票交易计数'
/
comment on column rec_cash_request.monsaveopcount is '月票充值计数'
/
comment on column rec_cash_request.sumfare is '电子钱包卡总额'
/
comment on column rec_cash_request.electroddfare is '电子钱包余额'
/
comment on column rec_cash_request.poscode is '设备唯一编号'
/
comment on column rec_cash_request.samcardno is 'sam卡号'
/
comment on column rec_cash_request.uploaddate is '上传时间'
/
comment on column rec_cash_request.empid is '职员id'
/
comment on column rec_cash_request.viceopcount is '次卡钱包消费操作计数'
/
comment on column rec_cash_request.vicesaveopcount is '次卡钱包充值操作计数'
/
comment on column rec_cash_request.viceoddfare is '次卡钱包余额'
/
comment on column rec_cash_request.monoddfare is '月票钱包余额'
/
comment on column rec_cash_request.customerunitcode is '客户代码'
/
comment on column rec_cash_request.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CITY_BANK_DZLOG" 
   (	"FOOTDT" NUMBER(8,0) NOT NULL ENABLE, 
	"ACCTYPE" NUMBER(2,0) NOT NULL ENABLE, 
	"ACCCODE" VARCHAR2(10) NOT NULL ENABLE, 
	"ACCCODEDESC" VARCHAR2(40), 
	"OPDT" DATE, 
	"BANKSUMCOUNT" NUMBER(10,0) NOT NULL ENABLE, 
	"BANKSUMFARE" NUMBER(20,2), 
	"ORGSUMCOUNT" NUMBER(10,0), 
	"ORGSUMFARE" NUMBER(20,2), 
	"DZSUMCOUNT" NUMBER(10,0), 
	"DZSUMFARE" NUMBER(20,2), 
	"DESCRIPT" VARCHAR2(60), 
	"ALLSUMCOUNT" NUMBER(10,0), 
	"ALLSUMFARE" NUMBER(20,2), 
	"FIXSUMCOUNT" NUMBER(10,0), 
	"FIXSUMFARE" NUMBER(20,2), 
	"BZSUMCOUNT" NUMBER(10,0) DEFAULT 0, 
	"BZSUMFARE" NUMBER(20,2), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_BANK_DZLOG" PRIMARY KEY ("FOOTDT", "ACCTYPE", "ACCCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_bank_dzlog is '存储对帐时的对帐文件中的交易次数和交易金额(统计报表使用)'
/
comment on column rec_city_bank_dzlog.footdt is '帐务日期'
/
comment on column rec_city_bank_dzlog.acctype is '为银行缴费等代理业务对帐备用(1圈存,2银行代缴费...)'
/
comment on column rec_city_bank_dzlog.acccode is '科目代码'
/
comment on column rec_city_bank_dzlog.acccodedesc is '科目代码内银行名称的和对帐类别的描述'
/
comment on column rec_city_bank_dzlog.opdt is '操作时间'
/
comment on column rec_city_bank_dzlog.banksumcount is '对帐文件中银行交易总次数'
/
comment on column rec_city_bank_dzlog.banksumfare is '对帐文件中银行交易总金额'
/
comment on column rec_city_bank_dzlog.orgsumcount is '中心数据库内交易总次数'
/
comment on column rec_city_bank_dzlog.orgsumfare is '中心数据库内交易总金额'
/
comment on column rec_city_bank_dzlog.dzsumcount is '对帐修正后成功总笔数'
/
comment on column rec_city_bank_dzlog.dzsumfare is '对帐修正后成功总金额'
/
comment on column rec_city_bank_dzlog.descript is '数据库内对帐结果的描述'
/
comment on column rec_city_bank_dzlog.allsumcount is '对帐修正后，数据库内对帐成功（succed=1或2），交易总次数'
/
comment on column rec_city_bank_dzlog.allsumfare is '对帐修正后，数据库内对帐成功（succed=1或2），交易总金额'
/
comment on column rec_city_bank_dzlog.fixsumcount is '对帐修正后，数据库内对帐成功（以第三方日期为准），交易总次数'
/
comment on column rec_city_bank_dzlog.fixsumfare is '对帐修正后，数据库内对帐成功（以第三方日期为准），交易总金额'
/
comment on column rec_city_bank_dzlog.bzsumcount is '补帐成功次数'
/
comment on column rec_city_bank_dzlog.bzsumfare is '补帐成功金额'
/
comment on column rec_city_bank_dzlog.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_CITY_BANK_REQUEST" 
   (	"BANKRECNO" NUMBER(17,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER(8,0) NOT NULL ENABLE, 
	"BANKCARDNO" VARCHAR2(20) NOT NULL ENABLE, 
	"FOOTDT" NUMBER(8,0) NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2), 
	"BANKCOUNT" NUMBER(6,0), 
	"SUCCED" NUMBER(2,0), 
	"BANKRET" VARCHAR2(10), 
	"BANKTRADENO" VARCHAR2(30), 
	"BANKRETDESC" VARCHAR2(30), 
	"ACCCODE" VARCHAR2(10) NOT NULL ENABLE, 
	"QYLX" NUMBER(2,0), 
	"PREODDFARE" NUMBER(10,2), 
	"PREOPCOUNT" NUMBER(5,0), 
	"OPDT" DATE, 
	"BANKPCH" NUMBER(6,0), 
	"REQPCH" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_BANK_REQUEST" PRIMARY KEY ("FOOTDT", "BANKRECNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_bank_request is '银行圈存申请记录表'
/
comment on column rec_city_bank_request.bankrecno is '服务流水号'
/
comment on column rec_city_bank_request.customerid is '客户账号'
/
comment on column rec_city_bank_request.bankcardno is '银行卡号'
/
comment on column rec_city_bank_request.footdt is '帐务日期'
/
comment on column rec_city_bank_request.opfare is '交易金额'
/
comment on column rec_city_bank_request.bankcount is 'aappll上午下午夜晚三个班次的组合次数,目前只支持0和1'
/
comment on column rec_city_bank_request.succed is '成功标记'
/
comment on column rec_city_bank_request.bankret is '银行返回值'
/
comment on column rec_city_bank_request.banktradeno is '银行流水'
/
comment on column rec_city_bank_request.bankretdesc is '银行返回值的简要描述'
/
comment on column rec_city_bank_request.acccode is '科目代码'
/
comment on column rec_city_bank_request.qylx is 'qylx[签约类型],签约类型的不同,向银行发送方式不同'
/
comment on column rec_city_bank_request.preoddfare is '以前余额'
/
comment on column rec_city_bank_request.preopcount is '以前操作次数'
/
comment on column rec_city_bank_request.opdt is '操作时间'
/
comment on column rec_city_bank_request.bankpch is '批次号'
/
comment on column rec_city_bank_request.reqpch is '请求批次号'
/
comment on column rec_city_bank_request.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_CITY_BANKBINDQY" 
   (	"ACCCODE" VARCHAR2(10) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER(*,0) NOT NULL ENABLE, 
	"BANKCARDNO" VARCHAR2(30) NOT NULL ENABLE, 
	"QYLX" NUMBER(3,0) NOT NULL ENABLE, 
	"QYOPFARE" NUMBER(10,2) DEFAULT 0.00, 
	"QYODDFARE" NUMBER(10,2) DEFAULT 0.00, 
	"QSRQ" NUMBER(*,0), 
	"JZRQ" NUMBER(*,0), 
	"QYPASS" CHAR(16), 
	"QYZJHM" VARCHAR2(30), 
	"FIRSTTRYDT" DATE, 
	"LASTTRYCS" NUMBER(*,0), 
	"INITDT" DATE, 
	"INITGH" VARCHAR2(32), 
	"QYTYPE" NUMBER(3,0) DEFAULT 0 NOT NULL ENABLE, 
	"BZINFO" VARCHAR2(300), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ASN" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_BANKBINDQY" PRIMARY KEY ("ACCCODE", "CUSTOMERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_bankbindqy is '银行签约表'
/
comment on column rec_city_bankbindqy.acccode is '科目代码'
/
comment on column rec_city_bankbindqy.customerid is '校园帐号'
/
comment on column rec_city_bankbindqy.bankcardno is '银行帐号'
/
comment on column rec_city_bankbindqy.qylx is '签约类型 =1普通签约,=2定额签约,=3非定额签约'
/
comment on column rec_city_bankbindqy.qyopfare is '批量时交易金额'
/
comment on column rec_city_bankbindqy.qyoddfare is '批量时账本起圈金额'
/
comment on column rec_city_bankbindqy.qsrq is '有效起始日期-[备用]'
/
comment on column rec_city_bankbindqy.jzrq is '有效截止日期-[备用]'
/
comment on column rec_city_bankbindqy.qypass is '自助签约密码-[备用]'
/
comment on column rec_city_bankbindqy.qyzjhm is '签约证件号码'
/
comment on column rec_city_bankbindqy.firsttrydt is '尝试变更日期,没启用'
/
comment on column rec_city_bankbindqy.lasttrycs is '累计尝试变更签约次数,超过10次拒绝自动签约'
/
comment on column rec_city_bankbindqy.initdt is '初始日期'
/
comment on column rec_city_bankbindqy.initgh is '初始人'
/
comment on column rec_city_bankbindqy.qytype is '签约类型(圈存机：0，电话银行：1，网上银行：2，批量签约：3)'
/
comment on column rec_city_bankbindqy.bzinfo is '电话号码或ip地址或备注信息'
/
comment on column rec_city_bankbindqy.customerunitcode is '客户代码'
/
comment on column rec_city_bankbindqy.asn is 'm1：卡唯一序列号；cpu卡：卡应用序列号'
/


  CREATE TABLE "CCENSE"."REC_CITY_BANKINFO" 
   (	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"BANKNAME" VARCHAR2(32) NOT NULL ENABLE, 
	"SERVERIP" VARCHAR2(64) DEFAULT 0 NOT NULL ENABLE, 
	"SERVERPORT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_BANKINFO" PRIMARY KEY ("ACCCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_bankinfo is '银行圈存服务前置设置表'
/
comment on column rec_city_bankinfo.acccode is '科目代码'
/
comment on column rec_city_bankinfo.bankname is '银行代码'
/
comment on column rec_city_bankinfo.serverip is '圈存前置ip'
/
comment on column rec_city_bankinfo.serverport is '前置端口'
/


  CREATE TABLE "CCENSE"."REC_CITY_BANKREC" 
   (	"BANKRECNO" NUMBER(17,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE, 
	"PREODDFARE" NUMBER(10,2), 
	"PREOPCOUNT" NUMBER, 
	"ODDFARE" NUMBER(10,2), 
	"OPCOUNT" NUMBER(5,0), 
	"CARDSN" NUMBER, 
	"OPFARE" NUMBER(10,2), 
	"FOOTDT" NUMBER, 
	"FIXFOOTDT" NUMBER, 
	"BANKCARDNO" NUMBER, 
	"BANKTRADENO" VARCHAR2(100), 
	"BANKRET" VARCHAR2(6), 
	"BANKRETDESC" VARCHAR2(60), 
	"BANKDZ" NUMBER, 
	"ACCCODE" VARCHAR2(10) NOT NULL ENABLE, 
	"TERMID" NUMBER NOT NULL ENABLE, 
	"TERMTRADENO" NUMBER(14,0) NOT NULL ENABLE, 
	"TRADESTATUS" NUMBER, 
	"SUCCED" NUMBER, 
	"SN" NUMBER(9,0), 
	"BANKPCH" NUMBER, 
	"QCTYPE" NUMBER(3,0) DEFAULT 0 NOT NULL ENABLE, 
	"BZINFO" VARCHAR2(32), 
	"COUDATE" DATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"EMPID" NUMBER, 
	"OUTID" VARCHAR2(20), 
	 CONSTRAINT "PK_REC_CITY_BANKREC" PRIMARY KEY ("BANKRECNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 9437184 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_bankrec is '银行圈存记录表'
/
comment on column rec_city_bankrec.bankrecno is '发送给银行的我方流水(yyyymmdd+5或6位lsh)'
/
comment on column rec_city_bankrec.customerid is '客户账号'
/
comment on column rec_city_bankrec.opdt is '操作日期'
/
comment on column rec_city_bankrec.preoddfare is '以往余额，不准确，批量圈存时，存的是账本表信息，实时交易存的是账本表信息'
/
comment on column rec_city_bankrec.preopcount is '以往操作计数，不准确，规则同preoddfare'
/
comment on column rec_city_bankrec.oddfare is '卡余额'
/
comment on column rec_city_bankrec.opcount is '卡操作计数'
/
comment on column rec_city_bankrec.cardsn is '持卡序号'
/
comment on column rec_city_bankrec.opfare is '对银行交易额'
/
comment on column rec_city_bankrec.footdt is '交易发起时本地日期'
/
comment on column rec_city_bankrec.fixfootdt is '最后修正帐务日期即第三方帐务日期'
/
comment on column rec_city_bankrec.bankcardno is '银行卡号[第三方对接复用为cardno]'
/
comment on column rec_city_bankrec.banktradeno is '银行交易号'
/
comment on column rec_city_bankrec.bankret is '银行原始返回值'
/
comment on column rec_city_bankrec.bankretdesc is '银行原始返回值的描述'
/
comment on column rec_city_bankrec.bankdz is '银行对帐(0-默认值，原始状态4帐务日期差异,5学校单边帐,6银行单边帐,7对帐金额不一致,8补帐记录,9对帐成功记录)'
/
comment on column rec_city_bankrec.acccode is '业务代码,见rec_cust_dbacc表'
/
comment on column rec_city_bankrec.termid is '终端id'
/
comment on column rec_city_bankrec.termtradeno is '终端流水号(yyyymmdd+6位lsh)'
/
comment on column rec_city_bankrec.tradestatus is '写卡状态(0:原始状态；1：成功；51-99：跟踪信息，终端错误信息)'
/
comment on column rec_city_bankrec.succed is '交易状态(=0申请,=1成功,=2对帐成功,=3失败,=4冲正,=5冲正成功,=6冲正失败)，只使用前四种状态0、1、2、3'
/
comment on column rec_city_bankrec.sn is '领款计划表中的sn'
/
comment on column rec_city_bankrec.bankpch is '批次号'
/
comment on column rec_city_bankrec.qctype is '圈存类型：0：圈存机，1：电话银行，2：网上银行，3：批量圈存，4：对接app 电子钱包圈存，8：对接app,次卡钱包圈存，9：对接app，月票钱包圈存'
/
comment on column rec_city_bankrec.bzinfo is '电话号码或ip地址'
/
comment on column rec_city_bankrec.coudate is '圈款统计日期'
/
comment on column rec_city_bankrec.customerunitcode is '客户代码'
/
comment on column rec_city_bankrec.empid is '职员帐号'
/
comment on column rec_city_bankrec.outid is '卡面号'
/


  CREATE TABLE "CCENSE"."REC_CITY_ERRORDEAL_AD" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ADJUSTSERNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"OLDACCOUNTDATE" DATE NOT NULL ENABLE, 
	"OLDCASISERNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"OLDACQUIRESERNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"OLDACQUIREDATE" DATE NOT NULL ENABLE, 
	"OLDSEARCHNUMBER" VARCHAR2(12) NOT NULL ENABLE, 
	"OLDTRANSACTIONCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"ADJUSTMENTTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OWNERCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"RECEIVECITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"SENDCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"SPONSORCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"CONFIRMCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"TRANSACTIONTYPE" VARCHAR2(4), 
	"MCC" VARCHAR2(4) NOT NULL ENABLE, 
	"CHANNELTYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REASONCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"RESULTCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"ERRORCODE" VARCHAR2(6) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	"ERRORPOUNDAGE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"POUNDAGE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MAKECARDFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACQUIREFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"RESERVEDDOMAIN" VARCHAR2(40) NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPDATEDATE" DATE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35) NOT NULL ENABLE, 
	"ADCONTENT" VARCHAR2(400) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_ERORDEAL_AD" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_errordeal_ad is '差错处理保存部里下发的ad文件数据'
/
comment on column rec_city_errordeal_ad.cstaccfc is '流水号'
/
comment on column rec_city_errordeal_ad.status is '差错ad数据是否已处理 0初始状态 1已处理'
/
comment on column rec_city_errordeal_ad.adjustsernum is '清分结算机构调整交易流水号'
/
comment on column rec_city_errordeal_ad.oldaccountdate is '原消费交易清分结算机构结算日期'
/
comment on column rec_city_errordeal_ad.oldcasisernum is '原消费交易清分结算机构流水号'
/
comment on column rec_city_errordeal_ad.oldacquiresernum is '原消费交易收单机构流水号'
/
comment on column rec_city_errordeal_ad.oldacquiredate is '原消费交易收单机构受理日期'
/
comment on column rec_city_errordeal_ad.oldsearchnumber is '原消费交易检索参考号'
/
comment on column rec_city_errordeal_ad.oldtransactioncode is '原交易交易类型'
/
comment on column rec_city_errordeal_ad.adjustmenttype is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款)'
/
comment on column rec_city_errordeal_ad.cardno is '卡号'
/
comment on column rec_city_errordeal_ad.ownercitycode is '发卡机构代码'
/
comment on column rec_city_errordeal_ad.receivecitycode is '接收机构代码,发卡地的顶级单位'
/
comment on column rec_city_errordeal_ad.tradecitycode is '收单机构标代码'
/
comment on column rec_city_errordeal_ad.sendcitycode is '发送机构代码代码，交易发生地的顶级单位'
/
comment on column rec_city_errordeal_ad.sponsorcitycode is '差错发起方机构代码'
/
comment on column rec_city_errordeal_ad.confirmcitycode is '确认方机构代码'
/
comment on column rec_city_errordeal_ad.opcount is '卡消费计数器'
/
comment on column rec_city_errordeal_ad.electronoddfare is '消费前卡余额'
/
comment on column rec_city_errordeal_ad.electronopfare is '调整后交易金额'
/
comment on column rec_city_errordeal_ad.transactiontype is '调整后交易类型'
/
comment on column rec_city_errordeal_ad.mcc is 'mcc'
/
comment on column rec_city_errordeal_ad.channeltype is '渠道类型 '
/
comment on column rec_city_errordeal_ad.opdt is '交易时间'
/
comment on column rec_city_errordeal_ad.testflag is '测试标志'
/
comment on column rec_city_errordeal_ad.reasoncode is '原因码'
/
comment on column rec_city_errordeal_ad.resultcode is '回复码'
/
comment on column rec_city_errordeal_ad.errorcode is '错误码'
/
comment on column rec_city_errordeal_ad.describe is '错误代码描述'
/
comment on column rec_city_errordeal_ad.errorpoundage is '差错手续费'
/
comment on column rec_city_errordeal_ad.poundage is '手续费'
/
comment on column rec_city_errordeal_ad.makecardfenrun is '发卡分润'
/
comment on column rec_city_errordeal_ad.acquirefenrun is '收单分润'
/
comment on column rec_city_errordeal_ad.reserveddomain is '预留字段'
/
comment on column rec_city_errordeal_ad.uploaddate is '上传时间'
/
comment on column rec_city_errordeal_ad.updatedate is '修改时间'
/
comment on column rec_city_errordeal_ad.filecreatedate is '文件创建时间'
/
comment on column rec_city_errordeal_ad.customerunitcode is '客户代码'
/
comment on column rec_city_errordeal_ad.filename is '文件名称'
/
comment on column rec_city_errordeal_ad.adcontent is '流水号'
/


  CREATE TABLE "CCENSE"."REC_CITY_ERRORDEAL_ED" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALRESULT" VARCHAR2(6), 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"CASISERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIRERSERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIRERDATE" DATE NOT NULL ENABLE, 
	"SEARCHNUMBER" VARCHAR2(12) NOT NULL ENABLE, 
	"ADJUSTMENTTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ERRORTYPE" VARCHAR2(4) DEFAULT '0000' NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"TRANSACTIONTYPE" VARCHAR2(4), 
	"MCC" VARCHAR2(4) NOT NULL ENABLE, 
	"CHANNELTYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REASONCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"SPONSORCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"OWNERCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPDATEDATE" DATE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35) NOT NULL ENABLE, 
	"EDCONTENT" VARCHAR2(400) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_ERORDEAL_ED" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_errordeal_ed is '差错处理存储部里下发的差错文件（交通部下发原始文件）'
/
comment on column rec_city_errordeal_ed.cstaccfc is '流水号'
/
comment on column rec_city_errordeal_ed.status is '差错处理状态 0初始状态 1已经处理'
/
comment on column rec_city_errordeal_ed.dealresult is '差错最终处理结果 '
/
comment on column rec_city_errordeal_ed.accountdate is '清算中心结算日期'
/
comment on column rec_city_errordeal_ed.casiserialnum is '清算中心流水号'
/
comment on column rec_city_errordeal_ed.acquirerserialnum is '收单机构流水号'
/
comment on column rec_city_errordeal_ed.acquirerdate is '收单机构受理日期'
/
comment on column rec_city_errordeal_ed.searchnumber is '交易检索参考号'
/
comment on column rec_city_errordeal_ed.adjustmenttype is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款)'
/
comment on column rec_city_errordeal_ed.errortype is '差错类型 0000初始状态 其他参考ed文件'
/
comment on column rec_city_errordeal_ed.cardno is '卡片序列号'
/
comment on column rec_city_errordeal_ed.opcount is '卡消费计数器'
/
comment on column rec_city_errordeal_ed.electronoddfare is '消费前卡余额'
/
comment on column rec_city_errordeal_ed.electronopfare is '调整后交易金额'
/
comment on column rec_city_errordeal_ed.transactiontype is '调整后交易类型'
/
comment on column rec_city_errordeal_ed.mcc is 'mcc'
/
comment on column rec_city_errordeal_ed.channeltype is '渠道类型'
/
comment on column rec_city_errordeal_ed.opdt is '交易时间'
/
comment on column rec_city_errordeal_ed.testflag is '测试标志'
/
comment on column rec_city_errordeal_ed.reasoncode is '原因码'
/
comment on column rec_city_errordeal_ed.sponsorcitycode is '差错发起方机构代码'
/
comment on column rec_city_errordeal_ed.ownercitycode is '发卡机构标识码'
/
comment on column rec_city_errordeal_ed.tradecitycode is '收单机构标识码'
/
comment on column rec_city_errordeal_ed.uploaddate is '上传时间'
/
comment on column rec_city_errordeal_ed.updatedate is '修改时间'
/
comment on column rec_city_errordeal_ed.filecreatedate is '文件创建时间'
/
comment on column rec_city_errordeal_ed.customerunitcode is '客户代码'
/
comment on column rec_city_errordeal_ed.filename is '文件名称'
/
comment on column rec_city_errordeal_ed.edcontent is '单个差错文件内容'
/


  CREATE TABLE "CCENSE"."REC_CITY_LOCALCARDCONSUME" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30), 
	"CARDSN" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER, 
	"ELECTRDUMMYOPFARE" NUMBER, 
	"CARDASN" NUMBER, 
	"TRADECITYCODE" VARCHAR2(12), 
	"OWNERCITYCODE" VARCHAR2(12), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(12), 
	"COLLECTPOINT" VARCHAR2(8), 
	"ACCOUNTDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	"FLEEPOSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"SAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35), 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CITY_LOCALCARDCONSUME" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 109051904 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 655360 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_localcardconsume is '互联互通本地卡异地消费记录'
/
comment on column rec_city_localcardconsume.cstaccfc is '流水号'
/
comment on column rec_city_localcardconsume.customerid is '账号'
/
comment on column rec_city_localcardconsume.cardno is '卡号'
/
comment on column rec_city_localcardconsume.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_city_localcardconsume.opdt is '交易时间'
/
comment on column rec_city_localcardconsume.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_city_localcardconsume.electronoddfare is '电子钱包卡余额'
/
comment on column rec_city_localcardconsume.electronopfare is '电子钱包交易金额'
/
comment on column rec_city_localcardconsume.acccode is '交易科目'
/
comment on column rec_city_localcardconsume.dscrp is '科目描述'
/
comment on column rec_city_localcardconsume.cardsn is '卡序号'
/
comment on column rec_city_localcardconsume.opcount is '卡操作计数'
/
comment on column rec_city_localcardconsume.dealtype is '记录类型 1：正常 2：灰色 3：mac错误...'
/
comment on column rec_city_localcardconsume.collectdt is '采集时间'
/
comment on column rec_city_localcardconsume.uploaddate is '上传时间'
/
comment on column rec_city_localcardconsume.busid is '车辆编号'
/
comment on column rec_city_localcardconsume.driverid is '司机id'
/
comment on column rec_city_localcardconsume.poscode is '设备运营唯一编号'
/
comment on column rec_city_localcardconsume.samcardno is 'sam卡号'
/
comment on column rec_city_localcardconsume.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_city_localcardconsume.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_city_localcardconsume.tac is 'tac验证码'
/
comment on column rec_city_localcardconsume.samtradeno is 'sam卡交易流水号'
/
comment on column rec_city_localcardconsume.buslineid is '线路编号'
/
comment on column rec_city_localcardconsume.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_city_localcardconsume.discount is '打折金额'
/
comment on column rec_city_localcardconsume.tradetype is '交易应用类型 1：电子钱包充值 2：月票充值'
/
comment on column rec_city_localcardconsume.linedept is '线路所属部门'
/
comment on column rec_city_localcardconsume.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_city_localcardconsume.electrdummyopfare is '电子钱包虚冲撤销金额'
/
comment on column rec_city_localcardconsume.cardasn is '卡应用号'
/
comment on column rec_city_localcardconsume.tradecitycode is '交易地城市代码'
/
comment on column rec_city_localcardconsume.ownercitycode is '所属地城市代码'
/
comment on column rec_city_localcardconsume.maincardtype is '主卡类型'
/
comment on column rec_city_localcardconsume.assocardtype is '子卡类型'
/
comment on column rec_city_localcardconsume.cardversion is '卡内版本'
/
comment on column rec_city_localcardconsume.tradekind is '交易性质'
/
comment on column rec_city_localcardconsume.testflag is '测试标记'
/
comment on column rec_city_localcardconsume.operatorpoint is '营运单位编号'
/
comment on column rec_city_localcardconsume.collectpoint is '采集点编号'
/
comment on column rec_city_localcardconsume.accountdate is '结算日期'
/
comment on column rec_city_localcardconsume.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_city_localcardconsume.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_city_localcardconsume.fleeposcode is '分段计费-逃票设备唯一编号（此处指代的逃票的车辆编号）'
/
comment on column rec_city_localcardconsume.upstopid is '分段计费-上车站点编号'
/
comment on column rec_city_localcardconsume.downstopid is '分段计费-下车站点编号'
/
comment on column rec_city_localcardconsume.customerunitcode is '客户代码'
/
comment on column rec_city_localcardconsume.wallettype is '钱包类型  1电子钱包  2电子现金'
/
comment on column rec_city_localcardconsume.saveopcount is '充值计数'
/
comment on column rec_city_localcardconsume.settlementdate is '清算日期'
/
comment on column rec_city_localcardconsume.filecreatedate is '文件创建日期'
/
comment on column rec_city_localcardconsume.filename is '文件名称'
/
comment on column rec_city_localcardconsume.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CITY_LOCALCARDCONSUME_BAK" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"TRADERECNO" NUMBER NOT NULL ENABLE, 
	"TAC" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER, 
	"ELECTRDUMMYOPFARE" NUMBER, 
	"CARDASN" NUMBER, 
	"TRADECITYCODE" VARCHAR2(12), 
	"OWNERCITYCODE" VARCHAR2(12), 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER NOT NULL ENABLE, 
	"TRADEKIND" NUMBER NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(12), 
	"COLLECTPOINT" VARCHAR2(8), 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER NOT NULL ENABLE, 
	"FLAG" NUMBER, 
	"FLEEPOSCODE" NUMBER NOT NULL ENABLE, 
	"UPSTOPID" NUMBER NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"SAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE NOT NULL ENABLE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35), 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_localcardconsume_bak is ''
/
comment on column rec_city_localcardconsume_bak.cstaccfc is ''
/
comment on column rec_city_localcardconsume_bak.customerid is ''
/
comment on column rec_city_localcardconsume_bak.cardno is ''
/
comment on column rec_city_localcardconsume_bak.cardtype is ''
/
comment on column rec_city_localcardconsume_bak.opdt is ''
/
comment on column rec_city_localcardconsume_bak.sumelectraddfare is ''
/
comment on column rec_city_localcardconsume_bak.electronoddfare is ''
/
comment on column rec_city_localcardconsume_bak.electronopfare is ''
/
comment on column rec_city_localcardconsume_bak.acccode is ''
/
comment on column rec_city_localcardconsume_bak.dscrp is ''
/
comment on column rec_city_localcardconsume_bak.cardsn is ''
/
comment on column rec_city_localcardconsume_bak.opcount is ''
/
comment on column rec_city_localcardconsume_bak.dealtype is ''
/
comment on column rec_city_localcardconsume_bak.collectdt is ''
/
comment on column rec_city_localcardconsume_bak.uploaddate is ''
/
comment on column rec_city_localcardconsume_bak.busid is ''
/
comment on column rec_city_localcardconsume_bak.driverid is ''
/
comment on column rec_city_localcardconsume_bak.poscode is ''
/
comment on column rec_city_localcardconsume_bak.samcardno is ''
/
comment on column rec_city_localcardconsume_bak.cardkind is ''
/
comment on column rec_city_localcardconsume_bak.traderecno is ''
/
comment on column rec_city_localcardconsume_bak.tac is ''
/
comment on column rec_city_localcardconsume_bak.samtradeno is ''
/
comment on column rec_city_localcardconsume_bak.buslineid is ''
/
comment on column rec_city_localcardconsume_bak.totalrecno is ''
/
comment on column rec_city_localcardconsume_bak.discount is ''
/
comment on column rec_city_localcardconsume_bak.tradetype is ''
/
comment on column rec_city_localcardconsume_bak.linedept is ''
/
comment on column rec_city_localcardconsume_bak.repealempid is ''
/
comment on column rec_city_localcardconsume_bak.electrdummyopfare is ''
/
comment on column rec_city_localcardconsume_bak.cardasn is ''
/
comment on column rec_city_localcardconsume_bak.tradecitycode is ''
/
comment on column rec_city_localcardconsume_bak.ownercitycode is ''
/
comment on column rec_city_localcardconsume_bak.maincardtype is ''
/
comment on column rec_city_localcardconsume_bak.assocardtype is ''
/
comment on column rec_city_localcardconsume_bak.cardversion is ''
/
comment on column rec_city_localcardconsume_bak.tradekind is ''
/
comment on column rec_city_localcardconsume_bak.testflag is ''
/
comment on column rec_city_localcardconsume_bak.operatorpoint is ''
/
comment on column rec_city_localcardconsume_bak.collectpoint is ''
/
comment on column rec_city_localcardconsume_bak.accountdate is ''
/
comment on column rec_city_localcardconsume_bak.recordtype is ''
/
comment on column rec_city_localcardconsume_bak.flag is ''
/
comment on column rec_city_localcardconsume_bak.fleeposcode is ''
/
comment on column rec_city_localcardconsume_bak.upstopid is ''
/
comment on column rec_city_localcardconsume_bak.downstopid is ''
/
comment on column rec_city_localcardconsume_bak.customerunitcode is ''
/
comment on column rec_city_localcardconsume_bak.wallettype is ''
/
comment on column rec_city_localcardconsume_bak.saveopcount is ''
/
comment on column rec_city_localcardconsume_bak.settlementdate is ''
/
comment on column rec_city_localcardconsume_bak.filecreatedate is ''
/
comment on column rec_city_localcardconsume_bak.filename is ''
/
comment on column rec_city_localcardconsume_bak.outid is ''
/


  CREATE TABLE "CCENSE"."REC_CITY_LOCALCARDCONSUME_CL" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"STATUS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" VARCHAR2(20), 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPDATEDATE" DATE, 
	"WALLETTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CASISERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIRERSERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIREDATE" DATE NOT NULL ENABLE, 
	"SEARCHNUMBER" VARCHAR2(12) NOT NULL ENABLE, 
	"TRADECODE" VARCHAR2(4) NOT NULL ENABLE, 
	"OPERATORFLAG" VARCHAR2(11) NOT NULL ENABLE, 
	"OPERATORCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"OWNERCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"ACCEPTCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"SPONSORCITYFLAG" VARCHAR2(11) NOT NULL ENABLE, 
	"MCC" VARCHAR2(4) NOT NULL ENABLE, 
	"CHANNELTYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"BALANCETYPE" NUMBER(*,0) NOT NULL ENABLE, 
	"ERRORCODE" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EXTENTVALUE" VARCHAR2(28), 
	"CLTEXT" VARCHAR2(1000), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"POUNDAGE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MAKECARDFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACQUIREFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ADFILENAME" VARCHAR2(35), 
	"ERRORDEALSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ADJUSTMENTTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ERRORTYPE" VARCHAR2(10) DEFAULT '0000' NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REASONCODE" VARCHAR2(10) DEFAULT '0000' NOT NULL ENABLE, 
	 CONSTRAINT "PK_CITY_LOCALCARDCONSUME_CL" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 109051904 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_localcardconsume_cl is '互联互通本地卡异地消费记录（原始文件）'
/
comment on column rec_city_localcardconsume_cl.cstaccfc is '流水号'
/
comment on column rec_city_localcardconsume_cl.customerid is '账号'
/
comment on column rec_city_localcardconsume_cl.filecreatedate is '文件创建日期'
/
comment on column rec_city_localcardconsume_cl.filename is '文件名称'
/
comment on column rec_city_localcardconsume_cl.accountdate is '清分结算机构清算日期'
/
comment on column rec_city_localcardconsume_cl.status is '0 未处理 1已处理'
/
comment on column rec_city_localcardconsume_cl.dealtype is '记录类型0：初始化状态  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_city_localcardconsume_cl.uploaddate is '上传时间'
/
comment on column rec_city_localcardconsume_cl.updatedate is ''
/
comment on column rec_city_localcardconsume_cl.wallettype is ''
/
comment on column rec_city_localcardconsume_cl.casiserialnum is '清分结算机构流水号'
/
comment on column rec_city_localcardconsume_cl.acquirerserialnum is '收单机构流水号'
/
comment on column rec_city_localcardconsume_cl.acquiredate is '收单机构受理日期'
/
comment on column rec_city_localcardconsume_cl.searchnumber is '检索参考号'
/
comment on column rec_city_localcardconsume_cl.tradecode is '交易代码'
/
comment on column rec_city_localcardconsume_cl.operatorflag is '收单机构标识码'
/
comment on column rec_city_localcardconsume_cl.operatorcode is '收单机构标代码'
/
comment on column rec_city_localcardconsume_cl.ownercitycode is '发卡地通卡公司代码'
/
comment on column rec_city_localcardconsume_cl.acceptcode is '接收清算机构代码 '
/
comment on column rec_city_localcardconsume_cl.sponsorcityflag is '发送机构标识码'
/
comment on column rec_city_localcardconsume_cl.mcc is ' mcc'
/
comment on column rec_city_localcardconsume_cl.channeltype is '渠道类型'
/
comment on column rec_city_localcardconsume_cl.cardno is '卡片序列号'
/
comment on column rec_city_localcardconsume_cl.opcount is '卡消费计数器'
/
comment on column rec_city_localcardconsume_cl.electronoddfare is '电子钱包卡余额'
/
comment on column rec_city_localcardconsume_cl.electronopfare is '交易金额'
/
comment on column rec_city_localcardconsume_cl.opdt is '交易日期'
/
comment on column rec_city_localcardconsume_cl.balancetype is '余额类型'
/
comment on column rec_city_localcardconsume_cl.errorcode is '错误代码'
/
comment on column rec_city_localcardconsume_cl.describe is '错误描述'
/
comment on column rec_city_localcardconsume_cl.testflag is '测试标志'
/
comment on column rec_city_localcardconsume_cl.extentvalue is '预留字段'
/
comment on column rec_city_localcardconsume_cl.cltext is '单个cl内容'
/
comment on column rec_city_localcardconsume_cl.customerunitcode is '客户代码'
/
comment on column rec_city_localcardconsume_cl.poundage is '手续费'
/
comment on column rec_city_localcardconsume_cl.makecardfenrun is '发卡分润'
/
comment on column rec_city_localcardconsume_cl.acquirefenrun is '收单分润'
/
comment on column rec_city_localcardconsume_cl.adfilename is '差错处理最终文件ad的文件名称'
/
comment on column rec_city_localcardconsume_cl.errordealstatus is '当前数据是否进行差错处理的状态 0处理状态 1正在进行差错处理'
/
comment on column rec_city_localcardconsume_cl.adjustmenttype is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款）'
/
comment on column rec_city_localcardconsume_cl.errortype is '差错类型 0000初始状态 其他参考ed文件'
/
comment on column rec_city_localcardconsume_cl.ver is '进行差错处理的版本号'
/
comment on column rec_city_localcardconsume_cl.reasoncode is '原因码 0000初始状态 其他参考ed文件'
/


  CREATE TABLE "CCENSE"."REC_CITY_LOCALCARDCONSUME_CQ" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(12), 
	"OWNERCITYCODE" VARCHAR2(12), 
	"OPERATORPOINT" VARCHAR2(12), 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"APPKEY" VARCHAR2(20), 
	"EXTENTVALUE" VARCHAR2(1000), 
	"SETTLEMENTDATE" DATE NOT NULL ENABLE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"UPDATEDATE" DATE, 
	"SEARCHNUMBER" VARCHAR2(12), 
	"BUSINESSTYPE" VARCHAR2(4), 
	"CARDASN" VARCHAR2(20), 
	"TRADETYPE" VARCHAR2(2), 
	"STATUS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"ORIGINALTRADE" VARCHAR2(23), 
	"UNIONTERMID" VARCHAR2(20), 
	"FILENAME" VARCHAR2(35), 
	"CASISERIALNUMBER" VARCHAR2(15), 
	"TRADETRANSDATE" VARCHAR2(10), 
	"ERRORCODE" VARCHAR2(30), 
	"DESCRIBE" VARCHAR2(200), 
	 CONSTRAINT "PK_CITY_LOCALCARDCONSUME_CQ" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_localcardconsume_cq is '互联互通本地卡异地消费记录（原始文件）'
/
comment on column rec_city_localcardconsume_cq.cstaccfc is '流水号'
/
comment on column rec_city_localcardconsume_cq.customerid is '账号'
/
comment on column rec_city_localcardconsume_cq.cardno is '卡号'
/
comment on column rec_city_localcardconsume_cq.opdt is '交易时间'
/
comment on column rec_city_localcardconsume_cq.electronoddfare is '电子钱包卡余额'
/
comment on column rec_city_localcardconsume_cq.electronopfare is '电子钱包交易金额'
/
comment on column rec_city_localcardconsume_cq.opcount is '卡操作计数'
/
comment on column rec_city_localcardconsume_cq.dealtype is '记录类型0：初始化状态  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_city_localcardconsume_cq.uploaddate is '上传时间'
/
comment on column rec_city_localcardconsume_cq.samcardno is 'sam卡号'
/
comment on column rec_city_localcardconsume_cq.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_city_localcardconsume_cq.tac is 'tac验证码'
/
comment on column rec_city_localcardconsume_cq.samtradeno is 'sam卡交易流水号'
/
comment on column rec_city_localcardconsume_cq.tradecitycode is '交易地城市代码'
/
comment on column rec_city_localcardconsume_cq.ownercitycode is '所属地城市代码'
/
comment on column rec_city_localcardconsume_cq.operatorpoint is '营运单位编号'
/
comment on column rec_city_localcardconsume_cq.accountdate is '结算日期'
/
comment on column rec_city_localcardconsume_cq.customerunitcode is '客户代码'
/
comment on column rec_city_localcardconsume_cq.wallettype is '钱包类型  1电子钱包  2电子现金'
/
comment on column rec_city_localcardconsume_cq.appkey is '应用密文'
/
comment on column rec_city_localcardconsume_cq.extentvalue is '预留字段'
/
comment on column rec_city_localcardconsume_cq.settlementdate is '清算日期'
/
comment on column rec_city_localcardconsume_cq.filecreatedate is '文件创建日期'
/
comment on column rec_city_localcardconsume_cq.updatedate is '入一卡通账时间'
/
comment on column rec_city_localcardconsume_cq.searchnumber is '检索参考号'
/
comment on column rec_city_localcardconsume_cq.businesstype is '商户类型'
/
comment on column rec_city_localcardconsume_cq.cardasn is '卡片序列号'
/
comment on column rec_city_localcardconsume_cq.tradetype is '交易类型标识'
/
comment on column rec_city_localcardconsume_cq.status is '0 未处理 1已处理'
/
comment on column rec_city_localcardconsume_cq.originaltrade is '原始交易信息'
/
comment on column rec_city_localcardconsume_cq.uniontermid is '终端机编号'
/
comment on column rec_city_localcardconsume_cq.filename is '文件名'
/
comment on column rec_city_localcardconsume_cq.casiserialnumber is '清分机构交易流水号'
/
comment on column rec_city_localcardconsume_cq.tradetransdate is '交易传输时间'
/
comment on column rec_city_localcardconsume_cq.errorcode is '部里处理清算结果错误代码'
/
comment on column rec_city_localcardconsume_cq.describe is '部里处理清算结果描述'
/


  CREATE TABLE "CCENSE"."REC_CITY_NOLOCALCARDCONSUME_FB" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CASISERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIRERSERIALNUM" VARCHAR2(12) NOT NULL ENABLE, 
	"ACQUIREACCEPTDATE" DATE NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"SEARCHNUMBER" VARCHAR2(12) NOT NULL ENABLE, 
	"STATUS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" VARCHAR2(20), 
	"ERRORCODE" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRIBE" VARCHAR2(200) NOT NULL ENABLE, 
	"TRANSCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"OPERATORFLAG" VARCHAR2(11) NOT NULL ENABLE, 
	"OWNERCITYCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MCC" VARCHAR2(4) NOT NULL ENABLE, 
	"CHANNELTYPE" VARCHAR2(2) NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPDATEDATE" DATE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35) NOT NULL ENABLE, 
	"FBCONTENT" VARCHAR2(400) NOT NULL ENABLE, 
	"RESERVEDDOMAIN" VARCHAR2(40) NOT NULL ENABLE, 
	"OPERATORCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"SENDERCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"POUNDAGE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MAKECARDFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACQUIREFENRUN" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CITY_NOLOCALCARDCONSUME_FB" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 109051904 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 10485760 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_nolocalcardconsume_fb is '互联互通异地卡本地消费记录（交通部下发原始文件）'
/
comment on column rec_city_nolocalcardconsume_fb.cstaccfc is '流水号'
/
comment on column rec_city_nolocalcardconsume_fb.casiserialnum is '清分结算机构流水号'
/
comment on column rec_city_nolocalcardconsume_fb.acquirerserialnum is '收单机构流水号'
/
comment on column rec_city_nolocalcardconsume_fb.acquireacceptdate is '收单机构受理日期'
/
comment on column rec_city_nolocalcardconsume_fb.accountdate is '清分结算机构清算日期'
/
comment on column rec_city_nolocalcardconsume_fb.searchnumber is '检索参考号'
/
comment on column rec_city_nolocalcardconsume_fb.status is '0 未处理 1已处理'
/
comment on column rec_city_nolocalcardconsume_fb.dealtype is '记录类型0：初始化状态  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_city_nolocalcardconsume_fb.errorcode is '错误代码'
/
comment on column rec_city_nolocalcardconsume_fb.describe is '错误描述'
/
comment on column rec_city_nolocalcardconsume_fb.transcode is '交易代码'
/
comment on column rec_city_nolocalcardconsume_fb.operatorflag is '收单机构标识码'
/
comment on column rec_city_nolocalcardconsume_fb.ownercitycode is '发卡地发卡机构代码'
/
comment on column rec_city_nolocalcardconsume_fb.electronoddfare is '电子钱包卡余额'
/
comment on column rec_city_nolocalcardconsume_fb.electronopfare is '交易金额'
/
comment on column rec_city_nolocalcardconsume_fb.mcc is ' mcc'
/
comment on column rec_city_nolocalcardconsume_fb.channeltype is '渠道类型'
/
comment on column rec_city_nolocalcardconsume_fb.cardno is '卡片序列号'
/
comment on column rec_city_nolocalcardconsume_fb.opcount is '卡消费计数器'
/
comment on column rec_city_nolocalcardconsume_fb.opdt is '交易日期'
/
comment on column rec_city_nolocalcardconsume_fb.wallettype is '钱包类型'
/
comment on column rec_city_nolocalcardconsume_fb.testflag is '测试标志'
/
comment on column rec_city_nolocalcardconsume_fb.uploaddate is '上传时间'
/
comment on column rec_city_nolocalcardconsume_fb.updatedate is '入一卡通账时间'
/
comment on column rec_city_nolocalcardconsume_fb.filecreatedate is '文件创建日期'
/
comment on column rec_city_nolocalcardconsume_fb.customerunitcode is '客户代码'
/
comment on column rec_city_nolocalcardconsume_fb.filename is '文件名称'
/
comment on column rec_city_nolocalcardconsume_fb.fbcontent is '单个fb内容'
/
comment on column rec_city_nolocalcardconsume_fb.reserveddomain is '预留字段'
/
comment on column rec_city_nolocalcardconsume_fb.operatorcode is '收单机构代码'
/
comment on column rec_city_nolocalcardconsume_fb.sendercode is '发送机构代码'
/
comment on column rec_city_nolocalcardconsume_fb.poundage is '手续费'
/
comment on column rec_city_nolocalcardconsume_fb.makecardfenrun is '发卡分润'
/
comment on column rec_city_nolocalcardconsume_fb.acquirefenrun is '收单分润'
/


  CREATE TABLE "CCENSE"."REC_CITY_NONLOCALCONSUME" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(100), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDASN" NUMBER(20,0) DEFAULT 0 NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(12), 
	"OWNERCITYCODE" VARCHAR2(12), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER DEFAULT 0, 
	"CARDVERSION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(12) NOT NULL ENABLE, 
	"COLLECTPOINT" VARCHAR2(20), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSINESSTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"DEPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35), 
	"FILECREATEDATE" DATE, 
	"ACCOUNTDATE" DATE, 
	"ERRORCODE" VARCHAR2(30), 
	"ERRORDEALSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ADJUSTMENTTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ERRORTYPE" VARCHAR2(10) DEFAULT '0000' NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REASONCODE" VARCHAR2(10) DEFAULT '0000' NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_NONLOCALCONSUME" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_CITY_NONLOCALCONSUME" UNIQUE ("CARDSN", "CARDASN", "OPCOUNT", "WALLETTYPE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 983040 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 8388608 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_nonlocalconsume is '互联互通异地卡本地消费记录表（未清算）'
/
comment on column rec_city_nonlocalconsume.cstaccfc is '流水号'
/
comment on column rec_city_nonlocalconsume.customerid is '账号'
/
comment on column rec_city_nonlocalconsume.cardno is '卡号'
/
comment on column rec_city_nonlocalconsume.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_city_nonlocalconsume.wallettype is '钱包类型'
/
comment on column rec_city_nonlocalconsume.opdt is '交易时间'
/
comment on column rec_city_nonlocalconsume.oddfare is '卡余额（交易前）'
/
comment on column rec_city_nonlocalconsume.opfare is '交易金额'
/
comment on column rec_city_nonlocalconsume.acccode is '交易科目'
/
comment on column rec_city_nonlocalconsume.dscrp is '科目描述'
/
comment on column rec_city_nonlocalconsume.cardsn is '卡序号'
/
comment on column rec_city_nonlocalconsume.opcount is '卡操作计数（交易前）'
/
comment on column rec_city_nonlocalconsume.dealtype is '记录类型0：初始化状态  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_city_nonlocalconsume.collectdt is '采集时间'
/
comment on column rec_city_nonlocalconsume.uploaddate is '上传时间'
/
comment on column rec_city_nonlocalconsume.busid is '车辆编号'
/
comment on column rec_city_nonlocalconsume.driverid is '司机id'
/
comment on column rec_city_nonlocalconsume.poscode is '设备运营唯一编号'
/
comment on column rec_city_nonlocalconsume.samcardno is 'sam卡号'
/
comment on column rec_city_nonlocalconsume.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_city_nonlocalconsume.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_city_nonlocalconsume.tac is 'tac验证码'
/
comment on column rec_city_nonlocalconsume.samtradeno is 'sam卡交易流水号'
/
comment on column rec_city_nonlocalconsume.buslineid is '线路编号'
/
comment on column rec_city_nonlocalconsume.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_city_nonlocalconsume.discount is '打折金额'
/
comment on column rec_city_nonlocalconsume.tradetype is '交易应用类型 1：电子钱包充值 2：月票充值'
/
comment on column rec_city_nonlocalconsume.linedept is '线路所属部门'
/
comment on column rec_city_nonlocalconsume.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_city_nonlocalconsume.cardasn is '卡应用序列号'
/
comment on column rec_city_nonlocalconsume.tradecitycode is '交易地城市代码'
/
comment on column rec_city_nonlocalconsume.ownercitycode is '所属地城市代码'
/
comment on column rec_city_nonlocalconsume.maincardtype is '主卡类型'
/
comment on column rec_city_nonlocalconsume.assocardtype is '子卡类型'
/
comment on column rec_city_nonlocalconsume.cardversion is '卡内版本'
/
comment on column rec_city_nonlocalconsume.tradekind is '交易性质'
/
comment on column rec_city_nonlocalconsume.testflag is '测试标记'
/
comment on column rec_city_nonlocalconsume.operatorpoint is '商户编号'
/
comment on column rec_city_nonlocalconsume.collectpoint is '采集点编号'
/
comment on column rec_city_nonlocalconsume.status is '0 未处理 1已处理'
/
comment on column rec_city_nonlocalconsume.businesstype is '交易应用类型 0：消费'
/
comment on column rec_city_nonlocalconsume.deptcode is '部门编号'
/
comment on column rec_city_nonlocalconsume.customerunitcode is '客户代码'
/
comment on column rec_city_nonlocalconsume.filename is '文件名称'
/
comment on column rec_city_nonlocalconsume.filecreatedate is '文件创建日期'
/
comment on column rec_city_nonlocalconsume.accountdate is '数据清算日期'
/
comment on column rec_city_nonlocalconsume.errorcode is '交通部处理结果errorcode'
/
comment on column rec_city_nonlocalconsume.errordealstatus is '当前数据是否进行差错处理的状态 0处理状态 1正在进行差错处理'
/
comment on column rec_city_nonlocalconsume.adjustmenttype is '调整类型 0初始状态 1贷方调整（发卡发付款） 2借方调整（发卡方收款）'
/
comment on column rec_city_nonlocalconsume.errortype is '差错类型 0000初始状态 其他参考ed文件'
/
comment on column rec_city_nonlocalconsume.ver is '进行差错处理的版本号'
/
comment on column rec_city_nonlocalconsume.reasoncode is '原因码 0000初始状态 其他参考ed文件'
/


  CREATE TABLE "CCENSE"."REC_CITY_NONLOCALRETURNINFO" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"LOCALCSTACCFC" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"TRANSFERDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"RESULTCODE" VARCHAR2(20), 
	"RESULTINFO" VARCHAR2(100), 
	"RESULTCONTENT" VARCHAR2(1000), 
	"WALLETTYPE" NUMBER, 
	"ACQUIREACCEPTDATE" DATE, 
	"MAKECARDCODE" VARCHAR2(8), 
	"FILENAME" VARCHAR2(35), 
	 CONSTRAINT "PK_REC_CITY_NONLOCALRETURNINFO" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_nonlocalreturninfo is '互联互通异地卡消费清算信息记录表'
/
comment on column rec_city_nonlocalreturninfo.cstaccfc is '流水号'
/
comment on column rec_city_nonlocalreturninfo.localcstaccfc is '原始记录流水号'
/
comment on column rec_city_nonlocalreturninfo.cardno is '卡号'
/
comment on column rec_city_nonlocalreturninfo.opdt is '交易时间'
/
comment on column rec_city_nonlocalreturninfo.oddfare is '卡余额（交易后）'
/
comment on column rec_city_nonlocalreturninfo.opfare is '交易金额'
/
comment on column rec_city_nonlocalreturninfo.acccode is '科目代码'
/
comment on column rec_city_nonlocalreturninfo.dscrp is '科目描述'
/
comment on column rec_city_nonlocalreturninfo.opcount is '卡操作计数（交易后）'
/
comment on column rec_city_nonlocalreturninfo.customerunitcode is '客户代码'
/
comment on column rec_city_nonlocalreturninfo.accountdate is '清算日期'
/
comment on column rec_city_nonlocalreturninfo.transferdate is '转储日期'
/
comment on column rec_city_nonlocalreturninfo.resultcode is '返回结果码'
/
comment on column rec_city_nonlocalreturninfo.resultinfo is '返回结果信息'
/
comment on column rec_city_nonlocalreturninfo.resultcontent is '返回原始报文'
/
comment on column rec_city_nonlocalreturninfo.wallettype is '钱包类型'
/
comment on column rec_city_nonlocalreturninfo.acquireacceptdate is '收单机构受理日期'
/
comment on column rec_city_nonlocalreturninfo.makecardcode is '发卡地发卡机构代码'
/
comment on column rec_city_nonlocalreturninfo.filename is '文件名'
/


  CREATE TABLE "CCENSE"."REC_CITY_NONLOCALSUCCESS" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"TRADERECNO" NUMBER NOT NULL ENABLE, 
	"TAC" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER NOT NULL ENABLE, 
	"CARDASN" NUMBER(20,0) NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(12), 
	"OWNERCITYCODE" VARCHAR2(12), 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER NOT NULL ENABLE, 
	"TRADEKIND" NUMBER NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(12) NOT NULL ENABLE, 
	"COLLECTPOINT" VARCHAR2(8), 
	"TRANSSTATUS" NUMBER NOT NULL ENABLE, 
	"BUSINESSTYPE" NUMBER NOT NULL ENABLE, 
	"DEPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"TRANSFERDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(35), 
	 CONSTRAINT "PK_REC_CITY_NONLOCALSUCCESS" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_CITY_NONLOCALSUCCESS" UNIQUE ("CARDASN", "OPCOUNT", "WALLETTYPE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_nonlocalsuccess is '互联互通异地卡本地消费清算成功记录表'
/
comment on column rec_city_nonlocalsuccess.cstaccfc is '流水号'
/
comment on column rec_city_nonlocalsuccess.customerid is '账号'
/
comment on column rec_city_nonlocalsuccess.cardno is '卡号'
/
comment on column rec_city_nonlocalsuccess.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_city_nonlocalsuccess.wallettype is '钱包类型'
/
comment on column rec_city_nonlocalsuccess.opdt is '交易时间'
/
comment on column rec_city_nonlocalsuccess.oddfare is '卡余额（交易后）'
/
comment on column rec_city_nonlocalsuccess.opfare is '交易金额'
/
comment on column rec_city_nonlocalsuccess.acccode is '交易科目'
/
comment on column rec_city_nonlocalsuccess.dscrp is '科目描述'
/
comment on column rec_city_nonlocalsuccess.cardsn is '卡序号'
/
comment on column rec_city_nonlocalsuccess.opcount is '卡操作计数（交易后）'
/
comment on column rec_city_nonlocalsuccess.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_city_nonlocalsuccess.collectdt is '采集时间'
/
comment on column rec_city_nonlocalsuccess.uploaddate is '上传时间'
/
comment on column rec_city_nonlocalsuccess.busid is '车辆编号'
/
comment on column rec_city_nonlocalsuccess.driverid is '司机id'
/
comment on column rec_city_nonlocalsuccess.poscode is '设备运营唯一编号'
/
comment on column rec_city_nonlocalsuccess.samcardno is 'sam卡号'
/
comment on column rec_city_nonlocalsuccess.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_city_nonlocalsuccess.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_city_nonlocalsuccess.tac is 'tac验证码'
/
comment on column rec_city_nonlocalsuccess.samtradeno is 'sam卡交易流水号'
/
comment on column rec_city_nonlocalsuccess.buslineid is '线路编号'
/
comment on column rec_city_nonlocalsuccess.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_city_nonlocalsuccess.discount is '打折金额'
/
comment on column rec_city_nonlocalsuccess.tradetype is '交易应用类型 1：电子钱包充值 2：月票充值'
/
comment on column rec_city_nonlocalsuccess.linedept is '线路所属部门'
/
comment on column rec_city_nonlocalsuccess.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_city_nonlocalsuccess.cardasn is '卡应用序列号'
/
comment on column rec_city_nonlocalsuccess.tradecitycode is '交易地城市代码'
/
comment on column rec_city_nonlocalsuccess.ownercitycode is '所属地城市代码'
/
comment on column rec_city_nonlocalsuccess.maincardtype is '主卡类型'
/
comment on column rec_city_nonlocalsuccess.assocardtype is '子卡类型'
/
comment on column rec_city_nonlocalsuccess.cardversion is '卡内版本'
/
comment on column rec_city_nonlocalsuccess.tradekind is '交易性质'
/
comment on column rec_city_nonlocalsuccess.testflag is '测试标记'
/
comment on column rec_city_nonlocalsuccess.operatorpoint is '商户编号'
/
comment on column rec_city_nonlocalsuccess.collectpoint is '采集点编号'
/
comment on column rec_city_nonlocalsuccess.transstatus is '对账上传标识，0初始状态，1已对账'
/
comment on column rec_city_nonlocalsuccess.businesstype is '交易应用类型 0：消费'
/
comment on column rec_city_nonlocalsuccess.deptcode is '部门编号'
/
comment on column rec_city_nonlocalsuccess.customerunitcode is '客户代码'
/
comment on column rec_city_nonlocalsuccess.accountdate is '结算日期'
/
comment on column rec_city_nonlocalsuccess.transferdate is '转储日期'
/
comment on column rec_city_nonlocalsuccess.filecreatedate is '文件创建日期'
/
comment on column rec_city_nonlocalsuccess.filename is '文件名'
/


  CREATE TABLE "CCENSE"."REC_CITY_SAFELIST" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MAKECARDCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"CARDIIN" VARCHAR2(10), 
	"VER" NUMBER DEFAULT 0, 
	"STATUS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"BATNUMBER" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CITY_SAFELIST" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_CITY_SAFELIST" UNIQUE ("MAKECARDCODE", "CARDIIN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_city_safelist is '交通部白名单'
/
comment on column rec_city_safelist.id is '自增长id'
/
comment on column rec_city_safelist.makecardcode is '发卡机构代码'
/
comment on column rec_city_safelist.cardiin is '卡iin'
/
comment on column rec_city_safelist.ver is '版本号'
/
comment on column rec_city_safelist.status is '状态（0白名单，1交通部黑名单,2自置黑名单）'
/
comment on column rec_city_safelist.batnumber is '批次号'
/
comment on column rec_city_safelist.opdt is '操作时间'
/
comment on column rec_city_safelist.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_COIN_INPUT" 
   (	"ID" NUMBER, 
	"ROOMCODE" VARCHAR2(9), 
	"LINEID" VARCHAR2(20), 
	"BUSID" VARCHAR2(20), 
	"SHIFTS" VARCHAR2(20), 
	"NOTES" VARCHAR2(150), 
	"COIN" VARCHAR2(150), 
	"BADRMB" VARCHAR2(150), 
	"ACCDATE" DATE, 
	"STATDATE" DATE, 
	"AUDITDATE" DATE, 
	"AUDITSTATUS" NUMBER, 
	"TOTALNO" NUMBER, 
	"TOTALMN" NUMBER, 
	"DPTCODE" VARCHAR2(9), 
	"CREATEDATE" DATE, 
	"EMPID" NUMBER, 
	"AUDIEMPID" NUMBER, 
	"SPOTCLERKID" NUMBER, 
	"CHECKERID" NUMBER, 
	 CONSTRAINT "PK_REC_COIN_ACC" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_coin_input is '投币录入详细信息表'
/
comment on column rec_coin_input.id is '主键'
/
comment on column rec_coin_input.roomcode is '点钞厅编号(部门)'
/
comment on column rec_coin_input.lineid is '线路 lineid'
/
comment on column rec_coin_input.busid is '	车号'
/
comment on column rec_coin_input.shifts is '	班次'
/
comment on column rec_coin_input.notes is '	纸币（json）'
/
comment on column rec_coin_input.coin is '硬币（json）'
/
comment on column rec_coin_input.badrmb is '残假币（json'
/
comment on column rec_coin_input.accdate is '数据日期'
/
comment on column rec_coin_input.statdate is '清点日期'
/
comment on column rec_coin_input.auditdate is '审核日期'
/
comment on column rec_coin_input.auditstatus is '入账状态 0 为入账  1已入账'
/
comment on column rec_coin_input.totalno is '合计数量'
/
comment on column rec_coin_input.totalmn is '合计金额'
/
comment on column rec_coin_input.dptcode is '线路部门'
/
comment on column rec_coin_input.createdate is '入库或最后修改时间'
/
comment on column rec_coin_input.empid is '添加人id(添加操作或者修改操作的当前登录人)'
/
comment on column rec_coin_input.audiempid is '审核人code'
/
comment on column rec_coin_input.spotclerkid is '点钞员code'
/
comment on column rec_coin_input.checkerid is '复核员id（入账操作的当前登录人）'
/


  CREATE TABLE "CCENSE"."REC_CONSUMEACC_BAD" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"CARDTYPE" NUMBER, 
	"OPDT" DATE, 
	"SUMFARE" NUMBER(10,2), 
	"ODDFARE" NUMBER(10,2), 
	"OPFARE" NUMBER(10,2), 
	"ACCCODE" NUMBER, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER, 
	"OPCOUNT" NUMBER, 
	"DEALTYPE" NUMBER, 
	"COLLECTDT" DATE DEFAULT SYSDATE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE, 
	"BUSID" VARCHAR2(10), 
	"DRIVERID" NUMBER, 
	"STAG_BAN" NUMBER, 
	"POSCODE" NUMBER, 
	"SAMCARDNO" NUMBER, 
	"CARDKIND" NUMBER, 
	"TRADERECNO" NUMBER, 
	"TAC" NUMBER, 
	"SAMTRADENO" NUMBER, 
	"WALLETTYPE" NUMBER, 
	"BADTYPE" NUMBER, 
	"BUSLINEID" NUMBER, 
	"LINEDEPTCODE" VARCHAR2(20), 
	"TOTALRECNO" NUMBER, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"CARDASN" NUMBER, 
	"TRADECITYCODE" VARCHAR2(8), 
	"OWNERCITYCODE" VARCHAR2(8), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLEEPOSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_consumeacc_bad is '消费明细坏账表'
/
comment on column rec_consumeacc_bad.cstaccfc is '流水号'
/
comment on column rec_consumeacc_bad.customerid is '账号'
/
comment on column rec_consumeacc_bad.cardno is '卡号'
/
comment on column rec_consumeacc_bad.cardtype is '当前卡卡类别,普通卡或者老年卡等等'
/
comment on column rec_consumeacc_bad.opdt is '交易时间'
/
comment on column rec_consumeacc_bad.sumfare is '卡总额，根据钱包类型判断钱包'
/
comment on column rec_consumeacc_bad.oddfare is '卡余额，根据钱包类型判断钱包'
/
comment on column rec_consumeacc_bad.opfare is '交易金额'
/
comment on column rec_consumeacc_bad.acccode is '交易科目'
/
comment on column rec_consumeacc_bad.dscrp is '科目描述'
/
comment on column rec_consumeacc_bad.cardsn is '卡序号'
/
comment on column rec_consumeacc_bad.opcount is '卡操作计数'
/
comment on column rec_consumeacc_bad.dealtype is '交易记录类型'
/
comment on column rec_consumeacc_bad.collectdt is '采集时间'
/
comment on column rec_consumeacc_bad.uploaddate is '上传时间'
/
comment on column rec_consumeacc_bad.busid is '车辆编号'
/
comment on column rec_consumeacc_bad.driverid is '司机id'
/
comment on column rec_consumeacc_bad.stag_ban is '统计标识'
/
comment on column rec_consumeacc_bad.poscode is '设备运营唯一编号'
/
comment on column rec_consumeacc_bad.samcardno is 'sam卡号'
/
comment on column rec_consumeacc_bad.cardkind is '交易卡类型 1m1卡， 2  cpu卡'
/
comment on column rec_consumeacc_bad.traderecno is 'pos交易流水号'
/
comment on column rec_consumeacc_bad.tac is 'tac验证码'
/
comment on column rec_consumeacc_bad.samtradeno is 'sam卡交易流水号'
/
comment on column rec_consumeacc_bad.wallettype is '钱包类型 1电子钱包 2 月票 3次卡'
/
comment on column rec_consumeacc_bad.badtype is '坏账类型'
/
comment on column rec_consumeacc_bad.buslineid is '线路id'
/
comment on column rec_consumeacc_bad.linedeptcode is '线路所属部门'
/
comment on column rec_consumeacc_bad.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_consumeacc_bad.tradetype is '交易应用类型'
/
comment on column rec_consumeacc_bad.discount is '折折费用'
/
comment on column rec_consumeacc_bad.cardasn is '卡应用号'
/
comment on column rec_consumeacc_bad.tradecitycode is '交易地城市代码'
/
comment on column rec_consumeacc_bad.ownercitycode is '所属地城市代码'
/
comment on column rec_consumeacc_bad.maincardtype is '主卡类型'
/
comment on column rec_consumeacc_bad.assocardtype is '子卡类型'
/
comment on column rec_consumeacc_bad.cardversion is '卡内版本'
/
comment on column rec_consumeacc_bad.tradekind is '交易性质'
/
comment on column rec_consumeacc_bad.testflag is '测试标记'
/
comment on column rec_consumeacc_bad.operatorpoint is '营运单位编号'
/
comment on column rec_consumeacc_bad.collectpoint is '采集点编号'
/
comment on column rec_consumeacc_bad.customerunitcode is '客户代码'
/
comment on column rec_consumeacc_bad.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_consumeacc_bad.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_consumeacc_bad.fleeposcode is '分段计费-逃票设备唯一编号（此处指代的逃票的车辆编号）'
/
comment on column rec_consumeacc_bad.upstopid is '分段计费-上车站点编号'
/
comment on column rec_consumeacc_bad.downstopid is '分段计费-下车站点编号'
/
comment on column rec_consumeacc_bad.status is ''
/
comment on column rec_consumeacc_bad.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CONSUMEACC_BAD_REPEAT" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"CARDTYPE" NUMBER, 
	"OPDT" DATE, 
	"SUMFARE" NUMBER(10,2), 
	"ODDFARE" NUMBER(10,2), 
	"OPFARE" NUMBER(10,2), 
	"ACCCODE" NUMBER, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER, 
	"OPCOUNT" NUMBER, 
	"DEALTYPE" NUMBER, 
	"COLLECTDT" DATE DEFAULT SYSDATE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE, 
	"BUSID" VARCHAR2(10), 
	"DRIVERID" NUMBER, 
	"STAG_BAN" NUMBER, 
	"POSCODE" NUMBER, 
	"SAMCARDNO" NUMBER, 
	"CARDKIND" NUMBER, 
	"TRADERECNO" NUMBER, 
	"TAC" NUMBER, 
	"SAMTRADENO" NUMBER, 
	"WALLETTYPE" NUMBER, 
	"BADTYPE" NUMBER, 
	"BUSLINEID" NUMBER, 
	"LINEDEPTCODE" VARCHAR2(20), 
	"TOTALRECNO" NUMBER, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(8), 
	"CARDASN" NUMBER, 
	"OWNERCITYCODE" VARCHAR2(8), 
	"MAINCARDTYPE" NUMBER, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER, 
	"TRADEKIND" NUMBER, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLEEPOSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_consumeacc_bad_repeat is '消费明细重复上传表'
/
comment on column rec_consumeacc_bad_repeat.cstaccfc is '流水号'
/
comment on column rec_consumeacc_bad_repeat.customerid is '账号'
/
comment on column rec_consumeacc_bad_repeat.cardno is '卡号'
/
comment on column rec_consumeacc_bad_repeat.cardtype is '当前卡卡类别,普通卡或者老年卡等等'
/
comment on column rec_consumeacc_bad_repeat.opdt is '交易时间'
/
comment on column rec_consumeacc_bad_repeat.sumfare is '卡总额，根据钱包类型判断钱包'
/
comment on column rec_consumeacc_bad_repeat.oddfare is '卡余额，根据钱包类型判断钱包'
/
comment on column rec_consumeacc_bad_repeat.opfare is '交易金额'
/
comment on column rec_consumeacc_bad_repeat.acccode is '交易科目'
/
comment on column rec_consumeacc_bad_repeat.dscrp is '科目描述'
/
comment on column rec_consumeacc_bad_repeat.cardsn is '卡序号'
/
comment on column rec_consumeacc_bad_repeat.opcount is '卡操作计数'
/
comment on column rec_consumeacc_bad_repeat.dealtype is '交易记录类型'
/
comment on column rec_consumeacc_bad_repeat.collectdt is '采集时间'
/
comment on column rec_consumeacc_bad_repeat.uploaddate is '上传时间'
/
comment on column rec_consumeacc_bad_repeat.busid is '车辆编号'
/
comment on column rec_consumeacc_bad_repeat.driverid is '司机id'
/
comment on column rec_consumeacc_bad_repeat.stag_ban is '统计标识'
/
comment on column rec_consumeacc_bad_repeat.poscode is '设备运营唯一编号'
/
comment on column rec_consumeacc_bad_repeat.samcardno is 'sam卡号'
/
comment on column rec_consumeacc_bad_repeat.cardkind is '交易卡类型 1m1卡， 2  cpu卡'
/
comment on column rec_consumeacc_bad_repeat.traderecno is 'pos交易流水号'
/
comment on column rec_consumeacc_bad_repeat.tac is 'tac验证码'
/
comment on column rec_consumeacc_bad_repeat.samtradeno is 'sam卡交易流水号'
/
comment on column rec_consumeacc_bad_repeat.wallettype is '钱包类型 1电子钱包 2 月票'
/
comment on column rec_consumeacc_bad_repeat.badtype is '坏账类型'
/
comment on column rec_consumeacc_bad_repeat.buslineid is '线路id'
/
comment on column rec_consumeacc_bad_repeat.linedeptcode is '线路所属部门'
/
comment on column rec_consumeacc_bad_repeat.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_consumeacc_bad_repeat.tradetype is '交易应用类型'
/
comment on column rec_consumeacc_bad_repeat.discount is '折折费用'
/
comment on column rec_consumeacc_bad_repeat.tradecitycode is '交易地城市代码'
/
comment on column rec_consumeacc_bad_repeat.cardasn is '卡应用序列号'
/
comment on column rec_consumeacc_bad_repeat.ownercitycode is '所属地城市代码'
/
comment on column rec_consumeacc_bad_repeat.maincardtype is '主卡类型'
/
comment on column rec_consumeacc_bad_repeat.assocardtype is '子卡类型'
/
comment on column rec_consumeacc_bad_repeat.cardversion is '卡内版本'
/
comment on column rec_consumeacc_bad_repeat.tradekind is '交易性质'
/
comment on column rec_consumeacc_bad_repeat.testflag is '测试标记'
/
comment on column rec_consumeacc_bad_repeat.operatorpoint is '营运单位编号'
/
comment on column rec_consumeacc_bad_repeat.collectpoint is '采集点编号'
/
comment on column rec_consumeacc_bad_repeat.customerunitcode is '客户代码'
/
comment on column rec_consumeacc_bad_repeat.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_consumeacc_bad_repeat.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_consumeacc_bad_repeat.fleeposcode is '分段计费-逃票设备唯一编号（此处指代的逃票的车辆编号）'
/
comment on column rec_consumeacc_bad_repeat.upstopid is '分段计费-上车站点编号'
/
comment on column rec_consumeacc_bad_repeat.downstopid is '分段计费-下车站点编号'
/
comment on column rec_consumeacc_bad_repeat.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CUST_CARDTYPE_CHANGE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER, 
	"CARDNO" NUMBER, 
	"CARDSN" NUMBER, 
	"EMPID" NUMBER, 
	"OPDT" DATE, 
	"OPDESC" VARCHAR2(100), 
	"ACCCODE" NUMBER, 
	"ACCDESC" VARCHAR2(30), 
	"PSAMCARDNO" NUMBER, 
	"OLDCARDTYPE" NUMBER, 
	"NEWCARDTYPE" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"OLDYEARCHECKS" NUMBER(*,0), 
	"OLDCHECKBEGINDAY" DATE, 
	"OLDCHECKENDDAY" DATE, 
	"NEWYEARCHECKS" NUMBER(*,0), 
	"NEWCHECKBEGINDAY" DATE, 
	"NEWCHECKENDDAY" DATE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_CUST_CARDTYPE_CHANGE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 983040 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_cust_cardtype_change is '卡类型转换明细'
/
comment on column rec_cust_cardtype_change.id is '编号'
/
comment on column rec_cust_cardtype_change.customerid is '账号'
/
comment on column rec_cust_cardtype_change.cardno is '卡号'
/
comment on column rec_cust_cardtype_change.cardsn is '卡序号'
/
comment on column rec_cust_cardtype_change.empid is '职员编号'
/
comment on column rec_cust_cardtype_change.opdt is '操作日期'
/
comment on column rec_cust_cardtype_change.opdesc is '操作描述'
/
comment on column rec_cust_cardtype_change.acccode is '科目代码'
/
comment on column rec_cust_cardtype_change.accdesc is '科目描述'
/
comment on column rec_cust_cardtype_change.psamcardno is 'psam卡号'
/
comment on column rec_cust_cardtype_change.oldcardtype is '老卡类型'
/
comment on column rec_cust_cardtype_change.newcardtype is '新卡类型'
/
comment on column rec_cust_cardtype_change.customerunitcode is '客户代码'
/
comment on column rec_cust_cardtype_change.oldyearchecks is '原卡类型 是否年检'
/
comment on column rec_cust_cardtype_change.oldcheckbeginday is '原年检开始时间'
/
comment on column rec_cust_cardtype_change.oldcheckendday is '原年检结束时间'
/
comment on column rec_cust_cardtype_change.newyearchecks is '新卡类型 是否年检'
/
comment on column rec_cust_cardtype_change.newcheckbeginday is '新卡类型 年检开始时间'
/
comment on column rec_cust_cardtype_change.newcheckendday is '新卡类型 年检结束时间'
/
comment on column rec_cust_cardtype_change.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_CUST_YEAR_CHECK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"STARTCHECKDATE" DATE NOT NULL ENABLE, 
	"ENDCHECKDATE" DATE NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"OPDESC" VARCHAR2(100) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"ACCDESC" VARCHAR2(30) NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"STARTCHECKDATEPRE" DATE NOT NULL ENABLE, 
	"ENDCHECKDATEPRE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"DETAILID" NUMBER, 
	"PREMIUMCOMPANY" NUMBER, 
	 CONSTRAINT "PK_REC_CUST_YEAR_CHECK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_cust_year_check is '年检明细'
/
comment on column rec_cust_year_check.id is '编号'
/
comment on column rec_cust_year_check.customerid is '账号'
/
comment on column rec_cust_year_check.cardno is '卡号'
/
comment on column rec_cust_year_check.cardsn is '卡序号'
/
comment on column rec_cust_year_check.startcheckdate is '年检后卡上开始年检时间'
/
comment on column rec_cust_year_check.endcheckdate is '年检后卡上结束年检时间'
/
comment on column rec_cust_year_check.empid is '操作职员'
/
comment on column rec_cust_year_check.opdt is '操作时间'
/
comment on column rec_cust_year_check.opdesc is '操作描述'
/
comment on column rec_cust_year_check.acccode is '操作科目'
/
comment on column rec_cust_year_check.accdesc is '操作描述'
/
comment on column rec_cust_year_check.psamcardno is 'psam卡号'
/
comment on column rec_cust_year_check.startcheckdatepre is '年检前卡上开始年检时间'
/
comment on column rec_cust_year_check.endcheckdatepre is '年检后卡上结束年检时间'
/
comment on column rec_cust_year_check.customerunitcode is '客户代码'
/
comment on column rec_cust_year_check.outid is '市民卡号'
/
comment on column rec_cust_year_check.detailid is '卡类型'
/
comment on column rec_cust_year_check.premiumcompany is '保险'
/


  CREATE TABLE "CCENSE"."REC_DRIVECARD_RECORD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DRIVERCARDNO" NUMBER NOT NULL ENABLE, 
	"DRIVERCARDSN" NUMBER NOT NULL ENABLE, 
	"OPTYPE" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"DEPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"COLLECTDT" DATE NOT NULL ENABLE, 
	"UPLOADDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"POSRECNO" NUMBER, 
	"CARDASN" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 29360128 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_drivecard_record is ''
/
comment on column rec_drivecard_record.id is '编号'
/
comment on column rec_drivecard_record.driverid is '司机编号'
/
comment on column rec_drivecard_record.poscode is ''
/
comment on column rec_drivecard_record.drivercardno is '司机卡号'
/
comment on column rec_drivecard_record.drivercardsn is '司机卡序号'
/
comment on column rec_drivecard_record.optype is '操作类型  1：签到；0：签退'
/
comment on column rec_drivecard_record.buslineid is '线路编号'
/
comment on column rec_drivecard_record.busid is '车辆编号'
/
comment on column rec_drivecard_record.opdt is '交易时间'
/
comment on column rec_drivecard_record.deptcode is '分公司'
/
comment on column rec_drivecard_record.collectdt is '采集时间'
/
comment on column rec_drivecard_record.uploaddt is '上传时间'
/
comment on column rec_drivecard_record.posrecno is 'pos记录编号'
/
comment on column rec_drivecard_record.cardasn is '卡应用号'
/
comment on column rec_drivecard_record.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_DRIVECARD_SUMFARE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"CHECKSTARTDT" DATE NOT NULL ENABLE, 
	"CHECKENDDT" DATE NOT NULL ENABLE, 
	"SUMNO" NUMBER(10,2) NOT NULL ENABLE, 
	"SUMFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"RECNO" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"DEPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"TAC" VARCHAR2(12) NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"UPLOADDT" DATE NOT NULL ENABLE, 
	"COLLECTDT" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"EMPID" NUMBER, 
	"VICECARDNO" NUMBER(20,0) DEFAULT 0, 
	 CONSTRAINT "PK_REC_DRIVERCARD_SUMFARE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 22020096 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_drivecard_sumfare is ''
/
comment on column rec_drivecard_sumfare.id is '编号'
/
comment on column rec_drivecard_sumfare.poscode is '设备运营唯一编号'
/
comment on column rec_drivecard_sumfare.driverid is '司机id（签退的司机编号）'
/
comment on column rec_drivecard_sumfare.checkstartdt is '签到时间'
/
comment on column rec_drivecard_sumfare.checkenddt is '签退时间'
/
comment on column rec_drivecard_sumfare.sumno is '交易笔数'
/
comment on column rec_drivecard_sumfare.sumfare is '交易总额'
/
comment on column rec_drivecard_sumfare.psamcardno is 'sam卡号'
/
comment on column rec_drivecard_sumfare.recno is '记录流水'
/
comment on column rec_drivecard_sumfare.busid is '车辆编号'
/
comment on column rec_drivecard_sumfare.buslineid is '线路编号'
/
comment on column rec_drivecard_sumfare.deptcode is '运营部门'
/
comment on column rec_drivecard_sumfare.tac is 'tac'
/
comment on column rec_drivecard_sumfare.opdt is '交易时间按签退时间取日期（yyyy-mm-dd）'
/
comment on column rec_drivecard_sumfare.uploaddt is '上传时间'
/
comment on column rec_drivecard_sumfare.collectdt is '采集时间'
/
comment on column rec_drivecard_sumfare.customerunitcode is '客户代码'
/
comment on column rec_drivecard_sumfare.empid is '实际签到的司机编号'
/
comment on column rec_drivecard_sumfare.vicecardno is '次卡汇总次数（暂时不明确）'
/


  CREATE TABLE "CCENSE"."REC_ELECTTION_CASH1" 
   (	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 851968 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtion_cash1 is '电子钱包充值-红冲记录'
/
comment on column rec_electtion_cash1.customerid is '客户编号'
/
comment on column rec_electtion_cash1.planid is '红冲流水号'
/
comment on column rec_electtion_cash1.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"HANDLETYPE" NUMBER DEFAULT 0, 
	"ISREPEAL" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_REC_ELECTTRON_CASH" PRIMARY KEY ("CARDNO", "ELECTRSAVEOPCOUNT", "ELECTROPCOUNT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("OPDT") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table rec_electtron_cash is '电子钱包充值记录明细表'
/
comment on column rec_electtron_cash.cashaccfc is '交易流水号'
/
comment on column rec_electtron_cash.opdt is '交易时间'
/
comment on column rec_electtron_cash.customerid is '账号'
/
comment on column rec_electtron_cash.cardno is '卡号'
/
comment on column rec_electtron_cash.cardsn is '卡序号'
/
comment on column rec_electtron_cash.cardtypedetailid is '卡类别小类'
/
comment on column rec_electtron_cash.cardkind is '卡类型 1m1 2cpu'
/
comment on column rec_electtron_cash.electropcount is '电子钱包消费操作计数'
/
comment on column rec_electtron_cash.electrsaveopcount is '电子钱包充值交易计数'
/
comment on column rec_electtron_cash.electroddfare is '电子钱包卡余额'
/
comment on column rec_electtron_cash.electroddfarepre is '电子钱包前期卡余额'
/
comment on column rec_electtron_cash.electrdummyopfare is '电子钱包虚充金额'
/
comment on column rec_electtron_cash.electropfare is '电子钱包交易金额'
/
comment on column rec_electtron_cash.acccode is '交易科目'
/
comment on column rec_electtron_cash.dscrp is '交易科目描述'
/
comment on column rec_electtron_cash.poscode is '交易终端设备唯一编号'
/
comment on column rec_electtron_cash.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_electtron_cash.samcardno is 'sam卡号'
/
comment on column rec_electtron_cash.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_cash.planid is '充值申请流水'
/
comment on column rec_electtron_cash.uploaddate is '上传时间'
/
comment on column rec_electtron_cash.empid is '职员id'
/
comment on column rec_electtron_cash.wallettype is '钱包类型:1-电子钱包'
/
comment on column rec_electtron_cash.tac is 'tac码'
/
comment on column rec_electtron_cash.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_cash.customerunitcode is '客户代码'
/
comment on column rec_electtron_cash.outid is '市民卡号'
/
comment on column rec_electtron_cash.handletype is '处理类型：0，终端自动处理，1，管理中心手动处理'
/
comment on column rec_electtron_cash.isrepeal is '是否充值撤销：0，未充值撤销；1，已经充值撤销'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_BAK" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_bak is ''
/
comment on column rec_electtron_cash_bak.cashaccfc is ''
/
comment on column rec_electtron_cash_bak.opdt is ''
/
comment on column rec_electtron_cash_bak.customerid is ''
/
comment on column rec_electtron_cash_bak.cardno is ''
/
comment on column rec_electtron_cash_bak.cardsn is ''
/
comment on column rec_electtron_cash_bak.cardtypedetailid is ''
/
comment on column rec_electtron_cash_bak.cardkind is ''
/
comment on column rec_electtron_cash_bak.electropcount is ''
/
comment on column rec_electtron_cash_bak.electrsaveopcount is ''
/
comment on column rec_electtron_cash_bak.electroddfare is ''
/
comment on column rec_electtron_cash_bak.electroddfarepre is ''
/
comment on column rec_electtron_cash_bak.electrdummyopfare is ''
/
comment on column rec_electtron_cash_bak.electropfare is ''
/
comment on column rec_electtron_cash_bak.acccode is ''
/
comment on column rec_electtron_cash_bak.dscrp is ''
/
comment on column rec_electtron_cash_bak.poscode is ''
/
comment on column rec_electtron_cash_bak.dealtype is ''
/
comment on column rec_electtron_cash_bak.samcardno is ''
/
comment on column rec_electtron_cash_bak.samtradeno is ''
/
comment on column rec_electtron_cash_bak.planid is ''
/
comment on column rec_electtron_cash_bak.uploaddate is ''
/
comment on column rec_electtron_cash_bak.empid is ''
/
comment on column rec_electtron_cash_bak.wallettype is ''
/
comment on column rec_electtron_cash_bak.tac is ''
/
comment on column rec_electtron_cash_bak.sumelectraddfare is ''
/
comment on column rec_electtron_cash_bak.customerunitcode is ''
/
comment on column rec_electtron_cash_bak.outid is ''
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_PLAN" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"REPEALEMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDPLANID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_ELECTTRON_CASH_PLAN" PRIMARY KEY ("PLANID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_plan is '领款计划申请表'
/
comment on column rec_electtron_cash_plan.planid is '申请流水'
/
comment on column rec_electtron_cash_plan.customerid is '帐号'
/
comment on column rec_electtron_cash_plan.cardno is '卡号'
/
comment on column rec_electtron_cash_plan.cardsn is '持卡序号'
/
comment on column rec_electtron_cash_plan.cardtypedetailid is '卡类型'
/
comment on column rec_electtron_cash_plan.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_cash_plan.electroddfare is '充值后电子钱包余额'
/
comment on column rec_electtron_cash_plan.electroddfarepre is '充值前电子钱包余额'
/
comment on column rec_electtron_cash_plan.electrdummyopfare is '电子钱包虚充金额'
/
comment on column rec_electtron_cash_plan.electropfare is '电子钱包交易金额'
/
comment on column rec_electtron_cash_plan.electrsaveopcount is '电子钱包充值后交易计数'
/
comment on column rec_electtron_cash_plan.electropcount is '电子钱包消费交易计数'
/
comment on column rec_electtron_cash_plan.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_electtron_cash_plan.acccode is '科目代码'
/
comment on column rec_electtron_cash_plan.opdt is '操作时间'
/
comment on column rec_electtron_cash_plan.description is '科目描述'
/
comment on column rec_electtron_cash_plan.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_electtron_cash_plan.poscode is '设备运营唯一编号'
/
comment on column rec_electtron_cash_plan.psamcardno is 'psam卡号'
/
comment on column rec_electtron_cash_plan.empid is '职员帐号'
/
comment on column rec_electtron_cash_plan.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_electtron_cash_plan.wallettype is '钱包类型'
/
comment on column rec_electtron_cash_plan.tac is 'tac码'
/
comment on column rec_electtron_cash_plan.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_cash_plan.ver is '记录版本'
/
comment on column rec_electtron_cash_plan.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_electtron_cash_plan.oldplanid is '原充值planid（充值申请时产生）'
/
comment on column rec_electtron_cash_plan.customerunitcode is '客户代码'
/
comment on column rec_electtron_cash_plan.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_PLAN_BAD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"CARDNO" NUMBER DEFAULT 0, 
	"CARDSN" NUMBER DEFAULT 0, 
	"CARDTYPEDETAILID" NUMBER(*,0) DEFAULT 0, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0, 
	"STATUS" NUMBER DEFAULT 0, 
	"ACCCODE" NUMBER, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0, 
	"POSCODE" NUMBER DEFAULT 0, 
	"PSAMCARDNO" NUMBER DEFAULT 0, 
	"EMPID" NUMBER DEFAULT 0, 
	"DEALTYPE" NUMBER DEFAULT 0, 
	"WALLETTYPE" NUMBER DEFAULT 0, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0, 
	"BADCODE" NUMBER, 
	"BADDESC" VARCHAR2(300), 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT sysdate, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_ELECTTRON_CASH_PLAN_BAD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_plan_bad is '提交失败记录表'
/
comment on column rec_electtron_cash_plan_bad.id is '流水号'
/
comment on column rec_electtron_cash_plan_bad.planid is '提交申请流水'
/
comment on column rec_electtron_cash_plan_bad.customerid is '提交帐号'
/
comment on column rec_electtron_cash_plan_bad.cardno is '提交卡号'
/
comment on column rec_electtron_cash_plan_bad.cardsn is '持卡序号'
/
comment on column rec_electtron_cash_plan_bad.cardtypedetailid is '提交卡类型'
/
comment on column rec_electtron_cash_plan_bad.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_cash_plan_bad.electroddfare is '提交充值后电子钱包余额'
/
comment on column rec_electtron_cash_plan_bad.electroddfarepre is '提交充值前电子钱包余额'
/
comment on column rec_electtron_cash_plan_bad.electrdummyopfare is '提交电子钱包虚充金额'
/
comment on column rec_electtron_cash_plan_bad.electropfare is '提交电子钱包交易金额'
/
comment on column rec_electtron_cash_plan_bad.electrsaveopcount is '提交电子钱包充值后交易计数'
/
comment on column rec_electtron_cash_plan_bad.electropcount is '提交电子钱包消费交易计数'
/
comment on column rec_electtron_cash_plan_bad.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_electtron_cash_plan_bad.acccode is '提交科目代码'
/
comment on column rec_electtron_cash_plan_bad.opdt is '操作时间'
/
comment on column rec_electtron_cash_plan_bad.description is '交易科目描述'
/
comment on column rec_electtron_cash_plan_bad.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_electtron_cash_plan_bad.poscode is '设备运营唯一编号'
/
comment on column rec_electtron_cash_plan_bad.psamcardno is 'psam卡号'
/
comment on column rec_electtron_cash_plan_bad.empid is '职员帐号'
/
comment on column rec_electtron_cash_plan_bad.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_electtron_cash_plan_bad.wallettype is '钱包类型'
/
comment on column rec_electtron_cash_plan_bad.tac is 'tac码'
/
comment on column rec_electtron_cash_plan_bad.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_cash_plan_bad.badcode is '坏账编号'
/
comment on column rec_electtron_cash_plan_bad.baddesc is '坏账描述'
/
comment on column rec_electtron_cash_plan_bad.ver is '记录版本'
/
comment on column rec_electtron_cash_plan_bad.createdt is '记录形成时间'
/
comment on column rec_electtron_cash_plan_bad.customerunitcode is '客户代码'
/
comment on column rec_electtron_cash_plan_bad.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_PLAN_LOG" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_plan_log is '领款计划申请表'
/
comment on column rec_electtron_cash_plan_log.planid is '申请流水'
/
comment on column rec_electtron_cash_plan_log.customerid is '帐号'
/
comment on column rec_electtron_cash_plan_log.cardno is '卡号'
/
comment on column rec_electtron_cash_plan_log.cardsn is '持卡序号'
/
comment on column rec_electtron_cash_plan_log.cardtypedetailid is '卡类型'
/
comment on column rec_electtron_cash_plan_log.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_cash_plan_log.electroddfare is '充值后电子钱包余额'
/
comment on column rec_electtron_cash_plan_log.electroddfarepre is '充值前电子钱包余额'
/
comment on column rec_electtron_cash_plan_log.electrdummyopfare is '电子钱包虚冲余额'
/
comment on column rec_electtron_cash_plan_log.electropfare is '电子钱包交易金额'
/
comment on column rec_electtron_cash_plan_log.electrsaveopcount is '电子钱包充值后交易计数'
/
comment on column rec_electtron_cash_plan_log.electropcount is '电子钱包消费交易计数'
/
comment on column rec_electtron_cash_plan_log.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_electtron_cash_plan_log.acccode is '科目代码'
/
comment on column rec_electtron_cash_plan_log.opdt is '操作时间'
/
comment on column rec_electtron_cash_plan_log.description is '描述(补助,零散补助,稿费)'
/
comment on column rec_electtron_cash_plan_log.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_electtron_cash_plan_log.poscode is '设备运营唯一编号'
/
comment on column rec_electtron_cash_plan_log.psamcardno is 'psam卡号'
/
comment on column rec_electtron_cash_plan_log.empid is '职员帐号'
/
comment on column rec_electtron_cash_plan_log.dealtype is '记录类型'
/
comment on column rec_electtron_cash_plan_log.wallettype is '钱包类型'
/
comment on column rec_electtron_cash_plan_log.tac is 'tac码'
/
comment on column rec_electtron_cash_plan_log.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_cash_plan_log.ver is '记录版本'
/
comment on column rec_electtron_cash_plan_log.createdt is '记录形成时间'
/
comment on column rec_electtron_cash_plan_log.customerunitcode is '客户代码'
/
comment on column rec_electtron_cash_plan_log.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_PLAN_PUTOUT" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT sysdate, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_plan_putout is '领款计划申请表'
/
comment on column rec_electtron_cash_plan_putout.planid is '申请流水'
/
comment on column rec_electtron_cash_plan_putout.customerid is '帐号'
/
comment on column rec_electtron_cash_plan_putout.cardno is '卡号'
/
comment on column rec_electtron_cash_plan_putout.cardsn is '持卡序号'
/
comment on column rec_electtron_cash_plan_putout.cardtypedetailid is '卡类型'
/
comment on column rec_electtron_cash_plan_putout.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_cash_plan_putout.electroddfare is '充值后电子钱包余额'
/
comment on column rec_electtron_cash_plan_putout.electroddfarepre is '充值前电子钱包余额'
/
comment on column rec_electtron_cash_plan_putout.electrdummyopfare is '电子钱包虚充金额'
/
comment on column rec_electtron_cash_plan_putout.electropfare is '电子钱包交易金额(含虚充)'
/
comment on column rec_electtron_cash_plan_putout.electrsaveopcount is '电子钱包充值后交易计数'
/
comment on column rec_electtron_cash_plan_putout.electropcount is '电子钱包消费交易计数'
/
comment on column rec_electtron_cash_plan_putout.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_electtron_cash_plan_putout.acccode is '科目代码'
/
comment on column rec_electtron_cash_plan_putout.opdt is '操作时间'
/
comment on column rec_electtron_cash_plan_putout.description is '描述(补助,零散补助,稿费)'
/
comment on column rec_electtron_cash_plan_putout.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_electtron_cash_plan_putout.poscode is '设备运营唯一编号'
/
comment on column rec_electtron_cash_plan_putout.psamcardno is 'psam卡号'
/
comment on column rec_electtron_cash_plan_putout.empid is '职员帐号'
/
comment on column rec_electtron_cash_plan_putout.dealtype is '交易类型'
/
comment on column rec_electtron_cash_plan_putout.wallettype is '钱包类型'
/
comment on column rec_electtron_cash_plan_putout.tac is 'tac码'
/
comment on column rec_electtron_cash_plan_putout.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_cash_plan_putout.ver is '记录版本'
/
comment on column rec_electtron_cash_plan_putout.createdt is '记录形成时间'
/
comment on column rec_electtron_cash_plan_putout.customerunitcode is '客户代码'
/
comment on column rec_electtron_cash_plan_putout.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CASH_REDRUSH" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"TRADERECNO" NUMBER NOT NULL ENABLE, 
	"TAC" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER, 
	"ELECTRDUMMYOPFARE" NUMBER, 
	"CARDASN" NUMBER, 
	"TRADECITYCODE" VARCHAR2(8), 
	"OWNERCITYCODE" VARCHAR2(8), 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER NOT NULL ENABLE, 
	"TRADEKIND" NUMBER NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER NOT NULL ENABLE, 
	"FLAG" NUMBER NOT NULL ENABLE, 
	"FLEEPOSCODE" NUMBER NOT NULL ENABLE, 
	"UPSTOPID" NUMBER NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_electtron_cash_redrush is ''
/
comment on column rec_electtron_cash_redrush.cstaccfc is ''
/
comment on column rec_electtron_cash_redrush.customerid is ''
/
comment on column rec_electtron_cash_redrush.cardno is ''
/
comment on column rec_electtron_cash_redrush.cardtype is ''
/
comment on column rec_electtron_cash_redrush.opdt is ''
/
comment on column rec_electtron_cash_redrush.sumelectraddfare is ''
/
comment on column rec_electtron_cash_redrush.electronoddfare is ''
/
comment on column rec_electtron_cash_redrush.electronopfare is ''
/
comment on column rec_electtron_cash_redrush.acccode is ''
/
comment on column rec_electtron_cash_redrush.dscrp is ''
/
comment on column rec_electtron_cash_redrush.cardsn is ''
/
comment on column rec_electtron_cash_redrush.opcount is ''
/
comment on column rec_electtron_cash_redrush.dealtype is ''
/
comment on column rec_electtron_cash_redrush.collectdt is ''
/
comment on column rec_electtron_cash_redrush.uploaddate is ''
/
comment on column rec_electtron_cash_redrush.busid is ''
/
comment on column rec_electtron_cash_redrush.driverid is ''
/
comment on column rec_electtron_cash_redrush.poscode is ''
/
comment on column rec_electtron_cash_redrush.samcardno is ''
/
comment on column rec_electtron_cash_redrush.cardkind is ''
/
comment on column rec_electtron_cash_redrush.traderecno is ''
/
comment on column rec_electtron_cash_redrush.tac is ''
/
comment on column rec_electtron_cash_redrush.samtradeno is ''
/
comment on column rec_electtron_cash_redrush.buslineid is ''
/
comment on column rec_electtron_cash_redrush.totalrecno is ''
/
comment on column rec_electtron_cash_redrush.discount is ''
/
comment on column rec_electtron_cash_redrush.tradetype is ''
/
comment on column rec_electtron_cash_redrush.linedept is ''
/
comment on column rec_electtron_cash_redrush.repealempid is ''
/
comment on column rec_electtron_cash_redrush.electrdummyopfare is ''
/
comment on column rec_electtron_cash_redrush.cardasn is ''
/
comment on column rec_electtron_cash_redrush.tradecitycode is ''
/
comment on column rec_electtron_cash_redrush.ownercitycode is ''
/
comment on column rec_electtron_cash_redrush.maincardtype is ''
/
comment on column rec_electtron_cash_redrush.assocardtype is ''
/
comment on column rec_electtron_cash_redrush.cardversion is ''
/
comment on column rec_electtron_cash_redrush.tradekind is ''
/
comment on column rec_electtron_cash_redrush.testflag is ''
/
comment on column rec_electtron_cash_redrush.operatorpoint is ''
/
comment on column rec_electtron_cash_redrush.collectpoint is ''
/
comment on column rec_electtron_cash_redrush.accountdate is ''
/
comment on column rec_electtron_cash_redrush.recordtype is ''
/
comment on column rec_electtron_cash_redrush.flag is ''
/
comment on column rec_electtron_cash_redrush.fleeposcode is ''
/
comment on column rec_electtron_cash_redrush.upstopid is ''
/
comment on column rec_electtron_cash_redrush.downstopid is ''
/
comment on column rec_electtron_cash_redrush.customerunitcode is ''
/
comment on column rec_electtron_cash_redrush.wallettype is ''
/
comment on column rec_electtron_cash_redrush.outid is ''
/


  CREATE TABLE "CCENSE"."REC_ELECTTRON_CONSUME" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER, 
	"ELECTRDUMMYOPFARE" NUMBER, 
	"CARDASN" NUMBER, 
	"TRADECITYCODE" VARCHAR2(8), 
	"OWNERCITYCODE" VARCHAR2(8), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER, 
	"CARDVERSION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"ACCOUNTDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FLEEPOSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DOWNSTOPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_ELECTTRON_CONSUME" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_ELECTTRON_CONSUME" UNIQUE ("CUSTOMERID", "CARDSN", "OPCOUNT", "CARDASN", "WALLETTYPE", "TRADERECNO", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("UPLOADDATE") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table rec_electtron_consume is '电子钱包消费明细表'
/
comment on column rec_electtron_consume.cstaccfc is '流水号'
/
comment on column rec_electtron_consume.customerid is '账号'
/
comment on column rec_electtron_consume.cardno is '卡号'
/
comment on column rec_electtron_consume.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_electtron_consume.opdt is '交易时间'
/
comment on column rec_electtron_consume.sumelectraddfare is '电子钱包总加款额系统值'
/
comment on column rec_electtron_consume.electronoddfare is '电子钱包卡余额'
/
comment on column rec_electtron_consume.electronopfare is '电子钱包交易金额'
/
comment on column rec_electtron_consume.acccode is '交易科目'
/
comment on column rec_electtron_consume.dscrp is '科目描述'
/
comment on column rec_electtron_consume.cardsn is '卡序号'
/
comment on column rec_electtron_consume.opcount is '卡操作计数'
/
comment on column rec_electtron_consume.dealtype is '记录类型 1：正常 2：灰色 3：mac错误...'
/
comment on column rec_electtron_consume.collectdt is '采集时间'
/
comment on column rec_electtron_consume.uploaddate is '上传时间'
/
comment on column rec_electtron_consume.busid is '车辆编号'
/
comment on column rec_electtron_consume.driverid is '司机id'
/
comment on column rec_electtron_consume.poscode is '设备运营唯一编号'
/
comment on column rec_electtron_consume.samcardno is 'sam卡号'
/
comment on column rec_electtron_consume.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_electtron_consume.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_electtron_consume.tac is 'tac验证码'
/
comment on column rec_electtron_consume.samtradeno is 'sam卡交易流水号'
/
comment on column rec_electtron_consume.buslineid is '线路编号'
/
comment on column rec_electtron_consume.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_electtron_consume.discount is '打折金额'
/
comment on column rec_electtron_consume.tradetype is '交易应用类型 1：电子钱包充值 2：月票充值'
/
comment on column rec_electtron_consume.linedept is '线路所属部门'
/
comment on column rec_electtron_consume.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_electtron_consume.electrdummyopfare is '电子钱包虚冲撤销金额'
/
comment on column rec_electtron_consume.cardasn is '卡应用号'
/
comment on column rec_electtron_consume.tradecitycode is '交易地城市代码'
/
comment on column rec_electtron_consume.ownercitycode is '所属地城市代码'
/
comment on column rec_electtron_consume.maincardtype is '主卡类型'
/
comment on column rec_electtron_consume.assocardtype is '子卡类型'
/
comment on column rec_electtron_consume.cardversion is '卡内版本'
/
comment on column rec_electtron_consume.tradekind is '交易性质'
/
comment on column rec_electtron_consume.testflag is '测试标记'
/
comment on column rec_electtron_consume.operatorpoint is '营运单位编号'
/
comment on column rec_electtron_consume.collectpoint is '采集点编号'
/
comment on column rec_electtron_consume.accountdate is '清算日期'
/
comment on column rec_electtron_consume.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_electtron_consume.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_electtron_consume.fleeposcode is '分段计费-逃票设备唯一编号（此处指代的逃票的车辆编号）'
/
comment on column rec_electtron_consume.upstopid is '分段计费-上车站点编号'
/
comment on column rec_electtron_consume.downstopid is '分段计费-下车站点编号'
/
comment on column rec_electtron_consume.customerunitcode is '客户代码'
/
comment on column rec_electtron_consume.wallettype is '坏账的最终处理状态 0：待处理 1：已入正常账 2：用户置坏 3：系统置坏'
/
comment on column rec_electtron_consume.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_EMP_LOSS" 
   (	"OPDT" DATE NOT NULL ENABLE, 
	"AREAID" NUMBER NOT NULL ENABLE, 
	"USERID" VARCHAR2(20) NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"OPEMPID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER, 
	"LOSSTYPE" NUMBER, 
	"OPTYPE" NUMBER, 
	"SOURCEIP" VARCHAR2(30), 
	"POSCODE" NUMBER, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"OPDESC" VARCHAR2(100), 
	"NEWCARDNO" NUMBER, 
	"HASUNLOSS" NUMBER, 
	"LOSSFC" NUMBER NOT NULL ENABLE, 
	"BLLTTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_EMP_LOSS" PRIMARY KEY ("LOSSFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_EMP_LOSS" UNIQUE ("EMPID", "CARDNO", "OPTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_emp_loss is '职员挂失和解挂表'
/
comment on column rec_emp_loss.opdt is '挂失或解挂时间'
/
comment on column rec_emp_loss.areaid is '所属校区'
/
comment on column rec_emp_loss.userid is '挂失职员工号'
/
comment on column rec_emp_loss.empid is '挂失职员账号'
/
comment on column rec_emp_loss.opempid is '操作职员账号'
/
comment on column rec_emp_loss.cardno is '挂失卡号'
/
comment on column rec_emp_loss.cardsn is '挂失卡序号'
/
comment on column rec_emp_loss.losstype is '挂失类别 1自助挂失 2制卡中心挂失'
/
comment on column rec_emp_loss.optype is '0--挂失；1--解挂'
/
comment on column rec_emp_loss.sourceip is '挂失地址'
/
comment on column rec_emp_loss.poscode is '设备唯一编号'
/
comment on column rec_emp_loss.cardtypedetailid is '卡类型小类'
/
comment on column rec_emp_loss.opdesc is '操作描述'
/
comment on column rec_emp_loss.newcardno is '新卡号'
/
comment on column rec_emp_loss.hasunloss is '已经解挂 （0挂失未解挂 1挂失已解挂 2解挂记录）'
/
comment on column rec_emp_loss.lossfc is '流水号'
/
comment on column rec_emp_loss.bllttype is '黑名单类型，0：黑名单，1白名单'
/
comment on column rec_emp_loss.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_EMP_SELFMONEY_ACC" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(32,0) NOT NULL ENABLE, 
	"CARDEMPID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"KTACCCODE" NUMBER NOT NULL ENABLE, 
	"KTFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"KTACCDSCRP" VARCHAR2(20), 
	"CHANGEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_EMP_SELFMONEY_ACC" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_emp_selfmoney_acc is '开户费用明细表（包含折旧费和卡套费）'
/
comment on column rec_emp_selfmoney_acc.id is '流水号'
/
comment on column rec_emp_selfmoney_acc.empid is '操作职员'
/
comment on column rec_emp_selfmoney_acc.cardempid is '此卡用户员工编号'
/
comment on column rec_emp_selfmoney_acc.cardtype is '卡类别，普通卡，月票卡，老年卡'
/
comment on column rec_emp_selfmoney_acc.opfare is '交易金额'
/
comment on column rec_emp_selfmoney_acc.acccode is '交易科目'
/
comment on column rec_emp_selfmoney_acc.dscrp is '交易科目描述'
/
comment on column rec_emp_selfmoney_acc.ktacccode is '卡套费科目'
/
comment on column rec_emp_selfmoney_acc.ktfare is '卡套费金额'
/
comment on column rec_emp_selfmoney_acc.ktaccdscrp is ''
/
comment on column rec_emp_selfmoney_acc.changedate is '交易时间'
/
comment on column rec_emp_selfmoney_acc.cardkind is '交易卡类型 1m1卡， 2  cpu卡'
/
comment on column rec_emp_selfmoney_acc.poscode is '终端唯一编号'
/
comment on column rec_emp_selfmoney_acc.scardsnr is '卡唯一编号'
/
comment on column rec_emp_selfmoney_acc.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_FILETYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPATHID" NUMBER, 
	"ISMULTIDIRECTORY" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_FILETYPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_FILETYPE" UNIQUE ("FILETYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_FILETYPE_PATHID" UNIQUE ("FTPPATHID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_filetype is '第三方对接文件类型信息表'
/
comment on column rec_filetype.id is '主键'
/
comment on column rec_filetype.filetype is '文件类型'
/
comment on column rec_filetype.ftppathid is 'ftp路径信息表id'
/
comment on column rec_filetype.ismultidirectory is '是否有子目录[0:无 1:有]'
/
comment on column rec_filetype.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_FREEZEFARE_ACC" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"SAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"FREEZEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"FREEZEFAREFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VER" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE, 
	"LIMITTIMES" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT sysdate, 
	"VALIDTIMEEND" DATE DEFAULT sysdate, 
	"MONTHFREEZEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"MONTHFREEZEFAREFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEFREEZEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"VICEFREEZEFAREFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICELIMITTIMES" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEMONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEVALIDTIMESTART" DATE DEFAULT sysdate, 
	"VICEVALIDTIMEEND" DATE DEFAULT sysdate, 
	"NEWCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"OPENDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_FREEZEFARE_ACC" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_freezefare_acc is '冻结金额记录表（包含电子钱包和月票冻结金额和次卡钱包冻结金额）'
/
comment on column rec_freezefare_acc.id is '流水号，自增长'
/
comment on column rec_freezefare_acc.customerid is '客户编号'
/
comment on column rec_freezefare_acc.cardno is '客户卡号'
/
comment on column rec_freezefare_acc.cardtype is '卡类型 普通卡，月票卡，老年卡等'
/
comment on column rec_freezefare_acc.cardsn is '持卡序号'
/
comment on column rec_freezefare_acc.cardkind is '卡种类 1 m1卡 2 cpu卡'
/
comment on column rec_freezefare_acc.opcount is '消费操作计数'
/
comment on column rec_freezefare_acc.saveopcount is '充值操作计数'
/
comment on column rec_freezefare_acc.freezefare is '冻结金额'
/
comment on column rec_freezefare_acc.empid is '领取操作职员 0 自助'
/
comment on column rec_freezefare_acc.freezefareflag is '冻结金额领取标记(0未领，1已领，2，申请状态  3,已经冲零次状态针对月票和次卡 )'
/
comment on column rec_freezefare_acc.createdate is '冻结金额形成时间'
/
comment on column rec_freezefare_acc.ver is '版本号'
/
comment on column rec_freezefare_acc.customerunitcode is '客户代码'
/
comment on column rec_freezefare_acc.wallettype is '钱包类型：1 电子钱包 2 月票钱包 3 次卡钱包'
/
comment on column rec_freezefare_acc.opdt is '冻结金额领取时间'
/
comment on column rec_freezefare_acc.limittimes is '每月最大消费次数（次卡）/金额（月票）'
/
comment on column rec_freezefare_acc.monthnum is '连充月个数'
/
comment on column rec_freezefare_acc.validtimestart is '月票/次卡钱包连充有效起日'
/
comment on column rec_freezefare_acc.validtimeend is '月票/次卡钱包连充有效止日'
/
comment on column rec_freezefare_acc.monthfreezefare is '月票冻结金额'
/
comment on column rec_freezefare_acc.monthfreezefareflag is '月票冻结金额领取标记(0未领，1已领，2，申请状态  3,已经冲零次状态针对月票和次卡 )'
/
comment on column rec_freezefare_acc.monthopcount is '月票消费操作计数'
/
comment on column rec_freezefare_acc.monthsaveopcount is '月票充值操作计数'
/
comment on column rec_freezefare_acc.vicefreezefare is '次卡冻结金额'
/
comment on column rec_freezefare_acc.vicefreezefareflag is '次卡冻结金额领取标记(0未领，1已领，2，申请状态  3,已经冲零次状态针对月票和次卡 )'
/
comment on column rec_freezefare_acc.viceopcount is '次卡消费操作计数'
/
comment on column rec_freezefare_acc.vicesaveopcount is '次卡充值操作计数'
/
comment on column rec_freezefare_acc.vicelimittimes is '次卡每月最大消费次数（次卡）/金额（月票）'
/
comment on column rec_freezefare_acc.vicemonthnum is '次卡连充月个数'
/
comment on column rec_freezefare_acc.vicevalidtimestart is '次卡钱包连充有效起日'
/
comment on column rec_freezefare_acc.vicevalidtimeend is '次卡钱包连充有效止日'
/
comment on column rec_freezefare_acc.newcardno is '新卡号'
/
comment on column rec_freezefare_acc.cardid is '对应卡信息表id列，多次补卡时表示哪一张卡的冻结'
/
comment on column rec_freezefare_acc.outid is '市民卡号'
/
comment on column rec_freezefare_acc.cardtypedetailid is '卡类型小类'
/
comment on column rec_freezefare_acc.opendt is '开户日期'
/


  CREATE TABLE "CCENSE"."REC_FTPADDRESS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FTPNAME" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPIP" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPORT" VARCHAR2(10) NOT NULL ENABLE, 
	"FTPUSER" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPASSWORD" VARCHAR2(20) NOT NULL ENABLE, 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"FTPREMAKE" VARCHAR2(50), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_FTPADDRESS" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_ftpaddress is 'ftp地址信息'
/
comment on column rec_ftpaddress.id is '主键'
/
comment on column rec_ftpaddress.ftpname is 'ftp服务别名'
/
comment on column rec_ftpaddress.ftpip is 'ftp服务器ip'
/
comment on column rec_ftpaddress.ftpport is 'ftp服务器端口'
/
comment on column rec_ftpaddress.ftpuser is 'ftp服务器用户名'
/
comment on column rec_ftpaddress.ftppassword is 'ftp服务器密码'
/
comment on column rec_ftpaddress.updatetime is '更新时间'
/
comment on column rec_ftpaddress.createtime is '入库时间'
/
comment on column rec_ftpaddress.ftpremake is '备注信息'
/
comment on column rec_ftpaddress.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_FTPFILEINFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(50), 
	"FPTPATHID" NUMBER, 
	"BUSINESSTYPE" NUMBER, 
	"FILETYPE" VARCHAR2(20), 
	"FILESIZE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DATARECORDNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ALREADYDEALNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FILEBUILDTIME" DATE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISACCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "UK_REC_FTPFILEINFO" UNIQUE ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "PK_REC_FTPFILEINFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_ftpfileinfo is '第三方对接文件信息表'
/
comment on column rec_ftpfileinfo.id is '主键'
/
comment on column rec_ftpfileinfo.filename is '文件名'
/
comment on column rec_ftpfileinfo.fptpathid is '关联ftppathid'
/
comment on column rec_ftpfileinfo.businesstype is '文件业务类型：1：上传；2：下载'
/
comment on column rec_ftpfileinfo.filetype is '文件类型'
/
comment on column rec_ftpfileinfo.filesize is '文件大小'
/
comment on column rec_ftpfileinfo.datarecordnum is '文件中数据记录条数(不包含头尾非数据行)'
/
comment on column rec_ftpfileinfo.alreadydealnum is '已入库多少条数据'
/
comment on column rec_ftpfileinfo.filebuildtime is '文件生成时间'
/
comment on column rec_ftpfileinfo.status is '文件记录是否入库完成状态：0：初始状态；1：已完成'
/
comment on column rec_ftpfileinfo.isaccount is '该文件里的所有记录是否已经本地清算完成：0：未清算，1：清算完成'
/
comment on column rec_ftpfileinfo.updatetime is '更新时间'
/
comment on column rec_ftpfileinfo.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_FTPFILEINFO_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LOGLEVEL" VARCHAR2(20) NOT NULL ENABLE, 
	"LOGSTEP" VARCHAR2(50) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(100), 
	"LOGCONTENT" VARCHAR2(100), 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_FTPFILEINFO_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_ftpfileinfo_log is 'ftp文件处理监控log'
/
comment on column rec_ftpfileinfo_log.id is '流水号'
/
comment on column rec_ftpfileinfo_log.loglevel is '日志级别'
/
comment on column rec_ftpfileinfo_log.logstep is '处理流程'
/
comment on column rec_ftpfileinfo_log.filename is '文件名'
/
comment on column rec_ftpfileinfo_log.logcontent is '异常日志内容'
/
comment on column rec_ftpfileinfo_log.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."REC_FTPPATH" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FTPADDRESSID" NUMBER NOT NULL ENABLE, 
	"BUSINESSTYPE" NUMBER NOT NULL ENABLE, 
	"FTPPATH" VARCHAR2(60) NOT NULL ENABLE, 
	"FTPBAKPATH" VARCHAR2(60), 
	"LOCALPATH" VARCHAR2(100), 
	"LOCALBAKPATH" VARCHAR2(100), 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_FTPPATH" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_ftppath is 'ftp路径信息'
/
comment on column rec_ftppath.id is '主键'
/
comment on column rec_ftppath.ftpaddressid is 'ftp地址id'
/
comment on column rec_ftppath.businesstype is '文件业务类型：1：上传；2：下载'
/
comment on column rec_ftppath.ftppath is 'ftp服务器路径'
/
comment on column rec_ftppath.ftpbakpath is 'ftp服务器备份路径'
/
comment on column rec_ftppath.localpath is '本地路径'
/
comment on column rec_ftppath.localbakpath is '本地备份路径'
/
comment on column rec_ftppath.updatetime is '更新时间'
/
comment on column rec_ftppath.createtime is '入库时间'
/
comment on column rec_ftppath.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_LOSS" 
   (	"LOSSFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"EMPID" VARCHAR2(32) NOT NULL ENABLE, 
	"OPTYPE" NUMBER NOT NULL ENABLE, 
	"LOSSTYPE" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER, 
	"SOURCEIP" VARCHAR2(30), 
	"CARDTYPEDETAILID" NUMBER, 
	"OPDESC" VARCHAR2(100), 
	"NEWCARDNO" NUMBER, 
	"HASUNLOSS" NUMBER, 
	"BLLTTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_LOSS" PRIMARY KEY ("LOSSFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 18874368 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 109051904 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_loss is '卡挂失记录'
/
comment on column rec_loss.lossfc is '流水号'
/
comment on column rec_loss.customerid is '客户账户'
/
comment on column rec_loss.cardno is '卡号'
/
comment on column rec_loss.opdt is '操作日期'
/
comment on column rec_loss.cardsn is '持卡序号'
/
comment on column rec_loss.empid is '职员编号'
/
comment on column rec_loss.optype is '0--挂失；1--解挂'
/
comment on column rec_loss.losstype is '挂失类别 1自助挂失 2制卡中心挂失 6自行车客服挂失 7第三方对接挂失'
/
comment on column rec_loss.poscode is '终端唯一编号'
/
comment on column rec_loss.sourceip is '挂失终端ip'
/
comment on column rec_loss.cardtypedetailid is '卡小类编号'
/
comment on column rec_loss.opdesc is '挂失描述'
/
comment on column rec_loss.newcardno is '新卡号'
/
comment on column rec_loss.hasunloss is '已经解挂 （0未解挂 1已解挂）'
/
comment on column rec_loss.bllttype is ''
/
comment on column rec_loss.customerunitcode is '客户代码'
/
comment on column rec_loss.cardid is '对应卡信息表id'
/
comment on column rec_loss.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_MONTICKET_RESET" 
   (	"RESETID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"MONOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RUSHFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"HANGDATEMONTH" DATE NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"BILLNO" NUMBER NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30) NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_MONTICKET_RESET" PRIMARY KEY ("RESETID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_MONTICKET_RESET" UNIQUE ("CUSTOMERID", "CARDNO", "CARDSN", "HANGDATEMONTH", "ACCCODE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_monticket_reset is '次卡冲零明细表'
/
comment on column rec_monticket_reset.resetid is '冲零流水号'
/
comment on column rec_monticket_reset.customerid is '账号'
/
comment on column rec_monticket_reset.cardno is '卡号'
/
comment on column rec_monticket_reset.cardsn is '卡序号'
/
comment on column rec_monticket_reset.createdate is '生成时间'
/
comment on column rec_monticket_reset.cardtypedetailid is '卡类型小类'
/
comment on column rec_monticket_reset.cardkind is '卡种类'
/
comment on column rec_monticket_reset.monopcount is '交易计数'
/
comment on column rec_monticket_reset.monsaveopcount is '充值计数'
/
comment on column rec_monticket_reset.rushfare is '冲零金额'
/
comment on column rec_monticket_reset.hangdatemonth is '冲零月份'
/
comment on column rec_monticket_reset.planid is '充值申请流水'
/
comment on column rec_monticket_reset.billno is '帐单编号'
/
comment on column rec_monticket_reset.acccode is '科目编号'
/
comment on column rec_monticket_reset.dscrp is '科目描述'
/
comment on column rec_monticket_reset.poscode is '设备唯一编号'
/
comment on column rec_monticket_reset.empid is '职员id'
/
comment on column rec_monticket_reset.psamcardno is 'psam卡号'
/
comment on column rec_monticket_reset.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_ONLINE_PAYMENT" 
   (	"ORDERID" VARCHAR2(30) NOT NULL ENABLE, 
	"OPFARE" NUMBER, 
	"QRCODETYPE" NUMBER, 
	"ACCCODE" NUMBER, 
	"EMPID" NUMBER, 
	"POSCODE" NUMBER, 
	"DPTCODE" VARCHAR2(9), 
	"STATE" NUMBER, 
	"CREATETIME" DATE, 
	"LASTTIME" DATE, 
	"RESULT" VARCHAR2(30), 
	"DESCRIPTION" NVARCHAR2(1000), 
	"DETAILS" NVARCHAR2(2000), 
	"POSID" CHAR(9), 
	"CUSTOMERUNITCODE" NVARCHAR2(30), 
	 CONSTRAINT "PK_REC_ONLINE_PAYMENT_ORDERID" PRIMARY KEY ("ORDERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 243269632 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN_INDEX"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_online_payment is ''
/
comment on column rec_online_payment.orderid is '订单号'
/
comment on column rec_online_payment.opfare is '操作金额'
/
comment on column rec_online_payment.qrcodetype is '二维码类型 1-  龙支付;2-  微信;3-  支付宝4-  银联（暂不支持）'
/
comment on column rec_online_payment.acccode is '科目类型'
/
comment on column rec_online_payment.empid is '职员编号'
/
comment on column rec_online_payment.poscode is '终端编号'
/
comment on column rec_online_payment.dptcode is '部门编号'
/
comment on column rec_online_payment.state is '定单状态:0,生成;1成功'
/
comment on column rec_online_payment.createtime is '订单创建时间'
/
comment on column rec_online_payment.lasttime is '最后操作时间'
/
comment on column rec_online_payment.result is '操作返回结果:'
/
comment on column rec_online_payment.description is '最后返回描述'
/
comment on column rec_online_payment.details is '包体'
/
comment on column rec_online_payment.posid is '柜员编号'
/
comment on column rec_online_payment.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_PLANNED_TRIPS" 
   (	"ID" NUMBER, 
	"LINEID" VARCHAR2(20), 
	"DPTCODE" VARCHAR2(20), 
	"LINEKILOMETRE" VARCHAR2(20), 
	"PLANTRIPS" NUMBER, 
	"PLANDT" DATE, 
	"OPDT" DATE, 
	"EMPID" NUMBER(*,0), 
	"CHARGINGSTANDARD" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_planned_trips is '计划趟次明细表'
/
comment on column rec_planned_trips.id is '自增id'
/
comment on column rec_planned_trips.lineid is '线路编号 lineid  int'
/
comment on column rec_planned_trips.dptcode is '公司编号'
/
comment on column rec_planned_trips.linekilometre is '线路公里'
/
comment on column rec_planned_trips.plantrips is '计划趟次'
/
comment on column rec_planned_trips.plandt is '计划时间'
/
comment on column rec_planned_trips.opdt is '操作时间'
/
comment on column rec_planned_trips.empid is '职员id'
/
comment on column rec_planned_trips.chargingstandard is '收费标准'
/


  CREATE TABLE "CCENSE"."REC_POSCODE_RESET" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"RUSHFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"HANGDATEMONTH" DATE NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"MONSAVEOPFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"HANGDATEMONTHEND" DATE, 
	"ODDFARE" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_POSCODE_RESET" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_POSCODE_RESET" UNIQUE ("CUSTOMERID", "CARDNO", "CARDSN", "OPCOUNT", "WALLETTYPE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_poscode_reset is ''
/
comment on column rec_poscode_reset.cstaccfc is '流水号'
/
comment on column rec_poscode_reset.customerid is '账号'
/
comment on column rec_poscode_reset.cardno is '卡号'
/
comment on column rec_poscode_reset.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_poscode_reset.opdt is '交易时间'
/
comment on column rec_poscode_reset.rushfare is '清零金额'
/
comment on column rec_poscode_reset.hangdatemonth is '清零金额所属月份（最早清零开始月份）'
/
comment on column rec_poscode_reset.acccode is '交易科目'
/
comment on column rec_poscode_reset.dscrp is '科目描述'
/
comment on column rec_poscode_reset.cardsn is '卡序号'
/
comment on column rec_poscode_reset.opcount is '卡操作计数（直接取卡上当时的交易计数）'
/
comment on column rec_poscode_reset.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_poscode_reset.collectdt is '采集时间'
/
comment on column rec_poscode_reset.uploaddate is '上传时间'
/
comment on column rec_poscode_reset.busid is '车辆编号'
/
comment on column rec_poscode_reset.driverid is '司机id'
/
comment on column rec_poscode_reset.poscode is '设备运营唯一编号'
/
comment on column rec_poscode_reset.samcardno is 'sam卡号'
/
comment on column rec_poscode_reset.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_poscode_reset.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_poscode_reset.tac is 'tac验证码'
/
comment on column rec_poscode_reset.samtradeno is 'sam卡交易流水号（清零记录全部为0）'
/
comment on column rec_poscode_reset.buslineid is '线路编号'
/
comment on column rec_poscode_reset.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_poscode_reset.tradetype is '交易应用类型 0：消费记录 1：电子钱包充值撤销  9 清零记录'
/
comment on column rec_poscode_reset.linedept is '线路所属部门'
/
comment on column rec_poscode_reset.operatorpoint is '营运单位编号'
/
comment on column rec_poscode_reset.collectpoint is '采集点编号'
/
comment on column rec_poscode_reset.customerunitcode is '客户代码'
/
comment on column rec_poscode_reset.wallettype is '钱包类型 1：电子钱包 2 月票钱包 3 次卡钱包'
/
comment on column rec_poscode_reset.monsaveopfare is '每月充值金额'
/
comment on column rec_poscode_reset.hangdatemonthend is '清零金额结束月份（如果清零一个月，则该时间和最早开始清零月份一致）'
/
comment on column rec_poscode_reset.oddfare is '卡余额'
/
comment on column rec_poscode_reset.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_REFUNDMENT_LIST" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"ELECODDFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"DEPRECIATEFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"EMPID" NUMBER(10,0) NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"MANGEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"MONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OTHERFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"WRITEOFFTYPE" NUMBER, 
	 CONSTRAINT "UK_REC_REFUNDMENT_LIST_CUSTID" UNIQUE ("CUSTOMERID", "CUSTOMERUNITCODE", "CARDSN", "CARDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 9437184 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_refundment_list is '退款明细报表'
/
comment on column rec_refundment_list.id is 'id'
/
comment on column rec_refundment_list.customerid is '客户编号'
/
comment on column rec_refundment_list.elecoddfare is '电子钱包退款金额'
/
comment on column rec_refundment_list.depreciatefare is '折旧费金额'
/
comment on column rec_refundment_list.empid is '退款职员'
/
comment on column rec_refundment_list.psamcardno is 'psam卡号'
/
comment on column rec_refundment_list.poscode is '终端唯一编号'
/
comment on column rec_refundment_list.createdate is '形成记录时间'
/
comment on column rec_refundment_list.viceoddfare is '次卡钱包退款金额'
/
comment on column rec_refundment_list.mangefare is '管理费金额'
/
comment on column rec_refundment_list.customerunitcode is '客户代码'
/
comment on column rec_refundment_list.monoddfare is '月票钱包退款金额'
/
comment on column rec_refundment_list.otherfare is '其他扣费，太原公交扣卡成本费'
/
comment on column rec_refundment_list.cardsn is '持卡序号'
/
comment on column rec_refundment_list.cardno is '卡号'
/
comment on column rec_refundment_list.outid is '市民卡号'
/
comment on column rec_refundment_list.writeofftype is '退卡类型:0,正常退卡；1，自然损坏；2，人为损坏；3，丢失'
/


  CREATE TABLE "CCENSE"."REC_RUSHDUMPFARE_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"ELECOPCOUNT" NUMBER NOT NULL ENABLE, 
	"ELECSAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"LASTDUMPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECSUMFARE" NUMBER NOT NULL ENABLE, 
	"SUMCONSUMFARE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_RUSHDUMPFARE_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_rushdumpfare_log is ''
/
comment on column rec_rushdumpfare_log.id is 'id'
/
comment on column rec_rushdumpfare_log.customerid is '客户编号'
/
comment on column rec_rushdumpfare_log.cardno is '客户卡号'
/
comment on column rec_rushdumpfare_log.elecopcount is '电子钱包交易计数'
/
comment on column rec_rushdumpfare_log.elecsaveopcount is '电子钱包充值计数'
/
comment on column rec_rushdumpfare_log.lastdumpfare is '清零金额'
/
comment on column rec_rushdumpfare_log.elecsumfare is '电子钱包总额'
/
comment on column rec_rushdumpfare_log.sumconsumfare is '电子钱包累计消费金额'
/
comment on column rec_rushdumpfare_log.opdt is '操作日期'
/
comment on column rec_rushdumpfare_log.poscode is '终端编号'
/
comment on column rec_rushdumpfare_log.psamcardno is 'psam卡号'
/
comment on column rec_rushdumpfare_log.customerunitcode is '客户代码'
/
comment on column rec_rushdumpfare_log.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_RUSHVICEDUMPFARE_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER NOT NULL ENABLE, 
	"LASTDUMPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ELECSUMFARE" NUMBER NOT NULL ENABLE, 
	"SUMCONSUMFARE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 3 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_RUSHVICEDUMPFARE_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_rushvicedumpfare_log is ''
/
comment on column rec_rushvicedumpfare_log.id is 'id'
/
comment on column rec_rushvicedumpfare_log.customerid is '客户编号'
/
comment on column rec_rushvicedumpfare_log.cardno is '客户卡号'
/
comment on column rec_rushvicedumpfare_log.viceopcount is '次卡、月票钱包交易计数'
/
comment on column rec_rushvicedumpfare_log.vicesaveopcount is '次卡、月票钱包充值计数'
/
comment on column rec_rushvicedumpfare_log.lastdumpfare is '清零金额'
/
comment on column rec_rushvicedumpfare_log.elecsumfare is '次卡、月票钱包总额'
/
comment on column rec_rushvicedumpfare_log.sumconsumfare is '次卡、月票钱包累计消费金额'
/
comment on column rec_rushvicedumpfare_log.opdt is '操作日期'
/
comment on column rec_rushvicedumpfare_log.poscode is '终端编号'
/
comment on column rec_rushvicedumpfare_log.psamcardno is 'psam卡号'
/
comment on column rec_rushvicedumpfare_log.customerunitcode is '客户代码'
/
comment on column rec_rushvicedumpfare_log.wallettype is '钱包类型 2 月票钱包 3 次卡钱包'
/
comment on column rec_rushvicedumpfare_log.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_SELFMONEY_ACC" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(32,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"KTACCCODE" NUMBER NOT NULL ENABLE, 
	"KTFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"KTACCDSCRP" VARCHAR2(20), 
	"CHANGEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"MANGEACCCODE" NUMBER, 
	"MANGEFARE" NUMBER(10,2), 
	"MANGEDSCRP" VARCHAR2(20), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_SELFMONEY_ACC" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_selfmoney_acc is '开户费用明细表（包含折旧费和卡套费）'
/
comment on column rec_selfmoney_acc.id is '流水号'
/
comment on column rec_selfmoney_acc.empid is '操作职员'
/
comment on column rec_selfmoney_acc.customerid is '账号'
/
comment on column rec_selfmoney_acc.cardtype is '卡类别，普通卡，月票卡，老年卡'
/
comment on column rec_selfmoney_acc.opfare is '交易金额'
/
comment on column rec_selfmoney_acc.acccode is '交易科目'
/
comment on column rec_selfmoney_acc.dscrp is '交易科目描述'
/
comment on column rec_selfmoney_acc.ktacccode is '卡套费科目'
/
comment on column rec_selfmoney_acc.ktfare is '卡套费金额'
/
comment on column rec_selfmoney_acc.ktaccdscrp is ''
/
comment on column rec_selfmoney_acc.changedate is '交易时间'
/
comment on column rec_selfmoney_acc.cardkind is '交易卡类型 1m1卡， 2  cpu卡'
/
comment on column rec_selfmoney_acc.poscode is '终端唯一编号'
/
comment on column rec_selfmoney_acc.scardsnr is '卡唯一编号'
/
comment on column rec_selfmoney_acc.mangeacccode is '管理费科目'
/
comment on column rec_selfmoney_acc.mangefare is '管理费金额'
/
comment on column rec_selfmoney_acc.mangedscrp is '管理费科目描述'
/
comment on column rec_selfmoney_acc.customerunitcode is '客户代码'
/
comment on column rec_selfmoney_acc.cardno is '卡号'
/
comment on column rec_selfmoney_acc.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_SELFMONEY_ACC_BAK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(32,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"KTACCCODE" NUMBER NOT NULL ENABLE, 
	"KTFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"KTACCDSCRP" VARCHAR2(20), 
	"CHANGEDATE" DATE NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"MANGEACCCODE" NUMBER, 
	"MANGEFARE" NUMBER(10,2), 
	"MANGEDSCRP" VARCHAR2(20), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_selfmoney_acc_bak is ''
/
comment on column rec_selfmoney_acc_bak.id is ''
/
comment on column rec_selfmoney_acc_bak.empid is ''
/
comment on column rec_selfmoney_acc_bak.customerid is ''
/
comment on column rec_selfmoney_acc_bak.cardtype is ''
/
comment on column rec_selfmoney_acc_bak.opfare is ''
/
comment on column rec_selfmoney_acc_bak.acccode is ''
/
comment on column rec_selfmoney_acc_bak.dscrp is ''
/
comment on column rec_selfmoney_acc_bak.ktacccode is ''
/
comment on column rec_selfmoney_acc_bak.ktfare is ''
/
comment on column rec_selfmoney_acc_bak.ktaccdscrp is ''
/
comment on column rec_selfmoney_acc_bak.changedate is ''
/
comment on column rec_selfmoney_acc_bak.cardkind is ''
/
comment on column rec_selfmoney_acc_bak.poscode is ''
/
comment on column rec_selfmoney_acc_bak.scardsnr is ''
/
comment on column rec_selfmoney_acc_bak.mangeacccode is ''
/
comment on column rec_selfmoney_acc_bak.mangefare is ''
/
comment on column rec_selfmoney_acc_bak.mangedscrp is ''
/
comment on column rec_selfmoney_acc_bak.customerunitcode is ''
/
comment on column rec_selfmoney_acc_bak.cardno is ''
/
comment on column rec_selfmoney_acc_bak.outid is ''
/


  CREATE TABLE "CCENSE"."REC_SELFMONEY_ACC_BAK1" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(32,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"KTACCCODE" NUMBER NOT NULL ENABLE, 
	"KTFARE" NUMBER(10,2) NOT NULL ENABLE, 
	"KTACCDSCRP" VARCHAR2(20), 
	"CHANGEDATE" DATE NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"MANGEACCCODE" NUMBER, 
	"MANGEFARE" NUMBER(10,2), 
	"MANGEDSCRP" VARCHAR2(20), 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"CARDNO" NUMBER, 
	"OUTID" VARCHAR2(20) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_selfmoney_acc_bak1 is ''
/
comment on column rec_selfmoney_acc_bak1.id is ''
/
comment on column rec_selfmoney_acc_bak1.empid is ''
/
comment on column rec_selfmoney_acc_bak1.customerid is ''
/
comment on column rec_selfmoney_acc_bak1.cardtype is ''
/
comment on column rec_selfmoney_acc_bak1.opfare is ''
/
comment on column rec_selfmoney_acc_bak1.acccode is ''
/
comment on column rec_selfmoney_acc_bak1.dscrp is ''
/
comment on column rec_selfmoney_acc_bak1.ktacccode is ''
/
comment on column rec_selfmoney_acc_bak1.ktfare is ''
/
comment on column rec_selfmoney_acc_bak1.ktaccdscrp is ''
/
comment on column rec_selfmoney_acc_bak1.changedate is ''
/
comment on column rec_selfmoney_acc_bak1.cardkind is ''
/
comment on column rec_selfmoney_acc_bak1.poscode is ''
/
comment on column rec_selfmoney_acc_bak1.scardsnr is ''
/
comment on column rec_selfmoney_acc_bak1.mangeacccode is ''
/
comment on column rec_selfmoney_acc_bak1.mangefare is ''
/
comment on column rec_selfmoney_acc_bak1.mangedscrp is ''
/
comment on column rec_selfmoney_acc_bak1.customerunitcode is ''
/
comment on column rec_selfmoney_acc_bak1.cardno is ''
/
comment on column rec_selfmoney_acc_bak1.outid is ''
/


  CREATE TABLE "CCENSE"."REC_SELFMONEY_ACC_ROLLBACK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER(32,0) NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"KTACCCODE" NUMBER NOT NULL ENABLE, 
	"KTACCDSCRP" VARCHAR2(20), 
	"KTFARE" NUMBER NOT NULL ENABLE, 
	"CHANGEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"ROLLDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_selfmoney_acc_rollback is '开户费用回滚明细表（包含折旧费和卡套费）'
/
comment on column rec_selfmoney_acc_rollback.id is '流水号'
/
comment on column rec_selfmoney_acc_rollback.empid is '操作职员'
/
comment on column rec_selfmoney_acc_rollback.customerid is '账号'
/
comment on column rec_selfmoney_acc_rollback.cardtype is '卡类别，普通卡，月票卡，老年卡'
/
comment on column rec_selfmoney_acc_rollback.opfare is '交易金额'
/
comment on column rec_selfmoney_acc_rollback.acccode is '交易科目'
/
comment on column rec_selfmoney_acc_rollback.dscrp is '交易科目描述'
/
comment on column rec_selfmoney_acc_rollback.ktacccode is '卡套费科目'
/
comment on column rec_selfmoney_acc_rollback.ktaccdscrp is '卡套费描述'
/
comment on column rec_selfmoney_acc_rollback.ktfare is '卡套费金额'
/
comment on column rec_selfmoney_acc_rollback.changedate is '交易时间'
/
comment on column rec_selfmoney_acc_rollback.cardkind is '交易卡类型 1m1卡， 2  cpu卡'
/
comment on column rec_selfmoney_acc_rollback.poscode is '终端唯一编号'
/
comment on column rec_selfmoney_acc_rollback.scardsnr is '卡唯一编号'
/
comment on column rec_selfmoney_acc_rollback.rolldate is '回滚时间'
/
comment on column rec_selfmoney_acc_rollback.customerunitcode is '客户代码'
/
comment on column rec_selfmoney_acc_rollback.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_TAKEBACK_CARD" 
   (	"ID" NUMBER, 
	"ASN" NUMBER, 
	"ACCCODE" NUMBER, 
	"DESCRIPTION" VARCHAR2(50), 
	"ROLETYPE" NUMBER, 
	"INCENTIVE" NUMBER, 
	"POSCODE" VARCHAR2(32), 
	"DPTCODE" VARCHAR2(9), 
	"EMPID" NUMBER, 
	"OUTID" VARCHAR2(20), 
	"OPDT" DATE, 
	"CARDKIND" NUMBER, 
	"DETAILID" NUMBER, 
	 CONSTRAINT "PK_REC_TAKEBACK_CARD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_takeback_card is ''
/
comment on column rec_takeback_card.id is '流水'
/
comment on column rec_takeback_card.asn is '秘钥分散因子'
/
comment on column rec_takeback_card.acccode is '科目代码'
/
comment on column rec_takeback_card.description is '描述'
/
comment on column rec_takeback_card.roletype is '角色类型'
/
comment on column rec_takeback_card.incentive is '奖励金额'
/
comment on column rec_takeback_card.poscode is ' 编号'
/
comment on column rec_takeback_card.dptcode is '部门编号'
/
comment on column rec_takeback_card.empid is '职员id'
/
comment on column rec_takeback_card.outid is '市民卡号'
/
comment on column rec_takeback_card.opdt is '操作时间'
/
comment on column rec_takeback_card.cardkind is '卡种类1：m1卡，2：cpu卡'
/
comment on column rec_takeback_card.detailid is '卡类型'
/


  CREATE TABLE "CCENSE"."REC_TERM_OPERATION_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"OPTYPEID" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"OPDESC" VARCHAR2(600) NOT NULL ENABLE, 
	"UPLOADDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"POSRECNO" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_term_operation_log is '终端操作日志'
/
comment on column rec_term_operation_log.id is '编号'
/
comment on column rec_term_operation_log.poscode is '设备唯一编号'
/
comment on column rec_term_operation_log.optypeid is '操作类型'
/
comment on column rec_term_operation_log.opdt is '操作时间'
/
comment on column rec_term_operation_log.opdesc is '操作描述'
/
comment on column rec_term_operation_log.uploaddt is '上传时间'
/
comment on column rec_term_operation_log.collectdt is '采集时间'
/
comment on column rec_term_operation_log.posrecno is 'pos记录编号'
/
comment on column rec_term_operation_log.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"DISCOUNTFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30), 
	"BUSID" VARCHAR2(10), 
	"DRIVERID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER DEFAULT 0, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT NULL, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	"THIRDTERMID" VARCHAR2(20), 
	"THIRDMERCHANTCODE" VARCHAR2(20) DEFAULT NULL, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT NULL, 
	"RESPONSECODE" VARCHAR2(20), 
	"RESPONSEMESSAGE" VARCHAR2(200), 
	"EXTENTVALUE" VARCHAR2(1000), 
	"NEXTTIME" DATE DEFAULT NULL, 
	"USERID" VARCHAR2(100), 
	"THIRDCARDNO" VARCHAR2(30), 
	"ACCOUNTID" VARCHAR2(50), 
	"FILENAME" VARCHAR2(50), 
	"SYSTRACENUM" VARCHAR2(60) DEFAULT 0 NOT NULL ENABLE, 
	"STOPID" NUMBER(10,0), 
	"ORDERTYPE" VARCHAR2(2) DEFAULT 01 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDINFO" VARCHAR2(1000), 
	"APPID" VARCHAR2(100), 
	"LINEDIRECTION" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(6), 
	"TRACENUM" VARCHAR2(6), 
	"ISPUSH" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PUSHTIME" DATE DEFAULT NULL, 
	"PUSHRESPCODE" VARCHAR2(20), 
	"PUSHRESPMESSAGE" VARCHAR2(200), 
	 CONSTRAINT "PK_REC_THIRDRECORD" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD" UNIQUE ("SYSTRACENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 25165824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord is '银联双免,二维码（所有发码方）,oda原始消费明细表'
/
comment on column rec_thirdrecord.cstaccfc is '流水号'
/
comment on column rec_thirdrecord.opfare is '交易金额'
/
comment on column rec_thirdrecord.discountfare is '打折金额'
/
comment on column rec_thirdrecord.oddfare is '消费后余额'
/
comment on column rec_thirdrecord.acccode is '交易科目'
/
comment on column rec_thirdrecord.dscrp is '科目描述'
/
comment on column rec_thirdrecord.busid is '车辆编号'
/
comment on column rec_thirdrecord.driverid is '司机id'
/
comment on column rec_thirdrecord.buslineid is '线路编号'
/
comment on column rec_thirdrecord.linedept is '线路所属部门'
/
comment on column rec_thirdrecord.maincardtype is '主卡类型'
/
comment on column rec_thirdrecord.cardtype is '子卡类型'
/
comment on column rec_thirdrecord.poscode is '设备运营唯一编号'
/
comment on column rec_thirdrecord.traderecno is 'pos交易流水号'
/
comment on column rec_thirdrecord.opdt is '交易时间'
/
comment on column rec_thirdrecord.collectdt is '采集时间'
/
comment on column rec_thirdrecord.uploaddate is '上传时间'
/
comment on column rec_thirdrecord.testflag is '测试标记 （0：正常，1：测试）'
/
comment on column rec_thirdrecord.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_thirdrecord.dealtype is '记录类型  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_thirdrecord.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_thirdrecord.thirdtermid is '第三方分配终端编号'
/
comment on column rec_thirdrecord.thirdmerchantcode is '第三方分配商户编号'
/
comment on column rec_thirdrecord.customerunitcode is '客户法人'
/
comment on column rec_thirdrecord.status is '账目状态，0未清算，1已清算'
/
comment on column rec_thirdrecord.accountdate is '清算日期'
/
comment on column rec_thirdrecord.responsecode is '应答码'
/
comment on column rec_thirdrecord.responsemessage is '应答信息'
/
comment on column rec_thirdrecord.extentvalue is '扩展字段'
/
comment on column rec_thirdrecord.nexttime is '下次清算时间'
/
comment on column rec_thirdrecord.userid is '用户id'
/
comment on column rec_thirdrecord.thirdcardno is '虚拟卡号或第三方卡号'
/
comment on column rec_thirdrecord.accountid is '银联交易：检索参考号；其他'
/
comment on column rec_thirdrecord.filename is '清算文件名'
/
comment on column rec_thirdrecord.systracenum is '银联联机业务（银联终端编号+批次号+受卡方系统跟踪号），非银联联机业务（商户订单号），脱机业务（消费时间+poscode+终端交易流水）'
/
comment on column rec_thirdrecord.stopid is '站点编号'
/
comment on column rec_thirdrecord.ordertype is '订单类型 01：正常行程单 02：带人行程单 03：换乘订单'
/
comment on column rec_thirdrecord.tradekind is '交易性质  公交 地铁 出租车'
/
comment on column rec_thirdrecord.wallettype is '钱包类型'
/
comment on column rec_thirdrecord.recordinfo is '二维码脱机记录信息'
/
comment on column rec_thirdrecord.appid is '第三方应用id'
/
comment on column rec_thirdrecord.linedirection is '线路方向  0上行 1下行 分段计费时使用'
/
comment on column rec_thirdrecord.tradetype is '交易应用类型  0：消费记录 1：电子钱包充值 2：月票充值 9：清零记录'
/
comment on column rec_thirdrecord.batchno is '银联批次号'
/
comment on column rec_thirdrecord.tracenum is '银联受卡方系统跟踪号'
/
comment on column rec_thirdrecord.ispush is '是否给第三方推送，0待推送，1已推送'
/
comment on column rec_thirdrecord.pushtime is '给对方推送时间'
/
comment on column rec_thirdrecord.pushrespcode is '给对方推送后响应码'
/
comment on column rec_thirdrecord.pushrespmessage is '给对方推送后响应信息'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_BATCHNO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(12) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"FILENUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DOWNSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPSTATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSINESSTYPE" NUMBER NOT NULL ENABLE, 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_THIRDRECORD_BATCHNO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD_BATCHNO" UNIQUE ("BATCHNO", "FILETYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_batchno is '第三方对接文件批次信息表'
/
comment on column rec_thirdrecord_batchno.id is '主键'
/
comment on column rec_thirdrecord_batchno.batchno is '批次号（格式：20190114）'
/
comment on column rec_thirdrecord_batchno.filetype is '文件类型'
/
comment on column rec_thirdrecord_batchno.filenum is '文件数'
/
comment on column rec_thirdrecord_batchno.downstatus is '下载文件状态：0：初始状态；1：是否全部下载完成；2：文件是否全部清算完成'
/
comment on column rec_thirdrecord_batchno.upstatus is '上传文件状态：0：初始状态；1：是否全部下载完成；2：文件是否全部清算完成'
/
comment on column rec_thirdrecord_batchno.businesstype is '批次业务类型：1：上传；2：下载'
/
comment on column rec_thirdrecord_batchno.updatetime is '更新时间'
/
comment on column rec_thirdrecord_batchno.createtime is '入库时间'
/
comment on column rec_thirdrecord_batchno.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_FILEINFO" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"FILENAME" VARCHAR2(50), 
	"FILESIZE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FILERECORDNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"REALRECORDNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ALREADYDEALNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"FILEBUILDTIME" DATE, 
	"ACCDATE" DATE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ISACCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(20), 
	 CONSTRAINT "PK_REC_THIRDRECORD_FILEINFO" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD_FILEINFO" UNIQUE ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_fileinfo is '第三方对接文件信息表'
/
comment on column rec_thirdrecord_fileinfo.id is '主键'
/
comment on column rec_thirdrecord_fileinfo.filetype is '文件类型'
/
comment on column rec_thirdrecord_fileinfo.filename is '文件名'
/
comment on column rec_thirdrecord_fileinfo.filesize is '文件大小'
/
comment on column rec_thirdrecord_fileinfo.filerecordnum is '文件记录条数'
/
comment on column rec_thirdrecord_fileinfo.realrecordnum is '文件中数据记录条数'
/
comment on column rec_thirdrecord_fileinfo.alreadydealnum is '已入库多少条数据'
/
comment on column rec_thirdrecord_fileinfo.filebuildtime is '文件生成时间'
/
comment on column rec_thirdrecord_fileinfo.accdate is '文件清算日期'
/
comment on column rec_thirdrecord_fileinfo.status is '文件记录是否入库完成状态：0：初始状态；1：已完成'
/
comment on column rec_thirdrecord_fileinfo.isaccount is '该文件里的所有记录是否已经本地清算完成：0：未清算，1：清算完成'
/
comment on column rec_thirdrecord_fileinfo.updatetime is '更新时间'
/
comment on column rec_thirdrecord_fileinfo.createtime is '入库时间'
/
comment on column rec_thirdrecord_fileinfo.customerunitcode is '客户代码'
/
comment on column rec_thirdrecord_fileinfo.batchno is '批次号'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_FILETYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"BUSINESSTYPE" NUMBER NOT NULL ENABLE, 
	"FTPIP" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPORT" VARCHAR2(10) NOT NULL ENABLE, 
	"FTPUSER" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPASSWORD" VARCHAR2(20) NOT NULL ENABLE, 
	"FTPPATH" VARCHAR2(60) NOT NULL ENABLE, 
	"FTPBAKPATH" VARCHAR2(60), 
	"LOCALUPPATH" VARCHAR2(100), 
	"LOCALUPBAKPATH" VARCHAR2(100), 
	"LOCALDOWNPATH" VARCHAR2(100), 
	"LOCALDOWNBAKPATH" VARCHAR2(100), 
	"UPDATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_THIRDRECORD_FILETYPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD_FILETYPE" UNIQUE ("FILETYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_filetype is '第三方对接文件类型信息表'
/
comment on column rec_thirdrecord_filetype.id is '主键'
/
comment on column rec_thirdrecord_filetype.filetype is '文件类型'
/
comment on column rec_thirdrecord_filetype.businesstype is '文件业务类型：1：上传；2：下载'
/
comment on column rec_thirdrecord_filetype.ftpip is 'ftp服务器ip'
/
comment on column rec_thirdrecord_filetype.ftpport is 'ftp服务器端口'
/
comment on column rec_thirdrecord_filetype.ftpuser is 'ftp服务器用户名'
/
comment on column rec_thirdrecord_filetype.ftppassword is 'ftp服务器密码'
/
comment on column rec_thirdrecord_filetype.ftppath is 'ftp服务器路径'
/
comment on column rec_thirdrecord_filetype.ftpbakpath is 'ftp服务器备份路径'
/
comment on column rec_thirdrecord_filetype.localuppath is '本地上传路径'
/
comment on column rec_thirdrecord_filetype.localupbakpath is '本地上传备份路径'
/
comment on column rec_thirdrecord_filetype.localdownpath is '本地下载路径'
/
comment on column rec_thirdrecord_filetype.localdownbakpath is '本地下载备份路径'
/
comment on column rec_thirdrecord_filetype.updatetime is '更新时间'
/
comment on column rec_thirdrecord_filetype.createtime is '入库时间'
/
comment on column rec_thirdrecord_filetype.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(12) NOT NULL ENABLE, 
	"FILETYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"BUSSINESSTYPE" VARCHAR2(50), 
	"LOGCONTENT" VARCHAR2(4000), 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	 CONSTRAINT "PK_REC_THIRDRECORD_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_log is '第三方对接日志'
/
comment on column rec_thirdrecord_log.id is '流水号'
/
comment on column rec_thirdrecord_log.batchno is '批次号'
/
comment on column rec_thirdrecord_log.filetype is '文件类型'
/
comment on column rec_thirdrecord_log.bussinesstype is '业务类型【0：ftp上传下载文件，1：本地处理文件；2：生成文件】'
/
comment on column rec_thirdrecord_log.logcontent is '异常日志内容'
/
comment on column rec_thirdrecord_log.createtime is '入库时间'
/
comment on column rec_thirdrecord_log.customerunitcode is '客户法人'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_REPEAT" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"DISCOUNTFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30), 
	"BUSID" VARCHAR2(10), 
	"DRIVERID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER DEFAULT 0, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT NULL, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	"THIRDTERMID" VARCHAR2(20), 
	"THIRDMERCHANTCODE" VARCHAR2(20) DEFAULT NULL, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT NULL, 
	"RESPONSECODE" VARCHAR2(20), 
	"RESPONSEMESSAGE" VARCHAR2(200), 
	"EXTENTVALUE" VARCHAR2(1000), 
	"NEXTTIME" DATE DEFAULT NULL, 
	"USERID" VARCHAR2(100), 
	"THIRDCARDNO" VARCHAR2(30), 
	"ACCOUNTID" VARCHAR2(50), 
	"FILENAME" VARCHAR2(50), 
	"SYSTRACENUM" VARCHAR2(60) DEFAULT 0 NOT NULL ENABLE, 
	"STOPID" NUMBER(10,0), 
	"ORDERTYPE" VARCHAR2(2) DEFAULT 01 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDINFO" VARCHAR2(1000), 
	"APPID" VARCHAR2(100), 
	"LINEDIRECTION" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(6), 
	"TRACENUM" VARCHAR2(6), 
	 CONSTRAINT "PK_REC_THIRDRECORD_REPEAT" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_repeat is '银联双免,二维码（所有发码方）,oda原始消费明细表'
/
comment on column rec_thirdrecord_repeat.cstaccfc is '流水号'
/
comment on column rec_thirdrecord_repeat.opfare is '交易金额'
/
comment on column rec_thirdrecord_repeat.discountfare is '打折金额'
/
comment on column rec_thirdrecord_repeat.oddfare is '消费后余额'
/
comment on column rec_thirdrecord_repeat.acccode is '交易科目'
/
comment on column rec_thirdrecord_repeat.dscrp is '科目描述'
/
comment on column rec_thirdrecord_repeat.busid is '车辆编号'
/
comment on column rec_thirdrecord_repeat.driverid is '司机id'
/
comment on column rec_thirdrecord_repeat.buslineid is '线路编号'
/
comment on column rec_thirdrecord_repeat.linedept is '线路所属部门'
/
comment on column rec_thirdrecord_repeat.maincardtype is '主卡类型'
/
comment on column rec_thirdrecord_repeat.cardtype is '子卡类型'
/
comment on column rec_thirdrecord_repeat.poscode is '设备运营唯一编号'
/
comment on column rec_thirdrecord_repeat.traderecno is 'pos交易流水号'
/
comment on column rec_thirdrecord_repeat.opdt is '交易时间'
/
comment on column rec_thirdrecord_repeat.collectdt is '采集时间'
/
comment on column rec_thirdrecord_repeat.uploaddate is '上传时间'
/
comment on column rec_thirdrecord_repeat.testflag is '测试标记 （0：正常，1：测试）'
/
comment on column rec_thirdrecord_repeat.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_thirdrecord_repeat.dealtype is '记录类型  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_thirdrecord_repeat.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_thirdrecord_repeat.thirdtermid is '第三方分配终端编号'
/
comment on column rec_thirdrecord_repeat.thirdmerchantcode is '第三方分配商户编号'
/
comment on column rec_thirdrecord_repeat.customerunitcode is '客户法人'
/
comment on column rec_thirdrecord_repeat.status is '账目状态，0未清算，1已清算'
/
comment on column rec_thirdrecord_repeat.accountdate is '清算日期'
/
comment on column rec_thirdrecord_repeat.responsecode is '应答码'
/
comment on column rec_thirdrecord_repeat.responsemessage is '应答信息'
/
comment on column rec_thirdrecord_repeat.extentvalue is '扩展字段'
/
comment on column rec_thirdrecord_repeat.nexttime is '下次清算时间'
/
comment on column rec_thirdrecord_repeat.userid is '用户id'
/
comment on column rec_thirdrecord_repeat.thirdcardno is '虚拟卡号或第三方卡号'
/
comment on column rec_thirdrecord_repeat.accountid is '账户id'
/
comment on column rec_thirdrecord_repeat.filename is '清算文件名'
/
comment on column rec_thirdrecord_repeat.systracenum is '银联联机业务（银联终端编号+批次号+受卡方系统跟踪号），非银联联机业务（商户订单号），脱机业务（消费时间+poscode+终端交易流水）'
/
comment on column rec_thirdrecord_repeat.stopid is '站点编号'
/
comment on column rec_thirdrecord_repeat.ordertype is '订单类型 01：正常行程单 02：带人行程单 03：换乘订单'
/
comment on column rec_thirdrecord_repeat.tradekind is '交易性质 公交 地铁 出租车'
/
comment on column rec_thirdrecord_repeat.wallettype is '钱包类型'
/
comment on column rec_thirdrecord_repeat.recordinfo is '二维码脱机记录信息'
/
comment on column rec_thirdrecord_repeat.appid is '第三方应用id'
/
comment on column rec_thirdrecord_repeat.linedirection is '线路方向  0上行 1下行 分段计费时使用'
/
comment on column rec_thirdrecord_repeat.tradetype is '交易应用类型  0：消费记录 1：电子钱包充值 2：月票充值 9：清零记录'
/
comment on column rec_thirdrecord_repeat.batchno is '银联批次号'
/
comment on column rec_thirdrecord_repeat.tracenum is '银联受卡方系统跟踪号'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_SUCESS" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"THIRDCARDNO" VARCHAR2(30), 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"DISCOUNTFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(30), 
	"BUSID" VARCHAR2(10), 
	"DRIVERID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER DEFAULT 0, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT NULL NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"TESTFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 1 NOT NULL ENABLE, 
	"FLAG" NUMBER DEFAULT 0, 
	"THIRDTERMID" VARCHAR2(20), 
	"THIRDMERCHANTCODE" VARCHAR2(20) DEFAULT NULL, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT NULL NOT NULL ENABLE, 
	"RESPONSECODE" VARCHAR2(12), 
	"RESPONSEMESSAGE" VARCHAR2(200), 
	"EXTENTVALUE" VARCHAR2(1000), 
	"USERID" VARCHAR2(100), 
	"ACCOUNTID" VARCHAR2(50), 
	"FILENAME" VARCHAR2(50), 
	"TRANSFERDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"SYSTRACENUM" VARCHAR2(60) DEFAULT 0 NOT NULL ENABLE, 
	"STOPID" NUMBER(10,0), 
	"ORDERTYPE" VARCHAR2(2) DEFAULT 01 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"RECORDINFO" VARCHAR2(1000), 
	"APPID" VARCHAR2(100), 
	"LINEDIRECTION" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"GPFLAG" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BATCHNO" VARCHAR2(6), 
	"TRACENUM" VARCHAR2(6), 
	 CONSTRAINT "PK_REC_THIRDRECORD_SUCESS" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD_SUCESS" UNIQUE ("SYSTRACENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 26214400 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_sucess is '银联双免,二维码（所有发码方）,oda原始消费明细表'
/
comment on column rec_thirdrecord_sucess.cstaccfc is '流水号'
/
comment on column rec_thirdrecord_sucess.thirdcardno is '第三方卡号'
/
comment on column rec_thirdrecord_sucess.opfare is '交易金额'
/
comment on column rec_thirdrecord_sucess.discountfare is '打折金额'
/
comment on column rec_thirdrecord_sucess.oddfare is '消费后余额'
/
comment on column rec_thirdrecord_sucess.acccode is '交易科目'
/
comment on column rec_thirdrecord_sucess.dscrp is '科目描述'
/
comment on column rec_thirdrecord_sucess.busid is '车辆编号'
/
comment on column rec_thirdrecord_sucess.driverid is '司机id'
/
comment on column rec_thirdrecord_sucess.buslineid is '线路编号'
/
comment on column rec_thirdrecord_sucess.linedept is '线路所属部门'
/
comment on column rec_thirdrecord_sucess.maincardtype is '主卡类型'
/
comment on column rec_thirdrecord_sucess.cardtype is '子卡类型'
/
comment on column rec_thirdrecord_sucess.poscode is '设备运营唯一编号'
/
comment on column rec_thirdrecord_sucess.traderecno is 'pos交易流水号'
/
comment on column rec_thirdrecord_sucess.opdt is '交易时间'
/
comment on column rec_thirdrecord_sucess.collectdt is '采集时间'
/
comment on column rec_thirdrecord_sucess.uploaddate is '上传时间'
/
comment on column rec_thirdrecord_sucess.testflag is '测试标记 （0：正常，1：测试）'
/
comment on column rec_thirdrecord_sucess.recordtype is '记录类型 0：统一票价记录 1：分段计费记录'
/
comment on column rec_thirdrecord_sucess.dealtype is '记录类型  1：正常 2：灰色 3：mac错误...'
/
comment on column rec_thirdrecord_sucess.flag is '分段计费-逃票标价：0-无逃票 1-逃票记录（如果是逃票记录，司机id是逃票车辆的司机信息）'
/
comment on column rec_thirdrecord_sucess.thirdtermid is '第三方分配终端编号'
/
comment on column rec_thirdrecord_sucess.thirdmerchantcode is '第三方分配商户编号'
/
comment on column rec_thirdrecord_sucess.customerunitcode is '客户法人'
/
comment on column rec_thirdrecord_sucess.accountdate is '清算日期'
/
comment on column rec_thirdrecord_sucess.responsecode is '应答码'
/
comment on column rec_thirdrecord_sucess.responsemessage is '应答信息'
/
comment on column rec_thirdrecord_sucess.extentvalue is '扩展字段'
/
comment on column rec_thirdrecord_sucess.userid is '用户id'
/
comment on column rec_thirdrecord_sucess.accountid is '银联交易：检索参考号；其他'
/
comment on column rec_thirdrecord_sucess.filename is '清算文件名'
/
comment on column rec_thirdrecord_sucess.transferdate is '转储时间'
/
comment on column rec_thirdrecord_sucess.systracenum is '银联联机业务（银联终端编号+批次号+受卡方系统跟踪号），非银联联机业务（商户订单号），脱机业务（消费时间+poscode+终端交易流水）'
/
comment on column rec_thirdrecord_sucess.stopid is '站点编号'
/
comment on column rec_thirdrecord_sucess.ordertype is '订单类型 01：正常行程单 02：带人行程单 03：换乘订单'
/
comment on column rec_thirdrecord_sucess.tradekind is '交易性质 公交 地铁 出租车'
/
comment on column rec_thirdrecord_sucess.wallettype is '钱包类型'
/
comment on column rec_thirdrecord_sucess.recordinfo is '二维码脱机记录信息'
/
comment on column rec_thirdrecord_sucess.appid is '第三方应用id'
/
comment on column rec_thirdrecord_sucess.linedirection is '线路方向  0上行 1下行 分段计费时使用'
/
comment on column rec_thirdrecord_sucess.gpflag is '0源于tb文件;1源于pd'
/
comment on column rec_thirdrecord_sucess.tradetype is '交易应用类型  0：消费记录 1：电子钱包充值 2：月票充值 9：清零记录'
/
comment on column rec_thirdrecord_sucess.batchno is '银联批次号'
/
comment on column rec_thirdrecord_sucess.tracenum is '银联受卡方系统跟踪号'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_UNION_RESULT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"MERCHANTCODE" VARCHAR2(20), 
	"MERCHANTNAME" VARCHAR2(50), 
	"ACCOUNTDATE" DATE DEFAULT SYSDATE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UNIONTERMID" VARCHAR2(20), 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCOUNTOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"FEE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER NOT NULL ENABLE, 
	"TRADETYPE" VARCHAR2(10), 
	"REFNO" VARCHAR2(20), 
	"BANKCARDNO" VARCHAR2(20), 
	"BANK" VARCHAR2(50), 
	"SYSTRACENUM" VARCHAR2(60) DEFAULT 0, 
	"CARDTYPE" VARCHAR2(20), 
	"LINECODE" VARCHAR2(20), 
	"DRIVERCODE" VARCHAR2(20), 
	"DRIVERINFO" VARCHAR2(20), 
	"BUSINFO" VARCHAR2(50), 
	"FILENAME" VARCHAR2(50), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"STATUSUPDATETIME" DATE, 
	 CONSTRAINT "PK_REC_THIRDRECORD_UNIO_RESULT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_union_result is '银联双免oda清算结果文件'
/
comment on column rec_thirdrecord_union_result.id is '主键'
/
comment on column rec_thirdrecord_union_result.merchantcode is '商户号'
/
comment on column rec_thirdrecord_union_result.merchantname is '商户名称'
/
comment on column rec_thirdrecord_union_result.accountdate is '清算日期'
/
comment on column rec_thirdrecord_union_result.opdt is '交易时间（银联的非终端上产生的）'
/
comment on column rec_thirdrecord_union_result.uniontermid is '银联终端编号'
/
comment on column rec_thirdrecord_union_result.opfare is '交易金额（单位元）'
/
comment on column rec_thirdrecord_union_result.accountopfare is '清算金额（单位元）'
/
comment on column rec_thirdrecord_union_result.fee is '手续费（单位元）'
/
comment on column rec_thirdrecord_union_result.traderecno is '银联终端交易流水号'
/
comment on column rec_thirdrecord_union_result.tradetype is '交易类型'
/
comment on column rec_thirdrecord_union_result.refno is '参考号'
/
comment on column rec_thirdrecord_union_result.bankcardno is '卡号'
/
comment on column rec_thirdrecord_union_result.bank is '发卡行'
/
comment on column rec_thirdrecord_union_result.systracenum is '系统跟踪号'
/
comment on column rec_thirdrecord_union_result.cardtype is '卡类型'
/
comment on column rec_thirdrecord_union_result.linecode is '线路编号'
/
comment on column rec_thirdrecord_union_result.drivercode is '司机编号'
/
comment on column rec_thirdrecord_union_result.driverinfo is '司机信息'
/
comment on column rec_thirdrecord_union_result.businfo is '车辆信息'
/
comment on column rec_thirdrecord_union_result.filename is '文件名'
/
comment on column rec_thirdrecord_union_result.status is '处理结果 0 未处理 1 已处理'
/
comment on column rec_thirdrecord_union_result.createtime is '入库时间'
/
comment on column rec_thirdrecord_union_result.statusupdatetime is '状态修改时间'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_XMLC_RESULT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"USERID" VARCHAR2(16) NOT NULL ENABLE, 
	"SYSTRACENUM" VARCHAR2(60) NOT NULL ENABLE, 
	"UPDATETIME" DATE NOT NULL ENABLE, 
	"ACTUALAMOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEVICEID" VARCHAR2(16), 
	"CODE" VARCHAR2(5) NOT NULL ENABLE, 
	"SUBCODE" VARCHAR2(5), 
	"SUB_MESSAGE" VARCHAR2(20), 
	"PAYTYPE" VARCHAR2(20), 
	"RESPTRADENO" VARCHAR2(60), 
	"FILENAME" VARCHAR2(50) NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE, 
	"STATUSUPDATETIME" DATE, 
	 CONSTRAINT "PK_REC_THIRDRECORD_XMLC_RESULT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 851968 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_THIRDRECORD_XMLC_RESULT" UNIQUE ("SYSTRACENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 7340032 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_xmlc_result is '小码联城二维码交易数据结算信息'
/
comment on column rec_thirdrecord_xmlc_result.id is '主键'
/
comment on column rec_thirdrecord_xmlc_result.userid is '用户id'
/
comment on column rec_thirdrecord_xmlc_result.systracenum is '交易流水号'
/
comment on column rec_thirdrecord_xmlc_result.updatetime is '交易时间'
/
comment on column rec_thirdrecord_xmlc_result.actualamount is '交易金额（元）'
/
comment on column rec_thirdrecord_xmlc_result.deviceid is '设备id'
/
comment on column rec_thirdrecord_xmlc_result.code is '错误码（10000代码成功）'
/
comment on column rec_thirdrecord_xmlc_result.subcode is '子错误码'
/
comment on column rec_thirdrecord_xmlc_result.sub_message is '具体错误信息'
/
comment on column rec_thirdrecord_xmlc_result.paytype is '支付类型:1是“支付宝“，7是”app“,'
/
comment on column rec_thirdrecord_xmlc_result.resptradeno is '对应外部系统得订单号（可选，默认没有）'
/
comment on column rec_thirdrecord_xmlc_result.filename is '文件名'
/
comment on column rec_thirdrecord_xmlc_result.status is '状态：0：未处理；1：已处理'
/
comment on column rec_thirdrecord_xmlc_result.createtime is '入库时间'
/
comment on column rec_thirdrecord_xmlc_result.accountdate is ''
/
comment on column rec_thirdrecord_xmlc_result.statusupdatetime is '状态修改时间'
/


  CREATE TABLE "CCENSE"."REC_THIRDRECORD_XMLC_RESULT_AA" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"USERID" VARCHAR2(16) NOT NULL ENABLE, 
	"SYSTRACENUM" VARCHAR2(60) NOT NULL ENABLE, 
	"UPDATETIME" DATE NOT NULL ENABLE, 
	"ACTUALAMOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEVICEID" VARCHAR2(16), 
	"CODE" VARCHAR2(5) NOT NULL ENABLE, 
	"SUBCODE" VARCHAR2(5), 
	"SUB_MESSAGE" VARCHAR2(20), 
	"PAYTYPE" VARCHAR2(20), 
	"RESPTRADENO" VARCHAR2(60), 
	"FILENAME" VARCHAR2(50) NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE, 
	"STATUSUPDATETIME" DATE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00, 
	 CONSTRAINT "PK_REC_THIRDRECORD_XMLC_AA" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_thirdrecord_xmlc_result_aa is '小码联城二维码交易数据结算信息'
/
comment on column rec_thirdrecord_xmlc_result_aa.id is '主键'
/
comment on column rec_thirdrecord_xmlc_result_aa.userid is '用户id'
/
comment on column rec_thirdrecord_xmlc_result_aa.systracenum is '交易流水号'
/
comment on column rec_thirdrecord_xmlc_result_aa.updatetime is '交易时间'
/
comment on column rec_thirdrecord_xmlc_result_aa.actualamount is '交易金额（元）'
/
comment on column rec_thirdrecord_xmlc_result_aa.deviceid is '设备id'
/
comment on column rec_thirdrecord_xmlc_result_aa.code is '错误码（10000代码成功）'
/
comment on column rec_thirdrecord_xmlc_result_aa.subcode is '子错误码'
/
comment on column rec_thirdrecord_xmlc_result_aa.sub_message is '具体错误信息'
/
comment on column rec_thirdrecord_xmlc_result_aa.paytype is '支付类型:1是“支付宝“，7是”app“,'
/
comment on column rec_thirdrecord_xmlc_result_aa.resptradeno is '对应外部系统得订单号（可选，默认没有）'
/
comment on column rec_thirdrecord_xmlc_result_aa.filename is '文件名'
/
comment on column rec_thirdrecord_xmlc_result_aa.status is '状态：0：未处理；1：已处理'
/
comment on column rec_thirdrecord_xmlc_result_aa.createtime is '入库时间'
/
comment on column rec_thirdrecord_xmlc_result_aa.accountdate is ''
/
comment on column rec_thirdrecord_xmlc_result_aa.statusupdatetime is '状态修改时间'
/
comment on column rec_thirdrecord_xmlc_result_aa.opfare is '交易金额（单位分）'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"ISREPEAL" NUMBER DEFAULT 0, 
	 CONSTRAINT "PK_REC_VICECARD_CASH" PRIMARY KEY ("CARDNO", "VICESAVEOPCOUNT", "VICEOPCOUNT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN_INDEX"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("OPDT") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table rec_vicecard_cash is '次卡钱包充值记录明细表'
/
comment on column rec_vicecard_cash.cashaccfc is '交易流水号'
/
comment on column rec_vicecard_cash.opdt is '交易时间'
/
comment on column rec_vicecard_cash.customerid is '账号'
/
comment on column rec_vicecard_cash.cardno is '卡号'
/
comment on column rec_vicecard_cash.cardsn is '卡序号'
/
comment on column rec_vicecard_cash.cardtypedetailid is '卡类别小类'
/
comment on column rec_vicecard_cash.cardkind is '卡类型 1m1 2cpu'
/
comment on column rec_vicecard_cash.viceopcount is '次卡钱包消费操作计数'
/
comment on column rec_vicecard_cash.vicesaveopcount is '次卡钱包充值交易计数'
/
comment on column rec_vicecard_cash.viceoddfare is '次卡钱包卡余额'
/
comment on column rec_vicecard_cash.viceoddfarepre is '次卡钱包前期卡余额'
/
comment on column rec_vicecard_cash.vicedummyopfare is '次卡钱包虚充金额'
/
comment on column rec_vicecard_cash.viceopfare is '次卡钱包交易金额'
/
comment on column rec_vicecard_cash.acccode is '交易科目'
/
comment on column rec_vicecard_cash.dscrp is '交易科目描述'
/
comment on column rec_vicecard_cash.poscode is '交易终端设备唯一编号'
/
comment on column rec_vicecard_cash.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_vicecard_cash.samcardno is 'sam卡号'
/
comment on column rec_vicecard_cash.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_cash.planid is '充值申请流水'
/
comment on column rec_vicecard_cash.uploaddate is '上传时间'
/
comment on column rec_vicecard_cash.empid is '职员id'
/
comment on column rec_vicecard_cash.wallettype is '钱包类型:3-电子钱包'
/
comment on column rec_vicecard_cash.tac is 'tac码'
/
comment on column rec_vicecard_cash.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_cash.customerunitcode is '客户代码'
/
comment on column rec_vicecard_cash.limittimes is '单位最大消费次数（每个月最多可以消费多少次）'
/
comment on column rec_vicecard_cash.monthnum is '充值单位数（本次充值连充的月数个数）'
/
comment on column rec_vicecard_cash.validtimestart is '有效启日'
/
comment on column rec_vicecard_cash.validtimeend is '有效止日'
/
comment on column rec_vicecard_cash.outid is '市民卡号'
/
comment on column rec_vicecard_cash.isrepeal is '是否充值撤销：0，未充值撤销；1，已经充值撤销'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH_PLAN" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AREAID" NUMBER, 
	"VER" NUMBER DEFAULT 0, 
	"REPEALEMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OLDPLANID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_VICE_CASH_PLAN" PRIMARY KEY ("PLANID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 983040 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_vicecard_cash_plan is '次卡钱包领款计划申请表'
/
comment on column rec_vicecard_cash_plan.planid is '申请流水'
/
comment on column rec_vicecard_cash_plan.customerid is '帐号'
/
comment on column rec_vicecard_cash_plan.cardno is '卡号'
/
comment on column rec_vicecard_cash_plan.cardsn is '持卡序号'
/
comment on column rec_vicecard_cash_plan.cardtypedetailid is '卡类型'
/
comment on column rec_vicecard_cash_plan.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_cash_plan.viceoddfare is '充值后次卡钱包余额'
/
comment on column rec_vicecard_cash_plan.viceoddfarepre is '充值前次卡钱包余额'
/
comment on column rec_vicecard_cash_plan.vicedummyopfare is '次卡钱包虚充金额'
/
comment on column rec_vicecard_cash_plan.viceopfare is '次卡钱包交易金额'
/
comment on column rec_vicecard_cash_plan.vicesaveopcount is '次卡钱包充值后交易计数'
/
comment on column rec_vicecard_cash_plan.viceopcount is '次卡钱包消费交易计数'
/
comment on column rec_vicecard_cash_plan.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_vicecard_cash_plan.acccode is '科目代码'
/
comment on column rec_vicecard_cash_plan.opdt is '操作时间'
/
comment on column rec_vicecard_cash_plan.description is '科目描述'
/
comment on column rec_vicecard_cash_plan.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_vicecard_cash_plan.poscode is '设备运营唯一编号'
/
comment on column rec_vicecard_cash_plan.psamcardno is 'psam卡号'
/
comment on column rec_vicecard_cash_plan.empid is '职员帐号'
/
comment on column rec_vicecard_cash_plan.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_vicecard_cash_plan.wallettype is '钱包类型'
/
comment on column rec_vicecard_cash_plan.tac is 'tac码'
/
comment on column rec_vicecard_cash_plan.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_cash_plan.areaid is '分区id'
/
comment on column rec_vicecard_cash_plan.ver is '记录版本'
/
comment on column rec_vicecard_cash_plan.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_vicecard_cash_plan.customerunitcode is '客户代码'
/
comment on column rec_vicecard_cash_plan.validtimestart is '有效启日'
/
comment on column rec_vicecard_cash_plan.validtimeend is '有效止日'
/
comment on column rec_vicecard_cash_plan.oldplanid is '原充值planid(充值申请时产生)'
/
comment on column rec_vicecard_cash_plan.limittimes is '单位最大消费次数'
/
comment on column rec_vicecard_cash_plan.monthnum is '充值单位数'
/
comment on column rec_vicecard_cash_plan.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH_PLAN_BAD" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"CARDNO" NUMBER DEFAULT 0, 
	"CARDSN" NUMBER DEFAULT 0, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0, 
	"SUMVICEADDFARE" NUMBER(10,2) DEFAULT 0.00, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0, 
	"VICEOPCOUNT" NUMBER DEFAULT 0, 
	"STATUS" NUMBER DEFAULT 0, 
	"ACCCODE" NUMBER, 
	"OPDT" DATE DEFAULT SYSDATE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0, 
	"POSCODE" NUMBER DEFAULT 0, 
	"PSAMCARDNO" NUMBER DEFAULT 0, 
	"EMPID" NUMBER DEFAULT 0, 
	"DEALTYPE" NUMBER DEFAULT 0, 
	"WALLETTYPE" NUMBER DEFAULT 0, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0, 
	"BADCODE" NUMBER, 
	"BADDESC" VARCHAR2(300), 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT SYSDATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_VICECARD_CASH_PLAN_BAD" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 983040 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_vicecard_cash_plan_bad is '次卡钱包提交失败记录表'
/
comment on column rec_vicecard_cash_plan_bad.id is '流水号'
/
comment on column rec_vicecard_cash_plan_bad.planid is '提交申请流水'
/
comment on column rec_vicecard_cash_plan_bad.customerid is '提交帐号'
/
comment on column rec_vicecard_cash_plan_bad.cardno is '提交卡号'
/
comment on column rec_vicecard_cash_plan_bad.cardsn is '持卡序号'
/
comment on column rec_vicecard_cash_plan_bad.cardtypedetailid is '提交卡类型'
/
comment on column rec_vicecard_cash_plan_bad.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_cash_plan_bad.viceoddfare is '提交充值后次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_bad.viceoddfarepre is '提交充值前次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_bad.vicedummyopfare is '提交次卡钱包虚充金额'
/
comment on column rec_vicecard_cash_plan_bad.viceopfare is '提交次卡钱包交易金额'
/
comment on column rec_vicecard_cash_plan_bad.vicesaveopcount is '提交次卡钱包充值后交易计数'
/
comment on column rec_vicecard_cash_plan_bad.viceopcount is '提交次卡钱包消费交易计数'
/
comment on column rec_vicecard_cash_plan_bad.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_vicecard_cash_plan_bad.acccode is '提交科目代码'
/
comment on column rec_vicecard_cash_plan_bad.opdt is '操作时间'
/
comment on column rec_vicecard_cash_plan_bad.description is '交易科目描述'
/
comment on column rec_vicecard_cash_plan_bad.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_vicecard_cash_plan_bad.poscode is '设备运营唯一编号'
/
comment on column rec_vicecard_cash_plan_bad.psamcardno is 'psam卡号'
/
comment on column rec_vicecard_cash_plan_bad.empid is '职员帐号'
/
comment on column rec_vicecard_cash_plan_bad.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_vicecard_cash_plan_bad.wallettype is '钱包类型'
/
comment on column rec_vicecard_cash_plan_bad.tac is 'tac码'
/
comment on column rec_vicecard_cash_plan_bad.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_cash_plan_bad.badcode is '坏账编号'
/
comment on column rec_vicecard_cash_plan_bad.baddesc is '坏账描述'
/
comment on column rec_vicecard_cash_plan_bad.ver is '记录版本'
/
comment on column rec_vicecard_cash_plan_bad.createdt is '记录形成时间'
/
comment on column rec_vicecard_cash_plan_bad.customerunitcode is '客户代码'
/
comment on column rec_vicecard_cash_plan_bad.limittimes is '单位最大消费次数'
/
comment on column rec_vicecard_cash_plan_bad.monthnum is '充值单位数'
/
comment on column rec_vicecard_cash_plan_bad.validtimestart is '有效启日'
/
comment on column rec_vicecard_cash_plan_bad.validtimeend is '有效止日'
/
comment on column rec_vicecard_cash_plan_bad.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH_PLAN_LOG" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_vicecard_cash_plan_log is '次卡钱包领款计划申请日志表'
/
comment on column rec_vicecard_cash_plan_log.planid is '申请流水'
/
comment on column rec_vicecard_cash_plan_log.customerid is '帐号'
/
comment on column rec_vicecard_cash_plan_log.cardno is '卡号'
/
comment on column rec_vicecard_cash_plan_log.cardsn is '持卡序号'
/
comment on column rec_vicecard_cash_plan_log.cardtypedetailid is '卡类型'
/
comment on column rec_vicecard_cash_plan_log.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_cash_plan_log.viceoddfare is '充值后次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_log.viceoddfarepre is '充值前次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_log.vicedummyopfare is '次卡钱包虚冲余额'
/
comment on column rec_vicecard_cash_plan_log.viceopfare is '次卡钱包交易金额'
/
comment on column rec_vicecard_cash_plan_log.vicesaveopcount is '次卡钱包充值后交易计数'
/
comment on column rec_vicecard_cash_plan_log.viceopcount is '次卡钱包消费交易计数'
/
comment on column rec_vicecard_cash_plan_log.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_vicecard_cash_plan_log.acccode is '科目代码'
/
comment on column rec_vicecard_cash_plan_log.opdt is '操作时间'
/
comment on column rec_vicecard_cash_plan_log.description is '描述(补助,零散补助,稿费)'
/
comment on column rec_vicecard_cash_plan_log.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_vicecard_cash_plan_log.poscode is '设备运营唯一编号'
/
comment on column rec_vicecard_cash_plan_log.psamcardno is 'psam卡号'
/
comment on column rec_vicecard_cash_plan_log.empid is '职员帐号'
/
comment on column rec_vicecard_cash_plan_log.dealtype is '记录类型'
/
comment on column rec_vicecard_cash_plan_log.wallettype is '钱包类型'
/
comment on column rec_vicecard_cash_plan_log.tac is 'tac码'
/
comment on column rec_vicecard_cash_plan_log.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_cash_plan_log.ver is '记录版本'
/
comment on column rec_vicecard_cash_plan_log.createdt is '记录形成时间'
/
comment on column rec_vicecard_cash_plan_log.customerunitcode is '客户代码'
/
comment on column rec_vicecard_cash_plan_log.limittimes is '单位最大消费次数'
/
comment on column rec_vicecard_cash_plan_log.monthnum is '充值单位数'
/
comment on column rec_vicecard_cash_plan_log.validtimestart is '有效启日'
/
comment on column rec_vicecard_cash_plan_log.validtimeend is '有效止日'
/
comment on column rec_vicecard_cash_plan_log.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH_PLAN_PUTOUT" 
   (	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(50), 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DEALTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16), 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AREAID" NUMBER, 
	"VER" NUMBER DEFAULT 0, 
	"CREATEDT" DATE DEFAULT SYSDATE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_vicecard_cash_plan_putout is '次卡钱包领款发放表'
/
comment on column rec_vicecard_cash_plan_putout.planid is '申请流水'
/
comment on column rec_vicecard_cash_plan_putout.customerid is '帐号'
/
comment on column rec_vicecard_cash_plan_putout.cardno is '卡号'
/
comment on column rec_vicecard_cash_plan_putout.cardsn is '持卡序号'
/
comment on column rec_vicecard_cash_plan_putout.cardtypedetailid is '卡类型'
/
comment on column rec_vicecard_cash_plan_putout.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_cash_plan_putout.viceoddfare is '充值后次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_putout.viceoddfarepre is '充值前次卡钱包余额'
/
comment on column rec_vicecard_cash_plan_putout.vicedummyopfare is '次卡钱包虚充金额'
/
comment on column rec_vicecard_cash_plan_putout.viceopfare is '次卡钱包交易金额(含虚充)'
/
comment on column rec_vicecard_cash_plan_putout.vicesaveopcount is '次卡钱包充值后交易计数'
/
comment on column rec_vicecard_cash_plan_putout.viceopcount is '次卡钱包消费交易计数'
/
comment on column rec_vicecard_cash_plan_putout.status is '记录状态（0默认 1 申请，2 提交，3 回滚）'
/
comment on column rec_vicecard_cash_plan_putout.acccode is '科目代码'
/
comment on column rec_vicecard_cash_plan_putout.opdt is '操作时间'
/
comment on column rec_vicecard_cash_plan_putout.description is '描述(补助,零散补助,稿费)'
/
comment on column rec_vicecard_cash_plan_putout.cardkind is '当前账户使用的卡类型 = 1是m1,=2 cpu卡 其他异常'
/
comment on column rec_vicecard_cash_plan_putout.poscode is '设备运营唯一编号'
/
comment on column rec_vicecard_cash_plan_putout.psamcardno is 'psam卡号'
/
comment on column rec_vicecard_cash_plan_putout.empid is '职员帐号'
/
comment on column rec_vicecard_cash_plan_putout.dealtype is '交易类型'
/
comment on column rec_vicecard_cash_plan_putout.wallettype is '钱包类型'
/
comment on column rec_vicecard_cash_plan_putout.tac is 'tac码'
/
comment on column rec_vicecard_cash_plan_putout.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_cash_plan_putout.areaid is '分区id'
/
comment on column rec_vicecard_cash_plan_putout.ver is '记录版本'
/
comment on column rec_vicecard_cash_plan_putout.createdt is '记录形成时间'
/
comment on column rec_vicecard_cash_plan_putout.customerunitcode is '客户代码'
/
comment on column rec_vicecard_cash_plan_putout.limittimes is '单位最大消费次数'
/
comment on column rec_vicecard_cash_plan_putout.monthnum is '充值单位数'
/
comment on column rec_vicecard_cash_plan_putout.validtimestart is '有效启日'
/
comment on column rec_vicecard_cash_plan_putout.validtimeend is '有效止日'
/
comment on column rec_vicecard_cash_plan_putout.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CASH1" 
   (	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table rec_vicecard_cash1 is '月票钱包充值红冲记录'
/
comment on column rec_vicecard_cash1.customerid is '客户编号'
/
comment on column rec_vicecard_cash1.planid is '红冲流水号'
/
comment on column rec_vicecard_cash1.customerunitcode is '人员客户代码'
/


  CREATE TABLE "CCENSE"."REC_VICECARD_CONSUME" 
   (	"CSTACCFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEONODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEONOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER NOT NULL ENABLE, 
	"COLLECTDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMCARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADERECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"TOTALRECNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DISCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"TRADETYPE" NUMBER NOT NULL ENABLE, 
	"LINEDEPT" VARCHAR2(9) NOT NULL ENABLE, 
	"REPEALEMPID" NUMBER, 
	"VICEDUMMYOPFARE" NUMBER, 
	"CARDASN" NUMBER(20,0) DEFAULT 0 NOT NULL ENABLE, 
	"TRADECITYCODE" VARCHAR2(8), 
	"OWNERCITYCODE" VARCHAR2(8), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ASSOCARDTYPE" NUMBER DEFAULT 0, 
	"CARDVERSION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TRADEKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TESTFLAG" NUMBER, 
	"OPERATORPOINT" VARCHAR2(8), 
	"COLLECTPOINT" VARCHAR2(8), 
	"ACCOUNTDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_REC_VICECARD_CONSUME" PRIMARY KEY ("CSTACCFC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 167772160 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_REC_VICECARD_CONSUME" UNIQUE ("CUSTOMERID", "CARDSN", "OPCOUNT", "CARDASN", "TRADERECNO", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 385875968 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("UPLOADDATE") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table rec_vicecard_consume is '次卡钱包消费明细表'
/
comment on column rec_vicecard_consume.cstaccfc is '流水号'
/
comment on column rec_vicecard_consume.customerid is '账号'
/
comment on column rec_vicecard_consume.cardno is '卡号'
/
comment on column rec_vicecard_consume.cardtype is '当前卡卡类别，普通卡，月卡，老年卡等'
/
comment on column rec_vicecard_consume.opdt is '交易时间'
/
comment on column rec_vicecard_consume.sumviceaddfare is '次卡钱包总加款额系统值'
/
comment on column rec_vicecard_consume.viceonoddfare is '次卡钱包卡余额'
/
comment on column rec_vicecard_consume.viceonopfare is '次卡钱包交易金额'
/
comment on column rec_vicecard_consume.acccode is '交易科目'
/
comment on column rec_vicecard_consume.dscrp is '科目描述'
/
comment on column rec_vicecard_consume.cardsn is '卡序号'
/
comment on column rec_vicecard_consume.opcount is '卡操作计数'
/
comment on column rec_vicecard_consume.dealtype is '记录类型 1：正常 0：灰色 2：mac错误...'
/
comment on column rec_vicecard_consume.collectdt is '采集时间'
/
comment on column rec_vicecard_consume.uploaddate is '上传时间'
/
comment on column rec_vicecard_consume.busid is '车辆编号'
/
comment on column rec_vicecard_consume.driverid is '司机id'
/
comment on column rec_vicecard_consume.poscode is '设备运营唯一编号'
/
comment on column rec_vicecard_consume.samcardno is 'sam卡号'
/
comment on column rec_vicecard_consume.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column rec_vicecard_consume.traderecno is 'pos交易流水号（交易记录）'
/
comment on column rec_vicecard_consume.tac is 'tac验证码'
/
comment on column rec_vicecard_consume.samtradeno is 'sam卡交易流水号'
/
comment on column rec_vicecard_consume.buslineid is '线路编号'
/
comment on column rec_vicecard_consume.totalrecno is '总流水，包含交易流水和日志流水'
/
comment on column rec_vicecard_consume.discount is '打折金额'
/
comment on column rec_vicecard_consume.tradetype is '交易应用类型 1：电子钱包充值 2：月票充值 3：次卡钱包'
/
comment on column rec_vicecard_consume.linedept is '线路所属部门'
/
comment on column rec_vicecard_consume.repealempid is '对应充值职员编号(不是存款红冲默认为0)'
/
comment on column rec_vicecard_consume.vicedummyopfare is '次卡钱包虚冲撤销金额'
/
comment on column rec_vicecard_consume.cardasn is '卡应用序列号'
/
comment on column rec_vicecard_consume.tradecitycode is '交易地城市代码'
/
comment on column rec_vicecard_consume.ownercitycode is '所属地城市代码'
/
comment on column rec_vicecard_consume.maincardtype is '主卡类型'
/
comment on column rec_vicecard_consume.assocardtype is '子卡类型'
/
comment on column rec_vicecard_consume.cardversion is '卡内版本'
/
comment on column rec_vicecard_consume.tradekind is '交易性质'
/
comment on column rec_vicecard_consume.testflag is '测试标记'
/
comment on column rec_vicecard_consume.operatorpoint is '营运单位编号'
/
comment on column rec_vicecard_consume.collectpoint is '采集点编号'
/
comment on column rec_vicecard_consume.accountdate is '清算日期'
/
comment on column rec_vicecard_consume.customerunitcode is '客户代码'
/
comment on column rec_vicecard_consume.outid is '市民卡号'
/


  CREATE TABLE "CCENSE"."SHIBA" 
   (	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table shiba is ''
/
comment on column shiba.systracenum is ''
/


  CREATE TABLE "CCENSE"."SHIJIU" 
   (	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table shijiu is ''
/
comment on column shijiu.systracenum is ''
/


  CREATE TABLE "CCENSE"."ST_ACCOUNT_LOG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"OPERATORID" NUMBER NOT NULL ENABLE, 
	"BEGINTIME" DATE NOT NULL ENABLE, 
	"ENDTIME" DATE NOT NULL ENABLE, 
	"ACCOUNTTYPE" NUMBER NOT NULL ENABLE, 
	"RESULTS" NUMBER NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(300) NOT NULL ENABLE, 
	"ISMANUAL" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_ST_ACCOUNT_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_account_log is '日结日志表'
/
comment on column st_account_log.id is 'id'
/
comment on column st_account_log.accountdate is '日结日期/月结月份/年结年份'
/
comment on column st_account_log.operatorid is '操作员账号'
/
comment on column st_account_log.begintime is '日结/月结/年结开始时间'
/
comment on column st_account_log.endtime is '日结/月结/年结结束时间'
/
comment on column st_account_log.accounttype is '结算类型　月结:0 年结:1 日结:9'
/
comment on column st_account_log.results is '结算结果  -1:失败 100:成功'
/
comment on column st_account_log.description is '描述'
/
comment on column st_account_log.ismanual is '是否手工结算 0：自动 1：手工'
/
comment on column st_account_log.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."ST_COIN_ACC" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LISTNO" VARCHAR2(12) NOT NULL ENABLE, 
	"DATEE" DATE, 
	"SJLX" VARCHAR2(2), 
	"SFJH" VARCHAR2(6), 
	"XFJEE" NUMBER(10,2), 
	"XFRSS" NUMBER, 
	"SJBZ" VARCHAR2(2), 
	"XLBH" VARCHAR2(6), 
	"RYBH" VARCHAR2(6), 
	"DWBH" VARCHAR2(4), 
	"CDBH" VARCHAR2(4), 
	"QCBH" VARCHAR2(6), 
	"HZKH" VARCHAR2(6), 
	"YGBH" VARCHAR2(4), 
	"HZRQ" DATE, 
	"SFILE" NUMBER, 
	"JHTC" NUMBER(10,2), 
	"TC" NUMBER(10,2), 
	"CB" NUMBER(10,2), 
	"RYXM" VARCHAR2(10), 
	"XLGL" NUMBER(10,2), 
	"DWBZ" VARCHAR2(2), 
	"FILENAME" VARCHAR2(20) NOT NULL ENABLE, 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"STATUSTIME" DATE, 
	"CREATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(10), 
	 CONSTRAINT "PK_ST_COIN_ACC" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_ST_COIN_ACC" UNIQUE ("LISTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 7340032 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 29360128 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_coin_acc is '现金汇总库'
/
comment on column st_coin_acc.id is '自增流水'
/
comment on column st_coin_acc.listno is '序列号(记录流水)'
/
comment on column st_coin_acc.datee is '消费日期(录入日期)'
/
comment on column st_coin_acc.sjlx is '数据类型(记录类型)'
/
comment on column st_coin_acc.sfjh is '收费机号(终端编号)'
/
comment on column st_coin_acc.xfjee is '消费金额(录入金额)'
/
comment on column st_coin_acc.xfrss is '消费人数(录入次数)'
/
comment on column st_coin_acc.sjbz is '数据标志'
/
comment on column st_coin_acc.xlbh is '线路编号'
/
comment on column st_coin_acc.rybh is '人员编号'
/
comment on column st_coin_acc.dwbh is '单位编号'
/
comment on column st_coin_acc.cdbh is '车队编号'
/
comment on column st_coin_acc.qcbh is '汽车编号'
/
comment on column st_coin_acc.hzkh is '汇总卡号'
/
comment on column st_coin_acc.ygbh is '员工编号'
/
comment on column st_coin_acc.hzrq is '汇总日期'
/
comment on column st_coin_acc.sfile is '批次号'
/
comment on column st_coin_acc.jhtc is '计划趟次(预留)'
/
comment on column st_coin_acc.tc is '趟次(预留)'
/
comment on column st_coin_acc.cb is ''
/
comment on column st_coin_acc.ryxm is '人员姓名(司机姓名)'
/
comment on column st_coin_acc.xlgl is '线路公里'
/
comment on column st_coin_acc.dwbz is '单位标志(数据标识)'
/
comment on column st_coin_acc.filename is '文件名'
/
comment on column st_coin_acc.status is '状态，0：未汇总，1：已汇总'
/
comment on column st_coin_acc.statustime is '修改状态时间'
/
comment on column st_coin_acc.createtime is '入库时间'
/
comment on column st_coin_acc.dptcode is ''
/


  CREATE TABLE "CCENSE"."ST_INVOICE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"OUTID" VARCHAR2(30) NOT NULL ENABLE, 
	"OLDCARDNO" NUMBER NOT NULL ENABLE, 
	"STATMONTH" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(10,2) NOT NULL ENABLE, 
	"OPERMN" NUMBER(10,2) NOT NULL ENABLE, 
	"ISINVOICE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"INVOICETIME" DATE, 
	"UPDATETIME" DATE, 
	"CREATETIME" DATE DEFAULT sysdate NOT NULL ENABLE, 
	 CONSTRAINT "PK_ST_INVOICE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_ST_INVOICE" UNIQUE ("CARDNO", "STATMONTH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_invoice is '卡号月统计表'
/
comment on column st_invoice.id is 'id'
/
comment on column st_invoice.cardno is '新卡号'
/
comment on column st_invoice.outid is '新卡面号'
/
comment on column st_invoice.oldcardno is '原卡号【消费记录过来时新卡号和原卡号都入成消费记录过来的卡号】'
/
comment on column st_invoice.statmonth is '消费月份（以上传时间的年月为准，数字格式yyyymm）'
/
comment on column st_invoice.operno is '消费笔数'
/
comment on column st_invoice.opermn is '消费金额'
/
comment on column st_invoice.isinvoice is '是否已开发票【0：未开；1：已开】'
/
comment on column st_invoice.invoicetime is '开发票时间'
/
comment on column st_invoice.updatetime is '更新时间'
/
comment on column st_invoice.createtime is '入库时间'
/


  CREATE TABLE "CCENSE"."ST_PAYMENT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_ST_PAYMENT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_payment is ''
/
comment on column st_payment.id is '编号'
/
comment on column st_payment.statdate is '即时统计日期yyyy-mm-dd'
/
comment on column st_payment.poscode is '终端唯一运营编号'
/
comment on column st_payment.busid is '车辆编号'
/
comment on column st_payment.buslineid is '线路id'
/
comment on column st_payment.empid is '司机id或者充值员id'
/
comment on column st_payment.wallettype is '钱包类型（1电子钱包 2月票 3：次卡钱包 0 其他，如投币，卡套费用）'
/
comment on column st_payment.cardtype is '卡类型'
/
comment on column st_payment.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column st_payment.accdate is '交易日期yyyy-mm-dd'
/
comment on column st_payment.dptcode is '线路对应的营业部门'
/
comment on column st_payment.acccode is '交易科目'
/
comment on column st_payment.operno is '交易计数累计'
/
comment on column st_payment.opermn is '交易金额合计'
/
comment on column st_payment.discountmn is '打折金额合计'
/
comment on column st_payment.customerunitcode is '客户代码'
/
comment on column st_payment.accountdate is '结算日期yyyy-mm-dd'
/
comment on column st_payment.settlementdate is '清算日期yyyy-mm-dd'
/
comment on column st_payment.filecreatedate is '文件创建日期yyyy-mm-dd'
/
comment on column st_payment.maincardtype is ''
/


  CREATE TABLE "CCENSE"."ST_PAYMENT_20190410" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE NOT NULL ENABLE, 
	"FILECREATEDATE" DATE NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_payment_20190410 is ''
/
comment on column st_payment_20190410.id is ''
/
comment on column st_payment_20190410.statdate is ''
/
comment on column st_payment_20190410.poscode is ''
/
comment on column st_payment_20190410.busid is ''
/
comment on column st_payment_20190410.buslineid is ''
/
comment on column st_payment_20190410.empid is ''
/
comment on column st_payment_20190410.wallettype is ''
/
comment on column st_payment_20190410.cardtype is ''
/
comment on column st_payment_20190410.cardkind is ''
/
comment on column st_payment_20190410.accdate is ''
/
comment on column st_payment_20190410.dptcode is ''
/
comment on column st_payment_20190410.acccode is ''
/
comment on column st_payment_20190410.operno is ''
/
comment on column st_payment_20190410.opermn is ''
/
comment on column st_payment_20190410.discountmn is ''
/
comment on column st_payment_20190410.customerunitcode is ''
/
comment on column st_payment_20190410.accountdate is ''
/
comment on column st_payment_20190410.settlementdate is ''
/
comment on column st_payment_20190410.filecreatedate is ''
/
comment on column st_payment_20190410.maincardtype is ''
/


  CREATE TABLE "CCENSE"."ST_PAYMENT_CASH_DAY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"BALANCEDATE" DATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "UK_ST_PAYMENT_CASH_DAY" UNIQUE ("EMPID", "DPTCODE", "ACCCODE", "CARDTYPE", "WALLETTYPE", "CARDKIND", "ACCDATE", "STATDATE", "BALANCEDATE", "POSCODE", "MAINCARDTYPE", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 10485760 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "PK_ST_PAYMENT_CASH_DAY" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("BALANCEDATE") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table st_payment_cash_day is '充值员结算数据'
/
comment on column st_payment_cash_day.id is 'id 自增长'
/
comment on column st_payment_cash_day.empid is '充值员编号'
/
comment on column st_payment_cash_day.dptcode is '部门'
/
comment on column st_payment_cash_day.acccode is '交易科目'
/
comment on column st_payment_cash_day.operno is '交易次数'
/
comment on column st_payment_cash_day.opermn is '交易金额'
/
comment on column st_payment_cash_day.discountmn is '打折金额'
/
comment on column st_payment_cash_day.cardtype is '卡类型'
/
comment on column st_payment_cash_day.wallettype is '钱包类型'
/
comment on column st_payment_cash_day.cardkind is '卡种'
/
comment on column st_payment_cash_day.accdate is '交易日期'
/
comment on column st_payment_cash_day.statdate is '即时统计日期'
/
comment on column st_payment_cash_day.balancedate is '结算日期'
/
comment on column st_payment_cash_day.poscode is '终端唯一编号'
/
comment on column st_payment_cash_day.maincardtype is '主卡类型'
/
comment on column st_payment_cash_day.customerunitcode is '客户代码'
/


  CREATE TABLE "CCENSE"."ST_PAYMENT_CONSUM_DAY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"BALANCEDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE, 
	 CONSTRAINT "UK_ST_PAYMENT_CONSUME_DAY" UNIQUE ("POSCODE", "BUSID", "BUSLINEID", "DRIVERID", "DPTCODE", "ACCCODE", "WALLETTYPE", "CARDTYPE", "CARDKIND", "MAINCARDTYPE", "ACCDATE", "STATDATE", "BALANCEDATE", "CUSTOMERUNITCODE", "ACCOUNTDATE", "SETTLEMENTDATE", "FILECREATEDATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 218103808 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "PK_ST_PAYMENT_CONSUM_DAY" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 33554432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
  PARTITION BY RANGE ("BALANCEDATE") 
  SUBPARTITION BY LIST ("CUSTOMERUNITCODE") 
 (PARTITION "PART2018"  VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB2018"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2018"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2019"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  LOGGING 
 ( SUBPARTITION "PART08600000000_SUB2019"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2019"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) , 
 PARTITION "PART2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 ( SUBPARTITION "PART08600000000_SUB2020"  VALUES ('08600000000') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS , 
  SUBPARTITION "PART08600000001_SUB2020"  VALUES ('08600000001') 
   TABLESPACE "TBS_PAR1" NOCOMPRESS ) ) 
 
/
comment on table st_payment_consum_day is '消费结算表'
/
comment on column st_payment_consum_day.id is '编号'
/
comment on column st_payment_consum_day.poscode is '终端唯一编号'
/
comment on column st_payment_consum_day.busid is '车辆编号'
/
comment on column st_payment_consum_day.buslineid is '线路id'
/
comment on column st_payment_consum_day.driverid is '司机id'
/
comment on column st_payment_consum_day.dptcode is '线路对应的部门'
/
comment on column st_payment_consum_day.acccode is '交易科目'
/
comment on column st_payment_consum_day.operno is '交易计数累计'
/
comment on column st_payment_consum_day.opermn is '交易金额合计'
/
comment on column st_payment_consum_day.discountmn is '打折金额合计'
/
comment on column st_payment_consum_day.wallettype is '钱包类型（1钱包 3：次卡 0 其他，如投币，卡套费用）'
/
comment on column st_payment_consum_day.cardtype is '钱包类型'
/
comment on column st_payment_consum_day.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column st_payment_consum_day.maincardtype is '主卡类型'
/
comment on column st_payment_consum_day.accdate is '交易日期'
/
comment on column st_payment_consum_day.statdate is '即时统计日期'
/
comment on column st_payment_consum_day.balancedate is '结算日期'
/
comment on column st_payment_consum_day.customerunitcode is '客户代码'
/
comment on column st_payment_consum_day.accountdate is '三方结算日期'
/
comment on column st_payment_consum_day.settlementdate is '清算日期'
/
comment on column st_payment_consum_day.filecreatedate is '文件创建日期'
/


  CREATE TABLE "CCENSE"."ST_SETTLEMENT_ACC" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"ACQUIRERCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"RECEIVECODE" VARCHAR2(11) NOT NULL ENABLE, 
	"ACCCODE" VARCHAR2(4) NOT NULL ENABLE, 
	"DIR" NUMBER(*,0) NOT NULL ENABLE, 
	"OPERNO" NUMBER NOT NULL ENABLE, 
	"OPERMN" NUMBER(20,2) NOT NULL ENABLE, 
	"TRANSPOUNDAGE" NUMBER(20,2) NOT NULL ENABLE, 
	"POUNDAGE" NUMBER(20,2), 
	"CARDPOUNDAGE" NUMBER(20,2) NOT NULL ENABLE, 
	"CASIPOUNDAGE" NUMBER(20,2) NOT NULL ENABLE, 
	"TESTFLAG" NUMBER(*,0) NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"ERRORCODE" VARCHAR2(6) NOT NULL ENABLE, 
	"ERRORDESCRIBE" VARCHAR2(40), 
	"RESERVEDDOMAIN" VARCHAR2(20), 
	"FILEINFO" VARCHAR2(1000)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_settlement_acc is ''
/
comment on column st_settlement_acc.id is '字增长id'
/
comment on column st_settlement_acc.accountdate is '清算日期'
/
comment on column st_settlement_acc.acquirercode is '收单机构标识'
/
comment on column st_settlement_acc.receivecode is '清分结算机构标识'
/
comment on column st_settlement_acc.acccode is '业务类型'
/
comment on column st_settlement_acc.dir is '差错调整标识 0-非差错交易 ，正常上送 1-贷方调整（发卡机构付款） 2-借方调整（发卡机构收款）'
/
comment on column st_settlement_acc.operno is '消费交易笔数'
/
comment on column st_settlement_acc.opermn is '消费交易金额'
/
comment on column st_settlement_acc.transpoundage is '手续费1（交易地手续费）'
/
comment on column st_settlement_acc.poundage is '手续费2（预留）'
/
comment on column st_settlement_acc.cardpoundage is '清分结算机构交易手续费1（卡属地手续费）'
/
comment on column st_settlement_acc.casipoundage is '清分结算机构交易手续费2（清分结算机构手续费）'
/
comment on column st_settlement_acc.testflag is '测试标志  0-正式数据  1-测试数据'
/
comment on column st_settlement_acc.statdate is '系统日期'
/
comment on column st_settlement_acc.errorcode is '错误代码'
/
comment on column st_settlement_acc.errordescribe is '错误描述'
/
comment on column st_settlement_acc.reserveddomain is '保留域'
/
comment on column st_settlement_acc.fileinfo is '原始文件信息'
/


  CREATE TABLE "CCENSE"."ST_SYS_CASI_BALANCE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE NOT NULL ENABLE, 
	"ACCEPTCODE" VARCHAR2(11) NOT NULL ENABLE, 
	"TOTALINCOME" NUMBER(16,2) NOT NULL ENABLE, 
	"TOTALPAYOUT" NUMBER(16,2) NOT NULL ENABLE, 
	"TESTTOTALINCOME" NUMBER(16,2) NOT NULL ENABLE, 
	"TESTTOTALPAYOUT" NUMBER(16,2) NOT NULL ENABLE, 
	"CASHDEPOSITCHANGESUM" NUMBER(16,2) NOT NULL ENABLE, 
	"SUMSIGNBIT" VARCHAR2(10), 
	"STATDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"RESERVEDDOMAIN" VARCHAR2(80), 
	"FILEINFO" VARCHAR2(1000), 
	 CONSTRAINT "UK_ST_SYS_CASI_BALANCE" UNIQUE ("ACCOUNTDATE", "ACCEPTCODE", "FILEINFO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_sys_casi_balance is '交通部互联互通收支平衡数据表'
/
comment on column st_sys_casi_balance.id is '自增长id'
/
comment on column st_sys_casi_balance.accountdate is '清算日期'
/
comment on column st_sys_casi_balance.acceptcode is '接收机构代码'
/
comment on column st_sys_casi_balance.totalincome is '收入总金额'
/
comment on column st_sys_casi_balance.totalpayout is '支出总金额'
/
comment on column st_sys_casi_balance.testtotalincome is '测试收入总金额'
/
comment on column st_sys_casi_balance.testtotalpayout is '测试支出总金额'
/
comment on column st_sys_casi_balance.cashdepositchangesum is '保证金账户变动金额'
/
comment on column st_sys_casi_balance.sumsignbit is '金额符号位'
/
comment on column st_sys_casi_balance.statdate is '系统日期'
/
comment on column st_sys_casi_balance.reserveddomain is '保留域'
/
comment on column st_sys_casi_balance.fileinfo is '原始文件信息'
/


  CREATE TABLE "CCENSE"."ST_TRIPS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"BUSID" VARCHAR2(10) NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_ST_TRIPS" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table st_trips is '趟次统计表（复制的st_payment'
/
comment on column st_trips.id is '编号'
/
comment on column st_trips.statdate is '即时统计日期yyyy-mm-dd'
/
comment on column st_trips.poscode is '终端唯一运营编号'
/
comment on column st_trips.busid is '车辆编号'
/
comment on column st_trips.buslineid is '线路id'
/
comment on column st_trips.empid is '司机id或者充值员id'
/
comment on column st_trips.wallettype is '钱包类型（1电子钱包 2月票 3：次卡钱包 0 其他，如投币，卡套费用）'
/
comment on column st_trips.cardtype is '卡类型'
/
comment on column st_trips.cardkind is '卡种类1m1卡， 2 cpu卡'
/
comment on column st_trips.accdate is '交易日期yyyy-mm-dd'
/
comment on column st_trips.dptcode is '线路对应的营业部门'
/
comment on column st_trips.acccode is '交易科目'
/
comment on column st_trips.operno is '交易计数累计(此处是实际趟次)'
/
comment on column st_trips.opermn is '交易金额合计(此处是计划趟次)'
/
comment on column st_trips.discountmn is '打折金额合计'
/
comment on column st_trips.customerunitcode is '客户代码'
/
comment on column st_trips.accountdate is '结算日期yyyy-mm-dd'
/
comment on column st_trips.settlementdate is '清算日期yyyy-mm-dd'
/
comment on column st_trips.filecreatedate is '文件创建日期yyyy-mm-dd'
/
comment on column st_trips.maincardtype is ''
/


  CREATE TABLE "CCENSE"."SYSTRACENUM" 
   (	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table systracenum is ''
/
comment on column systracenum.systracenum is ''
/


  CREATE TABLE "CCENSE"."T2_TEMP" 
   (	"NAME" VARCHAR2(10), 
	"CLASS" VARCHAR2(10), 
	"SROCE" NUMBER, 
	 PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table t2_temp is ''
/
comment on column t2_temp.name is ''
/
comment on column t2_temp.class is ''
/
comment on column t2_temp.sroce is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP" 
   (	"CARDNO" NUMBER NOT NULL ENABLE, 
	"DETAILNAME" VARCHAR2(20), 
	"OPDT" DATE NOT NULL ENABLE, 
	"BOPDT" DATE, 
	"PREMIUMCOMPANY" NUMBER, 
	"COMPANYNAME" VARCHAR2(200), 
	"ENABLE" NUMBER, 
	"PTY" NUMBER
   ) ON COMMIT PRESERVE ROWS 
 
/
comment on table temp is ''
/
comment on column temp.cardno is ''
/
comment on column temp.detailname is ''
/
comment on column temp.opdt is ''
/
comment on column temp.bopdt is ''
/
comment on column temp.premiumcompany is ''
/
comment on column temp.companyname is ''
/
comment on column temp.enable is ''
/
comment on column temp.pty is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_CARDFREENEWLYINSURANCE" 
   (	"CARDNO" NUMBER NOT NULL ENABLE, 
	"DETAILNAME" VARCHAR2(20), 
	"OPDT" DATE NOT NULL ENABLE, 
	"BOPDT" DATE, 
	"PREMIUMCOMPANY" NUMBER, 
	"COMPANYNAME" VARCHAR2(200), 
	"ENABLE" NUMBER, 
	"PTY" NUMBER
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_cardfreenewlyinsurance is ''
/
comment on column temp_cardfreenewlyinsurance.cardno is ''
/
comment on column temp_cardfreenewlyinsurance.detailname is ''
/
comment on column temp_cardfreenewlyinsurance.opdt is ''
/
comment on column temp_cardfreenewlyinsurance.bopdt is ''
/
comment on column temp_cardfreenewlyinsurance.premiumcompany is ''
/
comment on column temp_cardfreenewlyinsurance.companyname is ''
/
comment on column temp_cardfreenewlyinsurance.enable is ''
/
comment on column temp_cardfreenewlyinsurance.pty is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_CARDFREENEWLYINSURANCE1" 
   (	"CARDNO" NUMBER NOT NULL ENABLE, 
	"DETAILNAME" VARCHAR2(20), 
	"OPDT" DATE NOT NULL ENABLE, 
	"BOPDT" DATE, 
	"PREMIUMCOMPANY" NUMBER, 
	"COMPANYNAME" VARCHAR2(200), 
	"ENABLE" NUMBER, 
	"PTY" NUMBER
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_cardfreenewlyinsurance1 is ''
/
comment on column temp_cardfreenewlyinsurance1.cardno is ''
/
comment on column temp_cardfreenewlyinsurance1.detailname is ''
/
comment on column temp_cardfreenewlyinsurance1.opdt is ''
/
comment on column temp_cardfreenewlyinsurance1.bopdt is ''
/
comment on column temp_cardfreenewlyinsurance1.premiumcompany is ''
/
comment on column temp_cardfreenewlyinsurance1.companyname is ''
/
comment on column temp_cardfreenewlyinsurance1.enable is ''
/
comment on column temp_cardfreenewlyinsurance1.pty is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_CARD_MAKE_ACC" 
   (	"CARDFC" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SCARDSNR" VARCHAR2(16) NOT NULL ENABLE, 
	"CARDNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDNO" NUMBER DEFAULT 0, 
	"CARDTYPEDETAILID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDSN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDCARDSN" NUMBER DEFAULT 0, 
	"CARDKIND" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDMONOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OLDELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPDT" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"LOSSFC" NUMBER, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"STAG_BAN" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"AREAID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"PTY" NUMBER NOT NULL ENABLE, 
	"VER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ID" VARCHAR2(8) DEFAULT 0 NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"MONSAVEOPCOUNT" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMONTHODDFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"SUMMONTHODDFAREACC" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEFARE" NUMBER(10,2) DEFAULT 0 NOT NULL ENABLE, 
	"DEPRECIATEDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"REMAKECARDTYPE" VARCHAR2(1) DEFAULT 1 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_card_make_acc is ''
/
comment on column temp_rec_card_make_acc.cardfc is ''
/
comment on column temp_rec_card_make_acc.customerid is ''
/
comment on column temp_rec_card_make_acc.scardsnr is ''
/
comment on column temp_rec_card_make_acc.cardno is ''
/
comment on column temp_rec_card_make_acc.oldcardno is ''
/
comment on column temp_rec_card_make_acc.cardtypedetailid is ''
/
comment on column temp_rec_card_make_acc.cardsn is ''
/
comment on column temp_rec_card_make_acc.oldcardsn is ''
/
comment on column temp_rec_card_make_acc.cardkind is ''
/
comment on column temp_rec_card_make_acc.oldelectropcount is ''
/
comment on column temp_rec_card_make_acc.oldelectrsaveopcount is ''
/
comment on column temp_rec_card_make_acc.oldmonopcount is ''
/
comment on column temp_rec_card_make_acc.oldelectroddfare is ''
/
comment on column temp_rec_card_make_acc.opdt is ''
/
comment on column temp_rec_card_make_acc.lossfc is ''
/
comment on column temp_rec_card_make_acc.empid is ''
/
comment on column temp_rec_card_make_acc.stag_ban is ''
/
comment on column temp_rec_card_make_acc.areaid is ''
/
comment on column temp_rec_card_make_acc.pty is ''
/
comment on column temp_rec_card_make_acc.ver is ''
/
comment on column temp_rec_card_make_acc.id is ''
/
comment on column temp_rec_card_make_acc.poscode is ''
/
comment on column temp_rec_card_make_acc.monsaveopcount is ''
/
comment on column temp_rec_card_make_acc.summonthoddfare is ''
/
comment on column temp_rec_card_make_acc.summonthoddfareacc is ''
/
comment on column temp_rec_card_make_acc.depreciatefare is ''
/
comment on column temp_rec_card_make_acc.depreciatedate is ''
/
comment on column temp_rec_card_make_acc.remakecardtype is ''
/
comment on column temp_rec_card_make_acc.customerunitcode is ''
/
comment on column temp_rec_card_make_acc.outid is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_CASH" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"OPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"SAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"DUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"OPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMADDFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_cash is ''
/
comment on column temp_rec_cash.cashaccfc is ''
/
comment on column temp_rec_cash.opdt is ''
/
comment on column temp_rec_cash.customerid is ''
/
comment on column temp_rec_cash.cardno is ''
/
comment on column temp_rec_cash.cardsn is ''
/
comment on column temp_rec_cash.cardtypedetailid is ''
/
comment on column temp_rec_cash.cardkind is ''
/
comment on column temp_rec_cash.opcount is ''
/
comment on column temp_rec_cash.saveopcount is ''
/
comment on column temp_rec_cash.oddfare is ''
/
comment on column temp_rec_cash.oddfarepre is ''
/
comment on column temp_rec_cash.dummyopfare is ''
/
comment on column temp_rec_cash.opfare is ''
/
comment on column temp_rec_cash.acccode is ''
/
comment on column temp_rec_cash.dscrp is ''
/
comment on column temp_rec_cash.poscode is ''
/
comment on column temp_rec_cash.dealtype is ''
/
comment on column temp_rec_cash.samcardno is ''
/
comment on column temp_rec_cash.samtradeno is ''
/
comment on column temp_rec_cash.planid is ''
/
comment on column temp_rec_cash.uploaddate is ''
/
comment on column temp_rec_cash.empid is ''
/
comment on column temp_rec_cash.wallettype is ''
/
comment on column temp_rec_cash.tac is ''
/
comment on column temp_rec_cash.sumaddfare is ''
/
comment on column temp_rec_cash.customerunitcode is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_CUST_CARDTYPE_CHANGE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER, 
	"CARDNO" NUMBER, 
	"CARDSN" NUMBER, 
	"EMPID" NUMBER, 
	"OPDT" DATE, 
	"OPDESC" VARCHAR2(100), 
	"ACCCODE" NUMBER, 
	"ACCDESC" VARCHAR2(30), 
	"PSAMCARDNO" NUMBER, 
	"OLDCARDTYPE" NUMBER, 
	"NEWCARDTYPE" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12), 
	"OLDYEARCHECKS" NUMBER(*,0), 
	"OLDCHECKBEGINDAY" DATE, 
	"OLDCHECKENDDAY" DATE, 
	"NEWYEARCHECKS" NUMBER(*,0), 
	"NEWCHECKBEGINDAY" DATE, 
	"NEWCHECKENDDAY" DATE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_cust_cardtype_change is ''
/
comment on column temp_rec_cust_cardtype_change.id is ''
/
comment on column temp_rec_cust_cardtype_change.customerid is ''
/
comment on column temp_rec_cust_cardtype_change.cardno is ''
/
comment on column temp_rec_cust_cardtype_change.cardsn is ''
/
comment on column temp_rec_cust_cardtype_change.empid is ''
/
comment on column temp_rec_cust_cardtype_change.opdt is ''
/
comment on column temp_rec_cust_cardtype_change.opdesc is ''
/
comment on column temp_rec_cust_cardtype_change.acccode is ''
/
comment on column temp_rec_cust_cardtype_change.accdesc is ''
/
comment on column temp_rec_cust_cardtype_change.psamcardno is ''
/
comment on column temp_rec_cust_cardtype_change.oldcardtype is ''
/
comment on column temp_rec_cust_cardtype_change.newcardtype is ''
/
comment on column temp_rec_cust_cardtype_change.customerunitcode is ''
/
comment on column temp_rec_cust_cardtype_change.oldyearchecks is ''
/
comment on column temp_rec_cust_cardtype_change.oldcheckbeginday is ''
/
comment on column temp_rec_cust_cardtype_change.oldcheckendday is ''
/
comment on column temp_rec_cust_cardtype_change.newyearchecks is ''
/
comment on column temp_rec_cust_cardtype_change.newcheckbeginday is ''
/
comment on column temp_rec_cust_cardtype_change.newcheckendday is ''
/
comment on column temp_rec_cust_cardtype_change.outid is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_CUST_YEAR_CHECK" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"STARTCHECKDATE" DATE NOT NULL ENABLE, 
	"ENDCHECKDATE" DATE NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"OPDESC" VARCHAR2(100) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"ACCDESC" VARCHAR2(30) NOT NULL ENABLE, 
	"PSAMCARDNO" NUMBER NOT NULL ENABLE, 
	"STARTCHECKDATEPRE" DATE NOT NULL ENABLE, 
	"ENDCHECKDATEPRE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE, 
	"PREMIUMCOMPANY" NUMBER DEFAULT 0
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_cust_year_check is ''
/
comment on column temp_rec_cust_year_check.id is ''
/
comment on column temp_rec_cust_year_check.customerid is ''
/
comment on column temp_rec_cust_year_check.cardno is ''
/
comment on column temp_rec_cust_year_check.cardsn is ''
/
comment on column temp_rec_cust_year_check.startcheckdate is ''
/
comment on column temp_rec_cust_year_check.endcheckdate is ''
/
comment on column temp_rec_cust_year_check.empid is ''
/
comment on column temp_rec_cust_year_check.opdt is ''
/
comment on column temp_rec_cust_year_check.opdesc is ''
/
comment on column temp_rec_cust_year_check.acccode is ''
/
comment on column temp_rec_cust_year_check.accdesc is ''
/
comment on column temp_rec_cust_year_check.psamcardno is ''
/
comment on column temp_rec_cust_year_check.startcheckdatepre is ''
/
comment on column temp_rec_cust_year_check.endcheckdatepre is ''
/
comment on column temp_rec_cust_year_check.customerunitcode is ''
/
comment on column temp_rec_cust_year_check.outid is ''
/
comment on column temp_rec_cust_year_check.premiumcompany is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_ELECTTRON_CASH" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ELECTROPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTRSAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ELECTRODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTRDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ELECTROPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMELECTRADDFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_electtron_cash is ''
/
comment on column temp_rec_electtron_cash.cashaccfc is ''
/
comment on column temp_rec_electtron_cash.opdt is ''
/
comment on column temp_rec_electtron_cash.customerid is ''
/
comment on column temp_rec_electtron_cash.cardno is ''
/
comment on column temp_rec_electtron_cash.cardsn is ''
/
comment on column temp_rec_electtron_cash.cardtypedetailid is ''
/
comment on column temp_rec_electtron_cash.cardkind is ''
/
comment on column temp_rec_electtron_cash.electropcount is ''
/
comment on column temp_rec_electtron_cash.electrsaveopcount is ''
/
comment on column temp_rec_electtron_cash.electroddfare is ''
/
comment on column temp_rec_electtron_cash.electroddfarepre is ''
/
comment on column temp_rec_electtron_cash.electrdummyopfare is ''
/
comment on column temp_rec_electtron_cash.electropfare is ''
/
comment on column temp_rec_electtron_cash.acccode is ''
/
comment on column temp_rec_electtron_cash.dscrp is ''
/
comment on column temp_rec_electtron_cash.poscode is ''
/
comment on column temp_rec_electtron_cash.dealtype is ''
/
comment on column temp_rec_electtron_cash.samcardno is ''
/
comment on column temp_rec_electtron_cash.samtradeno is ''
/
comment on column temp_rec_electtron_cash.planid is ''
/
comment on column temp_rec_electtron_cash.uploaddate is ''
/
comment on column temp_rec_electtron_cash.empid is ''
/
comment on column temp_rec_electtron_cash.wallettype is ''
/
comment on column temp_rec_electtron_cash.tac is ''
/
comment on column temp_rec_electtron_cash.sumelectraddfare is ''
/
comment on column temp_rec_electtron_cash.customerunitcode is ''
/
comment on column temp_rec_electtron_cash.outid is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_REC_VICECARD_CASH" 
   (	"CASHACCFC" NUMBER NOT NULL ENABLE, 
	"OPDT" DATE NOT NULL ENABLE, 
	"CUSTOMERID" NUMBER NOT NULL ENABLE, 
	"CARDNO" NUMBER NOT NULL ENABLE, 
	"CARDSN" NUMBER NOT NULL ENABLE, 
	"CARDTYPEDETAILID" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"VICEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICESAVEOPCOUNT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VICEODDFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEODDFAREPRE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEDUMMYOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"VICEOPFARE" NUMBER(10,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"DSCRP" VARCHAR2(20), 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"DEALTYPE" NUMBER, 
	"SAMCARDNO" NUMBER NOT NULL ENABLE, 
	"SAMTRADENO" NUMBER NOT NULL ENABLE, 
	"PLANID" NUMBER NOT NULL ENABLE, 
	"UPLOADDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"EMPID" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"TAC" VARCHAR2(16) NOT NULL ENABLE, 
	"SUMVICEADDFARE" NUMBER DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"LIMITTIMES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"MONTHNUM" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"VALIDTIMESTART" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"VALIDTIMEEND" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"OUTID" VARCHAR2(20) DEFAULT 0 NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_rec_vicecard_cash is ''
/
comment on column temp_rec_vicecard_cash.cashaccfc is ''
/
comment on column temp_rec_vicecard_cash.opdt is ''
/
comment on column temp_rec_vicecard_cash.customerid is ''
/
comment on column temp_rec_vicecard_cash.cardno is ''
/
comment on column temp_rec_vicecard_cash.cardsn is ''
/
comment on column temp_rec_vicecard_cash.cardtypedetailid is ''
/
comment on column temp_rec_vicecard_cash.cardkind is ''
/
comment on column temp_rec_vicecard_cash.viceopcount is ''
/
comment on column temp_rec_vicecard_cash.vicesaveopcount is ''
/
comment on column temp_rec_vicecard_cash.viceoddfare is ''
/
comment on column temp_rec_vicecard_cash.viceoddfarepre is ''
/
comment on column temp_rec_vicecard_cash.vicedummyopfare is ''
/
comment on column temp_rec_vicecard_cash.viceopfare is ''
/
comment on column temp_rec_vicecard_cash.acccode is ''
/
comment on column temp_rec_vicecard_cash.dscrp is ''
/
comment on column temp_rec_vicecard_cash.poscode is ''
/
comment on column temp_rec_vicecard_cash.dealtype is ''
/
comment on column temp_rec_vicecard_cash.samcardno is ''
/
comment on column temp_rec_vicecard_cash.samtradeno is ''
/
comment on column temp_rec_vicecard_cash.planid is ''
/
comment on column temp_rec_vicecard_cash.uploaddate is ''
/
comment on column temp_rec_vicecard_cash.empid is ''
/
comment on column temp_rec_vicecard_cash.wallettype is ''
/
comment on column temp_rec_vicecard_cash.tac is ''
/
comment on column temp_rec_vicecard_cash.sumviceaddfare is ''
/
comment on column temp_rec_vicecard_cash.customerunitcode is ''
/
comment on column temp_rec_vicecard_cash.limittimes is ''
/
comment on column temp_rec_vicecard_cash.monthnum is ''
/
comment on column temp_rec_vicecard_cash.validtimestart is ''
/
comment on column temp_rec_vicecard_cash.validtimeend is ''
/
comment on column temp_rec_vicecard_cash.outid is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_ST_EMP_TRADE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_st_emp_trade is ''
/
comment on column temp_st_emp_trade.id is ''
/
comment on column temp_st_emp_trade.empid is ''
/
comment on column temp_st_emp_trade.poscode is ''
/
comment on column temp_st_emp_trade.acccode is ''
/
comment on column temp_st_emp_trade.operno is ''
/
comment on column temp_st_emp_trade.opermn is ''
/
comment on column temp_st_emp_trade.cardkind is ''
/
comment on column temp_st_emp_trade.cardtype is ''
/
comment on column temp_st_emp_trade.customerunitcode is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_ST_PAYMENT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"BUSID" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"WALLETTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"CARDKIND" NUMBER NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER(18,0) NOT NULL ENABLE, 
	"OPERMN" NUMBER(18,2) NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT TRUNC(SYSDATE, 'dd') NOT NULL ENABLE, 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_st_payment is ''
/
comment on column temp_st_payment.id is ''
/
comment on column temp_st_payment.statdate is ''
/
comment on column temp_st_payment.poscode is ''
/
comment on column temp_st_payment.busid is ''
/
comment on column temp_st_payment.buslineid is ''
/
comment on column temp_st_payment.empid is ''
/
comment on column temp_st_payment.wallettype is ''
/
comment on column temp_st_payment.cardtype is ''
/
comment on column temp_st_payment.cardkind is ''
/
comment on column temp_st_payment.accdate is ''
/
comment on column temp_st_payment.dptcode is ''
/
comment on column temp_st_payment.acccode is ''
/
comment on column temp_st_payment.operno is ''
/
comment on column temp_st_payment.opermn is ''
/
comment on column temp_st_payment.discountmn is ''
/
comment on column temp_st_payment.customerunitcode is ''
/
comment on column temp_st_payment.accountdate is ''
/
comment on column temp_st_payment.settlementdate is ''
/
comment on column temp_st_payment.filecreatedate is ''
/
comment on column temp_st_payment.maincardtype is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_ST_PAYMENT_CASH_DAY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CARDTYPE" NUMBER NOT NULL ENABLE, 
	"EMPID" NUMBER NOT NULL ENABLE, 
	"POSCODE" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"BALANCEDATE" DATE NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPERMN" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_st_payment_cash_day is ''
/
comment on column temp_st_payment_cash_day.id is ''
/
comment on column temp_st_payment_cash_day.cardtype is ''
/
comment on column temp_st_payment_cash_day.empid is ''
/
comment on column temp_st_payment_cash_day.poscode is ''
/
comment on column temp_st_payment_cash_day.statdate is ''
/
comment on column temp_st_payment_cash_day.balancedate is ''
/
comment on column temp_st_payment_cash_day.customerunitcode is ''
/
comment on column temp_st_payment_cash_day.acccode is ''
/
comment on column temp_st_payment_cash_day.operno is ''
/
comment on column temp_st_payment_cash_day.opermn is ''
/
comment on column temp_st_payment_cash_day.accdate is ''
/


  CREATE GLOBAL TEMPORARY TABLE "CCENSE"."TEMP_ST_PAYMENT_CONSUM_DAY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"BUSLINEID" NUMBER NOT NULL ENABLE, 
	"BUSID" NUMBER NOT NULL ENABLE, 
	"DRIVERID" NUMBER NOT NULL ENABLE, 
	"STATDATE" DATE NOT NULL ENABLE, 
	"BALANCEDATE" DATE NOT NULL ENABLE, 
	"CARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"DISCOUNTMN" NUMBER(18,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	"ACCCODE" NUMBER NOT NULL ENABLE, 
	"OPERNO" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"OPERMN" NUMBER(20,2) DEFAULT 0.00 NOT NULL ENABLE, 
	"ACCDATE" DATE NOT NULL ENABLE, 
	"DPTCODE" VARCHAR2(9), 
	"MAINCARDTYPE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"ACCOUNTDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE, 
	"SETTLEMENTDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE, 
	"FILECREATEDATE" DATE DEFAULT TRUNC (SYSDATE, 'dd') NOT NULL ENABLE
   ) ON COMMIT DELETE ROWS 
 
/
comment on table temp_st_payment_consum_day is ''
/
comment on column temp_st_payment_consum_day.id is ''
/
comment on column temp_st_payment_consum_day.buslineid is ''
/
comment on column temp_st_payment_consum_day.busid is ''
/
comment on column temp_st_payment_consum_day.driverid is ''
/
comment on column temp_st_payment_consum_day.statdate is ''
/
comment on column temp_st_payment_consum_day.balancedate is ''
/
comment on column temp_st_payment_consum_day.cardtype is ''
/
comment on column temp_st_payment_consum_day.discountmn is ''
/
comment on column temp_st_payment_consum_day.customerunitcode is ''
/
comment on column temp_st_payment_consum_day.acccode is ''
/
comment on column temp_st_payment_consum_day.operno is ''
/
comment on column temp_st_payment_consum_day.opermn is ''
/
comment on column temp_st_payment_consum_day.accdate is ''
/
comment on column temp_st_payment_consum_day.dptcode is ''
/
comment on column temp_st_payment_consum_day.maincardtype is ''
/
comment on column temp_st_payment_consum_day.accountdate is ''
/
comment on column temp_st_payment_consum_day.settlementdate is ''
/
comment on column temp_st_payment_consum_day.filecreatedate is ''
/


  CREATE TABLE "CCENSE"."UNION_DETAIL" 
   (	"BUSID" VARCHAR2(10), 
	"LINECODE" VARCHAR2(10), 
	"POSCODE" NUMBER, 
	"TRADETYPE" VARCHAR2(10), 
	"OPERMN" NUMBER(10,2), 
	"OPDT" VARCHAR2(30), 
	"ACCOUNTDATE" VARCHAR2(10), 
	"BANKCARDNO" VARCHAR2(30), 
	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table union_detail is ''
/
comment on column union_detail.busid is ''
/
comment on column union_detail.linecode is ''
/
comment on column union_detail.poscode is ''
/
comment on column union_detail.tradetype is ''
/
comment on column union_detail.opermn is ''
/
comment on column union_detail.opdt is ''
/
comment on column union_detail.accountdate is ''
/
comment on column union_detail.bankcardno is ''
/
comment on column union_detail.systracenum is ''
/


  CREATE TABLE "CCENSE"."UNION_ST" 
   (	"BUSID" VARCHAR2(10), 
	"LINECODE" VARCHAR2(10), 
	"POSCODE" NUMBER, 
	"TRADETYPE" VARCHAR2(10), 
	"SUMOPERNO" NUMBER(10,2), 
	"SUMOPERMN" NUMBER(10,2), 
	"ACCOUNTDATE" VARCHAR2(10)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table union_st is ''
/
comment on column union_st.busid is ''
/
comment on column union_st.linecode is ''
/
comment on column union_st.poscode is ''
/
comment on column union_st.tradetype is ''
/
comment on column union_st.sumoperno is ''
/
comment on column union_st.sumopermn is ''
/
comment on column union_st.accountdate is ''
/


  CREATE TABLE "CCENSE"."UPLOAD_FLAG" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"TABLENAME" VARCHAR2(200) NOT NULL ENABLE, 
	"VER" NUMBER, 
	"CUSTOMERUNITCODE" VARCHAR2(12) NOT NULL ENABLE, 
	 CONSTRAINT "PK_UPLOAD_FLAG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE, 
	 CONSTRAINT "UK_UPLOAD_FLAG" UNIQUE ("TABLENAME", "CUSTOMERUNITCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table upload_flag is '数据交换上传标识'
/
comment on column upload_flag.id is '流水号，自动增长'
/
comment on column upload_flag.tablename is '表名称'
/
comment on column upload_flag.ver is '上传记录版本号'
/
comment on column upload_flag.customerunitcode is '客户法人'
/


  CREATE TABLE "CCENSE"."YLP" 
   (	"POSCODE" NUMBER NOT NULL ENABLE, 
	"PRMEXTEND" VARCHAR2(100), 
	"CREATETIME" DATE DEFAULT sysdate NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table ylp is ''
/
comment on column ylp.poscode is ''
/
comment on column ylp.prmextend is ''
/
comment on column ylp.createtime is ''
/


  CREATE TABLE "CCENSE"."ZONGCHAYI" 
   (	"SYSTRACENUM" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CCEN" 
 
/
comment on table zongchayi is ''
/
comment on column zongchayi.systracenum is ''
/

