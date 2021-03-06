function newArray(n) {
    for (var i = [], t = 0; t < n; t++) i[t] = {
        value: t
    };
    return i
}
function getbyteLenth(n) {
    for (var i = 0,
    r, t = 0; t < n.length; t++) r = n.charAt(t),
    i += /^[\u0000-\u00ff]$/.test(r) ? 1 : 2;
    return i
}
function MenuFormValidate() {
    $("#MenuForm").validate({
        rules: {
            name: {
                required: !0
            },
            value: {
                required: !1
            },
            pagepath: {
                required: !0
            },
            appid: {
                required: !0
            }
        },
        messages: {
            name: {
                required: "请输入名称"
            },
            value: {
                required: $("#txtMenuButtonValue").attr("placeholder")
            },
            pagepath: {
                required: "请输入小程序的页面路径"
            },
            appid: {
                required: "请输入小程序的AppId"
            }
        }
    })
}
$(function() {
    var n = {
        Type: ko.observable(1),
        TokenType: ko.observable(1),
        AccessToken: ko.observable(window.token),
        AppId: ko.observable(),
        AppSecret: ko.observable(),
        AgentId: ko.observable(),
        CorpId: ko.observable(),
        PermanentCode: ko.observable(),
        SuiteId: ko.observable(),
        SuiteSecret: ko.observable(),
        SuiteTicket: ko.observable(),
        Emojis: ko.observableArray("☀|☁|☔|⛄|⚡|🌀|🌁|🌂|🌃|🌄|🌅|🌆|🌇|🌈|❄|⛅|🌉|🌊|🌋|🌌|🌏|🌑|🌔|🌓|🌙|🌕|🌛|🌟|🌠|🕐|🕑|🕒|🕓|🕔|🕕|🕖|🕗|🕘|🕙|🕚|🕛|⌚|⌛|⏰|⏳|♈|♉|♊|♋|♌|♍|♎|♏|♐|♑|♒|♓|⛎|🍀|🌷|🌱|🍁|🌸|🌹|🍂|🍃|🌺|🌻|🌴|🌵|🌾|🌽|🍄|🌰|🌼|🌿|🍒|🍌|🍎|🍊|🍓|🍉|🍅|🍆|🍈|🍍|🍇|🍑|🍏|👀|👂|👃|👄|👅|💄|💅|💆|💇|💈|👤|👦|👧|👨|👩|👪|👫|👮|👯|👰|👱|👲|👳|👴|👵|👶|👷|👸|👹|👺|👻|👼|👽|👾|👿|💀|💁|💂|💃|🐌|🐍|🐎|🐔|🐗|🐫|🐘|🐨|🐒|🐑|🐙|🐚|🐛|🐜|🐝|🐞|🐠|🐡|🐢|🐤|🐥|🐦|🐣|🐧|🐩|🐟|🐬|🐭|🐯|🐱|🐳|🐴|🐵|🐶|🐷|🐻|🐹|🐺|🐮|🐰|🐸|🐾|🐲|🐼|🐽|😠|😩|😲|😞|😵|😰|😒|😍|😤|😜|😝|😋|😘|😚|😷|😳|😃|😅|😆|😁|😂|😊|☺|😄|😢|😭|😨|😣|😡|😌|😖|😔|😱|😪|😏|😓|😥|😫|😉|😺|😸|😹|😽|😻|😿|😾|😼|🙀|🙅|🙆|🙇|🙈|🙊|🙉|🙋|🙌|🙍|🙎|🙏|🏠|🏡|🏢|🏣|🏥|🏦|🏧|🏨|🏩|🏪|🏫|⛪|⛲|🏬|🏯|🏰|🏭|⚓|🏮|🗻|🗼|🗽|🗾|🗿|👞|👟|👠|👡|👢|👣|👓|👕|👖|👑|👔|👒|👗|👘|👙|👚|👛|👜|👝|💰|💱|💹|💲|💳|💴|💵|💸|-|-|-|-|-|-|-|-|-|-|🔥|🔦|🔧|🔨|🔩|🔪|🔫|🔮|🔯|🔰|🔱|💉|💊|🅰|🅱|🆎|🅾|🎀|🎁|🎂|🎄|🎅|🎌|🎆|🎈|🎉|🎍|🎎|🎓|🎒|🎏|🎇|🎐|🎃|🎊|🎋|🎑|📟|☎|📞|📱|📲|📝|📠|✉|📨|📩|📪|📫|📮|📰|📢|📣|📡|📤|📥|📦|📧|🔠|🔡|🔢|🔣|🔤|✒|💺|💻|✏|📎|💼|💽|💾|💿|📀|✂|📍|📃|📄|📅|📁|📂|📓|📖|📔|📕|📗|📘|📙|📚|📛|📜|📋|📆|📊|📈|📉|📇|📌|📒|📏|📐|📑|🎽|⚾|⛳|🎾|⚽|🎿|🏀|🏁|🏂|🏃|🏄|🏆|🏈|🏊|🚃|🚇|Ⓜ|🚄|🚅|🚗|🚙|🚌|🚏|🚢|✈|⛵|🚉|🚀|🚤|🚕|🚚|🚒|🚑|🚓|⛽|🅿|🚥|🚧|🚨|♨|⛺|🎠|🎡|🎢|🎣|🎤|🎥|🎦|🎧|🎨|🎩|🎪|🎫|🎬|🎭|🎮|🀄|🎯|🎰|🎱|🎲|🎳|🎴|🃏|🎵|🎶|🎷|🎸|🎹|🎺|🎻|🎼|〽|📷|📹|📺|📻|📼|💋|💌|💍|💎|💏|💐|💑|💒|🔞|©|®|™|ℹ|-|-|-|-|-|-|-|-|-|-|-|🔟|📶|📳|📴|🍔|🍙|🍰|🍜|🍞|🍳|🍦|🍟|🍡|🍘|🍚|🍝|🍛|🍢|🍣|🍱|🍲|🍧|🍖|🍥|🍠|🍕|🍗|🍨|🍩|🍪|🍫|🍬|🍭|🍮|🍯|🍤|🍴|☕|🍸|🍺|🍵|🍶|🍷|🍻|🍹|↗|↘|↖|↙|⤴|⤵|↔|↕|⬆|⬇|➡|⬅|▶|◀|⏩|⏪|⏫|⏬|🔺|🔻|🔼|🔽|⭕|❌|❎|❗|⁉|‼|❓|❔|❕|〰|➰|-|❤|💓|💔|💕|💖|💗|💘|💙|💚|💛|💜|💝|💞|💟|♥|♠|♦|♣|🚬|🚭|♿|🚩|⚠|⛔|♻|🚲|🚶|🚹|🚺|🛀|🚻|🚽|🚾|🚼|🚪|🚫|✔|🆑|🆒|🆓|🆔|🆕|🆖|🆗|🆘|🆙|🆚|🈁|🈂|🈲|🈳|🈴|🈵|🈶|🈚|🈷|🈸|🈹|🈯|🈺|㊙|㊗|🉐|🉑|➕|➖|✖|➗|💠|💡|💢|💣|💤|💥|💦|💧|💨|💩|💪|💫|💬|✨|✴|✳|⚪|⚫|🔴|🔵|🔲|🔳|⭐|⬜|⬛|▫|▪|◽|◾|◻|◼|🔶|🔷|🔸|🔹|❇|💮|💯|↩|↪|🔃|🔊|🔋|🔌|🔍|🔎|🔒|🔓|🔏|🔐|🔑|🔔|☑|🔘|🔖|🔗|🔙|🔚|🔛|🔜|🔝|✅|✊|✋|✌|👊|👍|☝|👆|👇|👈|👉|👋|👏|👌|👎|👐".split("|")),
        SelectEmoji: function(n, t) {
            t.stopPropagation();
            var i = $("#selectEmojidiv");
            if (i.is(":visible")) i.hide(),
            $("html").unbind("click");
            else {
                $("html").one("click",
                function(n) {
                    n.stopPropagation();
                    i.hide()
                });
                i.show()
            }
        },
        ClickEmojiDiv: function(n, t) {
            t.stopPropagation()
        },
        ClickEmoji: function(n) {
            var t = $("#txtMenuName"),
            i = $("#selectEmojidiv");
            t.val(t.val() + n).trigger("keyup");
            i.hide()
        },
        Menus: ko.observable(),
        MenusReset: function() {
            var t = JSON.stringify(n.Menus());
            n.Menus(undefined);
            n.Menus(JSON.parse(t));
            MenuFormValidate()
        },
        MenuIndex: ko.observable(),
        isEditMenu: ko.observable(!1),
        isSaveMenu: ko.observable(!0),
        BottonIndex: ko.observable( - 1),
        SubBottonIndex: ko.observable( - 1),
        Menu: ko.observable(),
        InputMenu: ko.observable(),
        EditMenuType: ko.observable(),
        MenuTypeChange: function(t, i) {
            var e = $(i.currentTarget).find("option:selected"),
            f,
            u,
            r;
            $("#txtMenuButtonValue").attr("placeholder", e.attr("pl"));
            f = e.attr("value");
            f === "miniprogram" && (u = n.Menu(), u.pagepath == undefined && u.appid == undefined && (u.pagepath = "", u.appid = ""));
            n.EditMenuType(f);
            r = "";
            switch (f) {
            case "view":
                r = "跳转URL用户点击view类型按钮后，微信客户端将会打开开发者在按钮中填写的网页URL，可与网页授权获取用户基本信息接口结合，获得用户基本信息";
                break;
            case "click":
                r = "点击推事件用户点击click类型按钮后，微信服务器会通过消息接口推送消息类型为event的结构给开发者（参考消息接口指南），并且带上按钮中开发者填写的key值，开发者可以通过自定义的key值与用户进行交互";
                break;
            case "scancode_push":
                r = "扫码推事件用户点击按钮后，微信客户端将调起扫一扫工具，完成扫码操作后显示扫描结果（如果是URL，将进入URL），且会将扫码的结果传给开发者，开发者可以下发消息";
                break;
            case "scancode_waitmsg":
                r = "扫码推事件且弹出“消息接收中”提示框用户点击按钮后，微信客户端将调起扫一扫工具，完成扫码操作后，将扫码的结果传给开发者，同时收起扫一扫工具，然后弹出“消息接收中”提示框，随后可能会收到开发者下发的消息";
                break;
            case "pic_sysphoto":
                r = "弹出系统拍照发图用户点击按钮后，微信客户端将调起系统相机，完成拍照操作后，会将拍摄的相片发送给开发者，并推送事件给开发者，同时收起系统相机，随后可能会收到开发者下发的消息";
                break;
            case "pic_photo_or_album":
                r = "弹出拍照或者相册发图用户点击按钮后，微信客户端将弹出选择器供用户选择“拍照”或者“从手机相册选择”。用户选择后即走其他两种流程";
                break;
            case "pic_weixin":
                r = "弹出微信相册发图器用户点击按钮后，微信客户端将调起微信相册，完成选择操作后，将选择的相片发送给开发者的服务器，并推送事件给开发者，同时收起相册，随后可能会收到开发者下发的消息";
                break;
            case "location_select":
                r = "弹出地理位置选择器用户点击按钮后，微信客户端将调起地理位置选择工具，完成选择操作后，将选择的地理位置发送给开发者的服务器，同时收起位置选择工具，随后可能会收到开发者下发的消息";
                break;
            case "media_id":
                r = "下发消息（除文本消息）用户点击media_id类型按钮后，微信服务器会将开发者填写的永久素材id对应的素材下发给用户，永久素材类型可以是图片、音频、视频、图文消息。请注意：永久素材id必须是在“素材管理/新增永久素材”接口上传后获得的合法id";
                break;
            case "view_limited":
                r = "跳转图文消息URL用户点击view_limited类型按钮后，微信客户端将打开开发者在按钮中填写的永久素材id对应的图文消息URL，永久素材类型只支持图文消息。请注意：永久素材id必须是在“素材管理/新增永久素材”接口上传后获得的合法id";
                break;
            case "miniprogram":
                r = "打开小程序用户点击按钮后，微信客户端将会打开开发者在按钮中所填写的PagePath小程序的页面，不支持小程序的老版本客户端将打开在按钮中填写的URL";
                break;
            default:
                r = ""
            }
            $(i.currentTarget).tooltip("destroy");
            $(i.currentTarget).tooltip({
                title: r,
                animation: !1
            })
        },
        CopyMenu: ko.observable(),
        Copy: function() {
            if (n.Menu() != undefined) {
                var t = JSON.stringify(n.Menu());
                n.CopyMenu(JSON.parse(t));
                n.Menu(undefined)
            }
        },
        Paste: function() {
            if (n.CopyMenu() != undefined) {
                var t = JSON.parse(JSON.stringify(n.CopyMenu())); (n.SubBottonIndex() === -1 || t.sub_button == undefined) && (n.isEditMenu() || n.MenuIndex() == undefined) || delete t.sub_button;
                n.Menu(t);
                MenuFormValidate()
            }
        },
        Up: function() {
            var t = n.BottonIndex(),
            r = n.SubBottonIndex(),
            i = r - 1;
            n.Menus().button[t].sub_button[r] = n.Menus().button[t].sub_button[i];
            n.Menus().button[t].sub_button[i] = n.Menu();
            n.MenusReset();
            n.SubBottonIndex(i)
        },
        Down: function() {
            var t = n.BottonIndex(),
            r = n.SubBottonIndex(),
            i = r + 1;
            n.Menus().button[t].sub_button[r] = n.Menus().button[t].sub_button[i];
            n.Menus().button[t].sub_button[i] = n.Menu();
            n.MenusReset();
            n.SubBottonIndex(i)
        },
        Left: function() {
            var i = n.BottonIndex(),
            r = n.SubBottonIndex(),
            t;
            r === -1 && (t = i - 1, n.Menus().button[i] = n.Menus().button[t], n.Menus().button[t] = n.Menu(), n.MenusReset(), n.BottonIndex(t))
        },
        Right: function() {
            var i = n.BottonIndex(),
            r = n.SubBottonIndex(),
            t;
            r === -1 && (t = i + 1, n.Menus().button[i] = n.Menus().button[t], n.Menus().button[t] = n.Menu(), n.MenusReset(), n.BottonIndex(t))
        },
        EditMenu: function(t, i, r) {
            n.BottonIndex(i);
            n.SubBottonIndex(r);
            n.isEditMenu(!0);
            var f = JSON.stringify(t),
            u = JSON.parse(f);
            u.sub_button != undefined && u.sub_button.length > 0 ? u.type !== "menu" && (u.otype = u.type, u.type = "menu") : u.type === "menu" && (u.type = u.otype);
            n.Menu(u)
        },
        AddMenu: function(t) {
            n.BottonIndex( - 1);
            n.SubBottonIndex( - 1);
            n.isEditMenu(!1);
            n.MenuIndex(t);
            n.Menu({
                type: "view",
                name: "",
                value: ""
            })
        },
        DeleteMenu: function() {
            $(n.Menus().button).each(function(t, i) {
                t === n.BottonIndex() && n.SubBottonIndex() === -1 && n.Menus().button.splice(t, 1);
                i.sub_button instanceof Array && $(i.sub_button).each(function(r) {
                    t === n.BottonIndex() && r === n.SubBottonIndex() && i.sub_button.splice(r, 1)
                })
            });
            n.Menu(undefined);
            n.MenuIndex(undefined);
            n.BottonIndex( - 1);
            n.SubBottonIndex( - 1);
            n.MenusReset()
        },
        CancelMenuSave: function() {
            n.Menu(undefined);
            n.MenuIndex(undefined);
            n.BottonIndex( - 1);
            n.SubBottonIndex( - 1)
        },
        MenuSave: function() {
            if ($("#MenuForm").data("validator").form() && n.NameErrorMessage() == undefined && n.ValueErrorMessage() == undefined) {
                if (n.isEditMenu()) {
                    var t = n.BottonIndex(),
                    i = n.SubBottonIndex();
                    i === -1 ? n.Menus().button[t] = n.Menu() : n.Menus().button[t].sub_button[i] = n.Menu()
                } else n.MenuIndex() != undefined ? (n.Menus().button[n.MenuIndex()].sub_button == undefined && (n.Menus().button[n.MenuIndex()].sub_button = []), n.Menus().button[n.MenuIndex()].sub_button.unshift(n.Menu())) : n.Menus().button.push(n.Menu());
                n.Menu(undefined);
                n.MenuIndex(undefined);
                n.BottonIndex( - 1);
                n.SubBottonIndex( - 1);
                n.MenusReset()
            }
        },
        TrimMenuButton: function(n) {
            var t = {};
            return (n.sub_button == undefined || n.sub_button.length === 0) && (n.type === "menu" && (n.type = n.otype), t.type = n.type, n.type === "view" || n.type === "miniprogram" ? (t.url = n.value, n.type === "miniprogram" && (t.appid = n.appid, t.pagepath = n.pagepath)) : n.type === "media_id" || n.type === "view_limited" ? t.media_id = n.value: t.key = n.value),
            t.name = n.name,
            t
        },
        InitMenuButton: function(n) {
            var t = {};
            return t.type = n.type != undefined ? n.type: "menu",
            t.name = n.name,
            n.type === "view" || n.type === "miniprogram" ? (t.value = n.url, n.type === "miniprogram" && (t.appid = n.appid, t.pagepath = n.pagepath)) : t.value = n.type === "media_id" || n.type === "view_limited" ? n.media_id: n.key || "",
            t
        },
        InitMenus: function(t) {
            var i = {
                button: []
            };
            try {
                if (t.button == undefined) throw "格式错误";
                $(t.button).each(function(t, r) {
                    var u = n.InitMenuButton(r);
                    r.sub_button instanceof Array && r.sub_button.length > 0 && (u.sub_button = [], $(r.sub_button).each(function(t, i) {
                        u.sub_button.push(n.InitMenuButton(i))
                    }));
                    i.button.push(u)
                })
            } catch(r) {
                alert("请参照下方实时JSON输入正确的菜单数据")
            }
            return i
        },
        ConfirmInputMenu: function() {
            var t = n.InputMenu() || "",
            i,
            r;
            if ($.trim(t).length === 0) {
                alert("请输入菜单数据");
                return
            }
            try {
                i = JSON.parse(t);
                r = n.InitMenus(i);
                n.Menu(undefined);
                n.MenuIndex(undefined);
                n.BottonIndex( - 1);
                n.SubBottonIndex( - 1);
                n.Menus(undefined);
                n.Menus(r);
                $("#InputJSONModel").modal("hide")
            } catch(u) {
                alert("请输入正确的菜单数据")
            }
        },
        EditMenus: function(t) {
            var r;
            if (t == undefined) r = {},
            r.button = [],
            n.Menus(r);
            else {
                
                $("#btnQueryMenu").button("查询中...");
                $.ajax({
                    url: "api/getMenu.asp",
                    //datatype: "JSON",
                    type: "get",
                    async: !0,
                    //contentType: "application/json; charset=UTF-8",
                    success: function(t) {
						//console.log(t.menu);
                        //if ($("#btnQueryMenu").button("reset"), t.Success) {
                            var i = t,
                            r = JSON.parse(i).menu,
                            u = n.InitMenus(r);
                            n.Menu(undefined);
                            n.MenuIndex(undefined);
                            n.BottonIndex( - 1);
                            n.SubBottonIndex( - 1);
                            n.Menus(undefined);
                            n.Menus(u)
							//console.log(r);
                        //} else alert(t.Messages)
                    },
                    error: function(n, t) {
                        $("#btnQueryMenu").button("reset");
                        console.error(t)
                    }
                })
            }
        },
        SaveMenus: function() {
            var c = n.NewMenu();
            $("#btnSubmitMenu").button("发布中...");
			//console.log(JSON.stringify(c));
            $.ajax({
                url: "api/setMenu.asp",
                //datatype: "text",
                type: "POST",
                async: !0,
                data:{mymenu:JSON.stringify(c)},			//{	"menu": JSON.stringify({menu:JSON.stringify(c)}) },
                //contentType: "multipart/form-data; charset=UTF-8",
                success: function(n) {
                    $("#btnSubmitMenu").button("reset");
                    n=="true" ? alert("发布成功") : alert(n)
                },
                error: function(n) {
                    $("#btnSubmitMenu").button("reset");
                    console.error(c)
                }
            })
        }
    };
    n.IsPaste = ko.dependentObservable(function() {
        return this.CopyMenu() != undefined
    },
    n);
    n.IsUp = ko.dependentObservable(function() {
        return this.SubBottonIndex() > 0
    },
    n);
    n.IsDown = ko.dependentObservable(function() {
        return this.Menus() == undefined ? !1 : this.BottonIndex() >= 0 && this.SubBottonIndex() >= 0 && this.Menus().button[this.BottonIndex()].sub_button != undefined && this.SubBottonIndex() < this.Menus().button[this.BottonIndex()].sub_button.length - 1
    },
    n);
    n.IsLeft = ko.dependentObservable(function() {
        return this.BottonIndex() > 0 && this.SubBottonIndex() === -1
    },
    n);
    n.IsRight = ko.dependentObservable(function() {
        return this.Menus() == undefined ? !1 : this.BottonIndex() >= 0 && this.BottonIndex() < this.Menus().button.length - 1 && this.SubBottonIndex() === -1
    },
    n);
    n.SelectedCss = ko.dependentObservable(function() {
        var n = this.BottonIndex(),
        t = this.SubBottonIndex();
        $("div.list-group-item").removeClass("list-group-item-selected");
        n >= 0 && (t >= 0 ? $("div.list-group-item[bottonindex=" + n + "][subbottonindex=" + t + "]").addClass("list-group-item-selected") : $("div.list-group-item[bottonindex=" + n + "]").addClass("list-group-item-selected"))
    },
    n);
    n.NameErrorMessage = ko.observable();
    n.EventNameErrorMessage = function(t, i) {
        var r, f, u, e, o;
        $(i.currentTarget).trigger("change");
        n.Menu() != undefined ? (r = !1, n.isEditMenu() ? (f = n.SubBottonIndex(), r = f === -1 ? !0 : !1) : r = n.MenuIndex() != undefined ? !1 : !0, u = 0, u = r ? 16 : 60, e = n.Menu().name, o = getbyteLenth(e), o > u ? (n.NameErrorMessage("已超出最大长度"), $(i.currentTarget).popover({
            trigger: "manual",
            animation: !1
        }), $(i.currentTarget).popover("show")) : ($(i.currentTarget).popover("destroy"), n.NameErrorMessage(undefined))) : ($(i.currentTarget).popover("destroy"), n.NameErrorMessage(undefined))
    };
    n.ValueErrorMessage = ko.observable();
    n.EventValueErrorMessage = function(t, i) {
        var r, f, u, e, o;
        $(i.currentTarget).trigger("change");
        n.Menu() != undefined ? (r = 0, f = n.Menu().type, f === "view" ? r = 1024 : (u = parseInt(n.Type()), u === 1 ? r = 128 : u === 2 && (r = 256)), e = n.Menu().value, o = getbyteLenth(e), o > r ? (n.ValueErrorMessage("已超出最大长度"), $(i.currentTarget).popover({
            trigger: "manual",
            animation: !1
        }), $(i.currentTarget).popover("show")) : ($(i.currentTarget).popover("destroy"), n.ValueErrorMessage(undefined))) : ($(i.currentTarget).popover("destroy"), n.ValueErrorMessage(undefined))
    };
    n.NewMenu = ko.dependentObservable(function() {
        if (this.Menus() == undefined) return undefined;
        var t = {
            button: []
        },
        i = JSON.parse(JSON.stringify(this.Menus()));
        return $(i.button).each(function(i, r) {
            var u = n.TrimMenuButton(r);
            r.sub_button instanceof Array && r.sub_button.length > 0 && (u.sub_button = [], $(r.sub_button).each(function(t, i) {
                u.sub_button.push(n.TrimMenuButton(i))
            }));
            t.button.push(u)
        }),
        t
    },
    n);
    n.Menu.subscribe(function(t) {
        if (t != undefined) {
            var i = t.type;
            i !== "miniprogram" && n.EditMenuType(i);
            setTimeout(function() {
                n.EditMenuType(i);
                MenuFormValidate();
                $("#selectMenuType").trigger("change")
            },
            100)
        }
    });
    n.EditMenus();
    ko.applyBindings(n, document.getElementById("divMain"));
    ko.applyBindings(n, document.getElementById("jsonShow"));
    //ko.applyBindings(n, document.getElementById("InputJSONModel"));
    MenuFormValidate();
    $("#divMenu").show();
    $.LoadingHide();
    $("#selType").change(function() {
        $(this).val() === "2" ? $("#selTokenType").val("1").trigger("change") : $("#selTokenType").removeAttr("disabled")
    });
    $('[data-toggle="tooltip"]').tooltip()
})