
  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_ALERT_TYPEINFO" ("ID", "TYPEID", "NAME", "USINGALERT", "ALERTBASE", "DESCRIPTION", "ENABLECANCEL", "TYPELEVEL", "LEVELNAME", "VALIDITY", "ALERTTO", "TYPEGROUPID") AS 
  SELECT   a.ID, a.code AS typeid, a.NAME, a.usingalert, a.alertbase,
            a.description, a.enablecancel, a.typelevel, b.NAME AS levelname,
            b.validity, b.alertto, a.typegroupid
       FROM alert_type a, alert_level b
      WHERE a.typelevel = b.code
   ORDER BY a.code

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_ALL_CUSTOMERS" ("CUSTOMERID", "NAME", "IDCARDNO", "CARDNO", "CARDTYPEDETAILID", "CARDTYPEID", "TYPENAME", "TELPHONENUM", "ISNEWCAPECSYS", "OUTID") AS 
  (/* Formatted on 2013/04/24 16:05 (Formatter Plus v4.8.7) */
((SELECT a.customerid, a2.NAME, a2.idcardno, a.cardno, a.cardtypedetailid,
         a.cardtypeid, a1.typename, a2.telphonenum, a.isnewcapecsys, a.outid
    FROM base_customers a LEFT JOIN base_cardtype a1 ON a.cardtypeid =
                                                                     a1.typeid
         LEFT JOIN base_customers_info a2 ON a.customerid = a2.customerid
  UNION
  SELECT b.customerid, b2.NAME, b2.idcardno, b.cardno, b.cardtypedetailid,
         b.cardtypeid, b1.typename, b2.telphonenum, b.isnewcapecsys,
         b.outid AS outid
    FROM base_writeoff b LEFT JOIN base_cardtype b1 ON b.cardtypeid =
                                                                     b1.typeid
         LEFT JOIN base_writeoff_info b2 ON b.customerid = b2.customerid
         ))
)

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_BANKQYINFO" ("ACCCODE", "BANKNAME", "CUSTOMERID", "CUSTOMERUNITCODE", "ASN") AS 
  select a.acccode,a.bankname,b.customerid,b.customerunitcode,b.asn from rec_city_bankinfo a,rec_city_bankbindqy b where a.acccode=b.acccode

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_BUSLINE_STOP" ("STOPID", "SORTID", "FLAG", "CUSTOMERUNITCODE", "DOWNSORTID", "LINEID", "LINENAME", "PRICE", "ISUSE", "FLEEPRICE", "CHARGETYPEID", "STOPNAME", "LONGITUDE", "LATITUDE") AS 
  SELECT a.stopid,a.sortid,  a.flag, a.customerunitcode, a.downsortid,b.lineid,b.linename,b.price,b.isuse,b.fleeprice,b.chargetypeid,s.stopname,s.longitude,s.latitude
  FROM base_busroute a,base_busline b,base_busstop s where a.lineid=b.lineid and a.customerunitcode=b.customerunitcode
   and a.stopid=s.stopid and a.customerunitcode=s.customerunitcode and a.isdelete=0 and b.isvisible=1 and b.isdelete=0 and s.isdelete=0

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_CARDTYPEDETAIL" ("DETAILID", "DETAILNAME", "GROUPID", "SORTID", "VER", "PARAGROUPID", "WALLETUSETYPE", "ISVISIBLE", "CASHYEARCHECKMONS", "CUSTOMERUNITCODE") AS 
  SELECT a.detailid, a.detailname, a.groupid, a.sortid, a.ver,
       a.paragroupid, a.walletusetype, a.isvisible, a.cashyearcheckmons,
       a.customerunitcode
  FROM base_cardtype_detail_temp a
  union
  SELECT a.detailid, a.detailname, a.groupid, a.sortid, a.ver,
       a.paragroupid, a.walletusetype, a.isvisible, a.cashyearcheckmons,
       null as customerunitcode
  FROM base_cardtype_detail a

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_CONSUMEINFO" ("CSTACCFC", "CUSTOMERID", "CARDNO", "CARDTYPE", "OPDT", "ELECTRONODDFARE", "ELECTRONOPFARE", "ACCCODE", "DSCRP", "CARDSN", "OPCOUNT", "DEALTYPE", "COLLECTDT", "UPLOADDATE", "BUSID", "DRIVERID", "POSCODE", "SAMCARDNO", "CARDKIND", "TRADERECNO", "TAC", "SAMTRADENO", "BUSLINEID", "TOTALRECNO", "DISCOUNT", "TRADETYPE", "LINEDEPT", "REPEALEMPID", "ELECTRDUMMYOPFARE", "CARDASN", "TRADECITYCODE", "OWNERCITYCODE", "MAINCARDTYPE", "ASSOCARDTYPE", "CARDVERSION", "TRADEKIND", "TESTFLAG", "OPERATORPOINT", "COLLECTPOINT", "ACCOUNTDATE", "RECORDTYPE", "FLAG", "FLEEPOSCODE", "UPSTOPID", "DOWNSTOPID", "CUSTOMERUNITCODE", "BUSLINENAME", "TYPE") AS 
  SELECT a.cstaccfc, a.customerid, a.cardno, a.cardtype, a.opdt,
        a.electronoddfare, a.electronopfare,
       a.acccode, a.dscrp, a.cardsn, a.opcount, a.dealtype, a.collectdt,
       a.uploaddate, a.busid, a.driverid, a.poscode, a.samcardno,
       a.cardkind, a.traderecno, a.tac, a.samtradeno, a.buslineid,
       a.totalrecno, a.discount, a.tradetype, a.linedept, a.repealempid,
       a.electrdummyopfare, a.cardasn, a.tradecitycode, a.ownercitycode,
       a.maincardtype, a.assocardtype, a.cardversion, a.tradekind,
       a.testflag, a.operatorpoint, a.collectpoint, a.accountdate,
       a.recordtype, a.flag, a.fleeposcode, a.upstopid, a.downstopid,
       a.customerunitcode,b.linename,1 as type
  FROM rec_electtron_consume a,base_busline b where a.acccode=201
  and a.buslineid=b.lineid
  union
  SELECT a.cstaccfc, a.customerid, a.cardno, a.cardtype, a.opdt,
        a.viceonoddfare as electronoddfare,a.viceonopfare as electronopfare,
       a.acccode, a.dscrp, a.cardsn, a.opcount, a.dealtype, a.collectdt,
       a.uploaddate, a.busid, a.driverid, a.poscode, a.samcardno,
       a.cardkind, a.traderecno, a.tac, a.samtradeno, a.buslineid,
       a.totalrecno, a.discount, a.tradetype, a.linedept, a.repealempid,
       a.vicedummyopfare as electrdummyopfare, a.cardasn, a.tradecitycode, a.ownercitycode,
       a.maincardtype, a.assocardtype, a.cardversion, a.tradekind,
       a.testflag, a.operatorpoint, a.collectpoint, a.accountdate,
       0 as recordtype, 0 as flag, 0 as fleeposcode, 0 as upstopid, 0 as downstopid,
       a.customerunitcode,b.linename,1 as type
  FROM REC_MONTICKET_CONSUM a,base_busline b where a.acccode=202
  and a.buslineid=b.lineid
  union
  SELECT a.cstaccfc, a.customerid, a.cardno, a.cardtype, a.opdt,
        a.viceonoddfare as electronoddfare,a.viceonopfare as electronopfare,
       a.acccode, a.dscrp, a.cardsn, a.opcount, a.dealtype, a.collectdt,
       a.uploaddate, a.busid, a.driverid, a.poscode, a.samcardno,
       a.cardkind, a.traderecno, a.tac, a.samtradeno, a.buslineid,
       a.totalrecno, a.discount, a.tradetype, a.linedept, a.repealempid,
       a.vicedummyopfare as electrdummyopfare, a.cardasn, a.tradecitycode, a.ownercitycode,
       a.maincardtype, a.assocardtype, a.cardversion, a.tradekind,
       a.testflag, a.operatorpoint, a.collectpoint, a.accountdate,
       0 as recordtype, 0 as flag, 0 as fleeposcode, 0 as upstopid, 0 as downstopid,
       a.customerunitcode,b.linename,1 as type
  FROM REC_VICECARD_CONSUME a,base_busline b where a.acccode=203
  and a.buslineid=b.lineid

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_CUSTCARD" ("ID", "CUSTOMERID", "SCARDSNR", "CARDNO", "CARDTYPEDETAILID", "CARDSN", "STATUS", "QUERYPWD", "CARDKIND", "COUNTRYID", "ELECTROPCOUNT", "ELECTRSAVEOPCOUNT", "MONOPCOUNT", "MONSAVEOPCOUNT", "SUMELECTRADDFAREACC", "SUMELECTRADDFARE", "SUMMONADDFAREACC", "SUMCONSUMFARE", "SUMELECTRCONSUMFARE", "SUMMONCONSUMFARE", "SUMELECTRDUMMYFARE", "SUMMONRUSHFARE", "SUMDISCOUNT", "ELECTRODDFARE", "ELECTRODDFAREACC", "SEX", "NAME", "NATION", "TELPHONENUM", "IDCARDNO", "CERTIFICATEID", "CUSTDEPT", "OPENDT", "NOUSEDATE", "ADDRESS", "BIRTHDAY", "RREMARK", "EMPID", "YEARCHECKS", "CHECKBEGINDAY", "CHECKENDDAY", "SUMMONTHODDFAREACC", "VER", "NONAMEFLAG", "TEMCARDNO", "ASN", "OUTID", "CARDTYPEPEOPLEID", "CARDTYPECITYID", "NUMBERODDFARE", "CUSTOMERUNITCODE", "CARDTYPEID", "SUMMANGEFARE", "SUMFREEMANGEFARE", "ELECASHTYPE", "MONODDFARE", "NUMBEROPCOUNT", "NUMBERSAVEOPCOUNT", "OPDT") AS 
  SELECT  a.id, a.customerid,scardsnr, cardno, cardtypedetailid,
                                    cardsn, status, querypwd, cardkind, countryid,
                                    electropcount, electrsaveopcount, monopcount,
                                    monsaveopcount, sumelectraddfareacc, sumelectraddfare,
                                    summonaddfareacc, sumconsumfare, sumelectrconsumfare,
                                    summonconsumfare, sumelectrdummyfare, summonrushfare,
                                    sumdiscount, electroddfare, electroddfareacc, sex,
                                    name, nation, telphonenum, idcardno, certificateid,
                                    custdept, opendt, nousedate, address, birthday,
                                    rremark, empid, yearchecks, checkbeginday, checkendday,
                                       summonthoddfareacc, a.ver,nonameflag,a.temcardno,a.asn,
                                    a.outid, a.cardtypepeopleid,a.cardtypecityid,a.NUMBERODDFARE ,c.customerunitcode,a.cardtypeid,SUMMANGEFARE,SUMFREEMANGEFARE,elecashtype,a.monoddfare, a.numberopcount,
       a.numbersaveopcount,
       a.opdt --2016-07-25 新增base_customers opdt字段
                                    FROM base_customers a,base_customers_info c where   c.customerid=a.customerid and a.customerunitcode=c.customerunitcode

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_DRIVER_ATTENDANCE_FORAPP" ("DRIVERID", "DRIVERCARDNO", "DRIVERCARDSN", "OPTYPE", "OPDT", "BUSID", "CUSTOMERUNITCODE", "BUSLINENAME") AS 
  SELECT a.driverid,a.drivercardno,a.drivercardsn,a.optype,a.opdt,a.busid,a.customerunitcode,b.linename
