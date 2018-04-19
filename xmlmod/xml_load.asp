
<!--#include file="../conn/function.asp"-->
<%
CreateTime = ToUnixTime(DataFormat(now(),1),+8)
response.write CreateTime
response.write DataFormat(now(),1)
response.end
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
token="845C2550903CE6FA54CACDB82EAD4350"'您在后台添写的 token
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
if MsgType="text" then
Content=xml_dom.getelementsbytagname("Content").item(0).text
end if
'dim  mingling
'mingling=replace(content,chr(13),"")
'mingling=trim(replace(mingling,chr(10),""))
if (MsgType="event") then
        strEventType=xml_dom.getelementsbytagname("Event").item(0).text '微信事件
        if strEventType="subscribe" then '表示订阅微信公众平台
                strsend=gz(FromUserName,ToUserName)
        ElseIf strEventType="unsubscribe" Then'取消关
                strsend=gz(FromUserName,ToUserName)
        end if
Else
'strsend=text(fromusername,tousername,Content)
strsend=""
end if
response.write strsend
set xml_dom=Nothing
'*************以下代码只是为了调试作用***********
filepath=server.mappath("wx.txt")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
set fopen=fso.OpenTextFile(filepath, 8 ,true)
fopen.writeline(strsend)
set fso=nothing
set fopen=Nothing
'****************调试结束************************
function gz(fromusername,tousername)
gz="<xml>" &_
"<ToUserName><![CDATA["&fromusername&"]]></ToUserName>" &_
"<FromUserName><![CDATA["&tousername&"]]></FromUserName>" &_
"<CreateTime>"&now&"</CreateTime>" &_
"<MsgType>news</MsgType>" &_
"<ArticleCount>5</ArticleCount>" &_
"<Articles>" &_
"<item>" &_
"<Title>不赚差价的二手车交易市场</Title>" &_
"<Description>聊城二手车是二手车网上与实体相结合的二手车市场,以聊城二手车信息为主提供聊城及周边地市的二手车交易信息,您可免费查看和发布二手车信息,办理二手车相关业务。" &_
"</Description>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxlogo.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[查看二手车信息]]></Title>" &_
"<Discription><![CDATA[全部二手车信息]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxche.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/ershouche]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[二手车过户手续]]></Title>" &_
"<Discription><![CDATA[二手车过户过户手续]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxgh.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/guohu]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[什么是不赚差价]]></Title>" &_
"<Discription><![CDATA[电子商务]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxxw.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/service]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[联系我们]]></Title>" &_
"<Discription><![CDATA[联系我们]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxlx.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/]]></Url>" &_
"</item>" &_
"</Articles>" &_
"<FuncFlag>1</FuncFlag>" &_
"</xml> "
end function
function text(fromusername,tousername,returnstr)
text="<xml>" &_
"<ToUserName><![CDATA["&fromusername&"]]></ToUserName>" &_
"<FromUserName><![CDATA["&tousername&"]]></FromUserName>" &_
"<CreateTime>"&now&"</CreateTime>" &_
"<MsgType><![CDATA[text]]></MsgType>" &_
"<Content><![CDATA[" & returnstr & "]]></Content>" &_
"<FuncFlag>0<FuncFlag>" &_
"</xml>"
end function


%>