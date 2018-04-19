<%Response.Addheader "Content-Type","text/html; charset=UTF-8" %>
<!--#include file="../conn/function.asp"-->
<%
apid=request("appid")
apsc=request("appsecret")
oldid=request("oldid")
wechatname=request("wechatname")
issc = checkToken(apid,apsc)
uid = Request.Cookies("userid")
'response.write apid&"</br>"
'response.write apsc&"</br>"
'response.write oldid&"</br>"
'response.write wechatname&"</br>"
'response.write issc&"</br>"

if issc = "0" then
		Conn.BeginTrans 
		conn.Errors.Clear 
		Set Rs = conn.execute("select wechat_oldid from wechat_gzh where wechat_userid="&uid&" and wechat_oldid='"&oldid&"'")
		If NOT Rs.Eof Then
			response.write "您已经绑定过该公众号！"
			Response.end
		end if 
		user = "insert into wechat_gzh(wechat_userid,wechat_appid,wechat_appsecret,wechat_name,wechat_oldid) VALUES("&uid&",'"&apid&"','"&apsc&"','"&wechatname&"','"&oldid&"')"
		Conn.execute(user)
		if conn.Errors.Count>0 then
				conn.Errors.Clear
				conn.RollBackTrans
				response.write "绑定失败,请重试！"
				Response.end
		end if
	Conn.CommitTrans
	response.write "0"
else
	response.write "APPID或APPSECRET有误！"
end if 
%>