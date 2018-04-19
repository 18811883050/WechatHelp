<!--#include file="../conn/function.asp"-->
<%
	response.Charset="UTF-8"
	wechatid = request("wechatid")
	if wechatid="" then
		response.write "切换错误"
		response.end
	end if 
	
	Set rst = Server.CreateObject("ADODB.Recordset")
	  rst.Open "Select id,wechat_appid,wechat_appsecret,wechat_name,wechat_oldid From wechat_gzh where id=" &wechatid&" " , conn, 3,3
	  if rst.bof then
		  response.write "公众号不存在"
	  else
			Response.Cookies("appid")=rst("wechat_appid")
			Response.Cookies("appsecret")=rst("wechat_appsecret")
			Response.Cookies("oldid")=rst("wechat_oldid")
			Response.Cookies("wechatid")=rst("id")
			Response.Cookies("wechatname")=rst("wechat_name")
			Response.Cookies("appid").Expires=dateadd("d",3,now())
			Response.Cookies("appsecret").Expires=dateadd("d",3,now())
			Response.Cookies("oldid").Expires=dateadd("d",3,now())
			Response.Cookies("wechatid").Expires=dateadd("d",3,now())
			Response.Cookies("wechatname").Expires=dateadd("d",3,now())
			response.write "0"
	 End if
	rst.close
	set rst=nothing
%>