using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Mshan.Utilities.DbUtilities;
using System.Data.OracleClient;
namespace Mshan.Document.WinFormDatabase
{
    public partial class FrmImportDb : Form
    {
        public FrmImportDb()
        { 
            InitializeComponent();
        }
        public Dictionary<string, Dictionary<string, string>> __columnDictionary = new Dictionary<string, Dictionary<string, string>>();
        public char splitO='@';
        private void btnDiff_Click(object sender, EventArgs e)
        {
            string[] tableNameS = System.Text.RegularExpressions.Regex.Split(txtTableS.Text, "\r\n");
            string[] tableNameD = System.Text.RegularExpressions.Regex.Split(txtTableD.Text, "\r\n");
            for (int i = 0; i < tableNameS.Length; i++)
            {
                //string sourceQuery = string.Format("select * from {0}", tableNameS);
                DataTable dtS = GetColumnsByTableName(txtSourceConnection.Text, tableNameS[i]);
                //string desQuery = string.Format("select * from {0}", tableNameD);
                DataTable dtD = GetColumnsByTableName(txtDestinationConnection.Text,tableNameD[i]);
                StringBuilder exist = new StringBuilder();
                StringBuilder noexist = new StringBuilder();
                txtNotice.AppendText(string.Format("{0}————————————————————————————————",tableNameD[i]));
                txtNotice.AppendText("\r\n");
                foreach (DataRow dataRow in dtD.Rows)
                {
                    DataRow[] rowS = dtS.Select(string.Format("column_name='{0}'",dataRow["column_name"].ToString()));
                    if (rowS.Length < 1)
                    {
                        noexist.AppendFormat("{0}({1}){2}false", dataRow["column_name"].ToString(), dataRow["comments"].ToString(), splitO);
                        noexist.AppendFormat("\r\n");
                    }
                    else
                    {
                        exist.AppendFormat("{0}({1}){2}true", dataRow["column_name"].ToString(), dataRow["comments"].ToString(), splitO);
                         exist.AppendFormat("\r\n");
                    }
                }
                WriteControl(noexist.ToString());
                WriteControl(exist.ToString());

            }
        }
        public bool __isImport=false;
        public object importLock = new object();
        private void btnImport_Click(object sender, EventArgs e)
        {
            if(__columnDictionary.Count==0)
            {
                DialogResult result= MessageBox.Show(this, "未导入规则，是否继续执行？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (result == DialogResult.No)
                {
                    return;
                }
            }
            lock (importLock)
            {
                if (__isImport)
                {
                    WriteControl("数据正在导入");
                    return;
                }
                else
                __isImport = true;
            }
                System.Threading.ThreadPool.QueueUserWorkItem((obj) =>
                {
                    try
                    {
                        string[] tableNameS = System.Text.RegularExpressions.Regex.Split(txtTableS.Text, "\r\n");
                        string[] tableNameD = System.Text.RegularExpressions.Regex.Split(txtTableD.Text, "\r\n");
                        DateTime totalBeginTime = DateTime.Now;
                        for (int i = 0; i < tableNameS.Length; i++)
                        {
                            //string tableNameD = tableNameD[i];
                            DateTime beginTime = DateTime.Now;
                            WriteControl("开始导入" + tableNameD[i]);
                            string sourceQuery = string.Format("select * from {0}", tableNameS[i]);
                            DataTable dtS = DbHelper.Fill(txtSourceConnection.Text, sourceQuery);
                            string desQuery = string.Format("select * from {0} where 1=0", tableNameD[i]);
                            DataTable dtD = DbHelper.Fill(txtDestinationConnection.Text, desQuery);
                            DataTable insertTable = dtD.Clone();
                            insertTable.TableName = tableNameD[i];
                            WriteControl("获取数据：" + dtS.Rows.Count + "用时：" + (DateTime.Now - beginTime).ToString());
                            foreach (DataRow dataRow in dtS.Rows)
                            {
                                DataRow newRow = insertTable.NewRow();
                                foreach (DataColumn column in insertTable.Columns)
                                {

                                    if (__columnDictionary.ContainsKey(insertTable.TableName))
                                    {
                                        string columnInfo = __columnDictionary[insertTable.TableName][column.ColumnName];
                                        if (columnInfo == "true")
                                        {
                                            if (column.ColumnName.ToLower() == "outid")
                                            {
                                                if (dataRow[column.ColumnName].ToString() == "0")
                                                {
                                                    newRow[column.ColumnName] = dataRow["cardno"];
                                                }
                                                else
                                                    newRow[column.ColumnName] = dataRow[column.ColumnName];

                                            }
                                            else
                                                newRow[column.ColumnName] = dataRow[column.ColumnName];
                                        }
                                        else if (columnInfo.StartsWith("$"))
                                        {
                                            string columnNameS = columnInfo.TrimStart('$');
                                            if (dtS.Columns.Contains(columnNameS))
                                                newRow[column.ColumnName] = dataRow[columnNameS];
                                        }
                                        else if (columnInfo.StartsWith("{"))
                                        {
                                            newRow[column.ColumnName] = SpecialRules(columnInfo);
                                        }
                                        else if (columnInfo == "false")
                                        {
                                            //newRow[column.ColumnName] = ;
                                        }
                                        else
                                        {
                                            newRow[column.ColumnName] = columnInfo;
                                        }
                                    }
                                    else
                                    {
                                        if (dtS.Columns.Contains(column.ColumnName))
                                            newRow[column.ColumnName] = dataRow[column.ColumnName];
                                    }

                                }
                                insertTable.Rows.Add(newRow);

                            }
                            BulkCopy(insertTable, txtDestinationConnection.Text);
                            WriteControl(tableNameD[i] + "导入成功：" + dtS.Rows.Count + ",用时：" + (DateTime.Now - beginTime).ToString(""));


                        }
                        DateTime totalEndTime = DateTime.Now;

                        WriteControl("数据导入完成，共：" + tableNameD.Length + "个表,用时：" + (totalEndTime - totalBeginTime).ToString(""));
                    }
                    catch (Exception ex)
                    {
                        WriteControl(ex.Message);
                        WriteControl(ex.StackTrace);
                    }
                    finally
                    {
                        __isImport = false;
                    }
                });
           
        }


        private void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dtTable = GetAllUserTable(txtDestinationConnection.Text);

            dtTable.DefaultView.Sort = "table_name asc";

            foreach (DataRow dataRow in dtTable.DefaultView.ToTable().Rows)
            {
                    WriteControl(dataRow["table_name"].ToString() + ":" + dataRow["comments"].ToString());
            }
        }
        public string SpecialRules(string rule)
        {
            if (rule.StartsWith("{sysdate:"))
            {
                return string.Format(rule.Replace("sysdate", "0"), System.DateTime.Now);
            }
            else if (rule.StartsWith("{sysdate}"))
            {
                return string.Format("{0:yyyy-MM-dd HH:mm:ss}", System.DateTime.Now);
            }
            return string.Empty;
        }
        private void btnTigger_Click(object sender, EventArgs e)
        {
            while (System.IO.File.Exists(PathTrigger))
            {
               DialogResult dialogResult= MessageBox.Show(this, "触发器文件已经存在，是否覆盖原有文件", "提示", MessageBoxButtons.YesNoCancel,MessageBoxIcon.Information);
               if (dialogResult == DialogResult.No)
               {
                   FolderBrowserDialog browserDialog = new FolderBrowserDialog();
                   browserDialog.ShowDialog();
                   Int32 index = txtPathTrigge.Text.LastIndexOf('\\');
                   if (index > -1)
                   {
                       txtPathTrigge.Text = browserDialog.SelectedPath+txtPathTrigge.Text.Substring(index);
                   }
                    
               }
               else if (dialogResult == DialogResult.Yes)
               {
                   try
                   {
                       System.IO.File.Delete(PathTrigger);
                   }
                   catch (Exception ex)
                   {
                       MessageBox.Show(this,ex.Message,"提示");
                       return;
                   }
               }
               else if (dialogResult == DialogResult.Cancel)
               {
                   return;
               }
            }
            string[] tableNameD = System.Text.RegularExpressions.Regex.Split(txtTableS.Text, "\r\n");
            List<string> tigger = new List<string>();
            for (int i = 0; i < tableNameD.Length; i++)
            {
                CreateTrigger(tableNameD[i],tigger);
            }
            foreach (string s in tigger)
            {
                string sql = string.Format("drop trigger {0}", s);
                try
                {
                    DbHelper.ExecuteNonQuery(txtDestinationConnection.Text, sql);
                }
                catch (Exception ex)
                {
                    string dd = ex.Message;
                }
                finally
                {
                    WriteControl(string.Format("{0}删除成功", s));
                }
            }
        }
        public void BulkCopy(DataTable insertTable,string connectionString)
        {
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                string SQLString = string.Format("select * from {0} where rownum=0", insertTable.TableName);
                using (OracleCommand cmd = new OracleCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        OracleDataAdapter myDataAdapter = new OracleDataAdapter();
                        myDataAdapter.UpdateBatchSize = 1;
                        myDataAdapter.SelectCommand = new OracleCommand(SQLString, connection);
                        OracleCommandBuilder custCB = new OracleCommandBuilder(myDataAdapter);
                        custCB.ConflictOption = ConflictOption.OverwriteChanges;
                        custCB.SetAllValues = true;
                        myDataAdapter.Update(insertTable);
                        insertTable.AcceptChanges();
                        myDataAdapter.Dispose();
                    }
                    catch (System.Data.OracleClient.OracleException ex)
                    {
                        connection.Close();
                       DialogResult result= MessageBox.Show("入库异常是否继续？"+ex.Message,"询问",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
                       if (result == DialogResult.No)
                           throw ex;
                    }
                }
            }
        }
        public static DataTable GetAllUserTable(string connection)
        {
            return DbHelper.Fill(connection, "select  a.table_name, a.tablespace_name, a.status,a.num_rows, a.table_lock,b.comments  from user_tables a left join user_tab_comments b on a.table_name=b.table_name  order by a.table_name asc");
        }
        public DataTable GetColumnsByTableName(string connection, string tableName)
        {
            return DbHelper.Fill(connection, string.Format("select a.table_name,a.column_name,a.data_type,a.data_length,a.NULLABLE,a.column_id,a.data_default,b.comments  from user_tab_columns a left join user_col_comments b on a.table_name=b.table_name and a.COLUMN_NAME=b.column_name  where LOWER(a.Table_Name)='{0}' order by a.column_id asc", tableName.ToLower()));
        }
        public string PathTrigger
        {
            get {
                return txtPathTrigge.Text;
            }

        }
        public List<string> CreateTrigger(string tableName,List<string> result)
        {
            
            //List<string> result = new List<string>();

            DataTable dtTrigger = GetTriggerByTableName(tableName);
            foreach (DataRow dataRow in dtTrigger.Rows)
            {
                DataTable dtTriggerBody =GetProcedureByName(dataRow["trigger_name"].ToString(), "Trigger");
                if (dtTriggerBody.Rows.Count >0)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("CREATE OR REPLACE \r\n");
                    string seqName = string.Empty;
                    string columnName = string.Empty;
                    foreach (DataRow dr in dtTriggerBody.Rows)
                    {
                        sb.Append(dr["text"].ToString());
                    }
                    sb.Append("/\r\n");
                    GetSeqInfo(sb.ToString(),ref seqName,ref columnName);
                    string seq = string.Format(
@"declare
n_maxcount number;
n_currentcount number;
begin
    select max({0}) into n_maxcount from {1};
    select {2}.NEXTVAL into n_currentcount from dual;
    if n_maxcount>n_currentcount+500000
      then
        n_maxcount:=n_maxcount+1;
        dbms_output.put_line('{2}太大，请手动修改为：'||n_maxcount);
        return;
        end if;
    while n_maxcount>n_currentcount loop
            select seq_rec_bllt_ver.NEXTVAL into n_currentcount from dual;
            end loop;
end;
/
",columnName,tableName,seqName);
                    WriterFile(seq, PathTrigger);

                    WriterFile(sb.ToString(), PathTrigger);

                }
                result.Add(dataRow["trigger_name"].ToString());
            }
            return result;
        }

