/**
 * Created by lizhenya on 2018/5/19.
 */

function openCart() {
    var t = $(window).width();
    0 == $(".shopping_all").length ? t > 768 ? $("#shop_cart").animate({
        right: 35
    }, 300) : $("#shop_cart").animate({
        right: 0
    }, 300) : t > 980 ? $("#shop_cart").animate({
        right: 35
    }, 300) : $("#shop_cart").animate({
        right: 0
    }, 300),
    $(".compare_btn").hasClass("open") && closeCompare(),
        $(".shop_cart").addClass("bg")
}
function openBar() {
    toolbar.hasClass("open") || (toolbar.addClass("open"),
        $("#shop_cart .lazyload").removeClass("hidden").find("img").trigger("appear"),
        $(".global_toolbar").removeClass("default"),
        $(".toolbar_btn").css({
            top: "50%",
            marginTop: -$(".toolbar_btn").height() / 2
        })),
        $(".global_toolbar").removeClass("opacity"),
        $(".toolbar_btn").removeClass("default")
}
function closeBar() {
    $(".toolbar_btn a").removeClass("current"),
        toolbar.removeClass("open"),
        $(".toolbar_btn").removeClass("default")
}
function openCartMeiu() {
    var t = $(window).width();
    $(".bar_cart").hasClass("current") || $(".bar_cart").addClass("current").siblings("a").removeClass("current"),
        $(".global_toolbar").hasClass("open") ? closeBar() : openBar(),
        t > 768 ? $(".bar_cart").hasClass("current") || $(".bar_cart").trigger("click") : openBar()
}

function isChecked() {
    $("#shop_cart .go_btn").removeClass("disable"),
        $("#shop_cart .go_btn").attr("href", $("#shop_cart .go_btn").attr("data-url"));
    for (var t = "", e = document.getElementsByName("checkbox_c_Name"), i = 0; i < e.length; i++) {
        var r = $(e[i]).attr("data-url");
        if (1 == e[i].checked) {
            if ("undefined" != r) {
                var n = r.split("|")
                    , o = $(e[i]).siblings(".amount_btn").find("input").val();
                t += "" != t ? "|" + n[1] + "," + o + "," + n[0] + ",1" : n[1] + "," + o + "," + n[0] + ",1"
            }
        } else if ("undefined" != r) {
            var n = r.split("|")
                , o = $(e[i]).siblings(".amount_btn").find("input").val();
            t += "" != t ? "|" + n[1] + "," + o + "," + n[0] + ",0" : n[1] + "," + o + "," + n[0] + ",0"
        }
    }
    var s = $("#vHidelink").val() + encodeURIComponent($("#vHideToken").val());
    s = (s = (s = s.replace("en-GB", "uk")).replace("ru-RU", "ru")).replace("test120.huawei.com/zh", "test120.huawei.com/zh/EBG/Home").replace("test120.huawei.com/cn", "test120.huawei.com/zh/EBG/Home");
    var a = {
        type: 23,
        vgUserId: $("#hidevUserName").val(),
        UpdateString: t
    };
    $.ajax({
        url: s,
        type: "POST",
        data: a,
        success: function(t) {},
        error: function(t) {}
    }),
        CheckedAll()
}

function BindFCPwdHref() {
    var t = $("#aForgotPassword").attr("href")
        , e = $("#aChangePassword").attr("href");
    try {
        var i = GetQueryString("redirect");
        if (IsEmpty(i)) {
            var r = getLanguages()
                , n = "http://" + window.location.host + "/" + r;
            $("#aForgotPassword").attr("href", t + n),
                $("#aChangePassword").attr("href", e + n)
        } else {
            var o = decodeURI(i);
            o = o.replace("+", " ").replace("+", " ").replace("+", " ").replace("+", " ").replace("+", " ").replace("+", " ").replace("+", " ").replace("+", " "),
                $("#aForgotPassword").attr("href", t + o),
                $("#aChangePassword").attr("href", e + o)
        }
    } catch (s) {}
}

