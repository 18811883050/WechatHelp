<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
       <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">添加关键词文本消息回复</h1>
                        <h1 class="page-subhead-line">添加关键词文本消息回复后可在回复管理中查看</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
               <div class="panel panel-info">
                        <div class="panel-heading">
                           请输入文本消息
                        </div>
                        <div class="panel-body">
                            
									<div class="form-group">
                                            <label>关键词</label>
                                            <input class="form-control" type="text" >
										<!--p class="help-block">Help text here.</p-->
                                    </div>
                                     <div class="form-group">
                                            <label>回复内容</label>
                                            <textarea class="form-control" rows="3"></textarea>
                                    </div>
                                   <a href="javascript:" id="addMsg" class="btn btn-info">添加回复</a>
                                
                            </div>
                        </div>
               </div>
				</div>
             <!--/.ROW-->
       </div>
	   
	   <script>
		$("#addMsg").click(function(){
				//alert($("input[type='text']:eq(0)").val());
				//alert($("textarea:eq(0)").val());
				//return false;
				var kw = $("input[type='text']:eq(0)").val();
				var ct = $("textarea:eq(0)").val();
				if(ct=="" || ct==undefined || kw=="" || kw==undefined){
					alert("请填写完整！");
					return false;
				}
					  $.ajax({
						  type:"get",
						  async:false,
						  url:"api/addMsg.asp",
						  data:{"type":"text","keyword":kw,"content":ct},
						  success:function(dada){
								if(dada!="0"){
									alert(dada);
									return false;
								}else{
									alert("添加成功");
									window.location.href="MsgAdmin.asp";
								}
						  }
						});
						return false;
                
		});
	</script>
</body>
</html>
