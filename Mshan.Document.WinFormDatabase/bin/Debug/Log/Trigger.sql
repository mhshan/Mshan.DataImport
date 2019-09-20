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
TRIGGER "CCENSE".trg_base_bike_app
 before
  insert
 on base_bike_app
referencing new as new old as old
 for each row
declare
   integrity_error   exception;
   errno             integer;
   errmsg            char (200);
begin
   select seq_base_bike_app.nextval
     into :new.id
     from dual;
--  errors handling
exception
   when integrity_error
   then
      raise_application_error (errno, errmsg);
end;
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
TRIGGER "CCENSE".trg_base_bus_busno
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
   SELECT seq_base_bus_busno.NEXTVAL
     INTO :NEW.busno
     FROM DUAL;
--  Errors handling
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
TRIGGER "CCENSE"."TRG_base_Communicationlog"
 BEFORE
  INSERT
 ON base_Communication_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_Communicationlog.NEXTVAL
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
    BEFORE INSERT OR
           UPDATE OF nousedate,
                     cardtypedetailid,
                     cardno,
                     querypwd,
                     cardsn,
                     scardsnr
    ON base_customers
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_base_customers_ver.NEXTVAL INTO :new.ver FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_BASE_CUSTOMER_ID"
    BEFORE INSERT
    ON base_customers
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_base_customers.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

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
TRIGGER "CCENSE"."TRG_base_DatetimeLog"
 BEFORE
  INSERT
 ON base_Datetime_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_Datetimelog.NEXTVAL
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
TRIGGER "CCENSE".trg_base_maincardtype
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
END;

/

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
TRIGGER "CCENSE".trg_base_org_info
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
TRIGGER "CCENSE".trg_base_premiumcompany
 before
  insert
 on base_premiumcompany
referencing new as new old as old
 for each row
declare
   integrity_error   exception;
   errno             integer;
   errmsg            char (200);
begin
   select seq_base_premiumcompany.nextval
     into :new.id
     from dual;
--  errors handling
exception
   when integrity_error
   then
      raise_application_error (errno, errmsg);
end;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_base_psamCardLog"
 BEFORE
  INSERT
 ON base_psamCard_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_psamCardLog.NEXTVAL
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
TRIGGER "CCENSE".trg_base_remakecard
 before
  insert
 on base_remakecard
referencing new as new old as old
 for each row
declare
   integrity_error   exception;
   errno             integer;
   errmsg            char (200);
begin
   select seq_base_remakecard.nextval
     into :new.id
     from dual;
--  errors handling
exception
   when integrity_error
   then
      raise_application_error (errno, errmsg);
end;
/

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
TRIGGER "CCENSE"."TRG_base_SlotCardlog"
 BEFORE
  INSERT
 ON base_SlotCard_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_SlotCardlog.NEXTVAL
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
TRIGGER "CCENSE".trg_base_term_ver
 BEFORE
   INSERT OR UPDATE OF isswitch, primarykey, buscode, customerunitcode, switchkey, poscode, appid, psamcardno
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
TRIGGER "CCENSE".TRG_BASE_TERM_UPGRADE_VER
 BEFORE
  INSERT OR UPDATE of fileid,upgradeendtime,status,applicationver
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
END;/

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
TRIGGER "CCENSE"."TRG_base_TerminalShutdown_log"
 BEFORE
  INSERT
 ON BASE_TERMUSE_LOG
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_base_TerminalShutdown_log.NEXTVAL
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
    BEFORE INSERT
    ON log_operation
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_log_operation.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
trigger trg_log_serviceMonitoring_Id
  BEFORE
  INSERT
 ON Log_ServiceMonitoring
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_ServiceMonitoring_Id.NEXTVAL
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
TRIGGER "CCENSE".trg_log_updatecustomerinfo
    BEFORE INSERT
    ON ccense.log_updatecustomerinfo
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_log_updatecustomerinfo.NEXTVAL INTO :new.id FROM DUAL;
--  errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER trg_monitor_buscompany
 BEFORE
  INSERT
 ON monitor_buscompany
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_monitor_buscompany.NEXTVAL
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
TRIGGER "CCENSE"."TRG_REC_ACTUAL_TRIPS"
 BEFORE
  INSERT
 ON REC_ACTUAL_TRIPS
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_REC_ACTUAL_TRIPS_ID.NEXTVAL
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
TRIGGER "CCENSE".trg_rec_bike_app
 before
  insert
 on rec_bike_app
referencing new as new old as old
 for each row
declare
   integrity_error   exception;
   errno             integer;
   errmsg            char (200);
begin
   select seq_rec_bike_app.nextval
     into :new.id
     from dual;
--  errors handling
exception
   when integrity_error
   then
      raise_application_error (errno, errmsg);
