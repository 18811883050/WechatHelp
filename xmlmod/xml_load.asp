
<!--#include file="../conn/function.asp"-->
<%
CreateTime = ToUnixTime(DataFormat(now(),1),+8)
response.write CreateTime
response.write DataFormat(now(),1)
response.end
'**********************************************
'ע������
'ASP�ļ���Ҫ��UTF-8�ĸ�ʽ����,��������.
'�������д�����Ϊ��ͨ��΢�Žӿ���֤�ġ�
'response.write request("echostr")
'response.end
'**********************************************
dim signature        '΢�ż���ǩ��
dim timestamp        'ʱ���
dim nonce                '�����
dim echostr                '����ַ���
dim Token
dim signaturetmp
token="845C2550903CE6FA54CACDB82EAD4350"'���ں�̨��д�� token
signature = Request("signature")
nonce = Request("nonce")
timestamp = Request("timestamp")
'**********************************************
dim ToUserName        '������΢�ź�
dim FromUserName'���ͷ��ʺţ�һ��OpenID��
dim CreateTime        '��Ϣ����ʱ�䣨���ͣ�
dim MsgType                'text
dim Content                '�ı���Ϣ����
set xml_dom = Server.CreateObject("MSXML2.DOMDocument")'�˴���������ʵ�ʷ����������д
xml_dom.load request
FromUserName=xml_dom.getelementsbytagname("FromUserName").item(0).text '������΢���˺�
ToUserName=xml_dom.getelementsbytagname("ToUserName").item(0).text '������΢���˺š������ǵĹ���ƽ̨�˺š�
MsgType=xml_dom.getelementsbytagname("MsgType").item(0).text
if MsgType="text" then
Content=xml_dom.getelementsbytagname("Content").item(0).text
end if
'dim  mingling
'mingling=replace(content,chr(13),"")
'mingling=trim(replace(mingling,chr(10),""))
if (MsgType="event") then
        strEventType=xml_dom.getelementsbytagname("Event").item(0).text '΢���¼�
        if strEventType="subscribe" then '��ʾ����΢�Ź���ƽ̨
                strsend=gz(FromUserName,ToUserName)
        ElseIf strEventType="unsubscribe" Then'ȡ����
                strsend=gz(FromUserName,ToUserName)
        end if
Else
'strsend=text(fromusername,tousername,Content)
strsend=""
end if
response.write strsend
set xml_dom=Nothing
'*************���´���ֻ��Ϊ�˵�������***********
filepath=server.mappath("wx.txt")
Set fso = Server.CreateObject("Scripting.FileSystemObject")
set fopen=fso.OpenTextFile(filepath, 8 ,true)
fopen.writeline(strsend)
set fso=nothing
set fopen=Nothing
'****************���Խ���************************
function gz(fromusername,tousername)
gz="<xml>" &_
"<ToUserName><![CDATA["&fromusername&"]]></ToUserName>" &_
"<FromUserName><![CDATA["&tousername&"]]></FromUserName>" &_
"<CreateTime>"&now&"</CreateTime>" &_
"<MsgType>news</MsgType>" &_
"<ArticleCount>5</ArticleCount>" &_
"<Articles>" &_
"<item>" &_
"<Title>��׬��۵Ķ��ֳ������г�</Title>" &_
"<Description>�ĳǶ��ֳ��Ƕ��ֳ�������ʵ�����ϵĶ��ֳ��г�,���ĳǶ��ֳ���ϢΪ���ṩ�ĳǼ��ܱߵ��еĶ��ֳ�������Ϣ,������Ѳ鿴�ͷ������ֳ���Ϣ,������ֳ����ҵ��" &_
"</Description>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxlogo.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[�鿴���ֳ���Ϣ]]></Title>" &_
"<Discription><![CDATA[ȫ�����ֳ���Ϣ]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxche.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/ershouche]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[���ֳ���������]]></Title>" &_
"<Discription><![CDATA[���ֳ�������������]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxgh.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/guohu]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[ʲô�ǲ�׬���]]></Title>" &_
"<Discription><![CDATA[��������]]></Discription>" &_
"<PicUrl><![CDATA[http://www.0635che.com/images/wxxw.jpg]]></PicUrl>" &_
"<Url><![CDATA[http://www.0635che.com/service]]></Url>" &_
"</item>" &_
"<item>" &_
"<Title><![CDATA[��ϵ����]]></Title>" &_
"<Discription><![CDATA[��ϵ����]]></Discription>" &_
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