using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestRpcx
{
    public class UserChangeData
    {
        public int DpId
        {
            get;
            set;
        }
        public List<UserIdChangePair> ChangeedList {get;set; }

    }
    public class UserIdChangePair
    {
        public string UD
        {
            get;
            set;
        }
        public string UserId
        {
            get;
            set;
        }
    }
}
