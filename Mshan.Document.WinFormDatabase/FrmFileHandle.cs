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
    public partial class FrmFileHandle : Form
    {
        public FrmFileHandle()
        {
            InitializeComponent();
        }
        public string ConnectionString
        {
            get
            {
                return txtConnection.Text;
            }
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog folderDialog = new FolderBrowserDialog();
            folderDialog.ShowDialog(this);
            string path = folderDialog.SelectedPath;
            if (string.IsNullOrEmpty(path))
                return;
            string[] files = System.IO.Directory.GetFiles(path);
            foreach (string file in files)
            {
                Int32 length=file.LastIndexOf('\\');
                string fileName = file.Substring(length+ 1);
                if (fileName.EndsWith(".zip"))
                {
                    path = file.Substring(0, length);
                    List<string> fileNameList=Decompress(file,path);
                    
                    foreach (string name in fileNameList)
                    {
                        if (System.Text.RegularExpressions.Regex.IsMatch(name, "[0-9]+.txt$"))
                        {
                            string content = ReadFile(name);
                            List<string[]> recordList = ParseFile(content);
                            if (recordList.Count > 0)
                                WriteControl(string.Format("{0}共{1}条————————————————", fileName, recordList.Count));
                            foreach (string[] record in recordList)
                                ImportRecord(record);
                        }
                    }
                    WriteControl(string.Format("文件{0}处理结束————————————————", fileName));
                }
            }
        }
        public string ReadFile(string path)
        {
            System.IO.StreamReader stringReader = new System.IO.StreamReader(path, System.Text.ASCIIEncoding.UTF8);
            string text = stringReader.ReadToEnd();
            stringReader.Dispose();
            stringReader.Close();
            return text;
        }
        public List<string[]> ParseFile(string content)
        {
            string[] lineArray = content.Split('\n');
            List<string[]> textList = new List<string[]>();
            foreach (string line in lineArray)
            {
                string[] textArray = line.Split('\t');
                DateTime opdt=DateTime.MinValue;
                if(DateTime.TryParse(textArray[0],out opdt))
                    textList.Add(textArray);
            }
            return textList;
        }
        public List<string> Decompress(string fullName, string decompressPath)
        {
            List<string> fileNameList = new List<string>();
            if (!System.IO.Directory.Exists(decompressPath))
                System.IO.Directory.CreateDirectory(decompressPath);
            ICSharpCode.SharpZipLib.Zip.ZipInputStream inputStream = new ICSharpCode.SharpZipLib.Zip.ZipInputStream(System.IO.File.OpenRead(fullName));
            ICSharpCode.SharpZipLib.Zip.ZipEntry entry = inputStream.GetNextEntry();
            while (entry != null)
            {
                string path = decompressPath + "\\" + entry.Name;
                if (entry.IsDirectory)
                {
                    if (!System.IO.Directory.Exists(path))
                    {
                        System.IO.Directory.CreateDirectory(path);
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(entry.Name))
                    {
                        fileNameList.Add(path);
                        using (System.IO.FileStream streamWriter = System.IO.File.Create(path))
                        {
                            int size = 2048;
                            byte[] data = new byte[2048];

                            while (true)
                            {
                                size = inputStream.Read(data, 0, data.Length);
                                if (size <= 0) break;

                                streamWriter.Write(data, 0, size);
                            }
                            streamWriter.Close();
                        }
                    }
                }
                entry = inputStream.GetNextEntry();
            }
            return fileNameList;
        }
        public bool ImportRecord(string[] recordArray)
        {
            string querySql=string.Format("select * from rec_thirdrecord where systracenum='{0}'",recordArray[4]);
            DataTable dt = DbHelper.Fill(ConnectionString,querySql);
            if (dt.Rows.Count > 0)
            {
                Rec_ThirdRecord thirdRecord = new Rec_ThirdRecord();
                thirdRecord.Buscode ="0"; 
                SetEntity(thirdRecord, dt.Rows[0]);
                thirdRecord.Buscode = thirdRecord.Busid;
                thirdRecord.Opfare = thirdRecord.Opfare * 100;
                thirdRecord.Oddfare = thirdRecord.Oddfare * 100;
                thirdRecord.DiscountFare = thirdRecord.DiscountFare * 100;
                thirdRecord.Accountdate = DateTime.ParseExact(recordArray[1],"yyyyMMdd",System.Globalization.DateTimeFormatInfo.CurrentInfo).ToString("yyyy-MM-dd");
                Int32 result = 0;
                string message = string.Empty;
                UploadThirdRecord_Success(thirdRecord,ref result,ref message);
                if (result != 100)
                    WriteControl(string.Format("插入错误:{0},{1}",result,message));
                else
                    WriteControl(string.Format("{0}处理成功", thirdRecord.SysTraceNum));
            }
            return true;
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
        public bool UploadThirdRecord_Success(Rec_ThirdRecord record, ref Int32 result, ref string message)
        {
            OracleParameter[] paraList = new OracleParameter[43];
            int i = 0;
            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmcstaccfc";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = 0;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmposcode";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Poscode;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmtraderecno";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Traderecno;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmbuslineid";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Buslineid;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmbusid";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Busid;

            //ylp 20180928 新增buscode字段
            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmbuscode";
            paraList[i].Direction = ParameterDirection.Input;
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Buscode;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmdriverid";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Driverid;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmstopid";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.StopId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmopdt";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Opdt;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmlinedirection";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.LineDirection;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmcollectdt";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Collectdt;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmuploaddate";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.UploadDate;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmoddfare";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Oddfare;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmopfare";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Opfare;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmdiscountfare";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.DiscountFare;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmtestflag";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.TestFlag;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmtradekind";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.TradeKind;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmrecordtype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.RecordType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmtradetype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.TradeType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmmaincardtype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.Maincardtype;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmwallettype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.WalletType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmcardtype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.CardType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmaccountid";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.AccountId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmappid";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.AppId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmuid";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.UserId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmthirdcardno";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.ThirdCardno;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmthirdtermid";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.ThirdTermId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmthirdmerchantcode";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.ThirdMerchantCode;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmbatchno";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Batchno;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmtracenum";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Tracenum;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmordertype";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.OrderType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmrecordinfo";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.RecordInfo;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmextentvalue";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Extentvalue;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmsystracenum";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.SysTraceNum;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmdealtype";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.DealType;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmcustunitcode";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.CustomerUnitcode;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmbadid";
            paraList[i].OracleType = OracleType.Number;
            paraList[i++].Value = record.BadId;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmaccountdate";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.Accountdate;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmresponsecode";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.ResponseCode;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmresponsemessage";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.ResponseMessage;

            paraList[i] = new OracleParameter();
            paraList[i].ParameterName = "prmfilename";
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i++].Value = record.FileName;

            paraList[i] = new OracleParameter();
            paraList[i].Direction = ParameterDirection.Output;
            paraList[i].OracleType = OracleType.Number;
            paraList[i].ParameterName = "out_result";
            paraList[i++].Value = -1;

            paraList[i] = new OracleParameter();
            paraList[i].Direction = ParameterDirection.Output;
            paraList[i].OracleType = OracleType.VarChar;
            paraList[i].Size = 1000;
            paraList[i].ParameterName = "out_msg";
            paraList[i++].Value = string.Empty;
            using (OracleConnection connection = new OracleConnection(ConnectionString))
            {
                connection.Open();
                OracleCommand cmd = BuildQueryCommand(connection, "pkg_rec_thirdrecord.proc_thirdrecord_successresult", paraList);
                cmd.ExecuteNonQuery();
                foreach (OracleParameter pm in paraList)
                {
                    if (pm.Direction == ParameterDirection.Output || pm.Direction == ParameterDirection.InputOutput)
                    {
                        Object o = cmd.Parameters[pm.ParameterName].Value;
                        if (pm.ParameterName == "out_result")
                        {
                            result = int.Parse(o.ToString());
                        }
                        else if (pm.ParameterName == "out_msg")
                        {
                            message = o.ToString();
                        } 
                    }
                }
                connection.Close();
            }
            return result == 100;
        }
        private static OracleCommand BuildQueryCommand(OracleConnection connection, string storedProcName, OracleParameter[] parameters)
        {
            OracleCommand command = new OracleCommand(storedProcName, connection);
            command.CommandType = CommandType.StoredProcedure;

            foreach (OracleParameter parameter in parameters)
            {
                if (parameter != null)
                {
                    // 检查未分配值的输出参数,将其分配以DBNull.Value.
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    command.Parameters.Add(parameter);
                }
            }
            return command;
        }

        public static void SetEntity<T>(T t, DataRow dataRow)
        {
            string returnValue = string.Empty;
            if (t == null)
            {
                return;
            }
            System.Reflection.PropertyInfo[] properties = t.GetType().GetProperties(System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public);

            if (properties.Length <= 0)
            {
                return;
            }

            foreach (System.Reflection.PropertyInfo item in properties)
            {

                string name = item.Name.ToLower();
                if (!dataRow.Table.Columns.Contains(name))
                    continue;
                if (item.PropertyType.IsValueType || item.PropertyType.Name.StartsWith("String"))
                {
                    switch (item.PropertyType.FullName)
                    {
                        case "System.Decimal":
                            item.SetValue(t, Convert.ToDecimal(dataRow[name]), null);
                            break;
                        case "System.Int32":
                            item.SetValue(t, Convert.ToInt32(dataRow[name]), null);

                            break;
                        case "System.Int64":
                            item.SetValue(t, Convert.ToInt64(dataRow[name]), null);
                            break;
                        case "System.DateTime":
                            item.SetValue(t, Convert.ToDateTime(dataRow[name]), null);
                            break;
                        case "System.UInt64":
                            item.SetValue(t, Convert.ToUInt64(dataRow[name]), null);
                            break;
                        default:
                            item.SetValue(t, Convert.ToString(dataRow[name]), null);
                            break;
                    }

                }
            }
        }

        private void FrmFileHandle_Load(object sender, EventArgs e)
        {
            if (System.Configuration.ConfigurationSettings.AppSettings["UserCenterDbConnection"] != null)
                txtConnection.Text = System.Configuration.ConfigurationSettings.AppSettings["UserCenterDbConnection"].ToString();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtNotice.Text = string.Empty;
        }
    }

}
