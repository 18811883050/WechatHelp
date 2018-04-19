<!--#include file="../conn/function.asp"-->
<%
	mymenu=trim(request("mymenu"))
	'response.write mymenu
	gettoken()
'	response.write session("access_token")
	isok = postHTTPPage("https://api.weixin.qq.com/cgi-bin/menu/create?access_token="&session("access_token"),mymenu)
	
	set oJSON=new aspJSON
	 oJSON.loadJSON(isok)
	 errcode = oJSON.data("errcode")
	 if errcode="0" then
		response.write "true"
	 else
		response.write "请正确填写"
	 end if 
	
%>