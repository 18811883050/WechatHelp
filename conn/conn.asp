<% 
on error resume next
  function getDBStr(FileNum)
	  '取得数据文件
    'FileNum is 1-boaihospital  2-boaisex 3-shuguanghospital 4-jingtian 5-boaihr
		'ParaNum is 1-Server 2-Uid 3-Pwd 4 - DatabaseName
		set dbfiles = server.createobject("Scripting.FileSystemObject")
    set dbfile = dbfiles.openTextFile("e:\connection",1,false)
    i = 1
		LineContent = ""
		do while not dbfile.AtEndOfStream
      LineContent = dbfile.readline
			if i = FileNum then exit do
			i = i + 1
		loop
		dbfile.close
		set dbfile = nothing
		set dbfiles = nothing
		getDBStr = LineContent
		exit function
	end function

set conn = Server.CreateObject("ADODB.Connection")
lines = getDBStr(19)
if lines = "" then
	response.write "DBConnect Error!"
	response.end
end if
lines = split(lines,",")
str = "Driver={SQL Server};UID=" & lines(0) & ";"
str = str & "PWD=" & lines(1) & ";"
str = str & "Server=" & lines(2) & ";"
str = str & "Database=" & lines(3)
ConnStr = "Provider = Sqloledb; User ID = " & lines(0) & "; Password = " & lines(1) & "; Initial Catalog = " & lines(3) & "; Data Source = " & lines(2) & ";Pooling=true; MAX Pool Size=512;Min Pool Size=50;Connection Lifetime=30;"
conn.OPen ConnStr
if err.number>0 then
   msgbox "Connect Database error"
   response.end
end if

'-----------------------------------------------------------------------------------------------------
	Function Execute(Command)
		If Not IsObject(Conn) Then ConnectionDatabase		
		If IsDeBug = 0 Then 
			On Error Resume Next
			Set Execute = Conn.Execute(Command)
			If Err Then
				err.Clear
				Set Conn = Nothing
				'以下信息要翻译成英文
				Response.Write "查询数据的时候发现错误，请检查您的查询代码是否正确。"
				Response.End
			End If
		Else
			'Response.Write command & "<br>"
			Set Execute = Conn.Execute(Command)
		End If	
	End Function
%>
