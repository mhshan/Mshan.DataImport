namespace Mshan.Document.WinFormDatabase
{
    partial class FrmCardData
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
            this.btnCreate = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtUrl = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtIp = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtKey = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtCustomerUnitcode = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtCount = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnCancle = new System.Windows.Forms.Button();
            this.txtPath = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtNotice = new System.Windows.Forms.TextBox();
            this.btnRar = new System.Windows.Forms.Button();
            this.txtCityCode = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.txtSftpIp = new System.Windows.Forms.TextBox();
            this.txtSftpPort = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtSftpUser = new System.Windows.Forms.TextBox();
            this.txtSftpPassword = new System.Windows.Forms.TextBox();
            this.btnSftpUpload = new System.Windows.Forms.Button();
            this.label13 = new System.Windows.Forms.Label();
            this.txtZipFile = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.btnSaveConfig = new System.Windows.Forms.Button();
            this.btnReCreate = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCreate
            // 
            this.btnCreate.Location = new System.Drawing.Point(257, 596);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(120, 42);
            this.btnCreate.TabIndex = 0;
            this.btnCreate.Text = "生  成";
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(52, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 19);
            this.label1.TabIndex = 1;
            this.label1.Text = "Url：";
            // 
            // txtUrl
            // 
            this.txtUrl.Location = new System.Drawing.Point(116, 39);
            this.txtUrl.Name = "txtUrl";
            this.txtUrl.Size = new System.Drawing.Size(717, 29);
            this.txtUrl.TabIndex = 2;
            this.txtUrl.Text = "http://120.195.27.120:9980/webService/Newcapec.Bus.ThridPartyApi.asmx";
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(116, 88);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(272, 29);
            this.txtId.TabIndex = 4;
            this.txtId.Text = "4";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(52, 94);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 19);
            this.label2.TabIndex = 3;
            this.label2.Text = "ID：";
            // 
            // txtIp
            // 
            this.txtIp.Location = new System.Drawing.Point(508, 88);
            this.txtIp.Name = "txtIp";
            this.txtIp.Size = new System.Drawing.Size(272, 29);
            this.txtIp.TabIndex = 6;
            this.txtIp.Text = "192.168.60.31";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(444, 94);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 19);
            this.label3.TabIndex = 5;
            this.label3.Text = "IP：";
            // 
            // txtKey
            // 
            this.txtKey.Location = new System.Drawing.Point(116, 136);
            this.txtKey.Name = "txtKey";
            this.txtKey.Size = new System.Drawing.Size(272, 29);
            this.txtKey.TabIndex = 8;
            this.txtKey.Text = "123456";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(52, 142);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(58, 19);
            this.label4.TabIndex = 7;
            this.label4.Text = "Key：";
            // 
            // txtCustomerUnitcode
            // 
            this.txtCustomerUnitcode.Location = new System.Drawing.Point(508, 136);
            this.txtCustomerUnitcode.Name = "txtCustomerUnitcode";
            this.txtCustomerUnitcode.Size = new System.Drawing.Size(272, 29);
            this.txtCustomerUnitcode.TabIndex = 10;
            this.txtCustomerUnitcode.Text = "08600000001";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(400, 142);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(104, 19);
            this.label5.TabIndex = 9;
            this.label5.Text = "客户代码：";
            // 
            // txtCount
            // 
            this.txtCount.Location = new System.Drawing.Point(116, 189);
            this.txtCount.Name = "txtCount";
            this.txtCount.Size = new System.Drawing.Size(272, 29);
            this.txtCount.TabIndex = 12;
            this.txtCount.Text = "0";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(46, 195);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(66, 19);
            this.label6.TabIndex = 11;
            this.label6.Text = "数量：";
            // 
            // btnCancle
            // 
            this.btnCancle.Location = new System.Drawing.Point(820, 596);
            this.btnCancle.Name = "btnCancle";
            this.btnCancle.Size = new System.Drawing.Size(120, 42);
            this.btnCancle.TabIndex = 13;
            this.btnCancle.Text = "取  消";
            this.btnCancle.UseVisualStyleBackColor = true;
            this.btnCancle.Click += new System.EventHandler(this.btnCancle_Click);
            // 
            // txtPath
            // 
            this.txtPath.Location = new System.Drawing.Point(116, 238);
            this.txtPath.Name = "txtPath";
            this.txtPath.Size = new System.Drawing.Size(664, 29);
            this.txtPath.TabIndex = 15;
            this.txtPath.Text = "d:\\card";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 244);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(104, 19);
            this.label7.TabIndex = 14;
            this.label7.Text = "生成路径：";
            // 
            // txtNotice
            // 
            this.txtNotice.Location = new System.Drawing.Point(116, 438);
            this.txtNotice.Multiline = true;
            this.txtNotice.Name = "txtNotice";
            this.txtNotice.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtNotice.Size = new System.Drawing.Size(812, 152);
            this.txtNotice.TabIndex = 16;
            // 
            // btnRar
            // 
            this.btnRar.Location = new System.Drawing.Point(538, 596);
            this.btnRar.Name = "btnRar";
            this.btnRar.Size = new System.Drawing.Size(120, 42);
            this.btnRar.TabIndex = 17;
            this.btnRar.Text = "压  缩";
            this.btnRar.UseVisualStyleBackColor = true;
            this.btnRar.Click += new System.EventHandler(this.btnRar_Click);
            // 
            // txtCityCode
            // 
            this.txtCityCode.Location = new System.Drawing.Point(508, 185);
            this.txtCityCode.Name = "txtCityCode";
            this.txtCityCode.Size = new System.Drawing.Size(272, 29);
            this.txtCityCode.TabIndex = 19;
            this.txtCityCode.Text = "3110";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(400, 192);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(104, 19);
            this.label8.TabIndex = 18;
            this.label8.Text = "城市代码：";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(8, 343);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(106, 19);
            this.label9.TabIndex = 20;
            this.label9.Text = "sftp地址：";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(6, 395);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(106, 19);
            this.label11.TabIndex = 22;
            this.label11.Text = "sftp用户：";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(398, 395);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(106, 19);
            this.label12.TabIndex = 23;
            this.label12.Text = "sftp密码：";
            // 
            // txtSftpIp
            // 
            this.txtSftpIp.Location = new System.Drawing.Point(116, 340);
            this.txtSftpIp.Name = "txtSftpIp";
            this.txtSftpIp.Size = new System.Drawing.Size(272, 29);
            this.txtSftpIp.TabIndex = 24;
            this.txtSftpIp.Text = "192.168.51.170";
            // 
            // txtSftpPort
            // 
            this.txtSftpPort.Location = new System.Drawing.Point(508, 340);
            this.txtSftpPort.Name = "txtSftpPort";
            this.txtSftpPort.Size = new System.Drawing.Size(272, 29);
            this.txtSftpPort.TabIndex = 25;
            this.txtSftpPort.Text = "22";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(398, 343);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(106, 19);
            this.label10.TabIndex = 26;
            this.label10.Text = "sftp端口：";
            // 
            // txtSftpUser
            // 
            this.txtSftpUser.Location = new System.Drawing.Point(116, 392);
            this.txtSftpUser.Name = "txtSftpUser";
            this.txtSftpUser.Size = new System.Drawing.Size(272, 29);
            this.txtSftpUser.TabIndex = 27;
            this.txtSftpUser.Text = "sftpuser";
            // 
            // txtSftpPassword
            // 
            this.txtSftpPassword.Location = new System.Drawing.Point(508, 387);
            this.txtSftpPassword.Name = "txtSftpPassword";
            this.txtSftpPassword.Size = new System.Drawing.Size(272, 29);
            this.txtSftpPassword.TabIndex = 28;
            this.txtSftpPassword.Text = "sftpuser";
            // 
            // btnSftpUpload
            // 
            this.btnSftpUpload.Location = new System.Drawing.Point(681, 596);
            this.btnSftpUpload.Name = "btnSftpUpload";
            this.btnSftpUpload.Size = new System.Drawing.Size(120, 42);
            this.btnSftpUpload.TabIndex = 29;
            this.btnSftpUpload.Text = "sftp上传";
            this.btnSftpUpload.UseVisualStyleBackColor = true;
            this.btnSftpUpload.Click += new System.EventHandler(this.btnSftpUpload_Click);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(8, 293);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(104, 19);
            this.label13.TabIndex = 30;
            this.label13.Text = "生成文件：";
            // 
            // txtZipFile
            // 
            this.txtZipFile.Location = new System.Drawing.Point(116, 290);
            this.txtZipFile.Name = "txtZipFile";
            this.txtZipFile.Size = new System.Drawing.Size(664, 29);
            this.txtZipFile.TabIndex = 31;
            // 
            // label14
            // 
            this.label14.ForeColor = System.Drawing.Color.Red;
            this.label14.Location = new System.Drawing.Point(786, 290);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(194, 41);
            this.label14.TabIndex = 32;
            this.label14.Text = "上传到sftp的文件，可手动修改";
            // 
            // btnSaveConfig
            // 
            this.btnSaveConfig.Location = new System.Drawing.Point(116, 596);
            this.btnSaveConfig.Name = "btnSaveConfig";
            this.btnSaveConfig.Size = new System.Drawing.Size(120, 42);
            this.btnSaveConfig.TabIndex = 33;
            this.btnSaveConfig.Text = "保存配置";
            this.btnSaveConfig.UseVisualStyleBackColor = true;
            this.btnSaveConfig.Click += new System.EventHandler(this.btnSaveConfig_Click);
            // 
            // btnReCreate
            // 
            this.btnReCreate.Location = new System.Drawing.Point(401, 596);
            this.btnReCreate.Name = "btnReCreate";
            this.btnReCreate.Size = new System.Drawing.Size(120, 42);
            this.btnReCreate.TabIndex = 34;
            this.btnReCreate.Text = "重新生成";
            this.btnReCreate.UseVisualStyleBackColor = true;
            this.btnReCreate.Click += new System.EventHandler(this.btnReCreate_Click);
            // 
            // FrmCardData
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 19F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(984, 661);
            this.Controls.Add(this.btnReCreate);
            this.Controls.Add(this.btnSaveConfig);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.txtZipFile);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.btnSftpUpload);
            this.Controls.Add(this.txtSftpPassword);
            this.Controls.Add(this.txtSftpUser);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtSftpPort);
            this.Controls.Add(this.txtSftpIp);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtCityCode);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.btnRar);
            this.Controls.Add(this.txtNotice);
            this.Controls.Add(this.txtPath);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.btnCancle);
            this.Controls.Add(this.txtCount);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtCustomerUnitcode);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtKey);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtIp);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtUrl);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCreate);
            this.Font = new System.Drawing.Font("宋体", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.Name = "FrmCardData";
            this.Text = "获取制卡数据";
            this.Load += new System.EventHandler(this.FrmCardData_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCreate;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtUrl;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtIp;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtKey;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtCustomerUnitcode;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtCount;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnCancle;
        private System.Windows.Forms.TextBox txtPath;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtNotice;
        private System.Windows.Forms.Button btnRar;
        private System.Windows.Forms.TextBox txtCityCode;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtSftpIp;
        private System.Windows.Forms.TextBox txtSftpPort;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtSftpUser;
        private System.Windows.Forms.TextBox txtSftpPassword;
        private System.Windows.Forms.Button btnSftpUpload;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtZipFile;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Button btnSaveConfig;
        private System.Windows.Forms.Button btnReCreate;
    }
}