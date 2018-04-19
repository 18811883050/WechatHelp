<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="Baiduspider" content="noarchive">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="baidu-site-verification" content="fVhujlAX5A">
    <title>微信自定义菜单编辑</title>
    <link href="public/css/css.css" rel="stylesheet">
    <script src="public/js/modernizr.js"></script>
    <script src="public/js/jquery.js"></script>
    <link href="public/css/menu.css" rel="stylesheet">


</head>
<body style="overflow-x:hidden ; overflow-y:hidden;">
    <link href="public/css/loading.css" rel="stylesheet">
<div class="mask" id="loadingDiv" style="display: none;">
    <div class="centerAll" style="display: none;">
        <div class="spinner" style="margin: 0px;">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        $.extend({
            LoadingShow:function() {
                $("#loadingDiv").show();
            },
            LoadingHide: function () {
                (function(e) {
                    $(e).children().fadeOut(function () {
                        $(e).fadeOut();
                    });
                })($("#loadingDiv"));
            }
        });
    });
</script>

    <div class="container body-content">
        <div class="row">
            <h3>微信自定义菜单编辑工具</h3>
            <hr>
<ol class="breadcrumb">
    <li class="active">请在下方编辑自定义菜单后提交</li>
</ol>
<div class="panel panel-default" id="divMain">
    <div class="panel-heading" style="min-height: 55px;">
        <div class="container-fluid" style="margin-bottom: -15px;">
                   <!--标题文字-->
        </div>
    </div>

    <div class="panel-body" data-bind="with:Menus" id="divMenu" style="display: none;">
        <div style="height: 200px;" data-bind="foreach:newArray(3)">
            <div class="list-group col-xs-4 clearFill bn">
                <!--ko if:($parent.button.length>0 && $parent.button[$index()]!=undefined && $parent.button[$index()].sub_button!=undefined ) -->
                <!--ko foreach:newArray((4-$parent.button[$index()].sub_button.length)) -->
                <div class="list-group-item bn"></div>
                <!--/ko-->
                <!--ko if:$parent.button[$index()].sub_button.length<5 -->
                <div class="list-group-item" data-bind="click:function (){$root.AddMenu($index())}">
                    <i class="fa fa-plus"></i>
                </div>
                <!--/ko-->
                <!--ko foreach:($parent.button[$index()].sub_button) -->
                <div class="list-group-item" data-bind="text:name,attr:{'bottonIndex':$parent.value,'subbottonIndex':$index()},click:function (){$root.EditMenu($data,$parent.value,$index())}"></div>
                <!--/ko-->
                <!--/ko -->
                <!--ko if: $parent.button[$index()]!=undefined && $parent.button[$index()].sub_button==undefined -->
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item" data-bind="click:function (){$root.AddMenu($index())}">
                    <i class="fa fa-plus"></i>
                </div>
                <!--/ko-->
                <!--ko if: $parent.button[$index()]==undefined -->
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <div class="list-group-item bn"></div>
                <!--/ko-->
            </div>
        </div>
        <!--ko foreach:$data.button -->
        <div class="col-xs-4 list-group-item list-group-item-danger" data-bind="text:name,attr:{'bottonindex':$index()},click:function (){$root.EditMenu($data,$index(),-1)}"></div>
        <!--/ko-->
        <!--ko if:button.length < 3 -->
        <div class="col-xs-4 list-group-item" data-bind="click:function (){$root.AddMenu();}">
            <i class="fa fa-plus"></i>
        </div>
        <!--/ko-->
        <div class="clearfix"></div>

        <div class="col-xs-12" style="border: 1px solid rgb(238, 238, 238); padding-top: 15px; margin-top: 15px; " data-bind="with:$root.Menu,visible:($root.Menu()!=undefined)">
			<form id="MenuForm" onsubmit="return false;" novalidate="novalidate">
                <div class="form-group col-xs-5">
                    <div class="input-group">
                        <input type="text" class="form-control" name="name" data-placement="top" data-toggle="popover" placeholder="请输入名称" data-bind="value:name,event:{'keyup':$root.EventNameErrorMessage},attr:{'data-content':$root.NameErrorMessage}" id="txtMenuName">
                        <span class="input-group-addon" data-bind="click:$root.SelectEmoji"><i class="fa fa-smile-o" aria-hidden="true"></i></span>
                        <div class="emojipar" id="selectEmojidiv" data-bind="click:$root.ClickEmojiDiv">
                            <span class="caret"></span>
						</div>
                    </div>
                </div>

                <div class="form-group col-xs-4">
                    <select class="form-control" id="selectMenuType" data-bind="event:{'change':$root.MenuTypeChange},value:type,disable:type=='menu'" data-original-title="" title="">
                        <option value="menu" pl="" disabled="disabled">显示二级菜单</option>
                        <option value="view" pl="请输入Url">跳转URL</option>
                        <option value="click" pl="请输入Key">点击推事件</option>
                        <option value="scancode_push" pl="请输入Key">扫码推事件</option>
                        <option value="scancode_waitmsg" pl="请输入Key">扫码推事件且弹出“消息接收中”提示框</option>
                        <option value="pic_sysphoto" pl="请输入Key">弹出系统拍照发图</option>
                        <option value="pic_photo_or_album" pl="请输入Key">弹出拍照或者相册发图</option>
                        <option value="pic_weixin" pl="请输入Key"> 弹出微信相册发图器</option>
                        <option value="location_select" pl="请输入Key">弹出地理位置选择器</option>
                        <option value="media_id" pl="请输入永久素材Id" data-bind="disable:($root.Type()==2)">下发消息（除文本消息）</option>
                        <option value="view_limited" pl="请输入永久素材Id" data-bind="disable:($root.Type()==2)">下发图文消息</option>
                        <option value="miniprogram" pl="请输入Url" data-bind="disable:($root.Type()==2)">打开小程序</option>
                    </select>
                </div>
                <!--ko if:type!='menu'-->
                <div class="form-group col-xs-9">
                    <input type="text" id="txtMenuButtonValue" name="value" class="form-control" placeholder="请输入Url" data-placement="top" data-toggle="popover" data-bind="value:value,event:{'keyup':$root.EventValueErrorMessage},attr:{'data-content':$root.ValueErrorMessage}">
                </div>
                <!--/ko-->
                <!--ko if:$root.EditMenuType()=='miniprogram'--><!--/ko-->
                <div class="form-group col-xs-12">
                    <button type="submit" class="btn btn-primary" data-bind="click:$root.MenuSave">确定</button>
                    <button type="submit" class="btn btn-danger" data-bind="visible:$root.isEditMenu,click:$root.DeleteMenu" style="display: none;">删除</button>
                    <button type="button" class="btn btn-default" title="上移" data-bind="visible:$root.isEditMenu(),disable:!$root.IsUp(),click:$root.Up" disabled="" style="display: none;"><i class="fa fa-chevron-circle-up" aria-hidden="true"></i></button>
                    <button type="button" class="btn btn-default" title="下移" data-bind="visible:$root.isEditMenu(),disable:!$root.IsDown(),click:$root.Down" disabled="" style="display: none;"><i class="fa fa-chevron-circle-down" aria-hidden="true"></i></button>
                    <button type="button" class="btn btn-default" title="左移" data-bind="visible:$root.isEditMenu(),disable:!$root.IsLeft(),click:$root.Left" disabled="" style="display: none;"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></button>
                    <button type="button" class="btn btn-default" title="右移" data-bind="visible:$root.isEditMenu(),disable:!$root.IsRight(),click:$root.Right" disabled="" style="display: none;"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></button>
                    <button type="button" class="btn btn-default" title="复制菜单" data-bind="visible:$root.isEditMenu(),click:$root.Copy" style="display: none;">复制</button>
                    <button type="button" class="btn btn-default" title="粘贴菜单" data-bind="visible:$root.IsPaste(),click:$root.Paste" style="display: none;">粘贴</button>
                    <button type="submit" class="btn btn-default" data-bind="click:$root.CancelMenuSave">关闭</button>
                </div>
            </form>
		</div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-footer" data-bind="with:Menus">
        <button id="btnSubmitMenu" type="button" class="btn btn-primary" data-bind="click:$root.SaveMenus" data-toggle="tooltip" data-placement="top" title="" data-original-title="发布到微信"><i class="fa fa-upload" aria-hidden="true"></i> 发布</button>
        <button id="btnQueryMenu" type="button" class="btn btn-default" data-bind="click:function (){$root.EditMenus(true)}" data-toggle="tooltip" data-placement="top" title="" data-original-title="查询公众号/企业号应用现有菜单"><i class="fa fa-download" aria-hidden="true"></i> 查询菜单</button>
        
    </div>
</div>
<div class="panel panel-default" style="display:none;">
    <div class="panel-heading">实时JSON</div>
    <div class="panel-body">
        <pre id="jsonShow" style="padding:0;border:none;background-color:#fff;" data-bind="html:JSON.stringify($root.NewMenu(),null,4)">{
    "button": []
}</pre>
    </div>
</div>
        </div>
    </div>

    <script src="public/js/bootstrap.js"></script><!--响应式设计JS-->
    <script src="public/js/jquery.validate.js"></script><!--表单验证JS-->
    <script src="public/js/jquery.validate.unobtrusive.js"></script><!--自动生成验证js代码-->   
    <script type="text/javascript">
        var token = "";
    </script>
    <script src="public/js/menu.js"></script>
</body></html>