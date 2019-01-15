
  CREATE OR REPLACE FUNCTION "CCENSE"."FUNC_VERSION" RETURN VARCHAR2 IS
 v_result varchar2(30);
  v_count NUMBER;
BEGIN
  SELECT count(*) INTO v_count FROM v$version t WHERE  INSTR(upper(t.BANNER),'10G') >1;
  IF v_count > 0 THEN
    v_result :=  '10G';
  Else
      SELECT count(*) INTO v_count FROM v$version t WHERE  INSTR(upper(t.BANNER),'11G') >1;
      IF v_count > 0 THEN
         v_result :=  '11G';
      End IF;
  End IF;
  RETURN v_result;
END;


 
 
 
 
 
/


  CREATE OR REPLACE FUNCTION "CCENSE"."GET_SEQUENCE_NO" (
   codestr      IN       VARCHAR2,
   out_result   OUT      NUMBER,
   out_msg      OUT      VARCHAR2
)
   RETURN NUMBER
AS
   vno   NUMBER;
BEGIN
   SELECT COUNT (*)
     INTO vno
     FROM base_sequence_no a
    WHERE a.code = codestr;

   IF vno = 0
   THEN
      out_result := -200;
      out_msg := '索引代码不存在';
      RETURN 0;
   ELSE
      BEGIN
         UPDATE base_sequence_no a
            SET a.max_no = a.max_no + 1
          WHERE a.code = codestr;

         SELECT a.max_no
           INTO vno
           FROM base_sequence_no a
          WHERE a.code = codestr;

         COMMIT;
         RETURN vno;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            out_result := -100;
            out_msg := out_msg || '_+_' || SQLCODE || SQLERRM;
      END;
   END IF;

   RETURN vno;
EXCEPTION
   WHEN OTHERS
   THEN
      out_result := -100;
      out_msg := out_msg || '_+_' || SQLCODE || SQLERRM;
END;


 
 
 
 
 
/


  CREATE OR REPLACE FUNCTION "CCENSE"."SPLIT" (p_list VARCHAR2, p_sep VARCHAR2 := ',')
   RETURN type_split PIPELINED
IS
   l_idx    PLS_INTEGER;
   v_list   VARCHAR2 (4000) := p_list;
BEGIN
   LOOP
      l_idx := INSTR (v_list, p_sep);

      IF l_idx > 0
      THEN
         PIPE ROW (SUBSTR (v_list, 1, l_idx - 1));
         v_list := SUBSTR (v_list, l_idx + LENGTH (p_sep));
      ELSE
         PIPE ROW (v_list);
         EXIT;
      END IF;
   END LOOP;

   RETURN;
END SPLIT;


 
 
 
 
 
/

