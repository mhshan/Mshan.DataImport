using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Paddings;
using Org.BouncyCastle.Crypto.Encodings;
using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System.Security.Cryptography;
using System.IO;
namespace Mshan.BankSecret
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSecret_Click(object sender, EventArgs e)
        {/*java动态库，不需要java环境*/
            String key = txtKey.Text;
            //textBox1.Text=COM.CCB.EnDecryptAlgorithm.MCipherEncryptor.EncodeBase64String(System.Text.ASCIIEncoding.Default.GetBytes(key));
            COM.CCB.EnDecryptAlgorithm.MCipherEncryptor encryptor = new COM.CCB.EnDecryptAlgorithm.MCipherEncryptor(key);
            string textSecret = encryptor.doEncrypt(txtSource.Text);
            txtSecret.Text = "java输出：\r\n";
            txtSecret.Text += textSecret;

            /*.net 版*/
            textSecret = string.Empty;
            /*
            * UTF-16BE: 16 位 UCS 转换格式，Big Endian（最低地址存放高位字节，符合人们的阅读习惯）字节顺序   
            * UTF-16LE: 16 位 UCS 转换格式，Little-endian（最高地址存放高位字节）字节顺序   */
            byte[] textArray = Encoding.GetEncoding("UTF-16BE").GetBytes(txtSource.Text);
            byte[] temp = new byte[textArray.Length + 2];
            temp[0] = 0Xfe;
            temp[1] = 0Xff;//UTF-16 BE(0XFE 0XFF)和LE（0XFF 0XFE）
            textArray.CopyTo(temp, 2);
            byte[] textSecretArray = Encrypt(txtKey.Text, temp);
            textSecret = Convert.ToBase64String(textSecretArray, Base64FormattingOptions.InsertLineBreaks);//Java每隔 76 个字符插入分行符。
            textSecret = textSecret.Replace("+", ",");
            textSecret = UrlEncode(textSecret);
            txtSecret.Text += "\r\n\r\n.net 第三方类库输出：";
            txtSecret.Text += "\r\n"+textSecret;

             
            DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
            dCSP.Padding = PaddingMode.PKCS7;
            dCSP.Mode = CipherMode.ECB;
            MemoryStream mStream = new MemoryStream();
            CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(Encoding.GetEncoding("ISO-8859-1").GetBytes(txtKey.Text), new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }), CryptoStreamMode.Write);
            cStream.Write(temp, 0, temp.Length);
            cStream.FlushFinalBlock();
            byte[] inputByteArray = mStream.ToArray();
            textSecret = Convert.ToBase64String(inputByteArray, Base64FormattingOptions.InsertLineBreaks);//Java每隔 76 个字符插入分行符。
            textSecret = textSecret.Replace("+", ",");
            textSecret = UrlEncode(textSecret);
            txtSecret.Text += "\r\n\r\n.net Des加密输出2：";
            txtSecret.Text += "\r\n" + textSecret;
        }
        /// <summary>
        /// 兼容java UrlEncode
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string UrlEncode(string str)
        {
            StringBuilder builder = new StringBuilder();
            foreach (char c in str)
            {
                string s = System.Web.HttpUtility.UrlEncode(c.ToString());
                if (s.Length > 1)
                    builder.Append(s.ToUpper());//java UrlEncode为大写
                else
                    builder.Append(c);
            }
            return builder.ToString();
        }
        IBlockCipher engine = new DesEngine();
        private byte[] Encrypt(string keys, byte[] ptBytes)
        {
            byte[] key = Encoding.GetEncoding("ISO-8859-1").GetBytes(keys);
            //byte[] k = new byte[16];
            IBufferedCipher cipher = Org.BouncyCastle.Security.CipherUtilities.GetCipher("DES/ECB/PKCS5Padding");
            ICipherParameters cipherParameters = new KeyParameter(key);
            cipher.Init(true, cipherParameters);
            byte[] rv = new byte[cipher.GetOutputSize(ptBytes.Length)];
            int tam = cipher.ProcessBytes(ptBytes, 0, ptBytes.Length, rv, 0);
            cipher.DoFinal(rv, tam);
            return rv;
        }

        private void btnVerifySigature_Click(object sender, EventArgs e)
        {
            NetPaySocketUtil payUitl = new NetPaySocketUtil();
            string signRet = payUitl.exeSign("127.0.0.1", 55533, txtSource.Text);
            txtSecret.Text = signRet;
           
            string[] source = System.Text.RegularExpressions.Regex.Split(txtSource.Text, "&SIGN=");
            ISigner signer = SignerUtilities.GetSigner("MD5withRSA");
            byte[] keyArray=HexStrToBytes(txtKey.Text);
            ICipherParameters cipherParameters = new Org.BouncyCastle.Crypto.Parameters.RsaKeyParameters(false, Org.BouncyCastle.Math.BigInteger.One, Org.BouncyCastle.Math.BigInteger.One);
            signer.Init(false, cipherParameters);
            byte[] sourceArray = Encoding.ASCII.GetBytes(source[0]);
            signer.BlockUpdate(sourceArray,0,sourceArray.Length);
            bool result = signer.VerifySignature(HexStrToBytes(source[1]));
            txtSecret.Text += "\r\n" + result;
            //MD5WithRSA.VerifyData(txtKey.Text,string.Empty,source[0],source[1]);
        }
        private static char[] bcdLookup = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
        /// <summary>
        /// 将签名结果转化为16进制字符串
        /// </summary>
        /// <param name="bcd">签名结果的byte数字</param>
        /// <returns>16进制字符串</returns>
        private static string BytesToHexStr(byte[] bcd)
        {
            StringBuilder s = new StringBuilder(bcd.Length * 2);
            for (int i = 0; i < bcd.Length; i++)
            {
                s.Append(bcdLookup[(bcd[i] >> 4) & 0x0f]);
                s.Append(bcdLookup[bcd[i] & 0x0f]);
            }
            return s.ToString();
        }

        public static byte[] HexStrToBytes(String s)
        {
            byte[] bytes = new byte[s.Length / 2];

            for (int i = 0; i < bytes.Length; i++)
            {
                bytes[i] = Convert.ToByte(s.Substring(2 * i, 2), 16);
            }
            return bytes;
        }
    }
}
