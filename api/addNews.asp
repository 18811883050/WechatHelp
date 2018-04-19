<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="../conn/upfile_5xSoft.inc"-->
<!--#include file="../conn/function.asp"-->
<%

Function getFileExt(sFileName) 
getFileExt = Mid(sFileName, InstrRev(sFileName, ".") + 1) 
End Function 
Function ToUnixTime()
    ToUnixTime = DateDiff("s", "1970-1-1 08:00:00", Now())
End Function
dim upload,file,formName,formPath,iCount,Photo_Beizhu,upcount,allName
		set upload=new upload_5xSoft ''建立上传对象
		'response.write upload.Version&"<br><br>"  ''显示上传类的版本
		 formPath="../UploadImages/" 
		iCount=0
		
		for each formName in upload.file ''列出所有上传了的文件
		 set file=upload.file(formName)  ''生成一个文件对象
		 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
			newName = ToUnixTime()&"."&getFileExt(file.FileName)
		  file.SaveAs Server.mappath(formPath&newName)   ''保存文件
		'录入数据库
		  'response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
		  iCount=iCount+1
		  allName = allName&newName&"|"
		 end if
		 set file=nothing
		 
		next
		allName = left(allName,len(allName)-1)
		keyword = upload.form("keyword")
		allTitle = upload.form("alltitle")
		allLink = upload.form("alllink")
		miaoshu = upload.form("allmiaoshu")
		set upload=nothing  ''删除此对象
		'response.write iCount&" 个文件上传成功！"
		
		msgKey = randKey(13)
		gzhid = Request.Cookies("wechatid")
		if checkKeyWord(keyword) then
			response.write "关键词已经存在"
			Response.end
		end if
		Conn.BeginTrans
		conn.Errors.Clear 
		Set rs = Conn.Execute("insert into wechat_return_msg(wechat_gzh_id,wechat_msg_type,wechat_msg_key,wechat_msg_keyword,wechat_msg_title,wechat_msg_content,wechat_msg_imgurl,wechat_msg_url) VALUES("&gzhid&",'news','"&msgKey&"','"&keyword&"','"&allTitle&"','"&miaoshu&"','"&allName&"','"&allLink&"') ")
		if conn.Errors.Count>0 then
				conn.Errors.Clear
				conn.RollBackTrans
				response.write "添加失败,请重试！"
				Response.end
		end if
		Conn.CommitTrans
		response.write "0"
		Response.end



' Dim FormData,FormSize,Divider,bCrLf
' FormSize=Request.TotalBytes
' FormData=Request.BinaryRead(FormSize)
' bCrLf=ChrB(13)&ChrB(10)
' Divider=LeftB(FormData,InStrB(FormData,bCrLf)-1)
' Function GetFormVal(FormName)
' GetFormVal=""
' StartPos=LenB(Divider)+2
' FormName=Chr(34)&FormName&Chr(34)
' Do While StartPos>0
' strlen=InStrB(StartPos,FormData,bCrLf)-StartPos
' SearchStr=MidB(FormData,StartPos,strlen)
' If InStr(bin2str(SearchStr),FormName)>0 Then
' ValStart=InStrB(StartPos,FormData,bCrLf&bCrLf)+4
' ValLen=InStrB(StartPos,FormData,Divider)-2-ValStart
' ValContent=MidB(FormData,ValStart,ValLen)
' If GetFormVal <> "" Then
' GetFormVal=GetFormVal & "," & bin2str(ValContent) 
' Else 
' GetFormVal = bin2str(ValContent) 
' End If 
' End If 
' If InStrB(StartPos, FormData, Divider) < 1 Then 
' Exit Do 
' End If 
' StartPos = InStrB(StartPos, FormData, Divider) + LenB(Divider) + 2 
' Loop
' end function

' Function bin2str(binstr) 
' Dim varlen, clow, ccc, skipflag 
' skipflag = 0 
' ccc = "" 
' varlen = LenB(binstr) 
' For i = 1 To varlen 
' If skipflag = 0 Then 
' clow = MidB(binstr, i, 1) 
' If AscB(clow) > 127 Then 
' ccc = ccc & Chr(AscW(MidB(binstr, i + 1, 1) & clow))  
' skipflag = 1 
' Else 
' ccc = ccc & Chr(AscB(clow)) 
' End If 
' Else 
' skipflag = 0 
' End If 
' Next 
' bin2str = ccc 
' End Function  

' Function str2bin(str) 
' For i = 1 To Len(str) 
' str2bin = str2bin & ChrB(Asc(Mid(str, i, 1))) 
' Next 
' End Function
%>