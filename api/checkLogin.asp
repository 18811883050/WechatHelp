<!--#include file="../conn/function.asp"-->
<!--#include file="../conn/md5.asp"-->
<%
uname=request("username")
pwd=request("password")
pwd=md5(pwd,32)
	Set rst = Server.CreateObject("ADODB.Recordset")
	  rst.Open "Select id,wechat_username,wechat_pwd From wechat_user where [wechat_username]='" &uname&"' and [wechat_pwd]='" &pwd&"'" , conn, 3,3
	  if rst.bof then
		  response.write "1"
	  else
			Response.Cookies("UserName")=rst("wechat_username")
			Response.Cookies("userid")=rst("id")
			Response.Cookies("UserName").Expires=dateadd("d",365,now())
			Response.Cookies("userid").Expires=dateadd("d",365,now())
			response.write "0"
	  End if
	rst.close
	set rst=nothing
	
%>