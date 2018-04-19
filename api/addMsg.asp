<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn/function.asp"-->
<%
msgType=trim(request("type"))
Select Case msgType
 Case "text"
		keyword = trim(request("keyword"))
		content = trim(request("content"))
		msgKey = randKey(13)
		gzhid = Request.Cookies("wechatid")
		if checkKeyWord(keyword) then
			response.write "关键词已经存在"
			Response.end
		end if
		Conn.BeginTrans 
		conn.Errors.Clear 	'insert into wechat_return_msg(wechat_gzh_id,wechat_msg_type,wechat_msg_key,wechat_msg_keyword,wechat_msg_title,wechat_msg_content,wechat_msg_imgurl,wechat_msg_url)
		Set rs = Conn.Execute("insert into wechat_return_msg(wechat_gzh_id,wechat_msg_type,wechat_msg_key,wechat_msg_keyword,wechat_msg_title,wechat_msg_content,wechat_msg_imgurl,wechat_msg_url) VALUES("&gzhid&",'"&msgType&"','"&msgKey&"','"&keyword&"','','"&content&"','','') ")
		if conn.Errors.Count>0 then
				conn.Errors.Clear
				conn.RollBackTrans
				response.write "添加失败,请重试！"
				Response.end
		end if
		Conn.CommitTrans
		response.write "0"
		Response.end
 Case "image"
		media_id = trim(request("media_id"))
		msgKey = randKey(13)
		gzhid = Request.Cookies("wechatid")
		keyword = trim(request("keyword"))
		if checkKeyWord(keyword) then
			response.write "关键词已经存在"
			Response.end
		end if
		Conn.BeginTrans 
		conn.Errors.Clear 	'insert into wechat_return_msg(wechat_gzh_id,wechat_msg_type,wechat_msg_key,wechat_msg_keyword,wechat_msg_title,wechat_msg_content,wechat_msg_imgurl,wechat_msg_url)
		Set rs = Conn.Execute("insert into wechat_return_msg(wechat_gzh_id,wechat_msg_type,wechat_msg_key,wechat_msg_keyword,wechat_msg_title,wechat_msg_content,wechat_msg_imgurl,wechat_msg_url) VALUES("&gzhid&",'"&msgType&"','"&msgKey&"','"&keyword&"','','"&media_id&"','','') ")
		if conn.Errors.Count>0 then
				conn.Errors.Clear
				conn.RollBackTrans
				response.write "添加失败,请重试！"
				Response.end
		end if
		Conn.CommitTrans
		response.write "0"
		Response.end
 Case else
		response.write "添加失败,请重试！"
End Select
	
%>