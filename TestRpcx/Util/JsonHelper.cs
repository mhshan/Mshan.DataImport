using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
namespace TestRpcx.Util
{
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
        /// <summary>
        /// Newtonsoft.Json Deserialize反序列化(忽略空值)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="content"></param>
        /// <returns></returns>
        //public static T DeserializeIgnoreNull<T>(string content) where T : class
        //{
        //    var jsonSetting = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore };
        //    return JsonConvert.DeserializeObject<T>(content, jsonSetting);
        //}
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
