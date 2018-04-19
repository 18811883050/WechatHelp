<!--#include file="../conn/function.asp"-->
<%
Dim appid,appsc
appid = "wxeaeeb3111b944679"
appsc = "14293b06a087582f548f11b1283514f9"


'**********************************************
'注意事项
'ASP文件需要以UTF-8的格式保存,否则乱码.
'以下两行代码是为了通过微信接口验证的。
'response.write request("echostr")
'response.end
'**********************************************
dim signature        '微信加密签名
dim timestamp        '时间戳
dim nonce                '随机数
dim echostr                '随机字符串
dim Token
dim signaturetmp
token="IZNfHxWbtklFGr6G9l"'您在后台添写的 token
signature = Request("signature")
nonce = Request("nonce")
timestamp = Request("timestamp")
'**********************************************
dim ToUserName        '开发者微信号
dim FromUserName'发送方帐号（一个OpenID）
dim CreateTime        '消息创建时间（整型）
dim MsgType                'text
dim Content                '文本消息内容
set xml_dom = Server.CreateObject("MSXML2.DOMDocument")'此处根据您的实际服务器情况改写
xml_dom.load request
FromUserName=xml_dom.getelementsbytagname("FromUserName").item(0).text '发送者微信账号
ToUserName=xml_dom.getelementsbytagname("ToUserName").item(0).text '接收者微信账号。即我们的公众平台账号。
MsgType=xml_dom.getelementsbytagname("MsgType").item(0).text
CreateTime = xml_dom.getelementsbytagname("CreateTime").item(0).text

'CreateTime = ToUnixTime(DataFormat(now(),1),+8)*1000
'sj = Format_Time(now(),1)

'判断获得消息类型进行操作
select case MsgType 
  '接收普通文本消息
  case "text"
   response.write "" '回复空消息，中断微信再次请求
  '接收图片消息
  case "image"
	response.write "" '回复空消息，中断微信再次请求
  '接收语音消息
  case "voice"
	response.write "" '回复空消息，中断微信再次请求
  '接收视频消息
  case "video"
	response.write "" '回复空消息，中断微信再次请求
  '接收小视频消息
  case "shortvideo"
	response.write "" '回复空消息，中断微信再次请求
  '接收地理位置消息
  case "location"
	response.write "" '回复空消息，中断微信再次请求
  '接收链接消息
  case "link"
	response.write "" '回复空消息，中断微信再次请求
  '接收事件推送
  case "event"
    'response.write "" '回复空消息，中断微信再次请求
	Events =  xml_dom.getelementsbytagname("Event").item(0).text
	select case Events 
		case "subscribe"  '订阅	
			EventKey = xml_dom.getelementsbytagname("EventKey").item(0).text '事件KEY值，qrscene_为前缀，后面为二维码的参数值
			if EventKey="" then    '单纯的用户关注事件
				'Content = returnText(ToUserName,FromUserName,CreateTime,"欢迎关注") '文本消息回复
				'Content = returnImg(ToUserName,FromUserName,CreateTime,"Kj4oh31L2NZDYKdnfZ3WQnz8-VpZqFmrzwhYDsbD1YU")	'图片消息回复
				Content = returnOneNews(ToUserName,FromUserName,CreateTime,"三月钜惠","asdasdasdasdasdad","http://www.mr91.com/zhuanti/thermage/images/part8_2.jpg","http://www.baidu.com/")
				'response.write "" '关注回复
			else	'用户扫描指定二维码关注事件
				Ticket = xml_dom.getelementsbytagname("Ticket").item(0).text	'二维码的ticket，可用来换取二维码图片
				response.write "" 
			end if
		
		case "unsubscribe"  '取消订阅
			response.write "" '回复空消息，中断微信再次请求
		case "SCAN" '已关注用户扫描二维码事件
			EventKey = xml_dom.getelementsbytagname("EventKey").item(0).text  '事件KEY值，qrscene_为前缀，后面为二维码的参数值
			Ticket = xml_dom.getelementsbytagname("Ticket").item(0).text		'二维码的ticket，可用来换取二维码图片
			response.write "" 
		case "LOCATION" '上报地理位置事件
			response.write "" 
		case "CLICK" '点击菜单拉取消息时的事件推送
			response.write "" 
		case "VIEW" '点击菜单跳转链接时的事件推送
			response.write "" 
		case else
			response.write "" 
	end select
  case else
   response.write "" '回复空消息，中断微信再次请求
end select

response.write Content

set xml_dom=Nothing
'*************以下代码只是为了调试作用***********

filepath=server.mappath("wx.txt")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
set fopen=fso.OpenTextFile(filepath, 8 ,true)
fopen.writeline(Content)
set fso=nothing
set fopen=Nothing
'****************调试结束************************
%>

