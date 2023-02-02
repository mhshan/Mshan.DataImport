using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Newcapec.eCardCity.BusinessStudio;
using System.Web.Script.Serialization;
 
namespace Newcapec.Tool.CreateCard
{
    public struct CardInfo
    {
        public string Card_No { get; set; }
    }

    public partial class FrmCardData : Form
    {
        public class Config
        {
            public string Url;
            public string Id;
            public string Ip;
            public string Key;
            public string CustomerUnitcode;
            public string CityCode;
            public string SftpIp;
            public string SftpPort;
            public string SftpUser;
            public string SftpPassword;
        }

        public class Parameter
        {
            /// <summary>
            /// 创建日期yyyyMMdd
            /// </summary>
            public string CreateDate;

            public Int32 Number;

            public Config ConfigInfo;
        }

        public FrmCardData()
        {
            InitializeComponent();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            Newcapec.eCardCity.BusinessStudio.ThridPartyApiProxy.ThridParyApi = null;
            Newcapec.eCardCity.BusinessStudio.SoapHeader.ServiceID = txtId.Text.Trim();
            Newcapec.eCardCity.BusinessStudio.SoapHeader.SaltKey = txtKey.Text.Trim();
            Newcapec.eCardCity.BusinessStudio.SoapHeader.IP = txtIp.Text.Trim();
            Newcapec.eCardCity.BusinessStudio.SoapHeader.CustomerUnitCode = txtCustomerUnitcode.Text.Trim();
            Newcapec.eCardCity.BusinessStudio.ThridPartyApiProxy.ServiceUrl = txtUrl.Text.Trim();
            int count = Convert.ToInt32(txtCount.Text);
            if (count <= 0)
            {
                MessageBox.Show(this,"请输入生成文件数量！","提示");
                txtCount.Focus();
                return;
            }
            string path = txtPath.Text.Trim();
            if (!System.IO.Directory.Exists(path))
                System.IO.Directory.CreateDirectory(path);

            for (int i = 0; i < count; i++)
            {
                int result = -1;
                string message = string.Empty;
                string cardData = string.Empty;
                ThridPartyApiProxy.ThridParyApi.GetCardInfo(string.Empty, "", ref cardData, ref result, ref message);
                if (result == 100 && cardData.Length > 8)
                {
                    string data = cardData.Substring(8);
                    CardInfo cardInfo = JsonDeSerializer<CardInfo>(data);
                    string fileName = string.Format("{0}\\{1}.json", path, cardInfo.Card_No);
                    if (System.IO.File.Exists(fileName))
                    {
                        System.IO.File.Delete(fileName);
                        WriteControl(string.Format("删除{0},文件成功", fileName));

                    }      
                    WriterFile(data, fileName);
                    WriteControl(string.Format("{0}、写入{1},文件成功", i, fileName));
                }
            }
            WriteControl(string.Format("执行完成，共生成:{0}条………………………………………………………………………………", count));

        }

        public void WriteControl(string text)
        {
            this.Invoke(new Action(() =>
            {
                txtNotice.AppendText(text + "\r\n");
                txtNotice.ScrollToCaret();
            }));
        }

        public static void WriterFile(string text, string path)
        {
            System.IO.StreamWriter rw = System.IO.File.AppendText(path);
            rw.WriteLine(text);
            rw.Flush();
            rw.Close();
        }

        private void btnCancle_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRar_Click(object sender, EventArgs e)
        {
            Parameter parameter = GetParameter();
            string destName = string.Format("{0}\\{1}{2}{3:d4}.zip", txtPath.Text.TrimEnd('\\').Trim(), parameter.CreateDate, txtCityCode.Text.Trim(), parameter.Number);
            if (System.IO.File.Exists(destName))
            {
                DialogResult result = MessageBox.Show(this, "该文件已经生成，是否重新生成", "询问", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.No)
                {
                    return;
                }
            }
            if (!System.IO.Directory.Exists(txtPath.Text))
            {
                MessageBox.Show(this, string.Format("目录不存在:{0}", txtPath.Text), "提示");
                txtPath.Focus();
                return;
            }
            System.IO.DirectoryInfo dirInfo = new System.IO.DirectoryInfo(txtPath.Text);
            System.IO.FileInfo[] fileInfoArray = dirInfo.GetFiles();
            List<string> fullNameList = new List<string>();
            foreach (System.IO.FileInfo fileInfo in fileInfoArray)
            {
                if (fileInfo.FullName.EndsWith(".json"))
                    fullNameList.Add(fileInfo.FullName);
            }
            if (Compress(fullNameList, destName, (s) => { WriteControl(s); }))
            {
                WriterParameter(JsonSerializer(parameter));
                WriteControl(destName + "压缩完成");
                txtZipFile.Text = destName;
            }
        }
        public Parameter GetParameter()
        {
            Parameter parameter = null;
            string paramText = ReadParameter();
            if (string.IsNullOrEmpty(paramText))
            {
                parameter = new Parameter()
                {
                    CreateDate = DateTime.Now.ToString("yyyyMMdd"),
                    Number = 1
                };
            }
            else
            {
                parameter = JsonDeSerializer<Parameter>(paramText);
                if (parameter.CreateDate == DateTime.Now.ToString("yyyyMMdd"))
                {
                    parameter.Number++;
                }
                else
                {
                    parameter = new Parameter()
                    {
                        CreateDate = DateTime.Now.ToString("yyyyMMdd"),
                        Number = 1
                    };
                }
            }
            return parameter;
        }

