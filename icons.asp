<%
uname = request.Cookies("UserName")
uid = request.Cookies("userid")
if uname="" or IsEmpty(uname) or IsEmpty(uid) then
response.redirect("login.asp") 
end if
wechatname = request.Cookies("wechatname")
%>
<!--#include file="template/head.html"-->
<!--#include file="template/left.html"-->
<script>
var wechatname = "<%=wechatname%>";
if(wechatname!=""){
	$("#wcName").html(wechatname);
}

</script>

<div id="page-wrapper">
		
        <iframe id="page-all" src="selectWechat.asp" style="width:100%;min-height:1200px;"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="auto" allowtransparency="yes"></iframe>
</div>
<!--#include file="template/footer.html"-->
