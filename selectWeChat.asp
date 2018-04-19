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
	<script src="assets/js/jquery-1.10.2.js"></script>
</head>
<body style="overflow-x:hidden ; overflow-y:hidden;">
        <!-- /. NAV SIDE  -->
     
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">选择公众号</h1>
                        <h1 class="page-subhead-line">选择对应的公众号之后才能进行操作</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
					<%getWechatAll()%>
                    <!--<div class="col-md-4">
                        <div class="main-box mb-red">
                            <a href="javascript:">
                                <i class="fa fa-bolt fa-5x"></i>
                                <h5>???????</h5>
								<input type="hidden" name="appid" />
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="main-box mb-red">
                            <a href="#">
                                <i class="fa fa-bolt fa-5x"></i>
                                <h5>???????</h5>
                            </a>
                        </div>
                    </div>-->
                    

                
				</div>
			</div>
		<script>
		$(".col-md-4 a").click(function(){
                if (confirm('确认切换吗？')) {
					  $.ajax({
						  type:"get",
						  url:"api/changeWechat.asp",
						  data:{wechatid:$(this).find("input").val()},
						  success:function(dada){
								if(dada!="0"){
									alert(dada);
									return false;
								}else{
									parent.location.reload();
								}
						  }
						});
                }else{
					return false;
				}
		});
	</script>
</body>
</html>
