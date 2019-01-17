namespace Mshan.BankSecret
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btnSecret = new System.Windows.Forms.Button();
            this.txtSecret = new System.Windows.Forms.TextBox();
            this.txtSource = new System.Windows.Forms.TextBox();
            this.txtKey = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnVerifySigature = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnSecret
            // 
            this.btnSecret.Location = new System.Drawing.Point(68, 500);
            this.btnSecret.Name = "btnSecret";
            this.btnSecret.Size = new System.Drawing.Size(100, 36);
            this.btnSecret.TabIndex = 0;
            this.btnSecret.Text = " 密  码 ";
            this.btnSecret.UseVisualStyleBackColor = true;
            this.btnSecret.Click += new System.EventHandler(this.btnSecret_Click);
            // 
            // txtSecret
            // 
            this.txtSecret.Location = new System.Drawing.Point(68, 238);
            this.txtSecret.Multiline = true;
            this.txtSecret.Name = "txtSecret";
            this.txtSecret.Size = new System.Drawing.Size(1034, 256);
            this.txtSecret.TabIndex = 1;
            // 
            // txtSource
            // 
            this.txtSource.Location = new System.Drawing.Point(68, 65);
            this.txtSource.Multiline = true;
            this.txtSource.Name = "txtSource";
            this.txtSource.Size = new System.Drawing.Size(1034, 154);
            this.txtSource.TabIndex = 2;
            this.txtSource.Text = "MERFLAG=1&MERCHANTID=105000000000000&POSID=000000000&TERMNO1=&TERMNO2=&BRANCHID=1" +
                "10000000&ORDERID=105000000000000123456&QRCODE=CCB9991234567&AMOUNT=0.01&TXCODE=P" +
                "AY100";
            // 
            // txtKey
            // 
            this.txtKey.Location = new System.Drawing.Point(68, 25);
            this.txtKey.Name = "txtKey";
            this.txtKey.Size = new System.Drawing.Size(788, 21);
            this.txtKey.TabIndex = 3;
            this.txtKey.Text = "Er@9f7DE";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(10, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 21);
            this.label1.TabIndex = 4;
            this.label1.Text = "key:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.Location = new System.Drawing.Point(3, 130);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 21);
            this.label2.TabIndex = 5;
            this.label2.Text = "源文件:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label3.Location = new System.Drawing.Point(3, 296);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 21);
            this.label3.TabIndex = 6;
            this.label3.Text = "加密:";
            // 
            // btnVerifySigature
            // 
            this.btnVerifySigature.Location = new System.Drawing.Point(195, 500);
            this.btnVerifySigature.Name = "btnVerifySigature";
            this.btnVerifySigature.Size = new System.Drawing.Size(100, 36);
            this.btnVerifySigature.TabIndex = 7;
            this.btnVerifySigature.Text = " 验  签";
            this.btnVerifySigature.UseVisualStyleBackColor = true;
            this.btnVerifySigature.Click += new System.EventHandler(this.btnVerifySigature_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1114, 545);
            this.Controls.Add(this.btnVerifySigature);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtKey);
            this.Controls.Add(this.txtSource);
            this.Controls.Add(this.txtSecret);
            this.Controls.Add(this.btnSecret);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSecret;
        private System.Windows.Forms.TextBox txtSecret;
        private System.Windows.Forms.TextBox txtSource;
        private System.Windows.Forms.TextBox txtKey;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnVerifySigature;
    }
}

