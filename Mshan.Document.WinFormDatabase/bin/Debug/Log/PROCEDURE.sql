
  CREATE OR REPLACE PROCEDURE "CCENSE"."EXECUTE_IMMEDIATE" ( p_sql_text VARCHAR2 ) IS

   COMPILATION_ERROR EXCEPTION;
   PRAGMA EXCEPTION_INIT(COMPILATION_ERROR,-24344);

   l_cursor INTEGER DEFAULT 0;
   rc       INTEGER DEFAULT 0;
   stmt     VARCHAR2(1000);

BEGIN

   l_cursor := DBMS_SQL.OPEN_CURSOR;
   DBMS_SQL.PARSE(l_cursor, p_sql_text, DBMS_SQL.NATIVE);
   rc := DBMS_SQL.EXECUTE(l_cursor);
   DBMS_SQL.CLOSE_CURSOR(l_cursor);
--
-- Ignore compilation errors because these sometimes happen due to
-- dependencies between views AND procedures
--
   EXCEPTION WHEN COMPILATION_ERROR THEN DBMS_SQL.CLOSE_CURSOR(l_cursor);
       WHEN OTHERS THEN
          BEGIN
              DBMS_SQL.CLOSE_CURSOR(l_cursor);
              raise_application_error(-20101,sqlerrm || '  when executing ''' || p_sql_text || '''   ');
          END;
END;


 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."GET_BUS_POSCODE" (
   prmbusno          IN       NUMBER,                               --车辆编号
   prmcustunitcode   IN       VARCHAR2,                             --客户代码
   inout_poscode     IN OUT   NUMBER,                                 --车辆ID
   out_result        OUT      NUMBER,
   out_msg           OUT      VARCHAR2
)
IS
    /*
   -------------------------------------------------------------------------------
   --存储过程：get_bus_poscode
   --作　　者：周晓娜
   --时　　间：2013-03-16
   --说　　明：如果同一辆车绑定多个终端，获取车辆绑定的其中一个终端编号信息
   --输入参数：
   --输出参数：
   --返回值定义：
   --   100：成功
   -----------------------------------------------------------------------------
   */
   i_count         INTEGER;
   n_isflag        NUMBER;                             --车辆是否绑定多台终端
   v_poscodelist   VARCHAR2 (1000);
--车辆对应多个终端时的设备编号组合
   n_poscode       NUMBER;
BEGIN
   out_result := -1001;
   out_msg := '获取车辆绑定的终端信息失败！';
   i_count := 0;

   --因为验证终端信息时已经校验了各种信息的合法性，获取车辆信息里面不在进行重新校验

   --只有车辆ID为0时，才查找车辆ID信息
   IF (prmbusno = 0)
   THEN
      out_result := -1002;
      out_msg := '车辆信息不合法！';
      RETURN;
   END IF;

   --检查车辆是否选择了终端
   SELECT COUNT (*)
     INTO i_count
     FROM base_bus a, base_term b
    WHERE (   a.poscode = b.poscode
           OR (   INSTR (a.poscodelist, '|' || b.poscode || '', -1, 1) != 0
               OR INSTR (a.poscodelist, '' || b.poscode || '|', -1, 1) != 0
              )
          )
      AND a.customerunitcode = b.customerunitcode
      AND a.busno = prmbusno
      AND a.customerunitcode = prmcustunitcode;

   IF i_count > 0
   THEN
      --检查车辆是否选择了终端
      SELECT a.isflag
        INTO n_isflag
        FROM base_bus a
       WHERE a.busno = prmbusno AND a.customerunitcode = prmcustunitcode;

      IF n_isflag = 0          --如果车辆和终端是一一对应关系，直接取poscode值
      THEN
         --根据车辆ID，获取到终端信息
         SELECT a.poscode
           INTO n_poscode
           FROM base_bus a, base_term b
          WHERE a.poscode = b.poscode
            AND a.customerunitcode = b.customerunitcode
            AND a.busno = prmbusno
            AND a.customerunitcode = prmcustunitcode;

         inout_poscode := n_poscode;
      ELSE             --如果车辆和终端是一对多关系，取其中一个poscode形成记录
         --获取该车辆对应的终端编号字符串
         SELECT a.poscodelist
           INTO v_poscodelist
           FROM base_bus a
          WHERE a.busno = prmbusno AND a.customerunitcode = prmcustunitcode;

         --获取多个终端编号中的第一个编号
         SELECT COLUMN_VALUE
           INTO n_poscode
           FROM (SELECT *
                   FROM TABLE
                           (SPLIT
                               ((SELECT REPLACE
                                            ((SELECT b.poscodelist
                                                FROM base_bus b
                                               WHERE b.isflag = 1
                                                 AND b.customerunitcode =
                                                               prmcustunitcode
                                                 AND b.poscodelist =
                                                           ''
                                                        || v_poscodelist
                                                        || ''),
                                             '|',
                                             ','
                                            )
                                   FROM DUAL),
                                ','
                               )
                           ))
          WHERE ROWNUM = 1;

         --目前设备唯一编号和PSAM卡号是同一个值，直接取poscode值赋值给PSAM卡号
         inout_poscode := n_poscode;
      END IF;
   END IF;

   out_result := 100;
   out_msg := '获取车辆绑定的终端编号成功！';
   RETURN;
EXCEPTION
   WHEN OTHERS
   THEN
      out_result := -1;
      out_msg := out_msg || '，异常信息为：' || SQLERRM;
      RETURN;
END;
-- Procedure


 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_ELECCONSUM_VALIDATETERM" (prmposcode        IN     VARCHAR2, --终端运行唯一编号
                                        prmsamcardno      IN     VARCHAR2, --PASM卡卡号
                                        prmcustunitcode   IN     VARCHAR2, --客户代码
                                        inout_busid       IN OUT NUMBER, --车辆ID
                                        prmopdt           IN     VARCHAR2,
                                        out_result           OUT NUMBER,
                                        out_msg              OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：PROC_VALIDATETERM
    --作　　者：朱鹏飞
    --时　　间：2009-05-30
    --说　　明：验证终端信息是否正确
    --输入参数：
    --输出参数：
    --返回值定义：
    --   100：成功
    --   -1002:终端在系统中不存在
    --   -1003:PASM卡号不存在
    --   -1004:终端配置信息异常
    --------------------------------------------------------------------------
    */
    i_count   INTEGER;
BEGIN
    out_result := -1001;
    out_msg := '判断终端';

    --先验证客户信息是否合法
    SELECT COUNT (a.id)
      INTO i_count
      FROM base_legal_person a
     WHERE a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        out_result := -1001;
        out_msg :=
               '客户法人信息不合法！CUSTOMERUNITCODE：'
            || TO_CHAR (prmcustunitcode);
        RETURN;
    END IF;

    -----根据终端唯一编号，查找终端是否存在--------------------
    SELECT COUNT (*)
      INTO i_count
      FROM base_term a
     WHERE a.poscode = prmposcode AND a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        out_result := -1002;
        out_msg := '终端在系统中不存在！POSCODE：' || TO_CHAR (prmposcode);
        RETURN;
    END IF;

    SELECT COUNT (*)
      INTO i_count
      FROM base_samcard a
     WHERE samcardno = prmsamcardno AND a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        out_result := -1003;
        out_msg := 'PSAM号不存在！SAMCARDNO：' || TO_CHAR (prmsamcardno);
        RETURN;
    END IF;

    SELECT COUNT (*)
      INTO i_count
      FROM base_samcard a
     WHERE     a.samcardno = prmsamcardno
           AND a.state = 10
           AND a.customerunitcode = prmcustunitcode;

    IF i_count > 0
    THEN
        out_msg := '此PSAM卡已挂失';

        SELECT COUNT (*)
          INTO i_count
          FROM base_samcard a
         WHERE     a.samcardno = prmsamcardno
               AND a.state = 10
               AND TO_DATE (prmopdt, 'yyyy-mm-dd hh24:mi:ss') < a.lossdate
               AND a.customerunitcode = prmcustunitcode;

        IF i_count <= 0
        THEN
            --记录上传时间比挂失时间大
            out_result := -1005;
            out_msg := 'PSAM卡挂失后消费';
            RETURN;
        END IF;
    END IF;

    out_result := 100;
    out_msg := '获取终端信息成功！';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        out_result := -1004;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
        RETURN;
END;
 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_GETCARD_INFO" (prmcustunitcode      IN     VARCHAR2,      --客户代码
                             prmmaincardtype      IN     NUMBER,        --主卡类型
                             prmownercitycode     IN OUT VARCHAR2, ----所属地城市代码
                             prmoperatorpoint     IN OUT VARCHAR2,    --营运单位编号
                             prmislocalcard          OUT NUMBER, --是否是本地卡 1本地卡  0异地卡
                             prmislocaloperator      OUT NUMBER, --是否本地消费 1本地消费 0异地消费
                             out_result              OUT NUMBER,
                             out_msg                 OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：proc_getcard_info
    --说　　明：判断当前卡片是不是本地卡，是不是本地消费
    -----------------------------------------------------------------------------
    */

    v_owner      VARCHAR (20);                                       --发卡方机构代码
    v_operator   VARCHAR (20);                                       --收单方机构代码
BEGIN
    ------------------------互联互通发卡地、交易地判断-------------------------------------
    prmownercitycode := TRIM (prmownercitycode);
    prmoperatorpoint := TRIM (prmoperatorpoint);

    IF (prmmaincardtype <> 8)
    THEN
        --非互联互通卡
        SELECT NVL (TRIM (MAX (ownercitycode)), '0'),
               NVL (TRIM (MAX (operatorcode)), '0')
          INTO prmownercitycode, prmoperatorpoint
          FROM base_legal_person a
         WHERE a.customerunitcode = prmcustunitcode;
    END IF;

    out_result := -1004;
    out_msg := '取本地发卡、收单方机构代码失败！';

    --取本地发卡、收单方机构代码
    SELECT NVL (TRIM (MAX (ownercitycode)), '0'),
           NVL (TRIM (MAX (operatorcode)), '0')
      INTO v_owner, v_operator
      FROM base_legal_person a
     WHERE a.customerunitcode = prmcustunitcode;

    IF LENGTH (v_owner) != 8 OR LENGTH (v_operator) != 8
    THEN
        out_result := 101;
        out_msg :=
               '发卡机构代码或收单机构代码配置错误，请重新配置！当前设置的发卡机构代码：'
            || v_owner
            || '当前设置的收单机构代码：'
            || v_operator;
        RETURN;
    END IF;

    ------------------------------------发卡地收单方判断----------------------------------------
    --发卡地判断
    IF (prmownercitycode = v_owner)
    THEN
        prmislocalcard := 1;                                        --本地卡(自发卡)
    ELSE
        prmislocalcard := 0;                                             --异地卡
    END IF;

    --收单方判断
    IF (prmoperatorpoint = v_operator)
    THEN
        prmislocaloperator := 1;
    ELSE
        -- v_operator         := prmoperatorpoint;
        prmislocaloperator := 0;
    END IF;

    out_result := 100;
    out_msg := '获取账号信息成功';
    RETURN;
END;
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_GET_ACCCODE" (
    prmmaincardtype   IN     NUMBER,                                --主卡类型
    inout_acccode     IN OUT NUMBER,                                --科目代码
    inout_accdscrp    IN OUT VARCHAR2,                                --科目描述
    out_result           OUT NUMBER,
    out_msg              OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：proc_get_acccode
    --作　　者：闫丽平
    --时　　间：2018-03-23
    --说　　明：获取科目及科目描述
    -----------------------------------------------------------------------------
    */
BEGIN
    out_result := -1001;
    out_msg := '获取科目失败！';

    IF (prmmaincardtype = 9)                                         --银联ODA
    THEN
        inout_acccode := 208;
    ELSIF (prmmaincardtype = 10)                                    --银联双免
    THEN
        inout_acccode := 209;
    ELSIF (prmmaincardtype = 11)                                  --银联二维码
    THEN
        inout_acccode := 210;
    ELSIF (prmmaincardtype = 22)                              --支付宝公交付款
    THEN
        inout_acccode := 207;
    ELSIF (prmmaincardtype = 23)                        --支付宝虚拟电子公交卡
    THEN
        inout_acccode := 225;
    ELSIF (prmmaincardtype = 24)                                  --腾讯二维码
    THEN
        inout_acccode := 226;
    ELSIF (prmmaincardtype = 25)           --第三方二维码非NFC或公司自建二维码
    THEN
        inout_acccode := 227;
    ELSE                                                            --未知科目
        inout_acccode := 230;
    END IF;

    SELECT NVL (MAX (a.accdscrp), '未知')
      INTO inout_accdscrp
      FROM base_acc_type a
     WHERE a.acccode = inout_acccode;

    out_result := 100;
    out_msg := '获取科目成功！';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        out_result := -1;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
        RETURN;
END;
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_GET_BUSNO" (prmposcode        IN     VARCHAR2, --终端运行唯一编号
                          prmcustunitcode   IN     VARCHAR2, --客户代码
                          prmopdt           IN     VARCHAR2, --记录交易时间
                          inout_busid       IN OUT NUMBER, --车辆ID
                          out_result           OUT NUMBER,
                          out_msg              OUT VARCHAR2)
IS
    /*
   -------------------------------------------------------------------------------
   --存储过程：PROC_GET_BUSNO
   --作　　者：周晓娜
   --时　　间：2013-03-16
   --说　　明：根据设备唯一编号、客户代码、记录交易时间等条件获取对应的车辆编号
               注释：车辆编号是根据设备唯一编号获取得到的，以上层平台为准，但是车辆会存在调整终端的问题
               为保证记录形成的车辆信息正确性，现在根据终端和交易时间共同确定车辆编号信息
   --输入参数：
   --输出参数：
   --返回值定义：
   --   100：成功
   --   -1002:终端在系统中不存在
   --   -1004:终端配置信息异常
   -----------------------------------------------------------------------------
   */
    i_count      INTEGER;
    d_opdt       DATE; --交易记录时间
    n_timespan   NUMBER; --时间间隔差
    d_maxtime    DATE; --变更关系表中最晚调整时间
    d_mintime    DATE; --变更关系表中最早调整时间
    c_busno      NUMBER; --临时变量
BEGIN
    out_result := -1001;
    out_msg := '获取车辆信息失败！';
    d_opdt := TO_DATE (prmopdt, 'yyyy-mm-dd hh24:mi:ss');
    n_timespan := 0;

    --只有车辆ID为0时，才查找车辆ID信息
    IF (inout_busid != 0)
    THEN
        out_result := 100;
        out_msg := '获取车辆信息成功！';
        RETURN;
    END IF;

    out_result := -1004;
    out_msg := '获取车辆ID信息';

    --根据终端唯一编号，获取车辆ID，只查询在使用中的车辆，如果获取不到，则为0
    SELECT b.busno
      INTO inout_busid
      FROM base_term a, base_bus b
     WHERE     (   a.poscode = b.poscode
                OR b.poscodelist LIKE '%' || prmposcode || '%')
           AND a.customerunitcode = b.customerunitcode
           AND b.isuse = 0
           AND a.poscode = prmposcode
           AND (   b.poscode = prmposcode
                OR b.poscodelist LIKE '%' || prmposcode || '%')
           AND a.customerunitcode = prmcustunitcode;

    out_result := 100;
    out_msg := '获取车辆信息成功！';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        out_result := -1;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
        RETURN;
END; -- Procedure
 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_GET_CUSTOMER" (prmcardno         IN     NUMBER, --卡号
                             prmcardsn         IN OUT NUMBER, --持卡序号
                             prmcustomerid     IN OUT NUMBER,
                             prmopdt           IN     VARCHAR2, --操作时间yyyy-mm-dd hh24:mi:ss
                             prmcustunitcode   IN     VARCHAR2, --客户代码
                             prmopcount        IN     NUMBER, --消费计数
                             prmwallettype     IN     NUMBER, --钱包类型
                             inout_badtype     IN OUT NUMBER, --坏账类型
                             prmmaincardtype   IN     NUMBER,
                             prmiscurcard         OUT NUMBER, --1当前卡  0非当前卡
                             prmisnewconsume      OUT NUMBER, --1新消费    0老消费
                             out_result           OUT NUMBER,
                             out_msg              OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：proc_get_customer
    --说　　明：从发卡记录表中获取持卡序号及customerid信息
                确定当前消费记录的状态及卡片新老卡
    --特别处理情况：卡面号和物理卡号保持一致的情况，重复使用卡片进行发卡操作这已特殊需求做处理
    -----------------------------------------------------------------------------
    */

    i_count             INTEGER;
    i_flag              NUMBER;
    i_customerid        NUMBER; --账号
    i_cardsn            NUMBER; -- 卡序号
    n_dbeleopcount      NUMBER; --数据库中电子钱包消费计数
    n_dbecopcount       NUMBER; --数据库中电子现金消费计数
    n_dbmonopcount      NUMBER; --数据库中月票消费计数
    n_dbnumberopcount   NUMBER; --数据库中次卡消费计数
    n_dbopcount         NUMBER;
BEGIN
    i_count := 0;
    prmiscurcard := 0;
    prmisnewconsume := 0;
    n_dbeleopcount := 0;
    n_dbecopcount := 0;
    n_dbmonopcount := 0;
    n_dbnumberopcount := 0;
    n_dbopcount := 0;

    ---------------------第三方系统卡、交通部秘钥卡持卡充号customerid信息需从库中查询------------------

    --查看发卡记录表中是否存在发卡记录信息
    SELECT NVL (COUNT (*), 0)
      INTO i_count
      FROM rec_card_make_acc
     WHERE cardno = prmcardno AND customerunitcode = prmcustunitcode;

    IF (i_count = 0)
    THEN
        --没有发卡记录形成黑名单
        out_msg := '没有发卡记录形成黑名单';
        pkg_rec_bllt.proc_insertbllt (prmcardno,
                                      3,
                                      prmcardno,
                                      prmcustunitcode,
                                      out_msg,
                                      out_result);
    END IF;

    -- 7 兼容第三方系统卡   8 交通部秘钥卡 0 自建秘钥卡
    IF (prmmaincardtype <> 0)
    THEN
        i_customerid := 0;
        i_cardsn := 1;
        prmcustomerid := 0;
        prmcardsn := 1;

        IF (i_count = 1)
        THEN
            SELECT a.cardsn, a.customerid
              INTO i_cardsn, i_customerid
              FROM rec_card_make_acc a
             WHERE     a.cardno = prmcardno
                   AND a.customerunitcode = prmcustunitcode;
        END IF;

        IF (i_count = 0)
        THEN
            i_customerid := 0;
            i_cardsn := 1;
        END IF;

        IF i_count > 1
        THEN
            i_flag := 0;

            DECLARE
                CURSOR cur_custinfo
                IS
                      SELECT opdt, customerid, cardsn
                        FROM rec_card_make_acc
                       WHERE     cardno = prmcardno
                             AND customerunitcode = prmcustunitcode
                    ORDER BY opdt DESC;

                row_custinfo   cur_custinfo%ROWTYPE;
            BEGIN
                OPEN cur_custinfo;

                LOOP
                    FETCH cur_custinfo INTO row_custinfo;

                    EXIT WHEN cur_custinfo%NOTFOUND;

                    --记录最新的cardsn和customerid信息
                    IF i_flag = 0
                    THEN
                        i_cardsn := row_custinfo.cardsn;
                        i_customerid := row_custinfo.customerid;
                        i_flag := 1;
                    END IF;

                    --根据消费时间查询发卡记录表中距离消费时间最近的持卡序号和账号信息
                    IF TO_DATE (prmopdt, 'YYYY-MM-DD HH24:MI:SS') >
                           row_custinfo.opdt
                    THEN
                        i_cardsn := row_custinfo.cardsn;
                        i_customerid := row_custinfo.customerid;
                        EXIT;
                    END IF;
                END LOOP;

                CLOSE cur_custinfo;
            END;
        END IF;

        prmcustomerid := i_customerid;
        prmcardsn := i_cardsn;
    END IF;

    ---------------------------------新老卡判断----------------------------------------
    i_count := 0;

    SELECT COUNT (*)
      INTO i_count
      FROM base_customers a
     WHERE     customerid = prmcustomerid
           AND a.cardno = prmcardno
           AND a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        prmiscurcard := 0;
        prmisnewconsume := 0; --老卡消费
        out_result := 100;
        out_msg := '获取账号信息成功';
        RETURN;
    END IF;

    SELECT a.electropcount,
           a.ecopcount,
           a.monopcount,
           a.numberopcount
      INTO n_dbeleopcount,
           n_dbecopcount,
           n_dbmonopcount,
           n_dbnumberopcount
      FROM base_customers a
     WHERE     customerid = prmcustomerid
           AND a.cardno = prmcardno
           AND a.customerunitcode = prmcustunitcode;

    IF (prmwallettype = 1) --电子钱包
    THEN
        n_dbopcount := n_dbeleopcount;
    ELSIF (prmwallettype = 2) --月票
    THEN
        n_dbopcount := n_dbmonopcount;
    ELSIF (prmwallettype = 3) --次卡
    THEN
        n_dbopcount := n_dbnumberopcount;
    ELSIF (prmwallettype = 4) --电子现金
    THEN
        n_dbopcount := n_dbecopcount;
    END IF;

    prmiscurcard := 1;

    IF prmopcount > n_dbopcount
    THEN
        prmisnewconsume := 1; --最新消费记录
    ELSE
        prmisnewconsume := 0; --老消费记录
    END IF;

    out_result := 100;
    out_msg := '获取账号信息成功';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        inout_badtype := 29; --取账户信息异常
        out_result := -1;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
END;

 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_HANDDEAL_ELEUNSETCASH" (prmcardno        IN NUMBER, --卡号
                                                       prmcardsn        IN NUMBER, --持卡序号
                                                       prmcustomerid    IN NUMBER,
                                                       prmmaincardtype  IN NUMBER, --主卡类型
                                                       prmopcount       IN NUMBER, --消费操作计数
                                                       prmisnullopcount IN NUMBER, --消费操作计数是否赋值 0已赋值 1未赋值
                                                       prmopdt          IN VARCHAR2, --操作时间
                                                       prmoddfare       IN NUMBER, --消费后余额，根据钱包类型判断钱包
                                                       prmopfare        IN NUMBER, --消费金额，根据钱包类型判断钱包
                                                       prmcustunitcode  IN VARCHAR2, --客户代码
                                                       out_result       OUT NUMBER,
                                                       out_msg          OUT VARCHAR2) IS
  /*
  -------------------------------------------------------------------------------
  --存储过程：proc_handdeal_eleunsetcash
  --作　　者：胡凡凡
  --时　　间：2017-03-22
  --说　　明：电子钱包充值未决处理
  --输入参数：
  --输出参数：
  --返回值定义：
  --   100：成功
  --------------------------------------------------------------------------
  */

  n_unset_planid  NUMBER;
  i_unset_cardsn  INTEGER;
  n_unset_opcount NUMBER;
  n_unset_oddfare NUMBER(10, 2);
  n_unset_opfare  NUMBER(10, 2);
  n_unset_acccode NUMBER;
  n_unset_opdt    DATE;
  n_unset_groupid NUMBER;
  n_unset_dir     NUMBER;
BEGIN
  out_msg    := '存在未决记录，调用校验未决过程';
  out_result := -2003;

  --获取未决记录信息，过程外已经判断了只有一笔未决
  SELECT a.planid,
         a.acccode,
         a.cardsn,
         a.electropcount,
         a.electroddfarepre,
         a.electropfare,
         a.opdt
    INTO n_unset_planid,
         n_unset_acccode,
         i_unset_cardsn,
         n_unset_opcount,
         n_unset_oddfare,
         n_unset_opfare,
         n_unset_opdt
    FROM rec_electtron_cash_plan a
   WHERE a.customerid = prmcustomerid
     AND a.cardsn = prmcardsn
     AND a.opdt < SYSDATE - (5 / 24 / 60)
     AND a.cardno = prmcardno
     AND a.customerunitcode = prmcustunitcode;

  SELECT a.groupid, a.dir
    INTO n_unset_groupid, n_unset_dir
    FROM base_acc_type a
   WHERE a.acccode = n_unset_acccode;

  --充值类
  IF n_unset_groupid = 1 AND n_unset_dir = 1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 AND prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare THEN
        out_result := -2004;
        out_msg    := '老卡消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      END IF;
    ELSE
      --写卡成功提交
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare) THEN
        out_result := -2004;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      ELSIF (prmopcount > n_unset_opcount) AND
            (prmoddfare > n_unset_oddfare) THEN
        out_result := -2005;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      END IF;
    
      --写卡失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2006;
        out_msg    := '消费记录校验未决写卡失败';
        pkg_handdeal_unsetcash.module_electrcash_rollback(n_unset_planid,
                                                          prmcustomerid,
                                                          '88888',
                                                          '写卡失败',
                                                          prmcustunitcode,
                                                          out_result,
                                                          out_msg);
      END IF;
    END IF;
  END IF;

  --充值红冲类
  IF n_unset_groupid = 1 AND n_unset_dir = -1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 AND prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare THEN
        out_result := -2007;
        out_msg    := '老卡消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      END IF;
    ELSE
      --红冲成功提交
      IF (prmopcount = n_unset_opcount + 2) AND
         (prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2007;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      ELSIF (prmopcount > n_unset_opcount + 2) AND
            (prmoddfare + prmopfare > n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2008;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_electrcash_commit(n_unset_planid,
                                                        prmcustomerid,
                                                        '66666',
                                                        prmcustunitcode,
                                                        out_result,
                                                        out_msg);
      END IF;
    
      --充值红冲失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2009;
        out_msg    := '消费记录校验充值红冲未决写卡失败';
        pkg_handdeal_unsetcash.module_electrcash_rollback(n_unset_planid,
                                                          prmcustomerid,
                                                          '88888',
                                                          '充值红冲失败',
                                                          prmcustunitcode,
                                                          out_result,
                                                          out_msg);
      END IF;
    END IF;
  END IF;

  RETURN;
END;

 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_HANDDEAL_MONUNSETCASH" (prmcardno        IN NUMBER, --卡号
                                                       prmcardsn        IN NUMBER, --持卡序号
                                                       prmcustomerid    IN NUMBER,
                                                       prmmaincardtype  in number, --主卡类型
                                                       prmopcount       IN NUMBER, --消费操作计数
                                                       prmisnullopcount in number, --消费操作计数是否赋值 0已赋值 1未赋值
                                                       prmopdt          IN VARCHAR2, --操作时间
                                                       prmoddfare       IN  NUMBER, --消费后余额，根据钱包类型判断钱包
                                                       prmopfare        IN  NUMBER, --消费金额，根据钱包类型判断钱包
                                                       prmcustunitcode  IN VARCHAR2, --客户代码
                                                       out_result       OUT NUMBER,
                                                       out_msg          OUT VARCHAR2) IS
  /*
  -------------------------------------------------------------------------------
  --存储过程：proc_handdeal_monunsetcash
  --作　　者：胡凡凡
  --时　　间：2017-03-22
  --说　　明：月票钱包充值未决处理
  --输入参数：
  --输出参数：
  --返回值定义：
  --   100：成功
  --------------------------------------------------------------------------
  */
  n_unset_planid  NUMBER;
  i_unset_cardsn  INTEGER;
  n_unset_opcount NUMBER;
  n_unset_oddfare NUMBER(10, 2);
  n_unset_opfare  NUMBER(10, 2);
  n_unset_acccode NUMBER;
  n_unset_opdt    DATE;
  n_unset_groupid NUMBER;
  n_unset_dir     NUMBER;
BEGIN
  out_msg    := '存在未决记录，调用校验未决过程';
  out_result := -3001;

  --获取未决记录信息，过程外已经判断了只有一笔未决
  SELECT a.planid,
         a.acccode,
         a.cardsn,
         a.viceopcount,
         a.viceoddfarepre,
         a.viceopfare,
         a.opdt
    INTO n_unset_planid,
         n_unset_acccode,
         i_unset_cardsn,
         n_unset_opcount,
         n_unset_oddfare,
         n_unset_opfare,
         n_unset_opdt
    FROM rec_monticket_cash_plan a
   WHERE a.customerid = prmcustomerid
     AND a.cardsn = prmcardsn
     AND a.opdt < SYSDATE - (5 / 24 / 60)
     AND a.cardno = prmcardno
     AND a.customerunitcode = prmcustunitcode;

  SELECT a.groupid, a.dir
    INTO n_unset_groupid, n_unset_dir
    FROM base_acc_type a
   WHERE a.acccode = n_unset_acccode;

  --充值类
  IF n_unset_groupid = 1 AND n_unset_dir = 1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 and prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare THEN
        out_result := -2004;
        out_msg    := '老卡消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_montrcash_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      END IF;
    else
      --写卡成功提交
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare) THEN
        out_result := -2004;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_montrcash_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      ELSIF (prmopcount > n_unset_opcount) AND
            (prmoddfare > n_unset_oddfare) THEN
        out_result := -2004;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_montrcash_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      END IF;
    
      --写卡失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2005;
        out_msg    := '消费记录校验未决写卡失败';
        pkg_handdeal_unsetcash.module_montrcash_rollback(n_unset_planid,
                                                         prmcustomerid,
                                                         '88888',
                                                         '写卡失败',
                                                         prmcustunitcode,
                                                         out_result,
                                                         out_msg);
      END IF;
    end if;
  END IF;

  --充值红冲类
  IF n_unset_groupid = 1 AND n_unset_dir = -1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 and prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare THEN
        out_result := -2006;
        out_msg    := '老卡消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_monticket_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      END IF;
    else
      --红冲成功提交
      IF (prmopcount = n_unset_opcount + 2) AND
         (prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2006;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_monticket_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      ELSIF (prmopcount > n_unset_opcount + 2) AND
            (prmoddfare + prmopfare > n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2006;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_monticket_commit(n_unset_planid,
                                                       prmcustomerid,
                                                       '66666',
                                                       prmcustunitcode,
                                                       out_result,
                                                       out_msg);
      END IF;
    
      --充值红冲失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2007;
        out_msg    := '消费记录校验充值红冲未决写卡失败';
        pkg_handdeal_unsetcash.module_montrcash_rollback(n_unset_planid,
                                                         prmcustomerid,
                                                         '88888',
                                                         '充值红冲失败',
                                                         prmcustunitcode,
                                                         out_result,
                                                         out_msg);
      END IF;
    end if;
  END IF;

  RETURN;

END;

 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_HANDDEAL_VICEUNSETCASH" (prmcardno        IN NUMBER, --卡号
                                                        prmcardsn        IN NUMBER, --持卡序号
                                                        prmcustomerid    IN NUMBER,
                                                        prmmaincardtype  in number, --主卡类型
                                                        prmopcount       IN NUMBER, --消费操作计数
                                                        prmisnullopcount in number, --消费操作计数是否赋值 0已赋值 1未赋值
                                                        prmopdt          IN VARCHAR2, --操作时间
                                                        prmoddfare       IN  NUMBER, --消费后余额，根据钱包类型判断钱包
                                                        prmopfare        IN  NUMBER, --消费金额，根据钱包类型判断钱包
                                                        prmcustunitcode  IN VARCHAR2, --客户代码
                                                        out_result       OUT NUMBER,
                                                        out_msg          OUT VARCHAR2) IS
  /*
  -------------------------------------------------------------------------------
  --存储过程：proc_handdeal_viceunsetcash
  --作　　者：胡凡凡
  --时　　间：2017-03-22
  --说　　明：次卡钱包充值未决处理
  --输入参数：
  --输出参数：
  --返回值定义：
  --   100：成功
  --------------------------------------------------------------------------
  */
  n_unset_planid  NUMBER;
  i_unset_cardsn  INTEGER;
  n_unset_opcount NUMBER;
  n_unset_oddfare NUMBER(10, 2);
  n_unset_opfare  NUMBER(10, 2);
  n_unset_acccode NUMBER;
  n_unset_opdt    DATE;
  n_unset_groupid NUMBER;
  n_unset_dir     NUMBER;
BEGIN
  out_msg    := '存在未决记录，调用校验未决过程';
  out_result := -2003;

  --获取未决记录信息，过程外已经判断了只有一笔未决
  SELECT a.planid,
         a.acccode,
         a.cardsn,
         a.viceopcount,
         a.viceoddfarepre,
         a.viceopfare,
         a.opdt
    INTO n_unset_planid,
         n_unset_acccode,
         i_unset_cardsn,
         n_unset_opcount,
         n_unset_oddfare,
         n_unset_opfare,
         n_unset_opdt
    FROM rec_vicecard_cash_plan a
   WHERE a.customerid = prmcustomerid
     AND a.cardsn = prmcardsn
     AND a.opdt < SYSDATE - (5 / 24 / 60)
     AND a.cardno = prmcardno
     AND a.customerunitcode = prmcustunitcode;

  SELECT a.groupid, a.dir
    INTO n_unset_groupid, n_unset_dir
    FROM base_acc_type a
   WHERE a.acccode = n_unset_acccode;

  --充值类
  IF n_unset_groupid = 1 AND n_unset_dir = 1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 and prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare THEN
        out_result := -2004;
        out_msg    := '老卡消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_vicecardcash_commit(n_unset_planid,
                                                          prmcustomerid,
                                                          '66666',
                                                          prmcustunitcode,
                                                          out_result,
                                                          out_msg);
      END IF;
    else
      --写卡成功提交
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare + n_unset_opfare) THEN
        out_result := -2004;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_vicecardcash_commit(n_unset_planid,
                                                          prmcustomerid,
                                                          '66666',
                                                          prmcustunitcode,
                                                          out_result,
                                                          out_msg);
      ELSIF (prmopcount > n_unset_opcount) AND
            (prmoddfare > n_unset_oddfare) THEN
        out_result := -2004;
        out_msg    := '消费记录校验未决写卡成功';
        pkg_handdeal_unsetcash.module_vicecardcash_commit(n_unset_planid,
                                                          prmcustomerid,
                                                          '66666',
                                                          prmcustunitcode,
                                                          out_result,
                                                          out_msg);
      END IF;
    
      --写卡失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2005;
        out_msg    := '消费记录校验未决写卡失败';
        pkg_handdeal_unsetcash.module_vicecardcash_rollback(n_unset_planid,
                                                            prmcustomerid,
                                                            '88888',
                                                            '写卡失败',
                                                            prmcustunitcode,
                                                            out_result,
                                                            out_msg);
      END IF;
    
    end if;
  END IF;

  --充值红冲类
  IF n_unset_groupid = 1 AND n_unset_dir = -1 THEN
    --prmmaincardtype=7 兼容第三方系统卡充值
    --老卡并且opcount终端没有赋值的时候根据时间及金额判断充值未决，其他则根据opcount和金额判断充值未决
    IF prmmaincardtype = 7 and prmisnullopcount = 1 THEN
      IF TO_DATE(prmopdt, 'yyyy-mm-dd hh24:mi:ss') > n_unset_opdt AND
         prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare THEN
        out_result := -2006;
        out_msg    := '老卡消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_vicecard_commit(n_unset_planid,
                                                      prmcustomerid,
                                                      '66666',
                                                      prmcustunitcode,
                                                      out_result,
                                                      out_msg);
      END IF;
    else
      --红冲成功提交
      IF (prmopcount = n_unset_opcount + 2) AND
         (prmoddfare + prmopfare = n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2006;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_vicecard_commit(n_unset_planid,
                                                      prmcustomerid,
                                                      '66666',
                                                      prmcustunitcode,
                                                      out_result,
                                                      out_msg);
      ELSIF (prmopcount > n_unset_opcount + 2) AND
            (prmoddfare + prmopfare > n_unset_oddfare - n_unset_opfare) THEN
        out_result := -2006;
        out_msg    := '消费记录校验充值红冲未决写卡成功';
        pkg_handdeal_unsetcash.repeal_vicecard_commit(n_unset_planid,
                                                      prmcustomerid,
                                                      '66666',
                                                      prmcustunitcode,
                                                      out_result,
                                                      out_msg);
      END IF;
    
      --充值红冲失败回滚
      IF (prmopcount = n_unset_opcount + 1) AND
         (prmoddfare + prmopfare = n_unset_oddfare) THEN
        out_result := -2007;
        out_msg    := '消费记录校验充值红冲未决写卡失败';
        pkg_handdeal_unsetcash.module_vicecardcash_rollback(n_unset_planid,
                                                            prmcustomerid,
                                                            '88888',
                                                            '充值红冲失败',
                                                            prmcustunitcode,
                                                            out_result,
                                                            out_msg);
      END IF;
    
    end if;
  END IF;

  RETURN;

END;

 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_VALIDATEISBALANCE" (out_result OUT NUMBER, out_msg OUT VARCHAR2)
IS
    /*
   -------------------------------------------------------------------------------
   --存储过程：proc_validateisbalance
   --作　　者：朱鹏飞
   --时　　间：2009-05-30
   --说　　明：验证当前是否正在日志
   --应用场景：消费，充值等产生结算数据的操作前要判断系统结算状态，只检查日结，
   --   不检查月结、年结，因为月结年结是从日结汇总，消费，充值操作只影响日结，不
   --   影响月结，年结等。
   --输入参数：
   --输出参数：
   --返回值定义：
   --100 :当前正在日结
   --0：当前数据库正常，未进行结算，可以进行相关操作，
   --   消费，充值等操作判断些过程只要返回的非0，就不能进行相关操作
   ---1001:系统未开通
   --------------------------------------------------------------------------
   --修改标示：朱鹏飞 2009-07-01
   --修改说明：原返回值为正数，是错误的。修改在日结时返回值为负数。
   -----------------------------------------------------------------------------
   */
   i_isbalance   INTEGER;                                      --系统结算标志
   i_count       INTEGER;
BEGIN
   SELECT COUNT (*)
     INTO i_count
     FROM base_syspara;

   IF i_count <> 1
   THEN
      out_result := -1800001;
      out_msg := 'NYGJ_ZXSJK_1800001:系统未开通';
      RETURN;
   END IF;

   --检查是否正在数据结算 0：未日结 1：正在日结 2：准备日结
   SELECT NVL (a.isbalance, 0)
     INTO i_isbalance
     FROM base_syspara a;

   --
   IF i_isbalance = 1
   THEN
      out_result := -1800000;
      out_msg := 'NYGJ_ZXSJK_1800000:数据库正在日结';
   ELSIF i_isbalance = 0
   THEN
      out_result := i_isbalance;
      out_msg := '当前数据库未进行日结';
   ELSIF i_isbalance = 2
   THEN
      out_result := -1800002;
      out_msg := 'NYGJ_ZXSJK_1800002:当前数据库正准备日结;';
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      out_result := -1800003;
      out_msg := '"NYGJ_ZXSJK_1800003:查看日结状态异常";';
END;


 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_VALIDATEISBALANCEBYCODE" (
   prmcustunitcode   IN       VARCHAR2,
   out_result        OUT      NUMBER,
   out_msg           OUT      VARCHAR2
)
IS
    /*
   -------------------------------------------------------------------------------
   --存储过程：proc_validateisbalancebycode
   --作　　者：周晓娜
   --时　　间：2013-05-30
   --说　　明：验证当前法人是否正在日志
   --应用场景：消费，充值等产生结算数据的操作前要判断系统结算状态，只检查日结，
   --   不检查月结、年结，因为月结年结是从日结汇总，消费，充值操作只影响日结，不
   --   影响月结，年结等。
   --输入参数：
   --输出参数：
   --返回值定义：
   --100 :当前正在日结
   --0：当前法人操作正常，未进行结算，可以进行相关操作，
   --   消费，充值等操作判断些过程只要返回的非0，就不能进行相关操作
   ---1001:系统未开通
   --------------------------------------------------------------------------
   */
   i_isbalance   INTEGER;                                      --系统结算标志
   i_count       INTEGER;
BEGIN
   SELECT COUNT (*)
     INTO i_count
     FROM base_legal_person
    WHERE customerunitcode = prmcustunitcode;

   IF i_count <> 1
   THEN
      out_result := -1800001;
      out_msg := 'NYGJ_ZXSJK_1800001:法人信息不合法';
      RETURN;
   END IF;

   --检查是否正在数据结算 0：未日结 1：正在日结 2：准备日结
   SELECT NVL (a.isbalance, 0)
     INTO i_isbalance
     FROM base_legal_person a
    WHERE a.customerunitcode = prmcustunitcode;

   --
   IF i_isbalance = 1
   THEN
      out_result := -1800000;
      out_msg := 'NYGJ_ZXSJK_1800000: 当前法人正在日结';
   ELSIF i_isbalance = 0
   THEN
      out_result := i_isbalance;
      out_msg := '当前法人未进行日结';
   ELSIF i_isbalance = 2
   THEN
      out_result := -1800002;
      out_msg := 'NYGJ_ZXSJK_1800002:当前法人正准备日结;';
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      out_result := -1800003;
      out_msg := '"NYGJ_ZXSJK_1800003:查看日结状态异常";';
END;


 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_VALIDATESAMCARD" (prmsamcardno      IN     VARCHAR2, --PASM卡卡号
                                prmcustunitcode   IN     VARCHAR2, --客户代码
                                inout_badtype     IN OUT NUMBER, --坏账类型
                                prmopdt           IN     VARCHAR2, --操作时间
                                out_result           OUT NUMBER,
                                out_msg              OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：proc_validatesamcard
    --作　　者：胡凡凡
    --时　　间：2017-03-22
    --说　　明：验证终端信息是否正确
    --输入参数：
    --输出参数：
    --返回值定义：
    --   100：成功
    --   -1002:PASM卡号不存在，坏账类型9
    --   -1003:PSAM卡挂失后消费，坏账类型7
    --   -1004:终端配置信息异常，坏账类型27
    --------------------------------------------------------------------------
    */
    i_count   INTEGER;
BEGIN
    out_result := -1002;
    out_msg := '判断PSAM卡号';

    SELECT COUNT (*)
      INTO i_count
      FROM base_samcard a
     WHERE samcardno = prmsamcardno AND a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        inout_badtype := 9;
        out_result := -1002;
        out_msg :=
               'PSAM卡号不存在或有多个！数量：'
            || i_count
            || ' 号：'
            || TO_CHAR (prmsamcardno);
        RETURN;
    END IF;

    SELECT COUNT (*)
      INTO i_count
      FROM base_samcard a
     WHERE     a.samcardno = prmsamcardno
           AND a.state = 10
           AND a.customerunitcode = prmcustunitcode;

    IF i_count > 0
    THEN
        out_msg := '此PSAM卡已挂失';

        SELECT COUNT (*)
          INTO i_count
          FROM base_samcard a
         WHERE     a.samcardno = prmsamcardno
               AND a.state = 10
               AND TO_DATE (prmopdt, 'yyyy-mm-dd hh24:mi:ss') < a.lossdate
               AND a.customerunitcode = prmcustunitcode;

        IF i_count <= 0
        THEN
            --记录上传时间比挂失时间大
            inout_badtype := 7;
            out_result := -1003;
            out_msg := 'PSAM卡挂失后消费';
            RETURN;
        END IF;
    END IF;

    out_result := 100;
    out_msg := '获取终端信息成功！';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        inout_badtype := 27;
        out_result := -1004;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
        RETURN;
END;
 
 
 
 
 
/


  CREATE OR REPLACE PROCEDURE "CCENSE"."PROC_VALIDATETERMBUSLINE" (prmposcode        IN     VARCHAR2, --终端运行唯一编号
                                    prmcustunitcode   IN     VARCHAR2, --客户代码
                                    prmbusid          IN OUT NUMBER, --车辆ID
                                    prmbuslineid      IN OUT NUMBER, --线路id
                                    prmdptcode        IN OUT VARCHAR2, --部门code
                                    inout_badtype     IN OUT NUMBER, --坏账类型
                                    out_result           OUT NUMBER,
                                    out_msg              OUT VARCHAR2)
IS
    /*
    -------------------------------------------------------------------------------
    --存储过程：PROC_VALIDATETERM
    --作　　者：朱鹏飞
    --时　　间：2009-05-30
    --说　　明：验证poscode,车辆，线路，部门是否正确
    --输入参数：
    --输出参数：
    --返回值定义：
    --   100：成功
    --   -1005:终端在系统中不存在
    --   -1006:车辆信息不存在
    --   -1007:根据车辆编号获取线路信息失败
    --   -1008:终端配置信息异常
    --------------------------------------------------------------------------
    */
    i_count     INTEGER;
    n_busid     INTEGER;
    n_lineid    INTEGER;
    v_dptcode   VARCHAR2 (100);
    v_consumemodel VARCHAR2(100); --消费账目归属模式
BEGIN
    out_result := -1005;
    out_msg := '判断终端';

    -----根据终端唯一编号，查找终端是否存在--------------------
    SELECT COUNT (*)
      INTO i_count
      FROM base_term a
     WHERE     a.poscode = prmposcode
           AND a.customerunitcode = prmcustunitcode;

    IF i_count <> 1
    THEN
        inout_badtype := 8;
        out_result := -1005;
        out_msg :=
               '终端不存在或重复！'
            || '对应个数：'
            || i_count
            || ' POSCODE：'
            || TO_CHAR (prmposcode);
        RETURN;
    END IF;

    --只有车辆ID为0时，才查找车辆ID信息
    out_result := -1006;
    out_msg := '获取车辆ID信息';

    n_busid := prmbusid;

    IF (prmbusid = 0)
    THEN
        SELECT COUNT (*)
          INTO i_count
          FROM base_term a, base_bus b
         WHERE     (   a.poscode = b.poscode
                    OR b.poscodelist LIKE '%' || prmposcode || '%')
               AND a.customerunitcode = b.customerunitcode
               AND b.isuse = 0
               AND b.isdelete = 0
               AND a.poscode = prmposcode
               AND (   b.poscode = prmposcode
                    OR b.poscodelist LIKE '%' || prmposcode || '%')
               AND a.customerunitcode = prmcustunitcode;

        IF (i_count <> 1)
        THEN
            inout_badtype := 10;
            out_result := -1006;
            out_msg := '车辆信息不存在或重复！' || '对应个数：' || i_count;
            RETURN;
        END IF;

        --根据终端唯一编号，获取车辆ID，只查询在使用中的车辆，如果获取不到，则为0
        SELECT b.busno
          INTO n_busid
          FROM base_term a, base_bus b
         WHERE     (   a.poscode = b.poscode
                    OR b.poscodelist LIKE '%' || prmposcode || '%')
               AND a.customerunitcode = b.customerunitcode
               AND b.isuse = 0
               AND b.isdelete = 0
               AND a.poscode = prmposcode
               AND (   b.poscode = prmposcode
                    OR b.poscodelist LIKE '%' || prmposcode || '%')
               AND a.customerunitcode = prmcustunitcode;
    END IF;

    out_result := -1007;
    out_msg := '根据车辆编号获取线路信息失败';

    -----------根据车辆编号获取线路信息---------------------
    SELECT COUNT (*)
      INTO i_count
      FROM base_bus a
     WHERE     a.busno = n_busid
           AND a.customerunitcode = prmcustunitcode
           AND a.isdelete = 0;

    IF (i_count <> 1)
    THEN
        --车辆不存在或者已删除
        inout_badtype := 10;
        out_result := -1006;
        out_msg :=
               '车辆信息不存在或重复！'
            || '对应个数：'
            || i_count
            || 'busid：'
            || TO_CHAR (n_busid);
        RETURN;
    END IF;

    --20180411 消费账目归属模式( 0 以平台绑定线路为准；1 以终端绑定线路为准；)
    --若系统无此参数，则以平台绑定线路为准
    SELECT NVL(MAX(b.paramvalue),0)
      INTO v_consumemodel
      FROM base_param b
     WHERE b.paramname = 'consumeaccountmodel'
       AND b.customerunitcode = prmcustunitcode
       AND b.isuse = 1;

    --20180411 消费账目归属模式( 0 以平台绑定线路为准；1 以终端绑定线路为准；)
    IF TRIM(v_consumemodel) = '0' THEN
      --获取线路信息
      SELECT a.lineid
        INTO n_lineid
        FROM base_bus a
       WHERE a.busno = n_busid
         AND a.customerunitcode = prmcustunitcode
         AND a.isdelete = 0;
    ELSE
      --以终端绑定线路为准
      n_lineid := prmbuslineid;
    END IF;

    --检查线路是否存在
    SELECT COUNT (*)
      INTO i_count
      FROM base_busline a
     WHERE     a.lineid = n_lineid
           AND a.customerunitcode = prmcustunitcode
           AND a.isdelete = 0;

    IF (i_count <> 1)
    THEN
        --线路不存在或者已删除
        inout_badtype := 14;
        out_result := -1006;
        out_msg :=
               '线路信息不存或重复！'
            || '对应个数：'
            || i_count
            || 'buslineid：'
            || TO_CHAR (n_lineid);
        RETURN;
    END IF;

    --获取线路所属的部门信息(线路信息目前不能调整部门信息，所以直接取没问题)
    SELECT a.dptcode
      INTO v_dptcode
      FROM base_busline a
     WHERE     a.lineid = n_lineid
           AND a.customerunitcode = prmcustunitcode
           AND a.isdelete = 0;

    prmbusid := n_busid;
    prmbuslineid := n_lineid;
    prmdptcode := v_dptcode;

    out_result := 100;
    out_msg := '终端、车辆、线路信息验证通过！';
    RETURN;
EXCEPTION
    WHEN OTHERS
    THEN
        inout_badtype := 27;
        out_result := -1004;
        out_msg := out_msg || '，异常信息为：' || SQLERRM;
        RETURN;
END;

 
/

