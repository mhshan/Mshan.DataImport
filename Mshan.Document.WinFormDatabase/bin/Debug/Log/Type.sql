CREATE OR REPLACE TYPE          "QUEST_SOO_ALERTTRACE_LINE_TYP"                                          IS OBJECT (linedate DATE, linetext VARCHAR2(4000), filestatus NUMBER )

/

CREATE OR REPLACE TYPE          "QUEST_SOO_ALERTTRACE_LOG_TYP"                                          IS TABLE OF quest_soo_alerttrace_line_typ

/

CREATE OR REPLACE TYPE          "TYPE_SPLIT"                                          AS TABLE OF VARCHAR2 (4000)

/