        public void GetSeqInfo(string body,ref string seqName,ref string columnName)
        {

            System.Text.RegularExpressions.MatchCollection collection = System.Text.RegularExpressions.Regex.Matches(body, @"SELECT (.+).NEXTVAL[\S\s]+INTO :new.(.+)[\S\s]+FROM DUAL", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            if (collection[0].Success)
            {
                seqName = collection[0].Groups[1].Value;
                columnName = collection[0].Groups[2].Value;
            }

        }
        public void WriterFile(string text, string path)
        {
            System.IO.StreamWriter rw = System.IO.File.AppendText(path);

            rw.WriteLine(text);
            rw.Flush();
            rw.Close();
        }
        public DataTable GetProcedureByName(string procedureName, string type)
        {
            return DbHelper.Fill(txtDestinationConnection.Text,string.Format("SELECT * FROM USER_SOURCE where  name='{0}' and upper(type)='{1}' order by line asc", procedureName, type.ToUpper()));
        }
        public DataTable GetTriggerByTableName(string tableName)
        {
            return DbHelper.Fill(txtDestinationConnection.Text,string.Format("select a.table_name,a.trigger_name,a.table_owner,a.triggering_event,a.trigger_body,a.column_name  from user_triggers a where LOWER(a.Table_Name)='{0}'", tableName.ToLower()));
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtNotice.Clear();
        }
        public string __currentTableName;
        private void btnImportReg_Click(object sender, EventArgs e)
        {
            __columnDictionary.Clear();
            string[] content = System.Text.RegularExpressions.Regex.Split(txtNotice.Text,"\r\n");
            for (Int32 i = 0; i < content.Length; i++)
            {
                if (string.IsNullOrEmpty(content[i]))
                    continue;
                if (content[i].EndsWith("————————————————————————————————"))
                {
                    __currentTableName=content[i].TrimEnd('—');
                    __columnDictionary.Add(__currentTableName, new Dictionary<string, string>());
                }
                else
                {
                    string[] column = content[i].Split(splitO);
                    if (string.IsNullOrEmpty(column[0]))
                        continue;
                    Int32 index = column[0].IndexOf('(') ;
                    string columnName = string.Empty;
                    columnName = index==-1?column[0]:column[0].Substring(0, index);
                    __columnDictionary[__currentTableName].Add(columnName, column[1]);
                }
            }
            WriteControl("导入成功");
        }

        public void WriteControl(string text)
        {
            //if (this.InvokeRequired)
            //{
            this.Invoke(new Action(() =>
            {
                txtNotice.AppendText(text + "\r\n");
                txtNotice.ScrollToCaret();
            }));
            //}
            //else

        }

        private void btnCross_Click(object sender, EventArgs e)
        {
            string s = txtSourceConnection.Text;
            string d = txtDestinationConnection.Text;
            txtSourceConnection.Text = d;
            txtDestinationConnection.Text = s;
        }

        private void FrmImportDb_Load(object sender, EventArgs e)
        {
           txtPathTrigge.Text= Application.StartupPath + "\\Trigger.sql";
        }

        private void btnRuleFile_Click(object sender, EventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            fileDialog.ShowDialog();
            if (!string.IsNullOrEmpty(fileDialog.FileName))
            WriteControl(System.IO.File.ReadAllText(fileDialog.FileName)); 
        }
    }
}
