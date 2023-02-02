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
    public partial class FrmSegmentNo : Form
    {
        public bool IsStart { get; set; }
        public UInt64 Start = 0;
        public UInt64 End = 0;
        public FrmSegmentNo()
        {
            InitializeComponent();
        }

        private void btnCancle_Click(object sender, EventArgs e)
        {
            Start = 0;
            End = 0;
            IsStart = false;
            this.Close();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (UInt64.TryParse(txtStart.Text, out Start) && UInt64.TryParse(txtEnd.Text, out End))
            {
                if (Start <= End)
                {
                    IsStart = true;
                    this.Close();
                }
                else
                {
                    MessageBox.Show(this, "开始卡号，不能大于结束卡号", "提示", MessageBoxButtons.OK);
                }
            }
            else
            {
                MessageBox.Show(this, "卡号格式不正确", "提示", MessageBoxButtons.OK);
            }
        }

        private void FrmSegmentNo_Load(object sender, EventArgs e)
        {
            IsStart = false;
        }
    }
}
