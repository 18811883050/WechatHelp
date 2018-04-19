<!--#include file="../conn/function.asp"-->
<!--#include file="../conn/md5.asp"-->
<%
			Response.Cookies("UserName")=""
			Response.Cookies("userid")=""
			Response.Cookies("UserName").Expires=dateadd("s",1,now())
			Response.Cookies("userid").Expires=dateadd("s",1,now())
			
			Response.Cookies("appid")=rst("wechat_appid")
			Response.Cookies("appsecret")=rst("wechat_appsecret")
			Response.Cookies("oldid")=rst("wechat_oldid")
			Response.Cookies("wechatid")=rst("id")
			Response.Cookies("wechatname")=rst("wechat_name")
			
			Response.Cookies("appid").Expires=dateadd("s",1,now())
			Response.Cookies("appsecret").Expires=dateadd("s",1,now())
			Response.Cookies("oldid").Expires=dateadd("s",1,now())
			Response.Cookies("wechatid").Expires=dateadd("s",1,now())
			Response.Cookies("wechatname").Expires=dateadd("s",1,now())
			
			if Request.Cookies("UserName")="" and Request.Cookies("userid")="" then
				response.write "0"
			else
				response.write "1"
			end if
			
%>