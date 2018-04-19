<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	<script src="assets/js/jquery-1.10.2.js"></script>
</head>
<body style="background-color: #E2E2E2;">
    <div class="container">
        <div class="row text-center " style="padding-top:100px;">
            <div class="col-md-12">
                <h3>请填写公众号的APPID和APPSECRET</h3>
            </div>
        </div>
         <div class="row ">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                           
								<div class="panel-body">
								  <form role="form">
									<hr />
									<h5>绑定之后可以对公众号进行操作</h5>
									<br />
									<div class="form-group input-group">
									  <span class="input-group-addon">
										<i class="fa fa-lock"></i>
									  </span>
									  <input type="text" class="form-control" placeholder="APPID " name="appid" /></div>
									<div class="form-group input-group">
									  <span class="input-group-addon">
										<i class="fa fa-lock"></i>
									  </span>
									  <input type="text" class="form-control" placeholder="APPSECRET" name="APPSECRET" /></div>
									<div class="form-group input-group">
									  <span class="input-group-addon">
										<i class="fa fa-tag"></i>
									  </span>
									 <input type="text" class="form-control" placeholder="原始ID" name="oldId" /></div>
									<div class="form-group input-group">
									  <span class="input-group-addon">
										<i class="fa fa-tag"></i>
									  </span>
									  <input type="text" class="form-control" placeholder="公众号名称" name="wechatname" /></div>
									<div class="form-group">
									</div>
									<a href="javascript:" class="btn btn-primary ">立即绑定</a>
									<!--<hr />Not register ?
									<a href="index.html">click here</a>or go to
									<a href="index.html">Home</a></form>-->
							</div>
				</div>
                
                
        </div>
    </div>
	<script>
		$(".btn-primary").click(function(){
			$("input[type='text']").each(function () {
                if ($(this).val() == "") {
                  alert("请将信息填写完整！");
				  return false;
                }
            });
			$.ajax({
				  type:"get",
				  url:"api/bindWeChat.asp",
				  data:{appid:$("input[type='text']:eq(0)").val(),appsecret:$("input[type='text']:eq(1)").val(),oldid:$("input[type='text']:eq(2)").val(),wechatname:$("input[type='text']:eq(3)").val()},
				  success:function(dada){
						if(dada!="0"){
							alert("绑定失败,错误信息 : "+dada);
							return false;
						}else{
							alert("恭喜您绑定成功！");
							window.location.href="selectWeChat.asp";
						}
				  }
			});
			
		});
	</script>
</body>
</html>