end;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_bike_fileinfo
    BEFORE INSERT
    ON rec_bike_fileinfo
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_bike_fileinfo.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_bike_fileinfoerror
    BEFORE INSERT
    ON rec_bike_fileinfoerror
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_bike_fileinfoerror.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_bike_lastrent
    BEFORE INSERT
    ON rec_bike_lastrent
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_bike_lastrent.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_bike_rent
    BEFORE INSERT
    ON rec_bike_rent
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_bike_rent.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_bkjlk"
 BEFORE
  INSERT
 ON rec_bkjlk
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_bkjlk.NEXTVAL
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
TRIGGER "CCENSE"."TRG_REC_BLLT"
 BEFORE
  INSERT OR UPDATE  OF state
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
TRIGGER "CCENSE"."TRG_REC_BLLT_VER"
 BEFORE
  INSERT OR UPDATE  OF state
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
TRIGGER "CCENSE".seq_rec_city_safelist_id
    BEFORE INSERT
    ON rec_city_safelist
    REFERENCING OLD AS old NEW AS new
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_city_safelist_id.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_CITY_SAFELIST"
    BEFORE INSERT OR UPDATE OF status
    ON rec_city_safelist
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_city_safelist.NEXTVAL INTO :new.ver FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_REC_COIN_INPUT"
 BEFORE
  INSERT
 ON REC_COIN_INPUT
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_REC_COIN_INPUT_ID.NEXTVAL
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
TRIGGER "CCENSE".trg_rec_filetype
    BEFORE INSERT
    ON rec_filetype
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_filetype.NEXTVAL INTO :new.id FROM DUAL;
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
TRIGGER "CCENSE".trg_rec_ftpaddress
 BEFORE
  INSERT
 ON rec_ftpaddress
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_ftpaddress.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_ftpfileinfo
 BEFORE
  INSERT
 ON rec_ftpfileinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_ftpfileinfo.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_REC_FTPFILEINFO_LOG
 BEFORE
  INSERT
 ON REC_FTPFILEINFO_LOG
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_REC_FTPFILEINFO_LOG.NEXTVAL
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
TRIGGER "CCENSE".trg_rec_ftppath
 BEFORE
  INSERT
 ON rec_ftppath
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_ftppath.NEXTVAL INTO :new.id FROM DUAL;
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
TRIGGER "CCENSE"."TRG_REC_PLANNED_TRIPS"
 BEFORE
  INSERT
 ON REC_PLANNED_TRIPS
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_REC_PLANNED_TRIPS_ID.NEXTVAL
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
TRIGGER "CCENSE".trg_rec_takeback_card
 before
  insert
 on rec_takeback_card
referencing new as new old as old
 for each row
declare
   integrity_error   exception;
   errno             integer;
   errmsg            char (200);
begin
   select seq_rec_takeback_card.nextval
     into :new.id
     from dual;
--  errors handling
exception
   when integrity_error
   then
      raise_application_error (errno, errmsg);
end;
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
TRIGGER "CCENSE".trg_rec_thirdrecord_batchno
 BEFORE
  INSERT
 ON rec_thirdrecord_batchno
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_batchno.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_fileinfo
 BEFORE
  INSERT
 ON rec_thirdrecord_fileinfo
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_fileinfo.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_filetype
 BEFORE
  INSERT
 ON rec_thirdrecord_filetype
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_filetype.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_log
 BEFORE
  INSERT
 ON rec_thirdrecord_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT seq_rec_thirdrecord_log.NEXTVAL
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
TRIGGER "CCENSE".trg_rec_thirdrecord_repeat
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
END;

/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_sucess
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
END;

/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_unioresult
    BEFORE INSERT OR UPDATE
    ON rec_thirdrecord_union_result
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_unioresult.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_xmlcresult
    BEFORE INSERT OR UPDATE
    ON rec_thirdrecord_xmlc_result
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_xmlcresult.NEXTVAL INTO :NEW.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_rec_thirdrecord_xmlc_aa
 BEFORE
  INSERT OR UPDATE
 ON rec_thirdrecord_xmlc_result_aa
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_rec_thirdrecord_xmlc_aa.NEXTVAL INTO :NEW.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

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
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE".TRG_ST_COIN_ACC
    BEFORE INSERT
    ON ST_COIN_ACC
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT SEQ_ST_COIN_ACC.NEXTVAL INTO :new.id FROM DUAL;
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;
/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_st_invoice
    BEFORE INSERT
    ON st_invoice
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_st_invoice.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

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
    BEFORE INSERT
    ON st_payment_cash_day
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_st_payment_cash_day.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE"."TRG_ST_PAYMENT_CONSUM_DAY"
    BEFORE INSERT
    ON st_payment_consum_day
    REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
DECLARE
    integrity_error   EXCEPTION;
    errno             INTEGER;
    errmsg            CHAR (200);
BEGIN
    SELECT seq_st_payment_consum_day.NEXTVAL INTO :new.id FROM DUAL;
--  Errors handling
EXCEPTION
    WHEN integrity_error
    THEN
        raise_application_error (errno, errmsg);
END;/

CREATE OR REPLACE 
TRIGGER "CCENSE".trg_st_settlement_acc
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
TRIGGER "CCENSE"."TRG_ST_TRIPS"
 BEFORE
  INSERT
 ON ST_TRIPS
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   integrity_error   EXCEPTION;
   errno             INTEGER;
   errmsg            CHAR (200);
BEGIN
   SELECT SEQ_ST_TRIPS_ID.NEXTVAL
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

