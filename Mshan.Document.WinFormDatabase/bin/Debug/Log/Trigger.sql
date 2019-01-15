CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ALERT_LOG" 
 BEFORE
  INSERT
 ON alert_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_alert_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ALERT_MESSAGE" 
 BEFORE
  INSERT
 ON alert_message
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_alert_message.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_atest
 BEFORE
  INSERT
 ON atest
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
    curid       NUMBER;
BEGIN
    SELECT seq_atest.NEXTVAL INTO curid FROM DUAL;

    :new.id := curid;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_ACC_TYPE" 
 BEFORE
  INSERT
 ON base_acc_type
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_acc_type.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_APP_PORT" 
 BEFORE
  INSERT
 ON base_app_port
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_app_port.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_APP_PORT_VER" 
 BEFORE
   INSERT OR UPDATE OF portpty, ipaddr, port, appid
 ON base_app_port
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_app_port_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_APP_TERM_VER" 
 BEFORE
   INSERT OR UPDATE OF poscode, appid
 ON base_app_term
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_app_term_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_APP_TERM" 
 BEFORE
  INSERT
 ON base_app_term
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_app_term.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUS_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_bus
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_bus_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUS" 
 BEFORE
  INSERT
 ON base_bus
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_bus.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUS_CHANGELOG" 
 BEFORE
  INSERT
 ON base_bus_changelog
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_bus_changelog.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSINESS_MODEL" 
 BEFORE
  INSERT
 ON base_business_model
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_business_model.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSLINE" 
 BEFORE
  INSERT
 ON base_busline
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busline.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSLINE_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_busline
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busline_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSLINESTOP_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_buslinestop
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_BUSLINESTOP_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "TRI_BUSLINESTOP" 
  BEFORE INSERT ON BASE_BUSLINESTOP
  FOR EACH ROW

BEGIN
   SELECT SEQ_BUSLINESTOP.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
END ;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSROUTE" 
 BEFORE
  INSERT
 ON base_busroute
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busroute.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSROUTE_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_busroute
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busroute_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSSTOP" 
 BEFORE
  INSERT
 ON base_busstop
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busstop.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_BUSSTOP_VER" 
 BEFORE
   INSERT OR UPDATE OF longitude, isdelete, latitude
 ON base_busstop
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_busstop_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CARD_REGIST" 
 BEFORE
  INSERT
 ON base_card_regist
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_card_regist.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRI_BASE_CARDID" 
 BEFORE
  INSERT
 ON base_cardid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_cardid.NEXTVAL
     INTO :NEW.cardid
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CARDTYPE" 
 BEFORE
  INSERT
 ON base_cardtype
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_cardtype.NEXTVAL
     INTO :NEW.TYPEID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CHARGAUTH" 
 BEFORE
  INSERT
 ON base_chargeauth
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_chargeauth.NEXTVAL
     INTO :NEW.AUTHCODE
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CITY_AREA" 
 BEFORE
  INSERT OR UPDATE
 ON base_city_area
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_city_area.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CITY_ERRORCODE" 
 BEFORE
  INSERT OR UPDATE
 ON BASE_CITY_ERRORCODE
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_city_errorcode.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_BASE_CITY_ERRORDEALTYPE" 
    BEFORE INSERT
    ON base_city_errordealtype
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_base_city_errordealtype.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CLEARINGRATES" 
 BEFORE
  INSERT
 ON base_clearingrates
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_clearingrates.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."BIN$V5l3If2SRSiqAsu9aBkVfQ==$1" 
 BEFORE
  INSERT
 ON base_customers
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_customers.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUSTOMER_VER" 
 BEFORE
   INSERT OR UPDATE OF nousedate, cardtypedetailid, cardno, querypwd, cardsn, scardsnr
 ON base_customers
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_customers_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUSTOMERS_INFO" 
 BEFORE
  INSERT
 ON base_customers_info
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_customers_info.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUSTOMERS_MONTICKET" 
 BEFORE
  INSERT
 ON base_customers_monticket
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_cust_monticketid.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUST_MONTICKETVER" 
 BEFORE
  INSERT
 ON base_customers_monticket
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_cust_monticketver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUSTOMERS_NUMBER" 
 BEFORE
  INSERT
 ON base_customers_vicecard
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_customers_number.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_DATABASE_LOG" 
 BEFORE
  INSERT
 ON base_database_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_database_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_DEPT" 
 BEFORE
  INSERT
 ON base_dept
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_dept.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_DEPT_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_dept
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_dept_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_EMP_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_emp
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_emp_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_EMP" 
 BEFORE
  INSERT
 ON base_emp
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_emp.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRI_BASE_EMP_CARD_HISTORY" 
 BEFORE
  INSERT
 ON base_emp_card_history
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_emp_card_history.NEXTVAL
     INTO :NEW.cardfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_EMP_MENU" 
 BEFORE
  INSERT
 ON base_emp_menu
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
      select  base_emp_menu_seq.nextval   into:new.emp_prmid from sys.dual ;
