<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WeChat微信公众号后台管理-技术支持-吴朝鹏</title>
<meta name="keywords" content="WeChat微信公众号后台管理-技术支持-吴朝鹏">
<meta name="description" content="WeChat微信公众号后台管理-技术支持-吴朝鹏">
<meta name="viewport" content="width=device-width">
<link href="public/css/base.css" rel="stylesheet" type="text/css">
<link href="public/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
<form action="" method="post" id="form">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input class="text_value" value="" name="username" type="text" id="username">
            <input class="text_value" value="" name="password" type="password" id="password">
        </div>
        <a href="javascript:" class="button" id="submit" >登录</a>	
    </div>
    
    <div id="tip"></div>
    </form>
</div>
<script src="assets/js/jquery-1.10.2.js"></script>
<script>
			$(".button").click(function(){
			$("input[type='text']").each(function () {
                if ($(this).val() == "") {
                  alert("用户名和密码必须填写！");
				  return false;
                }
            });
			$.ajax({
				  type:"get",
				  url:"api/checkLogin.asp",
				  data:{username:$("input[type='text']:eq(0)").val(),password:$("input[type='text']:eq(1)").val()},
				  success:function(dada){
						if(dada!="0"){
							alert("登录失败,错误信息 : "+dada);
							return false;
						}else{
							window.location.href="icons.asp";
						}
				  }
			});
			
		});
</script>
</body>
</html>