var toolbar = $(".global_toolbar");
$(function() {
    $("#wap_cartbtn_display").addClass("none");
    var t = $(window).height();
    $(window).width();
    setTimeout(function() {
    }, 5e3),
        $("body").click(function(t) {
            toolbar.hasClass("open") && closeBar()
        }),
        toolbar.click(function(t) {
            t.stopPropagation()
        }),
        $(".go_compare").click(function(t) {
            t.stopPropagation(),
                gpXlItemId = $("#hideItemId").val(),
                $(".m-pic_details.show").length > 3 ? $("#popup_full").fadeIn(300) : (LoadCompareAll(),
                    joinCompareOne(this),
                    $(".m-pic_details.show").length < 2 ? $(".m-compared .m-con .m-list .m-btn .m-db").removeClass("off") : $(".m-compared .m-con .m-list .m-btn .m-db").addClass("off"),
                    $(".m-compared .m-con .m-list .m-btn .m-del").removeClass("delete"))
        }),
        $("#popup_full .solid_btn").click(function() {
            $("#popup_full").fadeOut(300)
        }),
        $("#compare_column").find(".m-db").click(function() {
            if ($(this).hasClass("off")) {
                var t = $("#hideCompareList").val()
                    , e = $("#hideItemId").val()
                    , i = $(this).attr("data-url")
                    , r = "";
                r = (r = (r = (r = "?" == /\?/.exec(i) ? i + "&hideCompareList=" + t + e + "|" : i + "?hideCompareList=" + t + e + "|").replace("en-GB", "uk")).replace("ru-RU", "ru")).replace("test120.huawei.com/zh", "test120.huawei.com/zh/EBG/Home").replace("test120.huawei.com/cn", "test120.huawei.com/zh/EBG/Home"),
                    window.open(r)
            }
        }),
        $(".select_all").click(function() {
            $("input.checkbox_c").prop("checked", $(this).prop("checked")),
                countAll()
        }),
        $(".select_all").bind("click", isChecked);
    $(window).width();
    $("#shop_cart h4 a").click(function() {
        closeCart(),
            closeCompare()
    }),
        $("#shop_cart").find(".go_btn").click(function() {
            if ($(this).hasClass("disable"))
                return !1;
            AllUpdateOrderShoppingCar()
        }),
        $(window).resize(function() {
            autoShopcartH()
        }),
        $(".compare_table tr:odd").addClass("gray_bg"),
        $(".compare_table tr td:last-child").addClass("last");
    var e;
    e = /MSIE /i.test(navigator.userAgent) ? 565 : 625,
        $("#choose_products li").click(function() {
            $(this).addClass("current").siblings("li").removeClass("current"),
                $(this).find("dl").each(function() {
                    $(this).find("dd span:even").each(function() {
                        var t = 0
                            , e = $(this).outerHeight(!0)
                            , i = $(this).next("span").outerHeight(!0);
                        t = e >= i ? e : i,
                            $(this).height(t),
                            $(this).next("span").height(t)
                    })
                });
            var t = 0
                , i = 60
                , r = $("#productBox").height();
            $(this).find("dl").each(function() {
                i += $(this).outerHeight(!0)
            }),
                i > e && i > r ? $(".choose_products").height(i) : $(".choose_products").height("auto");
            var n = $(document).scrollTop()
                , o = $("#choose_products").offset().top - $("#nav-cont.fix .nav-list").height()
                , s = $("#choose_products ul").offset().top;
            if (n >= o) {
                var a = (n = $(document).scrollTop()) - s + $("#nav-cont.fix .nav-list").height();
                $(this).find(".item_layer").css({
                    top: a
                });
                var c = (t = a > 0 ? a : 0) + $("#pc_sidebar h3").height();
                if (i + c < e) {
                    var h = $("#pc_sidebar").height() - c;
                    $(this).find(".item_layer").css({
                        "min-height": h
                    })
                } else
                    $(this).find(".item_layer").css({
                        height: i
                    }),
                        $(".choose_products").height(i + t + 50)
            } else
                $(this).find(".item_layer").css({
                    top: -50
                }),
                    $(this).find(".item_layer").css({
                        "min-height": e
                    })
        }),
        $(".item_layer dd span a").click(function(t) {
            t.stopPropagation(),
                $("#choosen_tips").show(),
                $(".product_series .picbox font").hide(),
                $(this).parents(".item_layer").parent("li").removeClass("current"),
                $(".choose_products").height("auto")
        }),
        $(".r_item dd a").click(function() {
            $("#choosen_tips").show(),
                $(".product_series .picbox font").hide(),
                $(this).parents(".fixed_sidebar").hide()
        });
    var i = t - $(".fixed_sidebar h1").outerHeight(!0);
    $(".l_sidebar,.r_item").height(i),
        $(".l_sidebar li").click(function() {
            $(this).addClass("current").siblings("li").removeClass("current");
            var t = $(this).index();
            $(".item_wrap").eq(t).removeClass("none").siblings(".item_wrap").addClass("none")
        }),
        $(".wap_pro_sidebar").click(function() {
            $(".fixed_sidebar").fadeIn()
        }),
        $(".fixed_sidebar h1 a").click(function() {
            $(this).parents(".fixed_sidebar").fadeOut()
        }),
        $("body").click(function() {
            $("#pc_sidebar li").removeClass("current")
        }),
        $("#pc_sidebar,.item_layer").click(function(t) {
            t.stopPropagation()
        }),
        $(".toolbar_btn a:not('.bar_forum')").bind("click", function(t) {
            t.stopPropagation();
            var e = $(this).attr("data-id")
                , i = $("." + e);
            $(this).hasClass("current") ? $(this).removeClass("current") : $(this).addClass("current").siblings("a").removeClass("current"),
                i.hasClass("open") ? closeBar() : openBar()
        }),
        $(".wap_cartbtn").bind("click", function(t) {
            t.stopPropagation(),
                autoShopcartH(),
            $(this).hasClass("disable") || ($(".global_toolbar").hasClass("open") ? closeBar() : openBar())
        }),
        $(".js_column h4 a").click(function() {
            closeBar()
        })
});
var gpXlItemId = ""
    , winH = $(window).height()
    , compared_h = 0;