end;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_JTB_ERRORCODE" 
 BEFORE
  INSERT OR UPDATE
 ON base_jtb_errorcode
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_jtb_errorcode.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LEGAL_PERSON" 
 BEFORE
  INSERT
 ON base_legal_person
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_legal_person.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LEGAL_MENU_PRMID" 
 BEFORE
  INSERT
 ON base_legal_person_menu
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_legal_prmid.NEXTVAL
     INTO :NEW.prmid
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LINEPARAM" 
 BEFORE
  INSERT
 ON base_lineparam
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_lineparam.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LINEPARAM_VER" 
 BEFORE
  INSERT
 ON base_lineparam
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_lineparam_ver.NEXTVAL
     INTO :NEW.Ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LINEPARAM_CARDTYPE" 
 BEFORE
  INSERT
 ON base_lineparam_cardtype
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_lineparam_cardtype.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_LINEPARAM_CARDTYPEVER" 
 BEFORE
  INSERT OR UPDATE
 ON base_lineparam_cardtype
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_lineparam_cardver.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_base_maincardtype
    BEFORE INSERT
    ON base_maincardtype
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_base_maincardtype.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_OPERATION_PROCID" 
 BEFORE
  INSERT
 ON base_operation_procedure
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_operation_procedure.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_base_org_info
    BEFORE INSERT
    ON base_organization_info
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_base_org_info.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_BASE_PARAM" 
 BEFORE
  INSERT
 ON base_param
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_param.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;

   --SELECT seq_base_param_ver.NEXTVAL
   --  INTO :NEW.ver
   --  FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRI_BASE_PARAM_GROUP" 
 BEFORE
  INSERT
 ON base_param_group
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
  /* SELECT seq_base_param_group.NEXTVAL
     INTO :NEW.paramgroupid
     FROM DUAL;*/

   SELECT seq_base_param_group_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRI_BASE_PARAM_LIB" 
 BEFORE
  INSERT
 ON base_param_lib
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_param_lib.NEXTVAL
     INTO :NEW.paramid
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_BASE_PARAM_MODEL" 
 BEFORE
  INSERT
 ON base_param_model
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_param_model.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_POSITIONS" 
 BEFORE
  INSERT
 ON base_positions
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_positions.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_PRODUCT" 
 BEFORE
  INSERT
 ON base_productor
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_cardtype.NEXTVAL
     INTO :NEW.PRoDUCTID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_base_qrcode_key_ver
 BEFORE
  INSERT OR UPDATE
 ON base_qrcode_key
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_qrcode_key_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_ROLE" 
 BEFORE
  INSERT
 ON base_role
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_role.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_SAMCARD" 
 BEFORE
  INSERT
 ON base_samcard
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_samcard.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_SAVEMONEY_CONFIG" 
 BEFORE
  INSERT
 ON base_savemoney_config
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_savemoney_config.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM" 
 BEFORE
  INSERT
 ON base_term
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_VER" 
 BEFORE
   INSERT OR UPDATE OF customerunitcode,poscode, psamcardno,switchkey,primarykey,isswitch
 ON base_term
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_DELETE" 
 BEFORE
  INSERT
 ON base_term_delete
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_delete.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_MAINTAINLOG" 
 BEFORE
  INSERT
 ON base_term_maintainlog
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_maintainlog.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_PUBLICKEY_PARAM" 
 BEFORE
  INSERT
 ON base_term_publickey_param
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_publickey_param.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_STATUS" 
 BEFORE
  INSERT
 ON base_term_status
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_status.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UNION" 
 BEFORE
  INSERT
 ON base_term_union
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_union.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UNION_VER" 
 BEFORE
  INSERT
 ON base_term_union
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_union_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_UNIONCARD_PARAM" 
 BEFORE
  INSERT
 ON base_term_unioncard_param
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_unioncard_param.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UPGRADE_VER" 
 BEFORE
  INSERT OR UPDATE
 ON base_term_upgrade
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_upgrade_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UPGRADE_ID" 
 BEFORE
  INSERT
 ON base_term_upgrade
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_upgrade_id.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_IMPORT" 
 BEFORE
  INSERT
 ON base_term_upgrade_import
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_import.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UPGRADEAVR" 
 BEFORE
  INSERT
 ON base_term_upgrade_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_card_upgradever.NEXTVAL
     INTO :NEW.appver
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TERM_UPGRADELOG" 
 BEFORE
  INSERT
 ON base_term_upgrade_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_term_upgradelog.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TICKET_PRICE" 
 BEFORE
  INSERT
 ON base_ticket_price
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_ticket_price.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_TICKET_PRICE_VER" 
 BEFORE
   INSERT OR UPDATE OF price, valuetype
 ON base_ticket_price
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_ticket_price_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_WRITEOFF_INFO" 
 BEFORE
  INSERT
 ON base_writeoff_info
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_writeoff_info.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."trg_gis_Coordinate" 
 BEFORE
  INSERT
 ON gis_coordinate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_gis_coordinate.NEXTVAL
     INTO :NEW.COORDINATEID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_GIS_Coordinate" 
 BEFORE
  INSERT
 ON gis_coordinate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_gis_coordinate.NEXTVAL
     INTO :NEW.COORDINATEID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_GIS_Coordinate_Type" 
 BEFORE
  INSERT
 ON gis_coordinate_type
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_GIS_Coordinate_Type.NEXTVAL
     INTO :NEW.CTYPEID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_GIS_Location_Coordinate" 
 BEFORE
  INSERT
 ON gis_location_coordinate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_GIS_Location_Coordinate.NEXTVAL
     INTO :NEW.LOCATIONID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_GIS_Order_Log" 
 BEFORE
  INSERT
 ON gis_order_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_GIS_Order_Log.NEXTVAL
     INTO :NEW.LOGID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_LOG_LOGIN" 

 BEFORE

  INSERT

 ON log_login

