<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn/function.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>

<body>
<%
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from wechat_return_msg"
  rs.open sql,conn,1,3
  page=request("page")
   if IsNumeric(page) then
            page=cint(page)
            if page<1 then page=1 
         else 
            page=1 
         end if
  everypage=3
  rs.pagesize=everypage
  if rs.bof and rs.eof then
  response.Write("没有数据")
  else
  page_count=rs.pagecount
  rs.AbsolutePage=page
  do while not rs.eof and j<rs.pagesize
  response.Write(rs("wechat_msg_type")&"<br>")  
  j=j+1
  rs.movenext
  loop
  end if
%>
<%
if page=1 then
 Response.Write"上一页"
   else
 Response.Write"<a href=test.asp?page="&page-1&">上一页</a>"
 end if
 %>
 
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
   <a href="test.asp?page=<%=j%>"><%=j%></a>
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
    <a href="test.asp?page=<%=j%>">[<%=j%>]</a>
 <%else%>
 <a href="test.asp?page=<%=j%>"><%=j%></a>
 <%end if%> 
  <%end if%>
  <% next 
    %>
<%if page<page_count then%>
<a href="test.asp?page=<%=page+1%>">下一页</a>
<%else%>
下一页
<%end if%>
</body>
</html>