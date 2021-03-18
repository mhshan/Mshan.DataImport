using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mshan.Document.WinFormDatabase
{
    public class Rec_ThirdRecord
    {
        //终端信息
        public decimal cstaccfc{get;set;}
        public decimal Poscode{get;set;}//终端编号
        public ulong Samcardno{get;set;}//psam卡号
        public decimal Traderecno{get;set;}//记录流水号
        public decimal Buslineid{get;set;}//线路编号
        public string Busid{get;set;}//车辆编号
        public string Buscode{get;set;}//车辆唯一编号
        public decimal Driverid{get;set;}//司机编号
        public decimal StopId{get;set;}//站点编号
        public decimal LineDirection{get;set;}//线路方向  0上行 1下行 分段计费时使用
        //交易信息
        public string Opdt{get;set;}//交易时间
        public string Collectdt{get;set;}//采集时间 
        public string UploadDate{get;set;}//入中心库时间
        public decimal Oddfare{get;set;}//交易前余额
        public decimal Opfare{get;set;}//交易金额
        public decimal DiscountFare{get;set;}//打折金额
        public decimal TestFlag{get;set;}//测试标记（0：正常，1：测试）
        public decimal RecordType{get;set;}//记录类型 0：统一票价记录 1：分段计费记录
        public decimal TradeType{get;set;}//交易应用类型  0：消费记录 1：电子钱包充值 2：月票充值 9：清零记录
        public decimal TradeKind{get;set;}//交易性质 公交 地铁 出租车
        public decimal Maincardtype{get;set;}//主卡类型  
        public decimal AssoCardType{get;set;}//子卡类型  
        public decimal CardType{get;set;}//子卡类型
        public decimal WalletType{get;set;}//钱包类型 
        //第三方信息
        public string AccountId{get;set;}//账户ID
        public string AppId{get;set;}//第三方应用ID
        public string UserId{get;set;}//用户ID
        public string ThirdCardno{get;set;}//第三方卡号，采集没用，实体转换时需要
        public string ThirdTermId{get;set;}//第三方终端编号，采集没用，实体转换时需要
        public string ThirdMerchantCode{get;set;}//第三方商户号
        public string Batchno{get;set;}//银联批次号（域60.2）
        public string Tracenum{get;set;}//银联受卡方系统跟踪号（域11）
        public string OrderType{get;set;}//订单类型  01 正常形成单  02 带人行程单 03 换乘订单
        public string RecordInfo{get;set;}//脱机记录信息
        public string Extentvalue{get;set;}//扩展记录信息
        //业务信息
        public string SysTraceNum{get;set;}//银联联机业务（银联终端编号+批次号+受卡方系统跟踪号），非银联联机业务（商户订单号），脱机业务（消费时间+poscode+终端交易流水）
        public decimal DealType{get;set;}//记录类型  1：正常 2：灰色 3：MAC错误...
        public string CustomerUnitcode{get;set;}//客户法人
        //坏账处理
        public decimal BadId{get;set;}//坏账id
        //清算结果
        public string Accountdate{get;set;}//清算日期
        public string ResponseCode{get;set;}//响应码
        public string ResponseMessage{get;set;}//响应信息
        public string NextTime{get;set;}//下一次清算时间
        public string FileName{get;set;}//清算文件文件名
        public string Paytime{get;set;}//支付时间
    }
}