REFERENCING NEW AS NEW OLD AS OLD

 FOR EACH ROW

DECLARE

   integrity_error   EXCEPTION;

   errno             INTEGER;

   errmsg            CHAR (200);

BEGIN

   SELECT seq_log_login.NEXTVAL

     INTO :NEW.ID

     FROM DUAL;

--  Errors handling

EXCEPTION

   WHEN integrity_error

   THEN

      raise_application_error (errno, errmsg);

END;/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_LOG_OPERATION" 
 BEFORE
  INSERT
 ON log_operation
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_log_operation.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER rec_alipay_record
 BEFORE
  INSERT
 ON rec_alipay_record
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_alipay_record.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER rec_alipay_record_success
 BEFORE
  INSERT
 ON rec_alipay_record_success
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_alipay_record_success.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_BLLT_VER" 
 BEFORE
  INSERT OR UPDATE
 ON rec_bllt
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_bllt_ver.NEXTVAL
     INTO :NEW.ver
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_BLLT" 
 BEFORE
  INSERT OR UPDATE
 ON rec_bllt
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_bllt.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_BLLT_PASMCARD" 
 BEFORE
  INSERT
 ON rec_bllt_pasmcard
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_bllt_pasmcard.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_BLLT_SAFE" 
 BEFORE
  INSERT
 ON rec_bllt_safe
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_bllt_safe.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_BLLTSAFE_PSAMCARD" 
 BEFORE
  INSERT
 ON rec_blltsafe_psamcard
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_blltsafe_psamcard.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CARDMAKE_ACC" 
 BEFORE
  INSERT
 ON rec_card_make_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_cardmake_acc.NEXTVAL
     INTO :NEW.cardfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CARD_MAKE_ACC_BAD" 
 BEFORE
  INSERT
 ON rec_card_make_acc_bad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_card_make_acc_bad.NEXTVAL
     INTO :NEW.cardfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CARDMAKE_CARDFC" 
 BEFORE
  INSERT
 ON rec_card_sell
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_cardmake.NEXTVAL
     INTO :NEW.cardfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_rec_cash_input_businfo
 BEFORE
  INSERT
 ON rec_cash_input_businfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_REC_CASH_INPUT_BUSINFO.nextval into :new.ID from dual;
