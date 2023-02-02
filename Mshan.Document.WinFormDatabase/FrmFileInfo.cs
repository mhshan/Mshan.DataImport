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
    public partial class FrmFileInfo : Form
    {
        public string PathSource { get; set; }
        public string PathDest { get; set; }
        public DateTime UpdateTime { get; set; }
        public bool IsOk { get; set; }
        public FrmFileInfo()
        {
            InitializeComponent();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            PathSource = txtPathS.Text.TrimEnd('\\');
            PathDest = txtPathD.Text.TrimEnd('\\');
            UpdateTime = Convert.ToDateTime(dtpUpdateTime.Value.ToShortDateString()+" "+dateTimePicker1.Value.ToShortTimeString());
            IsOk = true;
            this.Close();
        }

        private void FrmFileInfo_Load(object sender, EventArgs e)
        {
            IsOk = false;
        }
    }
}
