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
       <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">添加关键词图片消息回复</h1>
                        <h1 class="page-subhead-line">添加关键词图片消息回复后可在回复管理中查看</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-6">
                       <div class="panel panel-default">
                        <div class="panel-heading">
                           图片选择
                        </div>
							<div class="panel-body">
							
								<div class="form-group">
                                            <label>关键词</label>
                                            <input class="form-control" type="text" >
										<!--p class="help-block">Help text here.</p-->
                                </div>
								<div class="form-group">
									<label class="control-label col-lg-4"></label>
									<div class="">
										<div class="fileupload fileupload-new" data-provides="fileupload">
											<div class="fileupload-preview thumbnail" style="width: 200px; height: 150px;overflow:hidden;"></div>
											<div>
												<span class="btn btn-file btn-success"><span class="fileupload-new">选择图片</span></span>
											</div>
										</div>
									</div>
								</div>
								<a href="javascript:" id="addMsg" class="btn btn-info">添加回复</a>
							</div>
                        </div>
                         
                    </div>
                </div>
             <!--/.ROW-->
				
       </div>
	   <div class="pp_overlay" style="display: none; opacity: 0.8; height: 100%; width: 100%;left: 0; position: absolute;top: 0;z-index:999;background: #000;">
			<div class="pp_overlay2" style="display: none; height: 800px; width: 1000px;z-index:1000;background:#fff;margin:5% auto;border-radius:20px;">
			<style>
					.imgBox{
						width:290px;
						height:230px;
						border:1px solid #ddd;
						float:left;
						border-radius:4px;
						margin:8px 20px;
						overflow:hidden;
						line-height:230px;
						cursor: pointer;
						}
					.imgList{
						margin:0 auto;
						width: 1000px;
						height: 730px;
						overflow:hidden;
					}
					.imgBox img{
						    max-width: 290px;
							max-height: 230px;
							min-width: 100px;
							min-height: 71px;
							vertical-align: middle;
					}
				</style>
				<div class="imgList">
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
					<div class="imgBox"></div>
				</div>
				
				<ul class="pager">
				  <li><a href="javascript:">上一页</a></li>
				  <li><a href="javascript:">下一页</a></li>
				</ul>
			</div>
	   </div>
	   <script>
	   var imgAll = 0;	//图片总数量
	   var getNum = 9;	//每次获取的图片数
	   var nowNum = 0;  //当前已经获取到哪张
		$(".fileupload-new").off().on("click",function(){
				//alert($("input[type='text']:eq(0)").val());
				//alert($("textarea:eq(0)").val());
				//return false;
					getlist();
					return false;
		});
		
		$(".pager a:eq(0)").click(function(){
			//console.log("last");
			if(nowNum<=0){
			nowNum=0;
			return false
			};
			getlist();
			nowNum=nowNum-getNum;
			
		});
			
		$(".pager a:eq(1)").click(function(){
			//console.log("next");
			if(nowNum+getNum>=imgAll){return false};
			getlist();
			nowNum=nowNum+getNum;
		});
		
		function getlist(){
					$.ajax({
						  type:"get",
						  async:false,
						  url:"api/getImagesCount.asp",
						  success:function(dada){
								if(isRealNum(dada)){
									//alert("正确"+dada);
									console.log(dada);
									imgAll=dada;
									$(".pp_overlay").show();
									$(".pp_overlay2").show();
									
									//(getNum>=imgAll) ? (getNum=imgAll;nowNum=0) : getNum=getNum;
									(imgAll-nowNum+getNum<getNum) ? getNum=imgAll-nowNum+getNum : getNum=9;
									//请求图片
										$.ajax({
											  type:"post",
											  url:"api/getImages.asp",
											  data:{"imgIndex":nowNum,"getNum":getNum},
											  success:function(imgList){
													var jsonObj = eval('(' + imgList + ')');
													//console.log(jsonObj.item);
													$.each(jsonObj.item,function(name,value) {
														//console.log(name);
														//console.log(value);
														//console.log(value.media_id);
														//console.log(value.url);
														
														var str = "";
														value.url!="" ? str = str + "<img src='api/showImg.asp?url="+value.url+"'/><input type='hidden' value='"+value.media_id+"'>" : str = " " ;
														$(".imgBox:eq("+name+")").html(str);
														//$(".imgList").append(str);
													});
											  }
										});
									return false;
								}else{
									alert("错误"+dada);
									return false;
									//window.location.href="MsgAdmin.asp";
								}
						  }
					});
					console.log(getNum);
		}
		
		$(".imgList").on("click","div",function(){
			var isHve = $(this).find("input").val();
			if(isHve=="" || isHve==undefined){return false;}
			$(".pp_overlay").hide();
			$(".pp_overlay2").hide();
			$(".fileupload-preview").html("");
			$(".fileupload-preview").append($(this).html());
			return false;
		});
		
		function isRealNum(val){
			// isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除
			if(val === "" || val ==null){
				return false;
			}
			if(!isNaN(val)){
				return true;
			}else{
				return false;
			}
		}
		
		$("#addMsg").click(function(){
				var media_id = $("input[type='hidden']:eq(0)").val();
				var kw = $("input[type='text']:eq(0)").val();
				console.log(kw);
				if(media_id=="" || media_id==undefined){
					alert("请选择图片！");
					return false;
				}
				
				if(kw=="" || kw==undefined){
					alert("请输入关键词！");
					return false;
				}
					  $.ajax({
						  type:"get",
						  async:false,
						  url:"api/addMsg.asp",
						  data:{"type":"image","media_id":media_id,"keyword":kw},
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
