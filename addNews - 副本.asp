<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<body style="overflow-x:hidden ; overflow-y:auto;">
       <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">添加关键词图文消息回复</h1>
                        <h1 class="page-subhead-line">添加关键词图文消息回复后可在回复管理中查看</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-6">
                       <div class="panel panel-default">
                        <div class="panel-heading">
                           图文列表选择
                        </div>
							<div class="panel-body">
								<div class="form-group">
                                            <label>关键词</label>
                                            <input class="form-control" name="keyword" type="text" >
										<!--p class="help-block">Help text here.</p-->
                                </div>
								
									  <div class="first_appmsg_item" >
										<div class="fileupload fileupload-new" data-provides="fileupload">
										<form method="post" id="uploadForm" enctype="multipart/form-data" >
											<div class="duan">
												<div class="fileupload-preview thumbnail" style="width: 160px; height: 144px;overflow:hidden;float:left;margin-right:20px;">
												</div>
												<input type="file" accept="image/*" name="myimg" style="display:none;" />
												<div class="form-group">
															<label>图文标题</label>
															<input class="form-control tit" type="text" name="title" style="width:50%;margin:0;">
														<!--p class="help-block">Help text here.</p-->
												</div>
												<div class="form-group">
														<label>图文链接</label>
														<input class="form-control lnk" type="text" name="link" style="width:50%;margin:0;">
												</div>
											</div>
											

												<div class="form-group miaoshu" >
														<label>图文描述</label>
														<textarea class="form-control" rows="3" name="miaoshu"  placeholder="多图文时描述可以不填写" ></textarea>
												</div>
												
												<div class="addNews"><img src="assets/img/jiahao.png"></div>
												<input type="hidden" value="" name="allTitle" /><input type="hidden" value="" name="allLink" />
											</form>
										</div>
										
									  </div>

								<a href="javascript:" id="addMsg" class="btn btn-info">添加回复</a>
							</div>
                        </div>
                         
							
						 
                    </div>
                </div>
             <!--/.ROW-->
				
       </div>
	<script>
		var str="";
		$(function(){
			str = $(".duan").html();
		});
	   $(".addNews").click(function(){
			$(".miaoshu").hide();
			str = str.replace("myimg","myimg"+$(".newtab").length).replace("title","title"+$(".newtab").length).replace("link","link"+$(".newtab").length)
			$(".addNews").before("<div class='newtab'>"+str+"<div style='position:absolute;top:20px;right:20px;'><button type='button' class='btn btn-danger'>删除</button></div></div>");
			$(".newtab").length>=7 ? $(this).hide() : $(this).show();
	   })
	   $(".first_appmsg_item").on("click",".fileupload-preview",function(){
			console.log(1);
			$(this).next("input").trigger("click");
	   })
	   $(".first_appmsg_item").on("change","input[type=file]",function(e){
			var objUrl = getObjectURL(this.files[0]);
			console.log("objUrl = "+objUrl);
			if (objUrl){
				$(this).prev("div").html("<img src='"+objUrl+"' />");
			}
			console.log(e);
	   })
	   
	   $(".first_appmsg_item").on("click",".btn-danger",function(){
			if(confirm("确认删除当前模块吗?")){
				$(this).parent().parent().remove();
				$(".newtab").length>=7 ? $(".addNews").hide() : $(".addNews").show();
				$(".newtab").length<=0 ? $(".miaoshu").show() : $(".miaoshu").hide();
			}
			return false;
	   })
	   
	//建立一個可存取到該file的url
	function getObjectURL(file) 
	{
		var url = null ;
		if (window.createObjectURL!=undefined) 
		{ // basic
			url = window.createObjectURL(file) ;
		}
		else if (window.URL!=undefined) 
		{
		// mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
		} 
		else if (window.webkitURL!=undefined) {
		// webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url ;
		}
	
	
	$("#addMsg").click(function(){
				var keyword=$("input[name=keyword]").val();
				var miaoshu = $("textarea:eq(0)").val();
				if(keyword=="" || keyword==undefined){
					alert("请输入关键词！");
					return false;
				}
				$(".tit").each(function(){
					if($(this).val()=="" || $(this).val()==undefined){
						alert("请填写图文标题！");
						return false;
					}
					//title = title + $(this).val() + "|";
					$("input[name=allTitle]").val($("input[name=allTitle]").val()+$(this).val()+"|");
				})
				$(".lnk").each(function(){
					if($(this).val()=="" || $(this).val()==undefined){
						alert("请填写图文链接！");
						return false;
					}
					$("input[name=allLink]").val($("input[name=allLink]").val()+$(this).val()+"|");
					//link = link + $(this).val() + "|";
				})
				var title = $("input[name=allTitle]").val();
				var link = $("input[name=allLink]").val();
				$("input[name=allTitle]").val(title.substr(0,title.length-1));
				$("input[name=allLink]").val(link.substring(0,link.length-1));
				
				//$("input[type=file]").each(function(){
					//console.log($(this).val());
					//console.log(this.files[0]);
					//$("#uploadForm").append(this);
				//})
				//return false;
				
				var formData = new FormData($("#uploadForm")[0]);

						$.ajax({
						  type:"post",
						  processData:  false,
						  url:"api/addMsg.asp",
						  data:formData, //"type":"news","title":title,"link":link,"miaoshu":miaoshu,"keyword":keyword,
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
