namespace Mshan.Document.WinFormDatabase
{
    partial class FrmImportDb
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtSourceConnection = new System.Windows.Forms.TextBox();
            this.txtDestinationConnection = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtNotice = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtTableD = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtTableS = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnSearch = new System.Windows.Forms.Button();
            this.btnDiff = new System.Windows.Forms.Button();
            this.btnImport = new System.Windows.Forms.Button();
            this.btnTigger = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.btnImportReg = new System.Windows.Forms.Button();
            this.btnCross = new System.Windows.Forms.Button();
            this.txtPathTrigge = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnRuleFile = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(42, 317);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(80, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "源数据库:";
            // 
            // txtSourceConnection
            // 
            this.txtSourceConnection.Location = new System.Drawing.Point(124, 311);
            this.txtSourceConnection.Margin = new System.Windows.Forms.Padding(4);
            this.txtSourceConnection.Name = "txtSourceConnection";
            this.txtSourceConnection.Size = new System.Drawing.Size(500, 26);
            this.txtSourceConnection.TabIndex = 1;
            this.txtSourceConnection.Text = "Password=ccense;User ID=ccense;Data Source=TongShanV1";
            // 
            // txtDestinationConnection
            // 
            this.txtDestinationConnection.Location = new System.Drawing.Point(822, 311);
            this.txtDestinationConnection.Margin = new System.Windows.Forms.Padding(4);
            this.txtDestinationConnection.Name = "txtDestinationConnection";
            this.txtDestinationConnection.Size = new System.Drawing.Size(500, 26);
            this.txtDestinationConnection.TabIndex = 3;
            this.txtDestinationConnection.Text = "Password=CCENSE;User ID=ccense;Data Source=TongShan";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(740, 317);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(80, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "目 标 库:";
            // 
            // txtNotice
            // 
            this.txtNotice.Location = new System.Drawing.Point(122, 13);
            this.txtNotice.Margin = new System.Windows.Forms.Padding(4);
            this.txtNotice.Multiline = true;
            this.txtNotice.Name = "txtNotice";
            this.txtNotice.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtNotice.Size = new System.Drawing.Size(1200, 276);
            this.txtNotice.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(40, 19);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 16);
            this.label3.TabIndex = 4;
            this.label3.Text = "消息提示:";
            // 
            // txtTableD
            // 
            this.txtTableD.Location = new System.Drawing.Point(822, 377);
            this.txtTableD.Margin = new System.Windows.Forms.Padding(4);
            this.txtTableD.Multiline = true;
            this.txtTableD.Name = "txtTableD";
            this.txtTableD.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtTableD.Size = new System.Drawing.Size(500, 154);
            this.txtTableD.TabIndex = 9;
            this.txtTableD.Text = "base_customers\r\nbase_customers_info\r\nrec_card_sell\r\nrec_card_make_acc\r\nrec_bllt\r\n" +
    "rec_loss\r\nbase_dept\r\nbase_emp\r\nbase_writeoff\r\nrec_refundment_list";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(740, 383);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(64, 16);
            this.label4.TabIndex = 8;
            this.label4.Text = "表结构:";
            // 
            // txtTableS
            // 
            this.txtTableS.Location = new System.Drawing.Point(124, 367);
            this.txtTableS.Margin = new System.Windows.Forms.Padding(4);
            this.txtTableS.Multiline = true;
            this.txtTableS.Name = "txtTableS";
            this.txtTableS.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtTableS.Size = new System.Drawing.Size(500, 154);
            this.txtTableS.TabIndex = 7;
            this.txtTableS.Text = "base_customers\r\nbase_customers\r\nrec_card_sell\r\nrec_card_make_acc\r\nrec_bllt\r\nrec_l" +
    "oss\r\nbase_dept\r\nbase_emp\r\nbase_writeoff\r\nrec_refundment_list";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(42, 373);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(64, 16);
            this.label5.TabIndex = 6;
            this.label5.Text = "表结构:";
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(121, 586);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(120, 42);
            this.btnSearch.TabIndex = 10;
            this.btnSearch.Text = "查询表结构";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // btnDiff
            // 
            this.btnDiff.Location = new System.Drawing.Point(271, 586);
            this.btnDiff.Name = "btnDiff";
            this.btnDiff.Size = new System.Drawing.Size(120, 42);
            this.btnDiff.TabIndex = 11;
            this.btnDiff.Text = "获取不同";
            this.btnDiff.UseVisualStyleBackColor = true;
            this.btnDiff.Click += new System.EventHandler(this.btnDiff_Click);
            // 
            // btnImport
            // 
            this.btnImport.Location = new System.Drawing.Point(838, 586);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(120, 42);
            this.btnImport.TabIndex = 13;
            this.btnImport.Text = "导入表";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // btnTigger
            // 
            this.btnTigger.Location = new System.Drawing.Point(688, 586);
            this.btnTigger.Name = "btnTigger";
            this.btnTigger.Size = new System.Drawing.Size(120, 42);
            this.btnTigger.TabIndex = 12;
            this.btnTigger.Text = "删除触发器";
            this.btnTigger.UseVisualStyleBackColor = true;
            this.btnTigger.Click += new System.EventHandler(this.btnTigger_Click);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(986, 586);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(120, 42);
            this.btnClear.TabIndex = 14;
            this.btnClear.Text = "清  空";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnImportReg
            // 
            this.btnImportReg.Location = new System.Drawing.Point(546, 586);
            this.btnImportReg.Name = "btnImportReg";
            this.btnImportReg.Size = new System.Drawing.Size(120, 42);
            this.btnImportReg.TabIndex = 15;
            this.btnImportReg.Text = "导入规则";
            this.btnImportReg.UseVisualStyleBackColor = true;
            this.btnImportReg.Click += new System.EventHandler(this.btnImportReg_Click);
            // 
            // btnCross
            // 
            this.btnCross.Location = new System.Drawing.Point(643, 310);
            this.btnCross.Name = "btnCross";
            this.btnCross.Size = new System.Drawing.Size(90, 24);
            this.btnCross.TabIndex = 16;
            this.btnCross.Text = " 交  换 ";
            this.btnCross.UseVisualStyleBackColor = true;
            this.btnCross.Click += new System.EventHandler(this.btnCross_Click);
            // 
            // txtPathTrigge
            // 
            this.txtPathTrigge.Location = new System.Drawing.Point(124, 540);
            this.txtPathTrigge.Margin = new System.Windows.Forms.Padding(4);
            this.txtPathTrigge.Name = "txtPathTrigge";
            this.txtPathTrigge.Size = new System.Drawing.Size(1194, 26);
            this.txtPathTrigge.TabIndex = 18;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(20, 544);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(96, 16);
            this.label6.TabIndex = 17;
            this.label6.Text = "触发器路径:";
            // 
            // btnRuleFile
            // 
            this.btnRuleFile.Location = new System.Drawing.Point(409, 586);
            this.btnRuleFile.Name = "btnRuleFile";
            this.btnRuleFile.Size = new System.Drawing.Size(120, 42);
            this.btnRuleFile.TabIndex = 19;
            this.btnRuleFile.Text = "读取规则文件";
            this.btnRuleFile.UseVisualStyleBackColor = true;
            this.btnRuleFile.Click += new System.EventHandler(this.btnRuleFile_Click);
            // 
            // FrmImportDb
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1331, 640);
            this.Controls.Add(this.btnRuleFile);
            this.Controls.Add(this.txtPathTrigge);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.btnCross);
            this.Controls.Add(this.btnImportReg);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnImport);
            this.Controls.Add(this.btnTigger);
            this.Controls.Add(this.btnDiff);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.txtTableD);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtTableS);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtNotice);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtDestinationConnection);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtSourceConnection);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FrmImportDb";
            this.Text = "FrmImportDb";
            this.Load += new System.EventHandler(this.FrmImportDb_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSourceConnection;
        private System.Windows.Forms.TextBox txtDestinationConnection;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtNotice;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtTableD;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtTableS;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Button btnDiff;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Button btnTigger;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btnImportReg;
        private System.Windows.Forms.Button btnCross;
        private System.Windows.Forms.TextBox txtPathTrigge;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnRuleFile;
    }
}