        public static void WriterParameter(string text)
        {
            string path =string.Format("{0}\\parameter.txt", Application.StartupPath.TrimEnd('\\'));
            byte[] textByte =System.Text.Encoding.GetEncoding("UTF-8").GetBytes(text);
            System.IO.FileStream fs = System.IO.File.Open(path,System.IO.FileMode.Create);
            fs.Write(textByte, 0, textByte.Length);
            fs.Flush();
            fs.Close();
        }
        public static string ReadParameter()
        {
            string path=string.Format("{0}\\parameter.txt", Application.StartupPath.TrimEnd('\\'));
            string text = string.Empty;
            if (System.IO.File.Exists(path))
            {
                System.IO.StreamReader rw = System.IO.File.OpenText(path);
                text = rw.ReadToEnd();
                rw.Close();
            }
            return text;
        }
        public static T JsonDeSerializer<T>(string jsonString)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsonSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
            return jsonSerialize.Deserialize<T>(jsonString);
        }
        public static string JsonSerializer<T>(T t)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsonSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
            string strJson = jsonSerialize.Serialize(t);
            return strJson;
        }
        public bool Decompress(string fullName, string decompressPath, System.Action<string> action)
        {
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
                action(entry.Name);
                entry = inputStream.GetNextEntry();
            }
            return true;
        }

        public bool Compress(List<string> fullNameList, string compressPath, System.Action<string> action)
        {
            System.IO.FileStream zipStream = System.IO.File.Open(compressPath,System.IO.FileMode.Create);
            ICSharpCode.SharpZipLib.Zip.ZipOutputStream outputStream = new ICSharpCode.SharpZipLib.Zip.ZipOutputStream(zipStream);

            foreach (string sourceName in fullNameList)
            {
                System.IO.FileStream sourceStream = System.IO.File.OpenRead(sourceName);
                int lastIndex = sourceName.LastIndexOf("\\") + 1;
                string destinationName = sourceName.Substring(lastIndex);
                ICSharpCode.SharpZipLib.Zip.ZipEntry zipEntry = new ICSharpCode.SharpZipLib.Zip.ZipEntry(destinationName);
                outputStream.PutNextEntry(zipEntry);
                int sizeRead = 0;
                byte[] buffer = new byte[1024];
                try
                {
                    do
                    {
                        sizeRead = sourceStream.Read(buffer, 0, buffer.Length);
                        outputStream.Write(buffer, 0, sizeRead);
                    }
                    while (sizeRead > 0);
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
                sourceStream.Close();
                action(sourceName);
            }
            outputStream.Finish();
            outputStream.Close();
            return true;
        }

        private void FrmCardData_Load(object sender, EventArgs e)
        {
            string text = ReadParameter();
            Parameter param = null;
            if (!string.IsNullOrEmpty(text))
            {
                param = JsonDeSerializer<Parameter>(ReadParameter());
                if (param.ConfigInfo != null)
                {
                    txtUrl.Text = param.ConfigInfo.Url;
                    txtId.Text = param.ConfigInfo.Id;
                    txtIp.Text = param.ConfigInfo.Ip;
                    txtKey.Text = param.ConfigInfo.Key;
                    txtCustomerUnitcode.Text = param.ConfigInfo.CustomerUnitcode;
                    txtCityCode.Text = param.ConfigInfo.CityCode;
                    txtSftpIp.Text = param.ConfigInfo.SftpIp;
                    txtSftpPort.Text = param.ConfigInfo.SftpPort;
                    txtSftpUser.Text = param.ConfigInfo.SftpUser;
                    txtSftpPassword.Text = param.ConfigInfo.SftpPassword;
                }
            }
        }

        private void btnSftpUpload_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtZipFile.Text))
            {
                MessageBox.Show(this, "请输入上传额文件", "提示");
                txtZipFile.Focus();
                return;
            }
            if (!System.IO.File.Exists(txtZipFile.Text))
            {
                MessageBox.Show(this, "上传文件，不存在", "提示");
                txtZipFile.Focus();
                return;
            }
            SftpHelper sftpHelper = new SftpHelper(txtSftpIp.Text, txtSftpPort.Text, txtSftpUser.Text, txtSftpPassword.Text);
            sftpHelper.OnLogExceptionEvent += new SftpHelper.LogExceptionHandler((notice, ex) =>
            {
                WriteControl(ex.Message);
                WriteControl(ex.StackTrace);
            });
            string sourceFile = txtZipFile.Text;
            string sourceName = txtZipFile.Text.Substring(txtZipFile.Text.LastIndexOf('\\') + 1);
            string destFile = string.Format("/upload/{0}", sourceName);
            if (sftpHelper.Connect())
            {
                if (sftpHelper.Exists(destFile))
                {
                    MessageBox.Show(this, "该文件已经存在，不能重复上传文件", "提示");
                    return;
                }
                sftpHelper.Put(sourceFile, destFile);
                if (sftpHelper.Exists(destFile))
                {
                    WriteControl(sourceFile + "---------------------文件上传sftp成功");
                }
            }
            sftpHelper.Disconnect();
        }

        private void btnSaveConfig_Click(object sender, EventArgs e)
        {
            Parameter param = GetParameter();
            param.ConfigInfo = new Config();
            param.ConfigInfo.Url=txtUrl.Text;
            param.ConfigInfo.Id=txtId.Text;
            param.ConfigInfo.Ip=txtIp.Text;
            param.ConfigInfo.Key=txtKey.Text;
            param.ConfigInfo.CustomerUnitcode=txtCustomerUnitcode.Text;
            param.ConfigInfo.CityCode=txtCityCode.Text;
            param.ConfigInfo.SftpIp=txtSftpIp.Text;
            param.ConfigInfo.SftpPort=txtSftpPort.Text;
            param.ConfigInfo.SftpUser=txtSftpUser.Text;
            param.ConfigInfo.SftpPassword=txtSftpPassword.Text;
            string text = JsonSerializer(param);
            WriterParameter(text);
            WriteControl("---------------------配置保存成功!");
        }
    }
}