end ;
/

CREATE OR REPLACE 
TRIGGER trg_rec_cash_input_counterinfo
 BEFORE
  INSERT
 ON rec_cash_input_counterinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_REC_CASH_INPUT_COUNTERINFO.nextval into :new.ID from dual;
end ;
/

CREATE OR REPLACE 
TRIGGER trg_rec_cash_input_driverinfo
 BEFORE
  INSERT
 ON rec_cash_input_driverinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_REC_CASH_INPUT_DRIVERINFO.nextval into :new.ID from dual;
end ;
/

CREATE OR REPLACE 
TRIGGER trg_rec_cash_input_tickets
 BEFORE
  INSERT
 ON rec_cash_input_tickets
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_REC_CASH_INPUT_TICKETS.nextval into :new.ID from dual;
end ;
/

CREATE OR REPLACE 
TRIGGER trg_rec_cash_input_today
 BEFORE
  INSERT
 ON rec_cash_input_today
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
select SEQ_REC_CASH_INPUT_TODAY.nextval into :new.ID from dual;
end ;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CASH_REQUEST" 
 BEFORE
  INSERT
 ON rec_cash_request
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_cash_request.NEXTVAL
     INTO :NEW.requestid
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_TERM_CHARGEAUTH" 
 BEFORE
  INSERT
 ON rec_chargeauth_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_chargeauth_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_REC_CITY_ERORDEAL_AD" 
    BEFORE INSERT
    ON REC_CITY_ERRORDEAL_AD
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_city_errordeal_ad.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_REC_CITY_ERORDEAL_ED" 
    BEFORE INSERT
    ON REC_CITY_ERRORDEAL_ED
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_city_errordeal_ed.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TGR_LOCALCARD_ERRORDEAL_VER" 
 BEFORE
  UPDATE OF adjustmenttype,errortype
 ON REC_CITY_LOCALCARDCONSUME_CL
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_LOCALCARD_ERRORDEAL_VER.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_CITY_LOCALCARDCONSUME_CL" 
    BEFORE INSERT
    ON rec_city_localcardconsume_CL
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_localcardconsume_CL.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_CITY_LOCALCARDCONSUME_CQ" 
    BEFORE INSERT
    ON rec_city_localcardconsume_cq
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_localcardconsume_cq.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_CITY_LOCALCARDCONSUME_FN" 
    BEFORE INSERT
    ON REC_CITY_LOCALCARDCONSUME_FN
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_CITY_LOCALCARDCONSUME_FN.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_CITY_LOCALCARDCONSUME_MX" 
    BEFORE INSERT
    ON REC_CITY_LOCALCARDCONSUME_MX
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_localcardconsume_MX.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_CITY_NOLOCALCARDCONSUME_FB" 
    BEFORE INSERT
    ON REC_CITY_NOLOCALCARDCONSUME_FB
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_CITY_NOLOCALCARDCONSUME_FB.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;








