<!--#include file="../conn/function.asp"-->
<%
gettoken()
'response.write session("access_token")
getNum = trim(request("getNum"))	'每页获取的数量

imgIndex = trim(request("imgIndex"))	'每页获取的数量

str = "{""type"":""image"",""offset"":"&imgIndex&",""count"":"&getNum&"}"
response.write postHTTPPage("https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token="&session("access_token"),str)

'算法



' AllImages = xxx  '总素材数量

' if pageCount>=AllImages
' 获取AllImages
' else
' 获取pageCount
' AllImages-pageCount
' end if
	' 循环判断
%>