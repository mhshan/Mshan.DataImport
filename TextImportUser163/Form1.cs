using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.IO;
using System.Web.Script.Serialization;
using System.Numerics;
namespace TextImportUser163
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public static object obj
        {
            get;
            set;
        }
        public static object VersionLock
        {
            get;
            set;
        }
        private void txtStart_Click(object sender, EventArgs e)
        {

            int thread = Convert.ToInt32(txtThread.Text);
            SqlDB.SqlConnString = txtDataBase.Text;
            DataTable dataTable = SqlDB.GetDataSetText("select top 1 * from user163").Tables[0];
            SqlDB.ExecSql("update baseversion set Finish=0 where Finish=1");
            obj = new object();
            VersionLock = new object();
            if (thread == 1)
            {
               new System.Threading.Thread(FileToDatabase1).Start();
            }
            else{
                for (int i = 1; i <= thread; i++)
                {
                    System.Threading.ThreadPool.QueueUserWorkItem(FileToDatabase, i);
                }
            }
            
        }
        public DataTable CreateTable(string tableName,params string[] columnNames)
        {
            DataTable dt = new DataTable(tableName);
            for (int i = 0; i < columnNames.Length; i++)
            {
                dt.Columns.Add(columnNames[i]);
            }
            return dt;
        }
        public void FileToDatabase1()
        {
            SqlDB.SqlConnString = txtDataBase.Text;
            //int i=26;
            WriterFile("线程开始同步");
            Version version = GetVerion("{0}_登录成功(1)_.txt");
            string fileFullPath = txtFilePath.Text + "\\" + version.VersionName;
            for (; File.Exists(fileFullPath); )
            {
                fileFullPath = txtFilePath.Text + "\\" + version.VersionName;
                WriterFile("线程开始同步" + version.VersionName);
                StreamReader sr = new StreamReader(fileFullPath, Encoding.Default);
                String line;
                System.Data.SqlClient.SqlConnection sqlConn = new System.Data.SqlClient.SqlConnection(txtDataBase.Text);
                sqlConn.Open();
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.Connection = sqlConn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select count(*) from User163 where username=@username and password=@password;";
                cmd.Parameters.AddRange(new System.Data.SqlClient.SqlParameter[]{
                       new System.Data.SqlClient.SqlParameter("@username",SqlDbType.NVarChar),
                       new System.Data.SqlClient.SqlParameter("@password",SqlDbType.NVarChar)
                        });
                System.Data.SqlClient.SqlBulkCopy sbc = new System.Data.SqlClient.SqlBulkCopy(sqlConn);
                int successNumber = 0;
                int repeatNumber = 0;
                int totaleNumber = 0;
                int indexes = 0;
                DateTime currentTime = DateTime.Now;
                line = sr.ReadToEnd();
                sr.Close();
                DataTable dt = CreateTable("User163","username", "password", "datatype");
               
                string[] lineArray = Regex.Split(line, "\r\n");
                for (int i = version.Row; i < lineArray.Length; i++)
                {
                    MatchCollection collection = Regex.Matches(lineArray[i], "^(.*)----(.*)$");
                    if (collection.Count > 0)
                    {
                        cmd.Parameters["@username"].Value = collection[0].Groups[1].Value;
                        cmd.Parameters["@password"].Value = collection[0].Groups[2].Value;
                        totaleNumber++;
                        if (dt.Select(string.Format("username='{0}' and password='{1}'",collection[0].Groups[1].Value,collection[0].Groups[2].Value.Replace("'","''"))).Length==0&&Convert.ToInt32(cmd.ExecuteScalar()) == 0)
                        {
                            successNumber++;
                            DataRow dr = dt.NewRow();
                            dr["username"] = collection[0].Groups[1].Value;
                            dr["password"] = collection[0].Groups[2].Value;
                            dr["datatype"] = "163";
                            dt.Rows.Add(dr);
                        }
                        else
                            repeatNumber++;
                        if (totaleNumber % 10000 == 0)
                        {
                            WriterFile(string.Format("线程：共{0}，成功{1}，失败{2}，用时{3},当前时间：{4}",
                                totaleNumber, successNumber, repeatNumber, DateTime.Now - currentTime, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
                            currentTime = DateTime.Now;

                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    currentTime = DateTime.Now;
                    WriterFile(string.Format("数据库插入开始，数量{2},用时{0},当前时间：{1}", DateTime.Now - currentTime, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), totaleNumber));
                    sbc.DestinationTableName = dt.TableName;
                    sbc.BulkCopyTimeout = 60000;
                    sbc.WriteToServer(dt);
                    WriterFile(string.Format("数据库插入结束，数量{2},用时{0},当前时间：{1}", DateTime.Now - currentTime, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), totaleNumber));
                    dt.Dispose();
                    indexes = 0;
                    SqlDB.ExecSql(string.Format("update baseversion set row={0} where versionname='{1}'", lineArray.Length, version.VersionName));
                }
                sbc.Close();
                sqlConn.Close();
                SqlDB.ExecSql(string.Format("update baseversion set row={0},Finish=2,endtime=getdate() where versionname='{1}'", totaleNumber, version.VersionName));
                version = GetVerion("{0}_登录成功(1)_.txt");
            }
            WriterFile("线程结束同步");
        }
        public void FileToDatabase(object obj)
        {
            SqlDB.SqlConnString = txtDataBase.Text;
            //int i=26;
            WriterFile(obj.ToString()+"线程开始同步");
            Version version = GetVerion("{0}_登录成功(1)_.txt");
            string fileFullPath = txtFilePath.Text + "\\" + version.VersionName;
            for (; File.Exists(fileFullPath); )
            {
                fileFullPath = txtFilePath.Text + "\\" + version.VersionName;
                WriterFile(obj+"线程开始同步"+version.VersionName);
                StreamReader sr = new StreamReader(fileFullPath, Encoding.Default);
                String line;
                System.Data.SqlClient.SqlConnection sqlConn = new System.Data.SqlClient.SqlConnection(txtDataBase.Text);
                sqlConn.Open();
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.Connection = sqlConn;
                int successNumber = 0;
                int repeatNumber = 0;
                int totaleNumber = 0;
                DateTime currentTime=DateTime.Now;
                string cmdText = string.Empty;
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.CommandText = "Proc_AddUser";
                cmd.Parameters.AddRange(new System.Data.SqlClient.SqlParameter[]{
                       new System.Data.SqlClient.SqlParameter("@username",SqlDbType.NVarChar),
                       new System.Data.SqlClient.SqlParameter("@password",SqlDbType.NVarChar),
                       new System.Data.SqlClient.SqlParameter("@return",SqlDbType.Int),
                       new System.Data.SqlClient.SqlParameter("@datatype","163")
                       });
                line=sr.ReadToEnd();
                sr.Close();
                string[] lineArray =Regex.Split(line,"\r\n");
                for (int i = version.Row; i < lineArray.Length;i++ )
                {
                    MatchCollection collection = Regex.Matches(lineArray[i], "^(.*)----(.*)$");
                    //SqlDB.ExecSql();
                    if (collection.Count > 0)
                    {
                        cmd.Parameters["@username"].Value = collection[0].Groups[1].Value;
                        cmd.Parameters["@password"].Value = collection[0].Groups[2].Value;
                        cmd.Parameters["@return"].Direction = ParameterDirection.ReturnValue;
                        cmd.ExecuteNonQuery();
                        if (Convert.ToInt32(cmd.Parameters["@return"].Value) == 1)
                            successNumber++;
                        else
                            repeatNumber++;
                        totaleNumber++;
                        if (totaleNumber % 10000 == 0)
                        {
                            SqlDB.ExecSql(string.Format("update baseversion set row={0} where versionname='{1}'", i,version.VersionName));
                            WriterFile(obj + string.Format("线程：共{0}，成功{1}，失败{2}，用时{3},当前时间：{4}",
                                totaleNumber, successNumber, repeatNumber, DateTime.Now - currentTime, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
                            //totaleNumber = 0;
                            successNumber = 0;
                            repeatNumber = 0;
                        }
                    }
                }
                sqlConn.Close();
                SqlDB.ExecSql(string.Format("update baseversion set row={0},Finish=2,endtime=getdate() where versionname='{1}'", totaleNumber, version.VersionName));
               version= GetVerion("{0}_登录成功(1)_.txt");
            }
            WriterFile(obj.ToString() + "线程结束同步");
        }

        public Version GetVerion(string nameFormat)
        {
            lock (VersionLock)
            {
                Version version = new Version();
                DataTable dt = SqlDB.GetDataSetText("select * from baseversion where finish=0").Tables[0];
                foreach (DataRow dataRow in dt.Rows)
                {
                    if (SqlDB.ExecSql(string.Format("update baseversion set finish=1 where versionname='{0}' and finish=0", dataRow["versionname"].ToString().Replace("'", "''"))))
                    {
                        version.VersionName = dataRow["versionname"].ToString();
                        version.VersionId = Convert.ToInt32(dataRow["version"]);
                        version.Row = Convert.ToInt32(dataRow["row"]);
                        return version;
                    }
                }
                while (true)
                {
                    int max = 0;
                    DataTable dtMax = SqlDB.GetDataSetText("select Max(version) from baseversion").Tables[0];
                    if (dtMax.Rows.Count > 0)
                        max = Convert.ToInt32(dtMax.Rows[0][0]) + 1;
                    version.VersionName = string.Format(nameFormat, max.ToString("D3"));
                    if (SqlDB.ExecSql(string.Format("Insert into baseversion(versionname,version,row,finish) values('{0}',{1},{2},{3})", version.VersionName, max, 0, 1)))
                    {
                        version.VersionId = max;
                        version.Row = 0;
                        version.Finish = 1;
                        return version;
                    }
                }
            }
        }

        public void WriterFile(string text)
        {


            this.Invoke(new Action(() =>
            {
                txtNotice.AppendText(text + "\r\n");
                txtNotice.ScrollToCaret();
            }));
            lock (obj)
            {
                string path = Application.StartupPath + "\\log_sell.txt";
                System.IO.StreamWriter rw = System.IO.File.AppendText(path);
                string[] textLine = text.Split('\n');
                for (int i = 0; i < textLine.Length; i++)
                {
                    rw.WriteLine(textLine[i]);
                }
                rw.Flush();
                rw.Close();
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(this, "事件2");
            return;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(this,"事件1");
            return;
            System.Numerics.BigInteger.Parse("F5F0A6CAEBC0F528C6DF00BA90D25FE2DDD844A668831AFB5AB2E26EAC5C2B52", System.Globalization.NumberStyles.AllowHexSpecifier);
            System.Numerics.BigInteger bigInt = new BigInteger(new byte[] { 0XF5, 0XF0, 0XA6, 0XCA, 0XEB, 0XC0, 0XF5, 0X28, 0XC6, 0XDF, 0X00, 0XBA, 0X90, 0XD2, 0X5F, 0XE2, 0XDD, 0XD8, 0X44, 0XA6, 0X68, 0X83, 0X1A, 0XFB, 0X5A, 0XB2, 0XE2, 0X6E, 0XAC, 0X5C, 0X2B, 0X52 });
            System.Numerics.BigInteger pow1 = System.Numerics.BigInteger.Pow(bigInt, 3);
            System.Numerics.BigInteger a = new BigInteger(new byte[]{0xff,0xff,0xff,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xfc});
            System.Numerics.BigInteger b = new BigInteger(new byte[]{0x28,0xe9,0xfa,0x9e, 0x9d,0x9f,0x5e,0x34, 0x4d,0x5a,0x9e,0x4b,0xcf,0x65,0x09,0xa7,
0xf3,0x97,0x89,0xf5, 0x15,0xab,0x8f,0x92, 0xdd,0xbc,0xbd,0x41,0x4d,0x94,0x0e,0x93});
            System.Numerics.BigInteger p = new BigInteger(new byte[]{0xff,0xff,0xff,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff});
            System.Numerics.BigInteger xmodp = System.Numerics.BigInteger.ModPow(bigInt, 3, p);
            System.Numerics.BigInteger total = pow1 + a * bigInt + b;
            System.Numerics.BigInteger mod = System.Numerics.BigInteger.ModPow(total, 1, p);
            mod = System.Numerics.BigInteger.ModPow(mod, 1, p);

            System.Numerics.Complex.Sqrt((System.Numerics.Complex)mod);
            Extensions.Sqrt(mod);
            System.Numerics.BigInteger.Log(mod,2);
            byte[] x = new byte[] { 0XF5, 0XF0, 0XA6, 0XCA, 0XEB, 0XC0, 0XF5, 0X28, 0XC6, 0XDF, 0X00, 0XBA, 0X90, 0XD2, 0X5F, 0XE2, 0XDD, 0XD8, 0X44, 0XA6, 0X68, 0X83, 0X1A, 0XFB, 0X5A, 0XB2, 0XE2, 0X6E, 0XAC, 0X5C, 0X2B, 0X52 };
            Array.Reverse(x,0,x.Length); 


//            System.Numerics.BigInteger bigInt = new BigInteger(new byte[] { 0XF5, 0XF0, 0XA6, 0XCA, 0XEB, 0XC0, 0XF5, 0X28, 0XC6, 0XDF, 0X00, 0XBA, 0X90, 0XD2, 0X5F, 0XE2, 0XDD, 0XD8, 0X44, 0XA6, 0X68, 0X83, 0X1A, 0XFB, 0X5A, 0XB2, 0XE2, 0X6E, 0XAC, 0X5C, 0X2B, 0X52 });
//            System.Numerics.BigInteger  pow1= System.Numerics.BigInteger.Pow(bigInt, 3);
//            System.Numerics.BigInteger a = new BigInteger(new byte[]{0xff,0xff,0xff,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
//0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xfc});
//            System.Numerics.BigInteger b = new BigInteger(new byte[]{0x28,0xe9,0xfa,0x9e, 0x9d,0x9f,0x5e,0x34, 0x4d,0x5a,0x9e,0x4b,0xcf,0x65,0x09,0xa7,
//0xf3,0x97,0x89,0xf5, 0x15,0xab,0x8f,0x92, 0xdd,0xbc,0xbd,0x41,0x4d,0x94,0x0e,0x93});
//            System.Numerics.BigInteger p = new BigInteger(new byte[]{0xff,0xff,0xff,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
//0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff});
//            System.Numerics.BigInteger xmodp=System.Numerics.BigInteger.ModPow(bigInt, 3, p);
//            System.Numerics.BigInteger total = pow1 + a * bigInt + b;
//            System.Numerics.BigInteger mod = System.Numerics.BigInteger.ModPow(total,1,p);
//            mod = System.Numerics.BigInteger.ModPow(mod, 1, p);

//            System.Numerics.Complex.Sqrt((System.Numerics.Complex)mod);
            StringBuilder sb = new StringBuilder();
            ObjectTest(sb);
            txtNotice.Text = sb.ToString();
         //   var items= new
         //               {
         //                   cardno = "",
         //                   opdt = ""
         //               };
         //   object[] obj = new object[]{
         //    new
         //               {
         //                   cardno = "1",
         //                   opdt = ""
         //               }
         //               ,
         //               new
         //               {
         //                   cardno = "2",
         //                   opdt = ""
         //               }
         //};
            
         //   txtNotice.Text = JsonSerializer(new
         //           {
         //               result = 100,
         //               msg = "操作成功",
         //               items=obj
         //           }
         //       );
        }
        public string JsonSerializer<T>(T t)
        {
            JavaScriptSerializer jsonSerialize = new JavaScriptSerializer();
            return jsonSerialize.Serialize(t);
        }
        public void ObjectTest(StringBuilder sb)
        {
            //sb = new StringBuilder();
            sb.Append("ObjectTest");
        }

        private void btnStop_Click(object sender, EventArgs e)
        {

        }

        
    }

    public class Version
    {
        public string VersionName
        {
            get;
            set;
        }
        public Int32 VersionId
        {
            get;
            set;
        }

        public Int32 Row
        {
            get;
            set;
        }

        public Int32 Finish
        {
            get;
            set;
        }
    }
}

  

    public static class Extensions
    {
      public static BigInteger Sqrt(this BigInteger x)
      {
        if (x.Sign < 0) throw new ArgumentOutOfRangeException("x", "must be greater than or equal to zero");
        BigInteger low, high;
        GetLowAndHigh(x, out low, out high);
        var mid = low;
        var cmp = 0;
        while (low.CompareTo(high) <= 0)
        {
          mid = (low + high) / 2;
          cmp = (mid * mid).CompareTo(x);
          if (cmp < 0) low = mid + 1;
          else if (cmp > 0) high = mid + (-1);
          else return mid;
        }
        if (cmp > 0) mid--;
        return mid;
      }
  
      static void GetLowAndHigh(BigInteger x, out BigInteger low, out BigInteger high)
      {
        var n = x.ToByteArray().Length;
        if (n < 2)
        {
          low = 0;
          high = x;
          return;
        }
        var bs = new byte[n / 2 + 1];
        var k = bs.Length - 2;
        if (n % 2 == 0)
        {
          bs[k] = 0x0B;
          low = new BigInteger(bs);
          bs[k] = 0xB6;
          high = new BigInteger(bs);
        }
        else
        {
          bs[k] = 0xB5;
          low = new BigInteger(bs);
          bs[k] = 0x51;
          bs[k + 1] = 0x0B;
          high = new BigInteger(bs);
        }
      }
    }
