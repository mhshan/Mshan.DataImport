using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Mshan.Document.Database;
using Mshan.Utilities.DbUtilities;
namespace Mshan.Document.WinFormDatabase
{
    public partial class FrmMaxSeq : Form
    {
        public FrmMaxSeq()
        {
            InitializeComponent();
        }

        private void btnTrigger_Click(object sender, EventArgs e)
        {
            System.Threading.ThreadPool.QueueUserWorkItem(GetSequeue, null);
        }

        public void GetSequeue(object obj)
        {

            string pathSeq = txtPath.Text;
            if (System.IO.File.Exists(pathSeq))
                System.IO.File.Delete(pathSeq);
            System.Data.DataTable allSeqTable = OracleDocument.GetAllTypeBySchema("TRIGGER",string.Empty);
            foreach (System.Data.DataRow dr in allSeqTable.Rows)
            {
                System.Data.DataTable seqTable = OracleDocument.GetProcedureByName(dr["name"].ToString(),"TRIGGER");
                Result nameResult=new Result();
                Result tableResult = new Result();
                Result columnResult=new Result();
                Result maxValueResult=new Result();
                string text = string.Empty;
                //WriteControl(string.Format("生成{0}开始————————————————",dr["name"].ToString()));
                foreach (System.Data.DataRow drBody in seqTable.Rows)
                {
                    if (nameResult.ret_code != 100)
                        nameResult = GetSeqName(drBody["text"].ToString());
                    if (tableResult.ret_code != 100)
                        tableResult = GetSeqTable(drBody["text"].ToString());
                    if (columnResult.ret_code != 100)
                        columnResult = GetSeqColumn(drBody["text"].ToString());
                    if (!string.IsNullOrEmpty(text))
                        text += "\r\n";
                    text += drBody["text"].ToString();
                }
                if (nameResult.ret_code == 100 && tableResult.ret_code == 100 && columnResult.ret_code == 100)
                {
                    maxValueResult = GetMaxSeqValue(columnResult.ret_message,tableResult.ret_message);
                    if (maxValueResult.ret_code == 100)
                    {
                        if (string.IsNullOrEmpty(maxValueResult.ret_message))
                            maxValueResult.ret_message = "1";
                        else
                        {
                            UInt64 maxValue = 0;
                            if (UInt64.TryParse(maxValueResult.ret_message, out maxValue))
                            {
                                maxValue = maxValue + 1;
                                maxValueResult.ret_message = maxValue.ToString();
                            } 
                        }
                        CreateSequences(pathSeq, nameResult.ret_message, maxValueResult.ret_message);
                        WriteControl(string.Format("生成{0}成功————————————————", nameResult.ret_message));
                        continue;
                    }
                }
                if (nameResult.ret_code == 100)
                    WriteControl(string.Format("生成{0}失败————————————————", nameResult.ret_message));
                else
                    WriteControl(string.Format("生成{0}失败————————————————", dr["name"].ToString()));

            }
        }


        public void GetTrigger(object obj)
        {

            string pathSeq = txtPath.Text;
            if (System.IO.File.Exists(pathSeq))
                System.IO.File.Delete(pathSeq);
            System.Data.DataTable allSeqTable = OracleDocument.GetAllTypeBySchema("TRIGGER", string.Empty);
            foreach (System.Data.DataRow dr in allSeqTable.Rows)
            {
                WriteControl(string.Format("生成{0}成功————————————————", dr["name"].ToString()));
WriterFile(string.Format(@"alter trigger {0} enable
/", dr["name"].ToString()), pathSeq);
            }
            WriteControl("生成结束————————————————" );
        }
        public void CreateSequences(string path,string seqName, string maxValue)
        {
            //string path = txtPath.Text + "\\Sequences.sql";
            
            DataTable seqTable = OracleDocument.GetSequenceByName(seqName);
            //WriteControl(string.Format("正在生产序列，共{0}-------------------------------------------", seqTable.Rows.Count));
            foreach (DataRow dataRow in seqTable.Rows)
            {
                WriterFile(string.Format(@"drop SEQUENCE {0}
/",seqName),path);
                WriterFile(string.Format(@"CREATE SEQUENCE {0}
    INCREMENT BY {1}
    START WITH {2}
    MINVALUE {3}
    MAXVALUE {4}
    NOCYCLE
    NOORDER
    NOCACHE
/".ToLower(), dataRow["sequence_name"].ToString().ToLower(), dataRow["increment_by"].ToString(), maxValue, dataRow["min_value"].ToString(), dataRow["max_value"].ToString())
                                      , path);
                //WriteControl(string.Format("{0}生成完成", dataRow["sequence_name"].ToString().ToLower()));//sequence_name,min_value,max_value,increment_by,last_number
            }
        }
        public static void WriterFile(string text, string path)
        {
            System.IO.StreamWriter rw = System.IO.File.AppendText(path);

            rw.WriteLine(text);
            rw.Flush();
            rw.Close();
        }
        public void WriteControl(string text)
        {
            if (this.InvokeRequired)
            {
                this.Invoke(new Action(() =>
                {
                    txtNotice.AppendText(text + "\r\n");
                    txtNotice.ScrollToCaret();
                }));
            }

        }
        public Result GetSeqName(string text)
        {
            string regexRule = @"^\s*SELECT\s+([a-zA-Z_]+)\.NEXTVAL";
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(regexRule,System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.MatchCollection matchCollection =regex.Matches(text);
            Result result = new Result();
            result.ret_code = -1;
            if (matchCollection.Count > 0)
            {
                result.ret_code = 100;
                result.ret_message = matchCollection[0].Groups[1].Value;
            }
            return result;
        }
        public Result GetMaxSeqValue(string column, string table)
        {

            DataTable dt = DbHelper.Fill(txtSource.Text, string.Format("select max({0}) as maxvalue from {1}", column, table));
            Result result = new Result();
            result.ret_code = -1;
            if (dt.Rows.Count > 0)
            {
                result.ret_code = 100;
                result.ret_message = dt.Rows[0]["maxvalue"].ToString(); ;
            }
            return result;
        }
        public Result GetSeqTable(string text)
        {
            string regexRule = @"^\s*ON\s+([a-zA-Z_]+)\s*$";
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(regexRule,System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.MatchCollection matchCollection =regex.Matches(text);
            Result result = new Result();
            result.ret_code = -1;
            if (matchCollection.Count > 0)
            {
                result.ret_code = 100;
                result.ret_message = matchCollection[0].Groups[1].Value;
            }
            return result;
        }
        public Result GetSeqColumn(string text)
        {
            string regexRule = @"\s+INTO\s*\:\s*NEW\.([a-zA-Z_]+)\s*";
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(regexRule,System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.MatchCollection matchCollection =regex.Matches(text);
            Result result = new Result();
            result.ret_code = -1;
            if (matchCollection.Count > 0)
            {
                result.ret_code = 100;
                result.ret_message = matchCollection[0].Groups[1].Value;
            }
            return result;
        }
        private void FrmMaxSeq_Load(object sender, EventArgs e)
        {
            txtSource.Text = System.Configuration.ConfigurationSettings.AppSettings["UserCenterDbConnection"].ToString();
            txtPath.Text =Application.StartupPath.TrimEnd('\\')+ "\\Sequences.sql";
        }

        private void btnEnable_Click(object sender, EventArgs e)
        {
            System.Threading.ThreadPool.QueueUserWorkItem(GetTrigger, null);
        }
    }
 
   
    public class Result
    {
        public Int32 ret_code;
        public string ret_message;
    }
}
