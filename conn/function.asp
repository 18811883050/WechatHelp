<%Response.Addheader "Content-Type","text/html; charset=UTF-8" %>
<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="ASPJson.class.asp"-->
<%
function BytesToBstr(body,Cset)
	dim objstream
	set objstream = Server.CreateObject("adodb.stream")
	objstream.Type = 1
	objstream.Mode =3
	objstream.Open
	objstream.Write body
	objstream.Position = 0
	objstream.Type = 2
	objstream.Charset = Cset
	BytesToBstr = objstream.ReadText
	objstream.Close
	set objstream = nothing
End function
'get请求方法
function getHTTPPage(url)
	dim Http
	set Http=server.createobject("MSXML2.XMLHTTP")
	Http.open "GET",url,false
	Http.send()
	if Http.readystate<>4 then
	exit function
	end if
	getHTTPPage=BytesToBstr(Http.responseBody,"UTF-8")
	set http=nothing
	if err.number<>0 then
	err.Clear
	end if
end function
'post请求方法
function postHTTPPage(url,data)
	dim Http
	set Http=server.createobject("MSXML2.XMLHTTP")
	Http.open "POST",url,false
	Http.send(data)
	if Http.readystate<>4 then
	exit function
	end if
	postHTTPPage=bytesToBSTR(Http.responseBody,"UTF-8")
	'response.Write postHTTPPage
	set http=nothing
	if err.number<>0 then
	err.Clear
	end if
end function

'日期格式化
Function DataFormat(s_Time, n_Flag)
'format_time(now,1)
 Dim y, m, d, h, mi, s
 DataFormat = ""
 If IsDate(s_Time) = False Then Exit Function
 y = cstr(year(s_Time))
 m = cstr(month(s_Time))
 If len(m) = 1 Then m = "0" & m
 d = cstr(day(s_Time))
 If len(d) = 1 Then d = "0" & d
 h = cstr(hour(s_Time))
 If len(h) = 1 Then h = "0" & h
 mi = cstr(minute(s_Time))
 If len(mi) = 1 Then mi = "0" & mi
 s = cstr(second(s_Time))
 If len(s) = 1 Then s = "0" & s
 Select Case n_Flag
 Case 1
  ' yyyy-mm-dd hh:mm:ss
  DataFormat = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
 Case 2
  ' yyyy-mm-dd
  DataFormat = y & "-" & m & "-" & d
 Case 3
  ' hh:mm:ss
  DataFormat = h & ":" & mi & ":" & s
 Case 4
  ' yyyy年mm月dd日
  'DataFormat = y & "年" & m & "月" & d & "日"
 Case 5
  ' yyyymmdd
  DataFormat = y & m & d
 case 6
  'yyyymmddhhmmss
  DataFormat= y & m & d & h & mi & s
 End Select
End Function

'获取CreateTime  就是时间戳
Function ToUnixTime(strTime, intTimeZone)
    If IsEmpty(strTime) Or Not IsDate(strTime) Then strTime = Now
    If IsEmpty(intTimeZone) Or Not IsNumeric(intTimeZone) Then intTimeZone = 0
    ToUnixTime = DateAdd("h", - intTimeZone, strTime)
    ToUnixTime = DateDiff("s", "1970-1-1 0:0:0", ToUnixTime)
End Function


'根据公众号检查token是否可用，并设置token
function gettoken()

gzhid = Request.Cookies("wechatid")
if gzhid="" or Cint(gzhid)=0 then
	response.write "请选择公众号后获取！"
	response.end
end if

If Cint(Session("access_token")) = 0 or IsEmpty(Session("access_token")) Then
	Set rs = Conn.Execute("select id,wechat_token,wechat_time from wechat_gzh_token where wechat_gzhid = "&gzhid&" ")
	sj = DataFormat(now(),1)
	If NOT Rs.Eof Then '存在查询token并判断时间
		Ds = Rs.GetRows()
		if datediff("n",Ds(2,0),sj)>100 then
			token = acc_token()
			Conn.Execute("update wechat_gzh_token set wechat_token='"&token&"',wechat_time='"&sj&"' where wechat_gzhid = "&gzhid&" ")
			Session.Timeout=110
			Session("access_token") = token
		else
			Session("access_token") = Ds(1,0)
		end if
	else	'不存在则获取token，然后入库
			token = acc_token()
			Conn.Execute("insert into wechat_gzh_token(wechat_gzhid,wechat_token,wechat_time) VALUES("&gzhid&",'"&token&"','"&sj&"') ")
			Session.Timeout=110
			Session("access_token") = token
	end if
end if

end function

'获取token
function acc_token()
	Dim access_token,apid,apsc
	apid = Request.Cookies("appid")
	apsc = Request.Cookies("appsecret")
	if apid<>"" and apsc<>""  then
		tokenurl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="&apid&"&secret="&apsc
		tokenjosn =getHTTPPage(tokenurl)
		set oJSON=new aspJSON
		 oJSON.loadJSON(tokenjosn)
		 access_token = oJSON.data("access_token")
		 if IsEmpty(access_token) then
			acc_token = oJSON.data("errmsg")
		 else
			acc_token = access_token
		 end if
		set oJSON=nothing
	else
		acc_token="请重新选择公众号后重试！"
	end if
end function


function checkToken(apid,apsc)
	Dim access_token
	tokenurl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="&apid&"&secret="&apsc
	tokenjosn =getHTTPPage(tokenurl)
	set oJSON=new aspJSON
	 oJSON.loadJSON(tokenjosn)
	 access_token = oJSON.data("access_token")
	 if access_token="" then
		checkToken = oJSON.data("errmsg")
	 else
		checkToken = "0"
	 end if
	set oJSON=nothing