FROM REC_DRIVECARD_RECORD a,BASE_BUSLINE b
WHERE a.buslineid=b.lineid

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_PAYMENT_DAY" ("ACCCODE", "OPERNO", "OPERMN", "BALANCEDATE", "WALLETTYPE", "EMPNAME", "EMPID", "DEPTNAME", "DPTCODE", "CARDTYPENAME") AS 
  ((SELECT t1.acccode, t1.operno, t1.opermn, t1.balancedate, t1.wallettype,
         t2.empname AS empname, t2.empid AS empid, t3.dptname AS deptname,
         t3.dptcode AS dptcode, t4.detailname AS cardtypename
    FROM st_payment_day t1 LEFT JOIN base_emp t2 ON t1.empid = t2.empid
         LEFT JOIN base_dept t3 ON t1.dptcode = t3.dptcode
         LEFT JOIN base_cardtype_detail t4 ON t1.cardtype = t4.detailid
         ))

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_REC_ALIPAY_RECORD_ALL" ("POSCODE", "BUSID", "BUSNUMBER", "LINENAME", "EMPNAME", "ACCCODE", "OPFARE", "OPDT", "UPLOADDATE", "ACCOUNTDATE", "FLAG_TYPE", "FLAG", "RESPONSEMESSAGE", "DATATYPE") AS 
  SELECT TO_CHAR(a.poscode) AS poscode,
       a.busid,
       b.busnumber,
       c.linename,
       e.empname,
       '支付宝消费' AS acccode,
       a.opfare,
       a.opdt,
       a.uploaddate,
       TO_CHAR(a.accountdate,'YYYY-MM-DD') AS accountdate,
       flag AS flag_type,
       DECODE(a.flag, 0, '待清算', 1, '清算失败') AS flag,
       a.responsemessage,
       '1' datatype
  FROM REC_ALIPAY_RECORD a
  LEFT JOIN base_bus b
    ON a.busid = b.busno
   and a.customerunitcode = b.customerunitcode
  LEFT JOIN base_busline c
    ON a.buslineid = c.lineid
   AND a.customerunitcode = c.customerunitcode
  LEFT JOIN base_emp e
    ON a.driverid = e.empid
   AND a.customerunitcode = e.customerunitcode
  UNION
  SELECT TO_CHAR(a.poscode) AS poscode,
  a.busid,
  b.busnumber,
       c.linename,
       e.empname,
       '支付宝消费' AS acccode,
       a.opfare,
       a.opdt,
       a.uploaddate,
       TO_CHAR(a.accountdate,'YYYY-MM-DD') AS accountdate,
       flag AS flag_type,
       '清算成功' AS flag,
       a.responsemessage,
       '2' datatype
  FROM rec_alipay_record_success a
  LEFT JOIN base_bus b
  ON a.busid = b.busno
  AND a.customerunitcode = b.customerunitcode
  LEFT JOIN base_busline c
    ON a.buslineid = c.lineid
   AND a.customerunitcode = c.customerunitcode
  LEFT JOIN base_emp e
    ON a.driverid = e.empid
   AND a.customerunitcode = e.customerunitcode

 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_REC_CUST" ("CARDNO", "CARDSN", "DETAILNAME", "OPENDT", "NOUSEDATE", "IDCARDNO", "SEX", "NAME", "KIND", "STATUS", "CARDDETAILID", "CARDKIND", "GROUPID", "USERID", "OUTID", "CUSTOMERUNITCODE", "SCARDSNR", "LINEID", "EMPCODE") AS 
  (/* Formatted on 2012/09/06 16:59 (Formatter Plus v4.8.7) */
(SELECT DISTINCT t1.asn AS cardno, t1.cardsn, t2.detailname,
                 t1.opdt AS opendt, t1.nousedate, t4.idcardno, t4.sex,
                 t4.NAME,
                 (CASE t3.kind
                     WHEN 0
                        THEN '乘车卡'
                     WHEN 1
                        THEN '管理卡'
                  END
                 ) AS kind,
                 t1.status, t1.cardtypedetailid, t3.kind, t3.groupid,
                 t1.customerid AS userid, t1.outid,t4.customerunitcode,scardsnr,0 as lineid,t5.empcode
            FROM base_customers t1 JOIN base_cardtype_detail t2
                 ON t1.cardtypedetailid = t2.detailid
                 JOIN base_cardtype_group t3 ON t2.groupid = t3.groupid
                 JOIN base_customers_info t4 ON t1.customerid = t4.customerid and t1.customerunitcode=t4.customerunitcode
                  join base_emp t5 on t4.idcardno=t5.idcardno
 UNION
 SELECT DISTINCT b.empcardno, b.cardsn, t2.detailname, b.opdt AS opendt,
                 b.nousedate, a.idcardno, a.sex, a.empname AS NAME,
                 (CASE t3.kind
                     WHEN 0
                        THEN '乘车卡'
                     WHEN 1
                        THEN '管理卡'
                  END
                 ) AS kind,
                 b.cardstatus, b.carddetailid, t3.kind, t3.groupid,
                 a.empid AS userid, '0' AS outid,a.customerunitcode,scardsnr,b.lineid,a.empcode
            FROM base_emp a JOIN base_emp_card b ON a.empid = b.empid and a.customerunitcode=b.customeruintcode
                 JOIN base_cardtype_detail t2 ON b.carddetailid = t2.detailid
                 JOIN base_cardtype_group t3 ON t2.groupid = t3.groupid
                 )
)

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_REC_THIRDRECORD" ("TRADEKIND", "WALLETTYPE", "RECORDINFO", "APPID", "LINEDIRECTION", "SYSTRACENUM", "STOPID", "ORDERTYPE", "OPFARE", "DISCOUNTFARE", "ODDFARE", "ACCCODE", "DSCRP", "BUSID", "DRIVERID", "BUSLINEID", "LINEDEPT", "MAINCARDTYPE", "CARDTYPE", "POSCODE", "TRADERECNO", "OPDT", "COLLECTDT", "UPLOADDATE", "TESTFLAG", "RECORDTYPE", "FLAG", "THIRDTERMID", "THIRDMERCHANTCODE", "CUSTOMERUNITCODE", "STATUS", "ACCOUNTDATE", "RESPONSECODE", "RESPONSEMESSAGE", "EXTENTVALUE", "USERID", "THIRDCARDNO", "ACCOUNTID", "FILENAME") AS 
  select a.TRADEKIND,a.WALLETTYPE,a.RECORDINFO,a.APPID,a.LINEDIRECTION,a.SYSTRACENUM,a.STOPID,a.ORDERTYPE,
  a.OPFARE*acctype.dir as opfare,a.DISCOUNTFARE,a.ODDFARE,a.ACCCODE,a.DSCRP,a.BUSID,a.DRIVERID,a.BUSLINEID,a.LINEDEPT,
  a.MAINCARDTYPE,a.CARDTYPE,a.POSCODE,a.TRADERECNO,a.OPDT,a.COLLECTDT,a.UPLOADDATE,a.TESTFLAG,a.RECORDTYPE,
  a.FLAG,a.THIRDTERMID,a.THIRDMERCHANTCODE,a.CUSTOMERUNITCODE,a.STATUS,a.ACCOUNTDATE,a.RESPONSECODE,
  a.RESPONSEMESSAGE,a.EXTENTVALUE,a.USERID,a.THIRDCARDNO,a.ACCOUNTID,a.FILENAME
  from rec_thirdrecord a
  join base_acc_type acctype
  on a.acccode=acctype.acccode
  union all
  select b.TRADEKIND,b.WALLETTYPE,b.RECORDINFO,b.APPID,b.LINEDIRECTION,b.SYSTRACENUM,b.STOPID,b.ORDERTYPE,
  b.OPFARE*acctype.dir as opfare,b.DISCOUNTFARE,b.ODDFARE,b.ACCCODE,b.DSCRP,b.BUSID,b.DRIVERID,b.BUSLINEID,b.LINEDEPT,
  b.MAINCARDTYPE,b.CARDTYPE,b.POSCODE,b.TRADERECNO,b.OPDT,b.COLLECTDT,b.UPLOADDATE,b.TESTFLAG,b.RECORDTYPE,
  b.FLAG,b.THIRDTERMID,b.THIRDMERCHANTCODE,b.CUSTOMERUNITCODE,2 STATUS,b.ACCOUNTDATE,b.RESPONSECODE,
  b.RESPONSEMESSAGE,b.EXTENTVALUE,b.USERID,b.THIRDCARDNO,b.ACCOUNTID,b.FILENAME
  from rec_thirdrecord_sucess b
  join base_acc_type acctype
  on b.acccode=acctype.acccode

 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_REC_UNIONTHIRD_ALL" ("BANKCARDNO", "OPFARE", "BUSID", "LINENAME", "DPTNAME", "ACCOUNTRESULT", "ACCOUNTDATE", "OPDT", "UPLOADDATE", "MERCHANTCODE", "CUSTOMERUNITCODE", "MAINCARDTYPE", "RESULTCODE", "ORDER_STR") AS 
  SELECT a.bankcardno,
         a.opfare,
         '' busid,
         '' linename,
         '' dptname,
         a.status accountresult,--0待清算;1已清算
         TO_CHAR(a.accountdate,'YYYY-MM-DD') AS accountdate,
         TO_CHAR(a.opdt,'YYYY-MM-DD') AS opdt,
         TO_CHAR(a.uploaddate,'YYYY-MM-DD') AS uploaddate,
         '' merchantcode,
         a.customerunitcode,
         a.serverinputtype as maincardtype,--主卡类型
         a.resultcode,--应答码  status=1 & resultcode='0000' 清算成功;status=1 & resultcode<>'0000'清算失败
         1 order_str
     FROM rec_thirdrecord_acoma a
     where a.status=0 or (a.status=1 and a.resultcode<>'0000')
  UNION all
  SELECT s.bankcardno,
         s.opfare as opfare,
         b.busnumber,
         c.linename,
         TO_CHAR(d.dptname) AS dptname,
         1 accountresult,
         TO_CHAR(s.accountdate,'YYYY-MM-DD') AS accountdate,
         TO_CHAR(s.opdt,'YYYY-MM-DD') AS opdt,
         TO_CHAR(s.uploaddate,'YYYY-MM-DD') AS uploaddate,
         s.merchantcode,
         s.customerunitcode,
         TO_CHAR(s.maincardtype) AS maincardtype,--主卡类型
         '0000' as resultcode,
         2 order_str
      FROM rec_thirdrecord_sucess s
       inner JOIN base_bus b
         ON s.busid = b.busno
         AND s.customerunitcode = b.customerunitcode
         and b.isdelete=0
      inner JOIN base_busline c
         ON s.buslineid  = c.lineid
         AND s.customerunitcode = c.customerunitcode
         and c.isdelete=0
      inner JOIN base_dept d
         ON s.linedept = d.dptcode
         AND s.customerunitcode = d.customerunitcode
         and d.isdelete=0
  UNION all
      --电子现金
      SELECT a.THIRDCARDNO bankcardno,
         a.opfare/100 opfare,
         '' busid,
         '' linename,
         '' dptname,
         a.status accountresult,--0待清算;1已清算
         TO_CHAR(a.accountdate,'YYYY-MM-DD') AS accountdate,
         TO_CHAR(a.opdt,'YYYY-MM-DD') AS opdt,
         TO_CHAR(a.uploaddate,'YYYY-MM-DD') AS uploaddate,
         '' merchantcode,
         a.customerunitcode,
         '1' as maincardtype,--电子现金主卡类型1
         a.resultcode,--应答码  status=1 & resultcode='0000' 清算成功;status=1 & resultcode<>'0000'清算失败
         1 order_str
     FROM rec_thirdcard_51b a
     where a.status=0 or (a.status=1 and a.resultcode<>'0000')
  UNION all
  SELECT s.THIRDCARDNO bankcardno,
         s.ELECTRONOPFARE as opfare,
         b.busnumber,
         c.linename,
         TO_CHAR(d.dptname) AS dptname,
         1 accountresult,
         TO_CHAR(s.accountdate,'YYYY-MM-DD') AS accountdate,
         TO_CHAR(s.opdt,'YYYY-MM-DD') AS opdt,
         TO_CHAR(s.uploaddate,'YYYY-MM-DD') AS uploaddate,
         s.merchantcode,
         s.customerunitcode,
         TO_CHAR(s.maincardtype) AS maincardtype,--主卡类型
         '0000' as resultcode,
         2 order_str
      FROM rec_thirdcard_consumesucess s
       inner JOIN base_bus b
         ON s.busid = b.busno
         AND s.customerunitcode = b.customerunitcode
         and b.isdelete=0
      inner JOIN base_busline c
         ON s.buslineid  = c.lineid
         AND s.customerunitcode = c.customerunitcode
         and c.isdelete=0
      inner JOIN base_dept d
         ON s.linedept = d.dptcode
         AND s.customerunitcode = d.customerunitcode
         and d.isdelete=0

 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_ST_PAYMENT_ALL" ("ID", "STATDATE", "POSCODE", "PASMCARDNO", "BUSID", "BUSLINEID", "EMPID", "WALLETTYPE", "CARDTYPE", "CARDKIND", "ACCDATE", "DEPTCODE", "ACCCODE", "OPERNO", "OPERMN", "DISCOUNTMN", "BALANCEDATE", "CUSTOMERUNITCODE") AS 
  (SELECT a.id,a.statdate, a.poscode, a.pasmcardno, a.busid, a.buslineid,
       a.empid, a.wallettype, a.cardtype, a.cardkind, a.accdate,
       a.dptcode as deptcode, a.acccode, a.operno, a.opermn, a.discountmn,
        a.statdate AS balancedate,customerunitcode
  FROM st_payment a
  union all
  SELECT a.id, a.statdate, a.poscode, a.pasmcardno, a.busid, a.buslineid,
       a.empid, a.wallettype, a.cardtype, a.cardkind, a.accdate,
       a.dptcode as deptcode, a.acccode, a.operno, a.opermn, a.discountmn,
       a.balancedate,customerunitcode
  FROM st_payment_day a
  )

 
 
 
 
 
