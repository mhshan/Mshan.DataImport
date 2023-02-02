using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
namespace TestRpcx
{
    class Program
    {
        static void Main(string[] args)
        {
            string path=AppDomain.CurrentDomain.BaseDirectory+"\\log.txt";
            while (true)
            {
                try
                {
                    // write request
                    WebRequest request = WebRequest.Create("http://127.0.0.1:9981/Service/Pay/");
                    request.Timeout =  5*60 * 1000;
                    request.Method = "POST";
                    request.Headers.Add("X-RPCX-MessageID", DateTime.Now.ToString("HHmmssfff"));
                    request.Headers.Add("X-RPCX-MesssageType", "0");
                    request.Headers.Add("X-RPCX-SerializeType", "1");
                    request.Headers.Add("X-RPCX-ServicePath", "SvcPaySQLSync");
                    request.Headers.Add("X-RPCX-ServiceMethod", "NotifyUserChanged");
                    UserChangeData userChangeData = new UserChangeData();
                    userChangeData.DpId = 1;
                    userChangeData.ChangeedList = new List<UserIdChangePair>();
                    UserIdChangePair pair = new UserIdChangePair();
                    pair.UD = "xxxx";
                    pair.UserId = "5";
                    userChangeData.ChangeedList.Add(pair);
                    //byte[] bizData = new byte[userChangeData.CalculateSize()];
                    //Google.Protobuf.CodedOutputStream bizStream = new Google.Protobuf.CodedOutputStream(bizData);
                    //userChangeData.WriteTo(bizStream);
                    string postData = JsonHelper.Serialize(userChangeData);
                    //string postData = "{\"UserIdChangePair\":[{\"UserId\":\"sucess\", \"UD\":1}], \"DpId\"}";
                    byte[] byteArray = Encoding.UTF8.GetBytes(postData);
                    //byte[] byteArray = bizData;
                    request.ContentType = "application/rpcx";
                    request.ContentLength = byteArray.Length;
                    Stream dataStream = request.GetRequestStream();
                    dataStream.Write(byteArray, 0, byteArray.Length);
                    dataStream.Close();


                    // Get the response
                    WebResponse response = request.GetResponse();
                    dataStream = response.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    string responseFromServer = reader.ReadToEnd();

                    Console.WriteLine(string.Format("{0:yyyy-MM-dd HH:mm:ss},返回信息：{1}", DateTime.Now, responseFromServer));
                    WriterFile(string.Format("{0:yyyy-MM-dd HH:mm:ss},返回信息：{1}", DateTime.Now, responseFromServer), path);
                    // Clean up the streams
                    reader.Close();
                    dataStream.Close();
                    response.Close();
                    System.Threading.Thread.Sleep(6000);
                    //Console.ReadLine();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(string.Format("{0:yyyy-MM-dd HH:mm:ss},异常信息：{1}", DateTime.Now, ex.Message));
                    WriterFile(string.Format("{0:yyyy-MM-dd HH:mm:ss},异常信息：{1},{2}", DateTime.Now, ex.Message, ex.StackTrace), path);
                }
            }
        } 
        public static void WriterFile(string text,string path)
        { 
            System.IO.StreamWriter rw = System.IO.File.AppendText(path);
            rw.WriteLine(text);
            rw.Flush();
            rw.Close();
        }
    }
           
    public class JsonHelper
    {
        public static T Deserialize<T>(string jsonString)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsonSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
            return jsonSerialize.Deserialize<T>(jsonString);
        }
        public static T JsonDeSerializer<T>(string jsonString)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsonSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
            return jsonSerialize.Deserialize<T>(jsonString);
        }
        public static string Serialize<T>(T t)
        {
            return JsonSerializer(t);
        }
        public static string JsonSerializer<T>(T t)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsonSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
            if (t is System.Data.DataTable)
            {
                System.Data.DataTable dt = t as System.Data.DataTable;
                IDictionary<string, object>[] result = SerializeDataRows(dt.Rows);
                return jsonSerialize.Serialize(result);
            }
            return jsonSerialize.Serialize(t);
        }
        public static IDictionary<string, object>[] SerializeDataRows(System.Data.DataRowCollection dataRowArray)
        {
            IDictionary<string, object>[] result = new Dictionary<string, object>[dataRowArray.Count];
            for (int i = 0; i < dataRowArray.Count; i++)
            {
                result[i] = SerializeDataRow(dataRowArray[i]);
            }
            return result;
        }
        public static IDictionary<string, object> SerializeDataRow(System.Data.DataRow dataRow)
        {
            IDictionary<string, object> result = new Dictionary<string, object>();
            foreach (System.Data.DataColumn dc in dataRow.Table.Columns)
            {
                if (dc.DataType.Name == "DateTime")
                    result.Add(dc.ColumnName.ToLower(), Convert.ToDateTime(dataRow[dc.ColumnName]).ToString("yyyy-MM-dd HH:mm:ss"));
                else
                    result.Add(dc.ColumnName.ToLower(), dataRow[dc.ColumnName]);
            }
            return result;
        }
   
    }
    public class DataRowConverter : System.Web.Script.Serialization.JavaScriptConverter
    {
        public override object Deserialize(IDictionary<string, object> dictionary, Type type, System.Web.Script.Serialization.JavaScriptSerializer serializer)
        {
            throw new NotImplementedException();
        }

        public override IDictionary<string, object> Serialize(object obj, System.Web.Script.Serialization.JavaScriptSerializer serializer)
        {
            System.Data.DataRow dataRow = obj as System.Data.DataRow;
            IDictionary<string, object> result = new Dictionary<string, object>();
            foreach (System.Data.DataColumn dc in dataRow.Table.Columns)
            {
                result.Add(dc.ColumnName, dataRow[dc.ColumnName]);
            }
            return result;
        }

        public override IEnumerable<Type> SupportedTypes
        {
            get { return new Type[] { typeof(System.Data.DataTable) }; }
        }
    }
}