end function


'回复文本消息
function returnText(toUser,fromUser,CreateTime,str)
returnText = "<xml>"&_
"<ToUserName><![CDATA["&fromUser&"]]></ToUserName>" &_
"<FromUserName><![CDATA["&toUser&"]]></FromUserName>" &_
"<CreateTime>"&CreateTime&"</CreateTime>" &_
"<MsgType>text</MsgType>" &_
"<Content><![CDATA["&str&"]]></Content>"&_
"</xml> "
end function

'回复图片消息
function returnImg(toUser,fromUser,CreateTime,imgId)
returnImg="<xml>"&_
"<ToUserName><![CDATA["&fromUser&"]]></ToUserName>"&_
"<FromUserName><![CDATA["&toUser&"]]></FromUserName>"&_
"<CreateTime>"&CreateTime&"</CreateTime>"&_
"<MsgType>image</MsgType>"&_
"<Image><MediaId><![CDATA["&imgId&"]]></MediaId></Image>"&_
"</xml>"
end function

'回复单图文消息
function returnOneNews(toUser,fromUser,CreateTime,title,msg,imgUrl,url)
returnOneNews="<xml>"&_
"<ToUserName><![CDATA["&fromusername&"]]></ToUserName>" &_
"<FromUserName><![CDATA["&tousername&"]]></FromUserName>" &_
"<CreateTime>"&CreateTime&"</CreateTime>" &_
"<MsgType>news</MsgType>" &_
"<ArticleCount>1</ArticleCount>" &_
"<Articles>" &_
"<item>" &_
"<Title>"&title&"</Title>" &_
"<Description>"&msg&"" &_
"</Description>" &_
"<PicUrl><![CDATA["&imgUrl&"]]></PicUrl>" &_
"<Url><![CDATA["&url&"]]></Url>" &_
"</Articles>"&_
"</xml> "
end function


'判断关键词是否存在，存在返回true ，不存在返回false 。 不存在才能添加
function checkKeyWord(keyword)
	Set rs = Conn.Execute("select id from wechat_return_msg where wechat_msg_keyword = '"&keyword&"' ")
	If Not Rs.Eof Then
		checkKeyWord = true
	else
		checkKeyWord = false
	end if 
	Rs.Close()
	Set Rs = Nothing
	
end function



'获取公众号
function getWechatAll()
	Set rs = Conn.Execute("select id,wechat_userid,wechat_appid,wechat_name from wechat_gzh where wechat_userid = "&request.Cookies("userid")&"")
	If NOT Rs.Eof Then
		Ds = Rs.GetRows()
		For i = 0 To UBound(Ds, 2)
			response.write "<div class=""col-md-4"">"
			if request.Cookies("appid")=Ds(2,i) then 
				response.write "<div class=""main-box mb-pink"">"
				response.write "<a href=""javascript:""><i class=""fa fa-plus fa-5x""></i>"
			else
				response.write "<div class=""main-box mb-red"">"
				response.write "<a href=""javascript:""><i class=""fa fa-remove fa-5x""></i>"
			end if 
			
			response.write "<h5>"&Ds(3,i)&"</h5><input type=""hidden"" value='"&Ds(0,i)&"' />"
			response.write "</a></div></div>"
		next
	end if 
	Rs.Close()
	Set Rs = Nothing
end function

'获取任意数字+大小写字母随机字符串
Function randKey(obj) 
 Dim char_array(80) 
 Dim temp 
 For i = 0 To 9  
  char_array(i) = Cstr(i) 
 Next 
 For i = 10 To 35 
  char_array(i) = Chr(i + 55) 
 Next 
 For i = 36 To 61 
  char_array(i) = Chr(i + 61) 
 Next 
 Randomize 
 For i = 1 To obj 
  'rnd函数返回的随机数在0~1之间，可等于0，但不等于1 
  '公式：int((上限-下限+1)*Rnd+下限)可取得从下限到上限之间的数，可等于下限但不可等于上限 
  temp = temp&char_array(int(62 - 0 + 1)*Rnd + 0) 
 Next 
 randKey = temp 
End Function 
		
Function IIF(A,B,C)
	If A Then IIF = B Else IIF = C
End Function

'小数向上取整函数
Function Ceil(value)
	Dim return
	return = int(value)
	Cei2=value-return
	if Cei2>0 then
		Ceil = return + 1
	else
		Ceil=value+0'就是Ceil=value多一个+0 强调返回值为数字型
	End If
End Function

%>

<%
Function fenye1(page,page_count,yemian)
if page=1 then
 Response.Write "<li class=""disabled""><a href=""javascript:"">&laquo;</a></li>"   
   else
 Response.Write "<li><a href="&yemian&"?page="&page-1&">&laquo;</a></li>"   '上一页
 end if
%>
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
   <li><a href="<%=yemian%>?page=<%=j%>"><%=j%></a></li>
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
	<li class="active" ><a href="<%=yemian%>?page=<%=j%>"><%=j%></a></li>
 <%else%>
	<li><a href="<%=yemian%>?page=<%=j%>"><%=j%></a></li>
 <%end if%> 
  <%end if%>
  <% next 
    %>
<%if page<page_count then%>
<li><a href="<%=yemian%>?page=<%=page+1%>">&raquo;</a></li>
<%else%>
<li class="disabled"><a href="javascript:">&raquo;</a></li>
<%end if%>
<%end function%>