/


  CREATE OR REPLACE FORCE VIEW "CCENSE"."V_TOPUPINFO" ("CASHACCFC", "OPDT", "CUSTOMERID", "CARDNO", "CARDSN", "CARDTYPEDETAILID", "CARDKIND", "ELECTROPCOUNT", "ELECTRSAVEOPCOUNT", "ELECTRODDFARE", "ELECTRDUMMYOPFARE", "ELECTROPFARE", "ACCCODE", "DSCRP", "POSCODE", "DEALTYPE", "SAMCARDNO", "SAMTRADENO", "PLANID", "EMPID", "WALLETTYPE", "CUSTOMERUNITCODE", "TYPE") AS 
  SELECT a.cashaccfc, a.opdt, a.customerid, a.cardno, a.cardsn,
       a.cardtypedetailid, a.cardkind, a.electropcount,
       a.electrsaveopcount, a.electroddfare,
       a.electrdummyopfare, a.electropfare, a.acccode, a.dscrp,
       a.poscode, a.dealtype, a.samcardno, a.samtradeno, a.planid,
        a.empid, a.wallettype,
       a.customerunitcode,1 as type
  FROM rec_electtron_cash a where a.acccode in('100','1101','1102','1102','1104','1105','1106','1107','1108')
  union
  SELECT a.cashaccfc, a.opdt, a.customerid, a.cardno, a.cardsn,
       a.cardtypedetailid, a.cardkind, a.viceopcount as electropcount,
       a.vicesaveopcount as electrsaveopcount, a.viceoddfare as electroddfare,
       a.vicedummyopfare as electrdummyopfare , a.viceopfare as electropfare, a.acccode, a.dscrp,
       a.poscode, a.dealtype, a.samcardno, a.samtradeno, a.planid,
        a.empid, a.wallettype,
       a.customerunitcode,1 as type
  FROM rec_monticket_cash a where a.acccode in('101')
  union
  SELECT a.cashaccfc, a.opdt, a.customerid, a.cardno, a.cardsn,
       a.cardtypedetailid, a.cardkind, a.viceopcount as electropcount,
       a.vicesaveopcount as electrsaveopcount, a.viceoddfare as electroddfare,
       a.vicedummyopfare as electrdummyopfare , a.viceopfare as electropfare, a.acccode, a.dscrp,
       a.poscode, a.dealtype, a.samcardno, a.samtradeno, a.planid,
        a.empid, a.wallettype,
       a.customerunitcode,1 as type
  FROM rec_vicecard_cash a  where a.acccode in('102')

 
 
 
 
 
/

