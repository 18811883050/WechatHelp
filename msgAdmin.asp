<!--#include file="conn/function.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>home</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body style="overflow-x:hidden ; overflow-y:hidden;">
       <div id="page-inner">
				<div class="row">
                   <div class="col-md-12">
                       <div class="panel panel-primary">
      <!-- Default panel contents -->
      <div class="panel-heading">关键词回复消息列表</div>
						  <table class="table">
							<thead>
							  <tr>
								<th>ID</th>
								  <th>消息类型</th>
								<th>关键词</th>
								<th>On Date</th>
								<th>Actions</th>
							  </tr>
							</thead>
							<tbody>
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
								  everypage=20
								  rs.pagesize=everypage
								  if rs.bof and rs.eof then
								  response.Write("没有数据")
								  else
								  page_count=rs.pagecount
								  rs.AbsolutePage=page
								  do while not rs.eof and j<rs.pagesize
								  'response.Write(rs("wechat_msg_type")&"<br>")  
								  j=j+1
									select case rs("wechat_msg_type")
									case "text"
										trCol = "list-group-item-warning"
									case "image"
										trCol = "list-group-item-info"
									case "news"
										trCol = "list-group-item-danger"
									case else
										trCol = "list-group-item-success"
									end select
							%>
							  <tr class="<%=trCol%>">
								<td><%=j%></td>
								<td><%=rs("wechat_msg_keyword")%></td>
								<td>100$ Pending Payment</td>
								<td>23rd June </td>
								<td><a href="#" class="btn btn-primary ">修改</a>&nbsp;<a href="#" class="btn btn-danger">删除</a></td>
							  </tr>
							  <%
								 rs.movenext
								  loop
								  end if
								rs.close
								set rs = nothing
								'response.write PageSize&rscount&pagecount&page
								%>
							  
							</tbody>
						  </table>
						  
						</div>
						<ul class="pagination">
						<%call fenye1(page,page_count,"msgAdmin.asp")%>
						</ul>
							<!--ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							  <li><a href="#">&raquo;</a></li>
							</ul-->
						
                   </div>
                     </div>
       </div>

</body>
</html>
