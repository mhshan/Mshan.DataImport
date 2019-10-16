﻿namespace Mshan.Document.WinFormDatabase
{
    partial class FrmUnLanguage
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbAll = new System.Windows.Forms.CheckBox();
            this.btnReName = new System.Windows.Forms.Button();
            this.cbxDestExtension = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cbxExtension = new System.Windows.Forms.ComboBox();
            this.txtPath = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNotice = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnUnExtension = new System.Windows.Forms.Button();
            this.btnExtension = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.btnLanguage = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.btnLoad = new System.Windows.Forms.Button();
            this.btnCurrentPath = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnCurrentPath);
            this.groupBox1.Controls.Add(this.cbAll);
            this.groupBox1.Controls.Add(this.btnReName);
            this.groupBox1.Controls.Add(this.cbxDestExtension);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cbxExtension);
            this.groupBox1.Controls.Add(this.txtPath);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtNotice);
            this.groupBox1.Location = new System.Drawing.Point(16, 16);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(1018, 422);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "提  示";
            // 
            // cbAll
            // 
            this.cbAll.AutoSize = true;
            this.cbAll.Location = new System.Drawing.Point(771, 391);
            this.cbAll.Name = "cbAll";
            this.cbAll.Size = new System.Drawing.Size(83, 20);
            this.cbAll.TabIndex = 8;
            this.cbAll.Text = "全  选 ";
            this.cbAll.UseVisualStyleBackColor = true;
            // 
            // btnReName
            // 
            this.btnReName.Location = new System.Drawing.Point(860, 379);
            this.btnReName.Name = "btnReName";
            this.btnReName.Size = new System.Drawing.Size(120, 36);
            this.btnReName.TabIndex = 7;
            this.btnReName.Text = "重命名";
            this.btnReName.UseVisualStyleBackColor = true;
            this.btnReName.Click += new System.EventHandler(this.btnReName_Click);
            // 
            // cbxDestExtension
            // 
            this.cbxDestExtension.FormattingEnabled = true;
            this.cbxDestExtension.Items.AddRange(new object[] {
            ".cs",
            ".txt",
            ".cpp",
            ".c",
            ".java"});
            this.cbxDestExtension.Location = new System.Drawing.Point(537, 386);
            this.cbxDestExtension.Name = "cbxDestExtension";
            this.cbxDestExtension.Size = new System.Drawing.Size(222, 24);
            this.cbxDestExtension.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(411, 394);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(120, 16);
            this.label3.TabIndex = 5;
            this.label3.Text = "目标扩展类型：";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 394);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(104, 16);
            this.label2.TabIndex = 4;
            this.label2.Text = "源扩展类型：";
            // 
            // cbxExtension
            // 
            this.cbxExtension.FormattingEnabled = true;
            this.cbxExtension.Items.AddRange(new object[] {
            ".cs",
            ".txt",
            ".cpp",
            ".c",
            ".java"});
            this.cbxExtension.Location = new System.Drawing.Point(127, 389);
            this.cbxExtension.Name = "cbxExtension";
            this.cbxExtension.Size = new System.Drawing.Size(222, 24);
            this.cbxExtension.TabIndex = 3;
            // 
            // txtPath
            // 
            this.txtPath.Location = new System.Drawing.Point(82, 344);
            this.txtPath.Name = "txtPath";
            this.txtPath.Size = new System.Drawing.Size(772, 26);
            this.txtPath.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 347);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 16);
            this.label1.TabIndex = 1;
            this.label1.Text = "路径：";
            // 
            // txtNotice
            // 
            this.txtNotice.Location = new System.Drawing.Point(23, 25);
            this.txtNotice.Multiline = true;
            this.txtNotice.Name = "txtNotice";
            this.txtNotice.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtNotice.Size = new System.Drawing.Size(986, 306);
            this.txtNotice.TabIndex = 0;
            this.txtNotice.WordWrap = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnUnExtension);
            this.groupBox2.Controls.Add(this.btnExtension);
            this.groupBox2.Controls.Add(this.btnClear);
            this.groupBox2.Controls.Add(this.btnLanguage);
            this.groupBox2.Controls.Add(this.btnClose);
            this.groupBox2.Controls.Add(this.btnStart);
            this.groupBox2.Controls.Add(this.btnLoad);
            this.groupBox2.Location = new System.Drawing.Point(16, 446);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox2.Size = new System.Drawing.Size(1009, 76);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "操  作";
            // 
            // btnUnExtension
            // 
            this.btnUnExtension.Location = new System.Drawing.Point(430, 28);
            this.btnUnExtension.Name = "btnUnExtension";
            this.btnUnExtension.Size = new System.Drawing.Size(120, 36);
            this.btnUnExtension.TabIndex = 6;
            this.btnUnExtension.Text = "去除扩展名";
            this.btnUnExtension.UseVisualStyleBackColor = true;
            this.btnUnExtension.Click += new System.EventHandler(this.btnUnExtension_Click);
            // 
            // btnExtension
            // 
            this.btnExtension.Location = new System.Drawing.Point(296, 28);
            this.btnExtension.Name = "btnExtension";
            this.btnExtension.Size = new System.Drawing.Size(120, 36);
            this.btnExtension.TabIndex = 5;
            this.btnExtension.Text = "增加扩展名";
            this.btnExtension.UseVisualStyleBackColor = true;
            this.btnExtension.Click += new System.EventHandler(this.btnExtension_Click);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(706, 26);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(120, 36);
            this.btnClear.TabIndex = 4;
            this.btnClear.Text = "清  除";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnLanguage
            // 
            this.btnLanguage.Location = new System.Drawing.Point(162, 28);
            this.btnLanguage.Name = "btnLanguage";
            this.btnLanguage.Size = new System.Drawing.Size(120, 36);
            this.btnLanguage.TabIndex = 3;
            this.btnLanguage.Text = "语言文件";
            this.btnLanguage.UseVisualStyleBackColor = true;
            this.btnLanguage.Click += new System.EventHandler(this.btnLanguage_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(846, 26);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(120, 36);
            this.btnClose.TabIndex = 2;
            this.btnClose.Text = "关  闭";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(563, 28);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(120, 36);
            this.btnStart.TabIndex = 1;
            this.btnStart.Text = "处  理";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // btnLoad
            // 
            this.btnLoad.Location = new System.Drawing.Point(20, 28);
            this.btnLoad.Name = "btnLoad";
            this.btnLoad.Size = new System.Drawing.Size(120, 36);
            this.btnLoad.TabIndex = 0;
            this.btnLoad.Text = "加  载 ";
            this.btnLoad.UseVisualStyleBackColor = true;
            this.btnLoad.Click += new System.EventHandler(this.btnLoad_Click);
            // 
            // btnCurrentPath
            // 
            this.btnCurrentPath.Location = new System.Drawing.Point(860, 337);
            this.btnCurrentPath.Name = "btnCurrentPath";
            this.btnCurrentPath.Size = new System.Drawing.Size(120, 36);
            this.btnCurrentPath.TabIndex = 9;
            this.btnCurrentPath.Text = "当前路径";
            this.btnCurrentPath.UseVisualStyleBackColor = true;
            this.btnCurrentPath.Click += new System.EventHandler(this.btnCurrentPath_Click);
            // 
            // FrmUnLanguage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1037, 532);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FrmUnLanguage";
            this.Text = "FrmUnLanguage";
            this.Load += new System.EventHandler(this.FrmUnLanguage_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtNotice;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Button btnLoad;
        private System.Windows.Forms.Button btnLanguage;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.TextBox txtPath;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnExtension;
        private System.Windows.Forms.Button btnUnExtension;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbxExtension;
        private System.Windows.Forms.ComboBox cbxDestExtension;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnReName;
        private System.Windows.Forms.CheckBox cbAll;
        private System.Windows.Forms.Button btnCurrentPath;
    }
}