$(window).load(function() {
    $(".js-m-compared .js-m-list").each(function() {
        var t = $(this).outerHeight();
        compared_h > t || (compared_h = t)
    }),
        $(".js-m-compared .js-m-list").outerHeight(compared_h),
        $(".js-m-compared").css("bottom", -compared_h - 200),
        $(".arrow-off").on("click", function() {
            var t = $(this);
            t.hasClass("active") ? (t.css("background", "url(/Assets/EBG/img/arrow-top.jpg) no-repeat center center"),
                t.removeClass("active"),
                $(".js-m-compared").removeClass("active").animate({
                    bottom: -compared_h
                })) : (t.css("background", "url(/Assets/EBG/img/arrow-bottom.jpg) no-repeat center center"),
                t.addClass("active"),
                $(".js-m-compared").addClass("active").animate({
                    bottom: 0
                }))
        }),
        $(".m-btn a.m-del").on("click", function() {
            gpXlItemId = "",
                $("#hideCompareNow").val("");
            for (var t = $("#hideCompareList").val().split("|"), e = 0; e < t.length - 1; e++) {
                var i = $(".m-bomb_box-block a[data-id='" + t[e] + "']")
                    , r = i.attr("data-name");
                i.html(r),
                    i.removeClass("disable")
            }
            $("#hideCompareList").val(""),
                $(".js-m-pic_details").css("display", "none").removeClass("show"),
                $(".js-m-list-ul").css("display", "block"),
                $(".m-pic_details.show").length < 2 ? $(".m-compared .m-con .m-list .m-btn .m-db").removeClass("off") : $(".m-compared .m-con .m-list .m-btn .m-db").addClass("off"),
                $(".m-compared .m-con .m-list .m-btn .m-del").addClass("delete")
        }),
        $("#shoppingCart").on("click", function() {
            var t = (new Date).getTime();
            hwaTrackEventClick($("#gLanguageCurrent").val() + "购物车按钮", "购物车按钮", "购物车按钮", "购物车按钮", t)
        })
})
var partnerRefresh = !1;
$("#pwdpopup").keydown(function(t) {
    t.keyCode,
        $(".tips_error").html("")
});
var popupcountdown = 300
    , timerNew = null;
$("#btn_popup_login").unbind("click").click(function() {
    $(".popup_login").css("display", "block"),
    $("#userNamepopup").attr("placeholder") != $("#userNamepopup").val() && $("#userNamepopup").val(""),
        $("#pwdpopup").val("")
});
var JSEncryptExports = {};


function openContact() {
    "ar-sa" == $("#gLanguageCurrent").val() ? ($(".contact_btn").addClass("open"),
        $(".contact_btn b").show(),
        $(".contact_layer").animate({
            left: 35
        }, 330)) : ($(".contact_layer").css({
        "margin-top": $(".contact_btn").css("margin-top")
    }),
        $(".contact_layer").animate({
            right: 35
        }, 300),
        $(".contact_btn").addClass("open"),
        $(".contact_btn b").show(),
        closeCompare(),
        closeCart())
}
function closeContact() {
    "ar-sa" == $("#gLanguageCurrent").val() ? ($(".contact_btn").removeClass("open"),
        $(".contact_btn b").hide(),
        $(".contact_layer").animate({
            left: -250
        })) : ($(".contact_layer").animate({
        right: -250
    }, 300),
        $(".contact_btn").removeClass("open"),
        $(".contact_btn b").hide())
}
function closeCompare() {
    var e = $("#compare_column");
    winW > 768 ? e.animate({
        right: -335
    }, 300) : e.animate({
        right: "-100%"
    }, 300),
        $(".compare_btn b").hide(),
        $(".compare_btn").removeClass("open")
}
function closeCart() {
    0 == $(".shopping_all").length ? winW > 768 ? $("#shopping_cart").animate({
        right: -335
    }, 300) : $("#shopping_cart").animate({
        right: "-100%"
    }, 300) : winW > 980 ? $("#shopping_cart").animate({
        right: -335
    }, 300) : $("#shopping_cart").animate({
        right: "-100%"
    }, 300),
        $(".shopping_cart").removeClass("bg"),
        $(".shopping_btn b").hide(),
        $(".shopping_btn").removeClass("open")
}

var winW = $(window).width()
    , hwa_DisablHwa = "" != document.domain || "1" == $("#hidDisableHwa").val() || navigator.userAgent.match(/AppleWebKit.*Mobile.*/) || navigator.userAgent.indexOf("iPad") > -1;
!hwa_DisablHwa && checkDomain(),

    $(function() {
        get_FeedBack_Url()
    })