/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_CITY_NONLOCAL_OPCOUNT" 
    BEFORE INSERT
    ON rec_city_nonlocal_opcount
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_nonlocal_opcount.NEXTVAL INTO :new.cstaccfc FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TGR_NOLOCALCARD_ERRORDEAL_VER" 
 BEFORE
  UPDATE OF adjustmenttype,errortype
 ON REC_CITY_NONLOCALCONSUME
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_NOLOCALCARD_ERRORDEAL_VER.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;




/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CITY_NONLOCALCONSUME" 
    BEFORE INSERT
    ON rec_city_nonlocalconsume
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_nonlocalconsume.NEXTVAL INTO :new.cstaccfc FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_CITY_NONLOCALINACCURATE" 
 BEFORE
  INSERT
 ON rec_city_nonlocalinaccurate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_nonlocalinaccurate.NEXTVAL INTO :new.cstaccfc FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_CITY_NONLOCALRETURNINFO" 
 BEFORE
  INSERT
 ON rec_city_nonlocalreturninfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_city_nonlocalreturninfo.NEXTVAL INTO :new.cstaccfc FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CITY_SAFELIST" 
 BEFORE
  INSERT OR UPDATE
 ON rec_city_safelist
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_city_safelist.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."SEQ_REC_CITY_SAFELIST_ID" 
 BEFORE
  INSERT OR UPDATE
 ON rec_city_safelist
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_city_safelist.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_rec_city_safelistdiscount
 BEFORE
  INSERT OR UPDATE
 ON rec_city_safelistdiscount
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_city_safelist.NEXTVAL
     INTO :NEW.VER
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_COIN_ACC_PRE" 
 BEFORE
  INSERT
 ON rec_coin_acc_pre
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_coin_acc_pre.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CONSUMEACC_BAD" 
 BEFORE
  INSERT
 ON rec_consumeacc_bad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_consumeacc_bad.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CONSUMEACC_BAD_REPEAT" 
 BEFORE
  INSERT
 ON rec_consumeacc_bad_repeat
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_consumeacc_bad_repeat.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_DRIVECARD_RECORD" 
 BEFORE
  INSERT
 ON rec_drivecard_record
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_drivecard_record.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_DRIVECARD_SUMFARE" 
 BEFORE
  INSERT
 ON rec_drivecard_sumfare
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_drivecard_sumfare.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_ELECONSUME_INACCURATE" 
 BEFORE
  INSERT
 ON rec_eleconsume_inaccurate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_eleconsume_inaccurate.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ELECTTRON_CASH_PLAN_BAD" 
 BEFORE
  INSERT
 ON rec_electtron_cash_plan_bad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_electtron_cash_plan_bad.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_EMP_INDENT" 
 BEFORE
  INSERT
 ON rec_emp_indent
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_emp_indent.NEXTVAL
     INTO :NEW.indentno
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_EMP_LOSS" 
 BEFORE
  INSERT
 ON rec_emp_loss
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_emp_loss.NEXTVAL
     INTO :NEW.lossfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_FREEZEFARE_ACC" 
 BEFORE
  INSERT
 ON rec_freezefare_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_freezefare_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_REC_LOSS" 
 BEFORE
  INSERT
 ON rec_loss
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_loss.NEXTVAL
     INTO :NEW.lossfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_MONCONSUME_INACCURATE" 
 BEFORE
  INSERT
 ON rec_monconsume_inaccurate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_monconsume_inaccurate.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_MONTICKET_CASH_PLAN_BAD" 
 BEFORE
  INSERT
 ON rec_monticket_cash_plan_bad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_monticket_cash_plan_bad.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_NOTICE_ACC" 
 BEFORE
  INSERT
 ON rec_notice_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_notice_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_NOTICE_COMMENT_ACC" 
 BEFORE
  INSERT
 ON rec_notice_comment_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_notice_comment_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_NOTICE_TYPE_ACC" 
 BEFORE
  INSERT
 ON REC_NOTICE_TYPE_ACC
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_notice_type_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRI_REC_PAYMENT_DAY" 
 BEFORE
  INSERT
 ON rec_payment_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_REC_PAYMENT_DAY.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_RUSHDUMPFARE_LOG" 
 BEFORE
  INSERT
 ON rec_rushdumpfare_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_rushdumpfare_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_RUSHVICEDUMPFARE_LOG" 
 BEFORE
  INSERT
 ON rec_rushvicedumpfare_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_rushvicedumpfare_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_REC_TERM_OPERATION_LOG" 
 BEFORE
  INSERT
 ON rec_term_operation_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_term_operation_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_REC_THIRDCARD_51B
 BEFORE
  INSERT OR UPDATE
 ON REC_THIRDCARD_51B
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_REC_THIRDCARD_51B.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_THIRDCARD_CONSUME" 
 BEFORE
  INSERT
 ON rec_thirdcard_consume
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_thirdcard_consume.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_THIRDCARD_RESULT" 
 BEFORE
  INSERT
 ON rec_thirdcard_consume_result
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_thirdcard_result.NEXTVAL
     INTO :NEW.id
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_THIRDCARD_CONSUMESUCESS" 
 BEFORE
  INSERT
 ON rec_thirdcard_consumesucess
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_thirdcard_consumesucess.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_THIRDCARD_UNSETTLED" 
 BEFORE
  INSERT
 ON rec_thirdcard_unsettled
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_thirdcard_unsettled.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_REC_thirdrecord_acoma
 BEFORE
  INSERT OR UPDATE
 ON REC_thirdrecord_acoma
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_REC_thirdrecord_acoma.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER trg_rec_thirdrecord_fileinfo
 BEFORE
  INSERT OR UPDATE
 ON rec_thirdrecord_fileinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_thirdrecord_fileinfo.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER trg_rec_thirdrecord_repeat
 BEFORE
  INSERT
 ON rec_thirdrecord_repeat
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
    curcstaccfc       NUMBER;
