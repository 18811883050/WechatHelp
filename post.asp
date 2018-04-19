<!--#include file="conn/function.asp"-->
<%
gettoken()
response.write session("access_token")

' apid = Request.Cookies("appid")
' apsc = Request.Cookies("appsecret")
	

' response.write apid&"<br>"
' response.write apsc
'str = "{""type"":""image"",""offset"":0,""count"":20}"

'response.write postHTTPPage("https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token="&session("access_token"),str)

' gzhid = Request.Cookies("wechatid")
' if gzhid="" or Cint(gzhid)=0 then
	' response.write "请选择公众号后获取！"
	' response.end
' end if

' If Cint(Session("access_token")) = 0 or IsEmpty(Session("access_token")) Then
' response.write "为空"
	' Set rs = Conn.Execute("select id,wechat_token,wechat_time from wechat_gzh_token where wechat_gzhid = "&gzhid&" ")
	' sj = DataFormat(now(),1)
	' If NOT Rs.Eof Then '存在查询token并判断时间
	' response.write "存在"
		' Ds = Rs.GetRows()
		' if datediff("n",Ds(2,0),sj)>100 then
		' response.write "超时"
			token = acc_token()
			' Conn.Execute("update wechat_gzh_token set wechat_token='"&token&"',wechat_time='"&sj&"' where wechat_gzhid = "&gzhid&" ")
			' Session.Timeout=110
			' Session("access_token") = token
		' else
		' response.write "未超时"
			' Session("access_token") = Ds(1,0)
		' end if
	' else	'不存在则获取token，然后入库
	' response.write "不存在"
			token = acc_token()
			' Conn.Execute("insert into wechat_gzh_token(wechat_gzhid,wechat_token,wechat_time) VALUES("&gzhid&",'"&token&"','"&sj&"') ")
			' Session.Timeout=110
			' Session("access_token") = token
	' end if
' end if


%>