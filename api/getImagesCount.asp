<!--#include file="../conn/function.asp"-->
<%
gettoken()
'response.write session("access_token")
infoCount = getHTTPPage("https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token="&session("access_token"))
set oJSON=new aspJSON
	 oJSON.loadJSON(infoCount)
	 imgCount = oJSON.data("image_count")
	 if imgCount="" then
		response.write oJSON.data("errmsg")
	 else
		response.write imgCount
	 end if
	set oJSON=nothing
%>