using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using Mshan.Document.Database;
using Mshan.Utilities.DbUtilities;

namespace Mshan.Document.WinFormDatabase
{
    public partial class FrmRegexcs : Form
    {
        public FrmRegexcs()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string text = System.IO.File.ReadAllText(txtPath.Text,Encoding.Default);
            MatchCollection matches = Regex.Matches(text, txtRegex.Text);
            foreach (Match match in matches)
            {
                for (int i = 0; i < match.Groups.Count; i++)
                {
                    txtNotice.AppendText(match.Groups[i].Value);
                    txtNotice.AppendText("——");

                }
                txtNotice.AppendText("\n");
            }

        }
        public Int32 __error=1000;
         
        private void button2_Click(object sender, EventArgs e)
        {
            DataTable dtCode = DbHelper.Fill("select max(to_number(errorcode)) from BASE_ERRORDICTIONARY  ");
            if (dtCode.Rows.Count > 0 && dtCode.Rows[0][0] != DBNull.Value)
                __error = Convert.ToInt32(dtCode.Rows[0][0]);
            
            string text = System.IO.File.ReadAllText(txtPath.Text, Encoding.Default);
            MatchCollection matches = Regex.Matches(text, txtRegex.Text);
            foreach (Match match in matches)
            {
                object count = DbHelper.ExecuteScalar(string.Format("select count(*) from BASE_ERRORDICTIONARY where errormessage='{0}'", match.Groups[2].Value.Replace("'","''")));
                if (Convert.ToInt32(count)==0)
                {
                    DbHelper.ExecuteNonQuery(string.Format("insert into BASE_ERRORDICTIONARY(errorcode,errormessage,body) values('{0}','{1}','{2}')"
                        , ++__error
                        , match.Groups[2].Value.Replace("'", "''")
                        , match.Groups[0].Value.Replace("'", "''")));
                }

            }
            MessageBox.Show(this, "入库完成", "提示");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dt = DbHelper.Fill("select * from BASE_ERRORDICTIONARY");
            string text = System.IO.File.ReadAllText(txtPath.Text, Encoding.Default);
            foreach (DataRow dataRow in dt.Rows)
            {
                //string body = Regex.Replace(dataRow["body"].ToString(), string.Format(@"out_result\s*\:\=\s*-(\d+);\s*\n\s*out_msg\s*\:\=({0});", dataRow["errormessage"].ToString().Replace("|", "\\|")), "out_result:=-" + dataRow["errorcode"].ToString() + "\r\nout_msg :=" + dataRow["errormessage"].ToString()+";");
                //text = text.Replace(dataRow["body"].ToString(), body);
                string body = "out_result:=-" + dataRow["errorcode"].ToString() + ";\r\nout_msg :=" + dataRow["errormessage"].ToString() + ";";
                text = Regex.Replace(text, string.Format(@"out_result\s*\:\=\s*-(\d+);\s*\n\s*out_msg\s*\:\=({0});", dataRow["errormessage"].ToString().Replace("|", "\\|").Replace("(", "\\(").Replace(")", "\\)")), body);
            }
            System.IO.File.WriteAllText(txtPath.Text.Replace(".sql","_code.sql"),text, Encoding.Default);
            MessageBox.Show(this, "替换完成", "提示");

        }
    }
}
