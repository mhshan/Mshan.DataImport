using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Mshan.Document.WinFormDatabase
{
    public partial class FrmFileHandle : Form
    {
        public FrmFileHandle()
        {
            InitializeComponent();
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
                string[] textAll= System.IO.File.ReadAllLines(file,Encoding.UTF8);
                if (textAll.Length>1)
                {
                    string fileName = file.Substring(file.LastIndexOf('\\') + 1);
                    fileName = fileName.Substring(0, fileName.LastIndexOf('.'));
                    //string posId=fileName.Substring(fileName.Length - 9);
                    //string posName = fileName.Substring(0,fileName.Length-10);
                    string posId = fileName;
                    string posName = fileName;
                    //txtNotice.AppendText(fileName + "," + textAll[1] + "\r");
                    txtNotice.AppendText(string.Format(
@"declare
            n_count number;
            begin
                select count(*) into n_count from base_ccbpublickey where posid='{0}';
                if n_count>0
                then
                    update base_ccbpublickey set publickey='{1}' where posid='{0}';
                else
                    insert into base_ccbpublickey(posid,posname,publickey,customerunitcode) values('{0}','{2}','{1}','08600000006');
            end if;
            end;
/
", posId, textAll[1].Trim().TrimStart('[').TrimEnd(']'), posName));

                }
            }
        }
    }
}
