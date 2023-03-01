using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace Mshan.Document.FwForm
{
    public partial class FrmUnLanguage : Form
    {
        public FrmUnLanguage()
        {
            InitializeComponent();
        }
        string __path = string.Empty;
        private void btnLoad_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog browerDialog = new FolderBrowserDialog();
            if (!string.IsNullOrEmpty(__path))
                browerDialog.SelectedPath = __path;
            DialogResult result = browerDialog.ShowDialog(this);
            if(result==DialogResult.OK)
            {
                __path = browerDialog.SelectedPath;
                if (!string.IsNullOrEmpty(__path) && System.IO.Directory.Exists(__path))
                {
                    List<string> list = GetFileList(__path);
                    foreach (string s in list)
                    {
                        if (!cbAll.Checked)
                        {
                            if (s.EndsWith(".dll")||s.EndsWith(".exe")||s.EndsWith(".lb"))
                                continue;
                            if (!IsFileSerect(s))
                                continue;
                        }
                        WriteControl(s);
                    }
                }
            }
            //MessageBox.Show("加载成功", "提示");
        }
        public string[] __exclude = new string[] { "bin", "obj"};
        public string[] __programExtension
        {
            get {
                string[] extension = txtProgramExtension.Text.Split(',');
                return extension;
            }
        }
        public bool IsProgramExtension(string fileName)
        {
            string[] extension=__programExtension;
            foreach (string e in extension)
            {
                if (fileName.EndsWith(e, true, System.Globalization.CultureInfo.CurrentCulture))
                    return true;
            }
            return false;
        }
        public List<string> GetFileList(string path)
        {
            List<string> list = new List<string>();
            string[] dir = System.IO.Directory.GetDirectories(path);
            string[] fileName = System.IO.Directory.GetFiles(path);
            for (int i = 0; i < dir.Length; i++)
            {
                if (!cbAll.Checked)
                {
                    if (ExcludeDir(dir[i]))
                        continue;
                }
                list.AddRange(GetFileList(dir[i]));
            }
            for (int i = 0; i < fileName.Length; i++)
            {

                if (IsProgramExtension(fileName[i])||System.Text.RegularExpressions.Regex.IsMatch(fileName[i], "^.*\\" + SourceExtension + "$"))
                    list.Add(fileName[i]);
            }
            return list;
        }
        public bool ExcludeDir(string path)
        {
            //if (System.Text.RegularExpressions.Regex.IsMatch(dir[i], string.Format("\\{0}$",__exclude), System.Text.RegularExpressions.RegexOptions.IgnoreCase))
            //        continue;
            bool pointer = false;
            foreach (string s in __exclude)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(path, string.Format(@"\\{0}$", s), System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    pointer = true;
                    break;
                }
            }
            return pointer;
        }

        public void WriteControl(string text)
        {
            //if (this.InvokeRequired)
            {
                this.Invoke(new Action(() =>
                {
                    txtNotice.AppendText(text + "\r\n");
                    txtNotice.ScrollToCaret();
                }));
            }

        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            string[] path =System.Text.RegularExpressions.Regex.Split(txtNotice.Text,"\r\n");
            foreach (string p in path)
            {
             
                if (System.IO.File.Exists(p))
                {
                    System.IO.StreamReader stringReader = new System.IO.StreamReader(p);
                    string text = stringReader.ReadToEnd();
                    stringReader.Dispose();
                    stringReader.Close();
                    System.Text.RegularExpressions.MatchCollection mathCollection = System.Text.RegularExpressions.Regex.Matches(text, "(\"\"\\s*\\+\\s*)*ECard.LanguageResources.LanguageUse.GetResourceValue\\(ECard.LanguageResources.LanguageUse.ResourcesType.Message\\)\\[\"(\\w*)\"\\].ToString\\(\\)(\\s*\\+\\s*\"\")*");
                    foreach (System.Text.RegularExpressions.Match match in mathCollection)
                    {
                        text = text.Replace(match.Groups[0].Value, "\"" + __dic[match.Groups[2].Value].ToString() + "\"");
                    }
                    System.IO.StreamWriter writer = new System.IO.StreamWriter(p);
                    writer.Write(text);
                    writer.Flush();
                    writer.Close();
                }
            }
            MessageBox.Show("处理完成", "提示");

        }
        public Dictionary<string, object> __dic = new Dictionary<string, object>();
        string __fileName = string.Empty;
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLanguage_Click(object sender, EventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            if (!string.IsNullOrEmpty(__fileName))
                fileDialog.FileName = __fileName;
            fileDialog.ShowDialog(this);
            __fileName = fileDialog.FileName;
            if (!System.IO.File.Exists(__fileName))
                return;
            System.Xml.XmlDocument document = new System.Xml.XmlDocument();
            document.Load(__fileName);
            System.Xml.XmlNodeList nodeList = document.SelectNodes("resources/textItems/items");
            __dic = new Dictionary<string, object>();
            foreach (System.Xml.XmlNode xmlNode in nodeList)
            {
                System.Xml.XmlNodeList childList = xmlNode.ChildNodes;
                Dictionary<string, object> dic = new Dictionary<string, object>();
                foreach (System.Xml.XmlNode childNode in childList)
                {
                    if (!string.IsNullOrEmpty(childNode.InnerText))
                        dic.Add(childNode.Attributes["key"].Value, childNode.InnerText);

                }
                __dic.Add(xmlNode.Attributes["key"].Value, __dic);
            }
            System.Xml.XmlNodeList messageList = document.SelectNodes("resources/commonSet/MES/item");
            foreach (System.Xml.XmlNode xmlNode in messageList)
            {
                if (!string.IsNullOrEmpty(xmlNode.Attributes["key"].Value))
                    __dic.Add(xmlNode.Attributes["key"].Value, xmlNode.InnerText);
            }
            MessageBox.Show("加载成功", "提示");

        }
        private void btnClear_Click(object sender, EventArgs e)
        {
            txtNotice.Text = string.Empty;
        }
        [DllImport("User32.DLL")]
        public static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, StringBuilder lParam);
        [DllImport("User32.DLL")]
        public static extern IntPtr FindWindowEx(IntPtr hwndParent, IntPtr hwndChildAfter, string lpszClass, string lpszWindow);
        /// <summary>
        /// 获取对话框中子窗口控件的句柄
        /// </summary>
        [DllImport("User32.DLL")]
        public extern static IntPtr GetDlgItem(IntPtr hDlg, int nControlID);
        [DllImport("user32.dll")]
        public static extern int GetWindowTextLength(IntPtr hWnd);
        [DllImport("User32.dll", CharSet = CharSet.Auto)]
        public static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int nMaxCount);
        [DllImport("User32.dll", CharSet = CharSet.Auto)]
        public static extern int GetWindowTextEX(IntPtr hWnd, StringBuilder text, int nMaxCount);
        /// <summary>
        /// 回调函数代理
        /// </summary>
        public delegate bool CallBack(IntPtr hwnd, IntPtr lParam);
        [DllImport("user32.dll")]
        public static extern int EnumWindows(CallBack lpfn, int lParam);
        [DllImport("user32.dll")]
        public static extern int EnumChildWindows(IntPtr hWndParent, CallBack lpfn, int lParam);
        public const uint WM_SETTEXT = 0x000C;
        public const int WM_GETTEXT = 0x000D;
        public const int WM_QUIT = 0x12;   
        /// <summary>
        /// 子窗口回调处理函数
        /// </summary>
        /// <param name="hwnd"></param>
        /// <param name="lParam"></param>
        /// <returns></returns>
        public static bool ChildWindowProcess(IntPtr hwnd, IntPtr lParam)
        {
            Int32 length = GetWindowTextLength(hwnd);
            StringBuilder text = new StringBuilder(4028);
            SendMessage(hwnd, WM_GETTEXT, 4028, text);
            return true;
        }
        /// <summary>
        /// 窗口回调处理函数
        /// </summary>
        /// <param name="hwnd"></param>
        /// <param name="lParam"></param>
        /// <returns></returns>
        public static bool WindowProcess(IntPtr hwnd, IntPtr lParam)
        {
            EnumChildWindows(hwnd, new CallBack(ChildWindowProcess), 0);
            return true;
        }
        private void ChangeExtension(string path,string dst)
        {
            Process process = new Process();
            process.StartInfo.FileName = "cmd.exe";
            process.StartInfo.Arguments = "/c " + "type "+path + ">>" + dst;
            process.StartInfo.UseShellExecute = false;   //是否使用操作系统shell启动 
            process.StartInfo.CreateNoWindow = false;   //是否在新窗口中启动该进程的值 (不显示程序窗口)
            process.Start();
            process.WaitForExit();  //等待程序执行完退出进程
            process.Close();
        }
        public static void WriterFile(string path, string text)
        {
            System.IO.FileStream rw = System.IO.File.Open(path, System.IO.FileMode.Create);
            byte[] info = new UTF8Encoding(true).GetBytes(text);
            rw.Write(info, 0, info.Length);
            rw.Flush();
            rw.Close();
        }
        private void btnExtension_Click(object sender, EventArgs e)
        {
            string newPath = txtPath.Text;
            if (string.IsNullOrEmpty(newPath))
            {
                MessageBox.Show(this, "请输入新的路径", "提示");
                return;
            }
            if (!string.IsNullOrEmpty(__path) && System.IO.Directory.Exists(__path))
            {
                DateTime beginTime = DateTime.Now;
                List<string> list = GetFileList(__path);
                int index=0;
                foreach (string s in list)
                {
                    string relativePath = s.Substring(__path.Length);
                    string newDir = newPath + relativePath.Substring(0, relativePath.LastIndexOf('\\'));
                    if (!System.IO.Directory.Exists(newDir))
                    {
                        System.IO.Directory.CreateDirectory(newDir);
                    }
                    if (IsProgramExtension(s))
                    {
                        System.IO.File.Copy(s, newPath + relativePath,true);
                        ++index;
                    }
                    else
                    {
                        if (!cbAll.Checked&&!IsFileSerect(s))
                            continue;
                        ++index;
                        string dst = newPath + relativePath + DestExtension;
                        ChangeExtension(s, dst);
                        //WriterFile(newPath + relativePath + DestExtension, text);
                    }
                }
                DateTime endTime = DateTime.Now;
                WriteControl(string.Format("共处理文件：{0},处理：{1}用时：{2}", list.Count, index, (endTime - beginTime)));
            }
        }
        public string SourceExtension 
        {
            get{
                if (string.IsNullOrEmpty(cbxExtension.Text))
                    return ".cs";
                return cbxExtension.Text;
            }
        }
        public string DestExtension
        {
            get
            {
                if (string.IsNullOrEmpty(cbxDestExtension.Text))
                    return ".txt";
                return cbxDestExtension.Text;
            }
        }
        private void btnUnExtension_Click(object sender, EventArgs e)
        {
            List<string> list = GetFileList(__path);
            foreach (string s in list)
            {
                if (s.EndsWith(DestExtension+SourceExtension, true, System.Globalization.CultureInfo.CurrentCulture))
                {
                    string newFile =s.Remove(s.Length - SourceExtension.Length);
                    if (System.IO.File.Exists(newFile))
                        System.IO.File.Delete(newFile);
                    System.IO.File.Move(s, newFile);
                }
            }
            MessageBox.Show(this, "成功！", "提示");
        }
        public bool IsFileSerect(string path)
        {
           IEnumerable<string> line = System.IO.File.ReadLines(path);
           foreach (string s in line)
           {
              
               return System.Text.RegularExpressions.Regex.IsMatch(s, "E-SafeNet"/*\0\0LOCK"*/);
           }
           return false;
        }
        public List<string> GetAllFileList(string path)
        {
            List<string> list = new List<string>();
            string[] dir = System.IO.Directory.GetDirectories(path);
            string[] fileName = System.IO.Directory.GetFiles(path);
            for (int i = 0; i < dir.Length; i++)
            {
                list.AddRange(GetAllFileList(dir[i]));
            }
            for (int i = 0; i < fileName.Length; i++)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(fileName[i], "^.*\\" + SourceExtension + "$"))
                    list.Add(fileName[i]);
            }
            return list;
        }
        public bool ChangeFileExtension(string source, string dest)
        {
            System.Diagnostics.Process proc;
            try
            {
                proc = new System.Diagnostics.Process();
                proc.StartInfo.UseShellExecute = false;
                proc.StartInfo.RedirectStandardInput = true;
                proc.StartInfo.RedirectStandardOutput = true;
                proc.StartInfo.Arguments = string.Format(" /c ren \"{0}\" \"{1}\"", source, dest);
                proc.StartInfo.FileName = "cmd.exe";
                proc.Start();
                //WriteControl(string.Format("cmd.exe /c ren \"{0}\" \"{1}\"", source, dest));

                proc.Start();
                System.Threading.Thread.Sleep(20);
                proc.CloseMainWindow();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }


        private void btnReName_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(__path))
            {
                MessageBox.Show(this, "请输入新的路径", "提示");
                return;
            }
            List<string> allFileList = this.GetFileList(this.__path);
            foreach (string fullName in allFileList)
            {
                if (fullName.EndsWith(this.SourceExtension, true, System.Globalization.CultureInfo.CurrentCulture))
                {
                    string fileName = fullName.Substring(fullName.LastIndexOf('\\') + 1);
                    this.ChangeFileExtension(fullName, fileName.Substring(0, fileName.Length - this.SourceExtension.Length) + this.DestExtension);
                }
            }

        }

        private void FrmUnLanguage_Load(object sender, EventArgs e)
        {
            if (System.Configuration.ConfigurationSettings.AppSettings["DefaultPath"] != null)
            {
                if (System.IO.Directory.Exists(System.Configuration.ConfigurationSettings.AppSettings["DefaultPath"]))
                    __path = System.Configuration.ConfigurationSettings.AppSettings["DefaultPath"];
            }
        }

        private void btnCurrentPath_Click(object sender, EventArgs e)
        {
            txtPath.Text = __path;
        }



    }
}
