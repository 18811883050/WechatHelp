<!--#include file="../conn/function.asp"-->
<%
	gettoken()
	isok = getHTTPPage("https://api.weixin.qq.com/cgi-bin/menu/get?access_token="&session("access_token"))
	response.write isok
	' set oJSON=new aspJSON
	 ' oJSON.loadJSON(isok)
	 ' errcode = oJSON.data("errcode")
	 ' if errcode="0" then
		' response.write "true"
	 ' else
		' response.write "请正确填写"
	 ' end if
	 
	 
	
%>