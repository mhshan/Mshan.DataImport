using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using Renci.SshNet;
using Renci.SshNet.Sftp;
using System.IO;
namespace Newcapec.Tool.CreateCard
{
        /// <summary>
        /// SFTP操作类
        /// </summary>
        public class SftpHelper
        {
            private SftpClient sftp;
            public delegate void LogExceptionHandler(object sender,Exception ex);

            public event LogExceptionHandler OnLogExceptionEvent;
            /// <summary>
            /// 构造
            /// </summary>
            /// <param name="ip">IP</param>
            /// <param name="port">端口</param>
            /// <param name="user">用户名</param>
            /// <param name="pwd">密码</param>
            public SftpHelper(string ip, string port, string user, string pwd)
            {
                sftp = new SftpClient(ip, Int32.Parse(port), user, pwd);
            }

 
            /// <summary>
            /// 连接SFTP
            /// </summary>
            /// <returns>true成功</returns>
            public bool Connect()
            {
                try
                {
                    if (!sftp.IsConnected)
                    {
                        sftp.Connect();
                    }
                }
                catch (Exception ex)
                {
                    WriteExceptionLog(null, ex);
                }
                return sftp.IsConnected;
            }

            /// <summary>
            /// 断开SFTP
            /// </summary> 
            public void Disconnect()
            {
                try
                {
                    if (sftp != null && sftp.IsConnected)
                    {
                        sftp.Disconnect();
                    }
                }
                catch (Exception ex)
                {      
                    WriteExceptionLog(null, ex); 
                }
            }

            public void WriteExceptionLog(object sender,Exception ex)
            {
                if (OnLogExceptionEvent == null)
                {
                    OnLogExceptionEvent(sender, ex);
                }
            }
 
            /// <summary>
            /// SFTP上传文件
            /// </summary>
            /// <param name="localPath">本地路径</param>
            /// <param name="remotePath">远程路径</param>
            public void Put(string localPath, string remotePath)
            {
                try
                {
                    using (var file = File.OpenRead(localPath))
                    {
                        sftp.UploadFile(file, remotePath);
                    } 
                }
                catch (Exception ex)
                { 
                    WriteExceptionLog(null, ex); 
                } 
            }
             /// <summary>
            /// SFTP文件是否存在
            /// </summary>
            /// <param name="file">文件名</param>
            public bool Exists(string file)
            {
                try
                {
                        return sftp.Exists(file);
                }
                catch (Exception ex)
                { 
                    WriteExceptionLog(null, ex); 
                }
                return false;
            }

 
            /// <summary>
            /// SFTP获取文件
            /// </summary>
            /// <param name="remotePath">远程路径</param>
            /// <param name="localPath">本地路径</param>
            public void Get(string remotePath, string localPath)
            {
                try
                {
                    Connect();
                    var byt = sftp.ReadAllBytes(remotePath);
                    Disconnect();
                    File.WriteAllBytes(localPath, byt);
                }
                catch (Exception ex)
                {
                    WriteExceptionLog(null, ex); 
                } 
            }
 
            /// <summary>
            /// 删除SFTP文件 
            /// </summary>
            /// <param name="remoteFile">远程路径</param>
            public void Delete(string remoteFile)
            {
                try
                {
                    Connect();
                    sftp.Delete(remoteFile);
                    Disconnect();
                }
                catch (Exception ex)
                { 
                    WriteExceptionLog(null, ex); 
                }
            }

            /// <summary>
            /// 获取SFTP文件列表
            /// </summary>
            /// <param name="remotePath">远程目录</param>
            /// <param name="fileSuffix">文件后缀</param>
            /// <returns></returns>
            public ArrayList GetFileList(string remotePath, string fileSuffix)
            {
                var objList = new ArrayList();
                try
                {
                    var files = sftp.ListDirectory(remotePath);
                    foreach (var file in files)
                    {
                        string name = file.Name;
                        if (name.Length > (fileSuffix.Length + 1) && fileSuffix == name.Substring(name.Length - fileSuffix.Length))
                        {
                            objList.Add(name);
                        }
                    }
                }
                catch (Exception ex)
                {
                    WriteExceptionLog(null, ex); 
                }
                return objList;
            }
      
            /// <summary>
            /// 移动SFTP文件
            /// </summary>
            /// <param name="oldRemotePath">旧远程路径</param>
            /// <param name="newRemotePath">新远程路径</param>
            public void Move(string oldRemotePath, string newRemotePath)
            {
                try
                { 
                    sftp.RenameFile(oldRemotePath, newRemotePath); 
                }
                catch (Exception ex)
                {
                   WriteExceptionLog(null, ex); 
                }
            }



            public int DownloadFtp(string filePath, string localPath, string fileName)
            {
                string localFileName = localPath + "/" + fileName;
                string remoteFileName = filePath + "/" + fileName;

                try
                {
                    using (var file = File.OpenWrite(localFileName))
                    {
                        sftp.DownloadFile(remoteFileName, file);
                    }
                    Console.WriteLine("下载文件成功,文件路径：{localFileName}");
                    return 0;
                }
                catch (Exception ex)
                {
                    WriteExceptionLog(null, ex);
                }
                return -1;
            }

        }
}