BEGIN
    SELECT seq_rec_thirdrecord_repeat.NEXTVAL INTO curcstaccfc FROM DUAL;

    :new.cstaccfc := curcstaccfc;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER trg_rec_thirdrecord_sucess
 BEFORE
  INSERT OR UPDATE
 ON rec_thirdrecord_sucess
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_sucess.NEXTVAL INTO :new.cstaccfc FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_RECUNIONPAYCONSUME_ODA_TB" 
 BEFORE
  INSERT
 ON REC_THIRDRECORD_TB
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_recunionpayconsume_oda_tb.NEXTVAL INTO :new.cstaccfc FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;



 /

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_UNIONCARD_CONSUME" 
 BEFORE
  INSERT
 ON rec_unioncard_consume
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_unioncard_consume.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER trg_unionconsume_synccontrol
   BEFORE INSERT
   ON rec_unionconsume_synccontrol
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_unionconsume_synccontrol.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_UNIONPAY_CONSUME_ODA" 
 BEFORE
  INSERT
 ON rec_unionpay_consume_oda
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_unionpay_consume_oda.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_UNIONPOUNDAGE_BUS" 
 BEFORE
  INSERT
 ON rec_Unionpoundage_Bus
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_Unionpoundage_Bus.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_UNIONPOUNDAGE_DETAIL" 
 BEFORE
  INSERT
 ON rec_UnionPoundage_Detail
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_UnionPoundage_Detail.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_UNIONPOUNDAGE_TOTAL" 
 BEFORE
  INSERT
 ON rec_UnionPoundage_Total
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_UnionPoundage_Total.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_VICECARD_CASH_PLAN_BAD" 
 BEFORE
  INSERT
 ON rec_vicecard_cash_plan_bad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_vicecard_cash_plan_bad.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_VICECONSUME_INACCURATE" 
 BEFORE
  INSERT
 ON rec_viceconsume_inaccurate
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_viceconsume_inaccurate.NEXTVAL
     INTO :NEW.cstaccfc
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_ACCOUNT_ACC" 
 BEFORE
  INSERT
 ON st_account_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_account_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_ACCOUNT_ACC_DAY" 
 BEFORE
  INSERT
 ON st_account_acc_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_account_acc_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_ACCOUNT_LOG" 
 BEFORE
  INSERT
 ON st_account_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_account_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_ASSETS_DEBTS_DAY" 
 BEFORE
  INSERT
 ON st_assets_debts_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_assets_debts_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_BALANCE_AREA" 
 BEFORE
  INSERT
 ON st_balance_area
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_balance_area.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_BALANCE_AREA_TOTAL" 
 BEFORE
  INSERT
 ON st_balance_area_total
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_balance_area_total.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_DEPT_PAYMENT_DAY" 
 BEFORE
  INSERT
 ON st_dept_payment_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_dept_payment_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_EMP_TRADE" 
 BEFORE
  INSERT
 ON st_emp_trade
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_emp_trade.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_INCOME_BALANCE_DAY" 
 BEFORE
  INSERT
 ON st_income_balance_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_income_balance_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_INCOME_OUTPAY" 
 BEFORE
  INSERT
 ON st_income_outpay
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_income_outpay.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_INCOME_OUTPAY_DAY" 
 BEFORE
  INSERT
 ON st_income_outpay_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_income_outpay_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_MINCOME_OUTPAY" 
 BEFORE
  INSERT
 ON st_mincome_outpay
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_mincome_outpay.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_MINCOME_OUTPAY_DAY" 
 BEFORE
  INSERT
 ON st_mincome_outpay_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_mincome_outpay_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT" 
 BEFORE
  INSERT
 ON st_payment
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_CASH_DAY" 
 BEFORE
  INSERT
 ON st_payment_cash_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_cash_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_CONSUM_DAY" 
 BEFORE
  INSERT
 ON st_payment_consum_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_consum_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_DAY" 
 BEFORE
  INSERT
 ON st_payment_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_MONTH" 
 BEFORE
  INSERT
 ON st_payment_month
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_month.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_THIRDUNSETTLE" 
 BEFORE
  INSERT
 ON st_payment_third_unsettle
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_thirdunsettle.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_YEAR" 
 BEFORE
  INSERT
 ON st_payment_year
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_payment_year.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_SETTLEMENT_ACC" 
 BEFORE
  INSERT
 ON st_settlement_acc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_settlement_acc.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_SYS_CASI_BALANCE" 
 BEFORE
  INSERT
 ON st_sys_casi_balance
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_sys_casi_balance.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_SYS_INCOME_BALANCE_DAY" 
 BEFORE
  INSERT
 ON st_sys_income_balance_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_sys_income_balance_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_SYS_IN_OUTPAY" 
 BEFORE
  INSERT
 ON st_sys_income_outpay
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_sys_in_outpay.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_SYS_IN_OUTPAY_DAY" 
 BEFORE
  INSERT
 ON st_sys_income_outpay_day
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_sys_in_outpay_day.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;



/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TIB_ST_TRANACCOUNT" 
 BEFORE
  INSERT
 ON st_tranaccount
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_tranaccount.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  ERRORS HANDLING
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_TRANACCOUNT_LOG" 
 BEFORE
  INSERT
 ON st_tranaccount_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_st_tranaccount_log.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_UPLOAD_FLAG" 
 BEFORE
  INSERT
 ON upload_flag
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_upload_flag.NEXTVAL
     INTO :NEW.ID
     FROM DUAL;
--  Errors handling
EXCEPTION
   WHEN integrity_error
   THEN
      raise_application_error (errno, errmsg);
END;





/

