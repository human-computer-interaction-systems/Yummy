<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <title>ClientNewOrder</title>
    <!-- Bootstrap Core CSS -->
    <link href="./assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./lite/css/style.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="./css1/password.css">
    <!-- You can change the theme colors from here -->
    <link href="./lite/css/colors/blue.css" id="theme" rel="stylesheet">
    <link href="css1/cart.css" rel="stylesheet">
    <link href="css1/toastr.min.css" rel="stylesheet">

    <style type="text/css">


        .css_column h4 a {
            font-size: 20px;
            position: absolute;
            top: 19px;
            right: 10px;
            display: block;
            width: 20px;
            height: 20px;
            color: #bfbfbf;
        }

        .global_toolbar.open {
            width: 320px;
        }
        .global_toolbar {
            position: fixed;
            z-index: 1001;
            top: 0;
            right: 0;
            width: 0;
            height: 100%;
            -webkit-transition: all .4s cubic-bezier(.2,.83,.42,.91);
            transition: all .4s cubic-bezier(.2,.83,.42,.91);
            border-left: 1px solid #d0d0d0;
            background: #fff;
        }
        .toolbar_btn {
            position: absolute;
            top: 100%;
            left: -60px;
            width: 60px;
        }
        .toolbar_btn a, .toolbar_btn a samp {
            position: relative;
            display: block;
            height: 60px;
            color:#666;
            text-decoration: none;
            -webkit-transition: all .4s cubic-bezier(.2,.83,.42,.91);
            transition: all .4s cubic-bezier(.2,.83,.42,.91);
            border-bottom: 1px solid #37393d;
        }

        .toolbar_btn a.current samp, .toolbar_btn a:hover samp {
            border-bottom: 1px solid #e50000;
            background-color: #e50000;
        }
        .toolbar_btn a samp {
            z-index: 2;
            width: 60px;
            color: #fff;
            background-color: #000;
        }

        .toolbar_btn a, .toolbar_btn a samp {
            position: relative;
            display: block;
            height: 60px;
            -webkit-transition: all .4s cubic-bezier(.2,.83,.42,.91);
            transition: all .4s cubic-bezier(.2,.83,.42,.91);
            border-bottom: 1px solid #37393d;
        }
        .iconi {
            width: 30px;
            height: 30px;
            display: block;
            position: absolute;
            top: 15px;
            left: 15px;
        }

        i {
            font-style: normal;
        }
        .icon-LiveChat1 img {
            width: 100%;
            height: auto;
            display: block;
            border: none;
        }
        .toolbar_btn a em {
            font-size: 16px;
            font-style: normal;
            line-height: 60px;
            position: absolute;
            z-index: 1;
            top: 0;
            right: 60px;
            display: block;
            overflow: hidden;
            width: 0;
            height: 60px;
            -webkit-transition: all .4s cubic-bezier(.2,.83,.42,.91);
            transition: all .4s cubic-bezier(.2,.83,.42,.91);
            text-align: center;
            color: #fff;
            background-color: #000;
        }
        .css_column, .toolbar_content {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
        }
        .toolbar_content {
            z-index: 3;
            width: 100%;
            background:#ecf2f6;
        }

        .css_column {
            z-index: 1000;
            overflow: hidden;
            width: 320px;
            min-width: 280px;
            background: #fafafa;
        }
        .css_column h4 {
            font-size: 24px;
            position: relative;
            margin: 0;
            padding: 15px 20px;
            color: #666;
            border-bottom: 1px solid #e6e6e6;
            background: #fff;
            font-weight: normal;
        }
        .resultData {
            overflow: auto;
            background:#ecf2f6;
        }
        .cart_column ul {
            overflow: auto;
            padding: 0 20px;
            border-bottom: 1px solid #e6e6e6;
        }

        .shop-cartfooter {
            bottom:0;
            right:0;
            width: 320px;
            position: absolute;
            height: 46px;
            line-height: 46px;
            background-color: #2c2c2c;
            box-shadow: 0 1px 3px #2c2c2c;
        }

        .shop-cartfooter-text.price {
            font-size: 24px;
            padding-left:10%;
        }

        .shop-cartfooter-text {
            color: #fff;
        }
        .shop-cartfooter-text, .shop-carticon {
            display: inline-block;
            vertical-align: middle;
        }
        .shop-cartfooter-checkout {
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            border: 0;
            outline: 0;
            width: 120px;
            text-align: center;
            background-color: #51d862;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
        }

        .restaurant{
            background-color: #fff;
            border-bottom: 1px #f5f5f5 solid;
            width: 48%;
            height: 150px;
            float: left;
            font-size: 12px;
            position: relative;
            margin: 6px;
        }

        .restaurant-logo{
            padding: 20px;
            color: #999;
            text-align: center;
            float: left;
            font-size: 12px;
            position: relative;
        }

        .restaurant-logo-icon{
            display: block;
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        .restaurant-content{
            padding: 20px;
        }
        .restaurant-title{
            font-size: 16px;
            margin-bottom: 6px;
            font-weight: 600;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #333;
        }
        .restaurant-address{
            color: #999;
            margin-top: 3px;
        }

        .shopmenu-food-price {
            bottom: 10px;
            font-size: 14px;
            font-weight: 700;
            color: #f74342;
        }

        .shopmenu-food-button{
            float: right;
            display: inline-block;
            position: absolute;
            right: 10px;
            bottom: 10px;
            border: 0;
            cursor: pointer;
            width: 90px;
            height: 26px;
            line-height: 26px;
            border-radius: 20px;
            text-align: center;
            outline: 0;
            display: inline-block;
            background-color: #0089dc;
            color: #fff;
        }

        .star-rating {
            unicode-bidi: bidi-override;
            color: #ddd;
            font-size: 0;
            height: 20px;
            margin: 0;
            position: relative;
            display: table;
            padding: 0;
            text-shadow: 0px 1px 0 #a2a2a2;
        }

        .star-rating span {
            padding: 5px;
            font-size: 15px;
        }

        .star-rating span:after {
            content: "★";
        }

        .star-rating-top {
            color: #FFD700;
            padding: 0;
            position: absolute;
            z-index: 1;
            display: block;
            top: 0;
            left: 0;
            overflow: hidden;
            white-space: nowrap;
        }

        .star-rating-bottom {
            padding: 0;
            display: block;
            z-index: 0;
        }

        .shopguide {
            background: url(images/shop-bg.jpg) no-repeat;
            background-size: cover;
            padding-top: 48px;
        }

        .shopguide .container {
            position: relative;
            display: table;
            height: 142px;
        }

        .shopguide-info {
            position: relative;
            display: table-cell;
            vertical-align: middle;
            color: #fff;
            z-index: 1;
        }

        .shopguide-info>img {
            margin-right: 15px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            border: 4px solid #FFF;
            border: 4px solid rgba(255,255,255,.3);
            vertical-align: middle;
        }

        .shopguide-info-wrapper{
            display: inline-block;
            vertical-align: middle;
        }

        .shopguide-info h1 {
            font-size: 30px;
            max-width: 270px;
            display: inline-block;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            font-weight: 400;
            color: #fff;
        }

        .shopguide-server {
            display: table-cell;
            padding-right: 100px;
            vertical-align: middle;
            color: #fff;
            text-align: right;
            width: 490px;
        }

        .shopguide-server>span:first-child {
            margin-left: 0;
        }

        .shopguide-server>span {
            display: inline-block;
            margin-left: 30px;
            vertical-align: top;
            text-align: center;
        }

        em{
            font-style: normal;
            font-weight: 400;
            font-size:18px;
        }

        .shopguide-server-value {
            display: block;
            margin-top: 12px;
            margin-bottom: 3px;
            font-size: 20px;
        }


        .u-flyer {
            display: block;
            width: 50px;
            height: 50px;
            border-radius: 50px;
            position: fixed;
            z-index: 9999;
        }

        .deleteGoods{
            font-size: 20px;
            left: 5px;
            top:40px;
            display: block;
            width: 20px;
            height: 20px;
            color: #bfbfbf;
            cursor:pointer;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./css1/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
    

function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}
function show(){
	var rid = (GetQueryString("rid"));
	var restaurant = JSON.parse(sessionStorage.getItem('restaurant_'+rid));
	var rgoods = restaurant.rgoods;
	$("#title").text(restaurant.rname);
	$("#address").text(restaurant.raddress);
	for(var i=0;i<rgoods.length;i++){
	    $("#goodsList").append("<div class=\"restaurant\">\n" +
            "                            <div class=\"restaurant-logo\">\n" +
            "                                <a>\n" +
            "                                    <img class=\"restaurant-logo-icon\" src=\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560838083846&di=04c5d1b32b25162f7836f6b3db8b2000&imgtype=0&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20151127%2F1448617714957094.jpg\">\n" +
            "                                </a>\n" +
            "                            </div>\n" +
            "                            <div class=\"restaurant-content\">\n" +
            "                                <h3 class=\"restaurant-title\">"+rgoods[i].foodName+"</h3>\n" +
            "                                <div class=\"restaurant-address\">\n" +
            "                                    介绍111\n" +
            "                                </div>\n" +
            "                                <div class=\"star-rating\">\n" +
            "                                    <div class=\"star-rating-top\" style=\"width: 50%\">\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                    </div>\n" +
            "                                    <div class=\"star-rating-bottom\">\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                        <span></span>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                                <div class=\"shopmenu-food-price\">\n" +
            "                                    ¥ "+rgoods[i].price+"\n" +
            "                                </div>\n" +
            "\n" +
            "                                <button class=\"shopmenu-food-button\" onclick='addToCart("+i+")'>加入购物车</button>\n" +
            "                            </div>\n" +
            "                        </div>")
    }

	
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"ClientGetResDisServlet",
		dataType:"json",
		data:{"rid":rid},
		success:function(data){
            sessionStorage.setItem('discount', JSON.stringify(data));
            var discount = "";
			var i = 0;
            for (; i < data.length-1; i++) {
                discount += "满"+data[i].amount+"减"+data[i].discount+" ";
            }
            discount += "满"+data[i].amount+"减"+data[i].discount+" ";
		    $("#discount").text(discount)
		}
		});
	
}

function addToCart(i) {
    var event = window.event;
    var x = event.clientX;
    var y = event.clientY;
    var rid = (GetQueryString("rid"));
    var restaurant = JSON.parse(sessionStorage.getItem('restaurant_' + rid));
    var goods = restaurant.rgoods[i];
    var isNew = true;

    $("#cartList").find("li").each(function () {
        if (this.getAttribute('foodName') == goods.foodName) {
            if(parseInt(this.children[2].children[1].children[2].innerHTML) + 1<=goods.quantity){
                this.children[2].children[1].children[2].innerHTML = parseInt(this.children[2].children[1].children[2].innerHTML) + 1;
                addProductAnimation(x, y);
            }
            else{
                toastr.error("你选择的商品库存不足！");
            }
            isNew = false;
        }
    });

    if (isNew) {

        $('#cartList').append("<li class=\"clearfix\" foodName=\"" + goods.foodName + "\">\n" +
            "                                <a onclick=\"removeGoods(this)\" class=\"icon-close deleteGoods\"></a>\n" +
            "                                <div class=\"img_con\">\n" +
            "                                    <img src=\"images/food.png\" alt=\"\">\n" +
            "                                </div>\n" +
            "                                <div class=\"product_name\">\n" +
            "                                    <span>" + goods.foodName + "</span>\n" +
            "                                    <div class=\"row\" style=\"padding-left: 20px\">\n" +
            "                                        <div class=\"text1\" style=\"color:red;\">¥" + goods.price + "</div><div class=\"text1\">　×　</div><div class=\"text1\" style=\"color:#3f88de;\">1</div>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                            </li>");
        addProductAnimation(x, y);
    }


    countAll();
}


function addProductAnimation(x,y) {
    var offset = $('#cart-icon-end').offset(), flyer = $('<img class="u-flyer" src="images/food.png"/>');
    flyer.fly({
        start: {
            left: x,
            top: y
        },
        end: {
            left: offset.left,
            top: 293.390625,
            width: 0,
            height: 0
        }
    });
}

function removeGoods(btn){

    var p = btn.parentElement;
    p.remove();
    countAll();
}

function countAll(){
    var all = 0;
    var result = 0;
    $("#cartList").find("li").each(function () {
        all += parseInt(this.children[2].children[1].children[2].innerHTML) * parseInt(this.children[2].children[1].children[0].innerHTML.substr(1));
    });
    $("#sum").text("");
    $("#sum").innerHTML="";
    var discount = JSON.parse(sessionStorage.getItem('discount'));

    var discount_index = -1;

    for (var i = 0; i < discount.length; i++) {  //遍历Table的所有Row
        //增加数量和总价
        if(all >= discount[i].amount){
            discount_index = i;
        }
    }

    if(discount_index >= 0){
        result = all-discount[discount_index].discount;
        $("#sum").append("<s>¥"+all+"</s>　¥"+result);
    }
    else{
        result = all;
        $("#sum").text("¥ "+all);
    }
    return result;
}

function goPay(){
    var liList = $("#cartList").find("li");
    if(liList.length==0){
        toastr.error("您还没有选择商品！");
    }
    else{
        $("#myModal").modal('show');
    }
}

function confirmPay(){

    //判断密码
    var paymentCode = ${sessionScope.client.paymentCode};
    if(getValue() != paymentCode){
        toastr.error("您输入支付密码不正确！请重新输入。");
        boxInput.init();
        return;
    }

    var identity = ${sessionScope.client.balance};
    if(countAll() > Number(identity)){
        toastr.error("您账户余额不足！请重新选购商品。");
        boxInput.init();
        return;
    }

    //整理数据与数据库连接,此时数据合法
    var rid = (GetQueryString("rid"));
    var caddress = $("#caddress").val();
    //整理商品数据
    var rgoods = [];


    $("#cartList").find("li").each(function () {
        var agoods = new Object();
        agoods.rid = rid;
        agoods.foodName = this.getAttribute('foodName');
        agoods.number = parseInt(this.children[2].children[1].children[2].innerHTML);
        agoods.amount = parseInt(this.children[2].children[1].children[2].innerHTML) * parseInt(this.children[2].children[1].children[0].innerHTML.substr(1));
        rgoods.push(agoods);
    });

    //var obj = JSON.stringify(rgoods);
    var amount = countAll();
    var orderInfo = {
        rid: rid,
        cid: ${sessionScope.client.cid},
        goods: rgoods,
        caddress: caddress,
        totalAmount: amount
    };

    var jsonData = JSON.stringify(orderInfo);

    $.ajaxSetup({cache:false})
    $.ajax({
        type:"post",
        url:"ClientNewOrderServlet",
        dataType:"json",
        data:{"data":jsonData},
        success:function(data) {

        }

    });

    toastr.success("下单成功！");
    setTimeout("window.location.href='ClientOrders.jsp'", 3000 );
}


$(function(){
    show();
    toastr.options = {
        closeButton: false,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-center",
        onclick: null,
        showDuration: "300",
        hideDuration: "1000",
        timeOut: "2000",
        extendedTimeOut: "1000",
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };
    $('#myModal').on('shown.bs.modal', function () {
        var $this = $(this);
        var dialog = $this.find('.modal-dialog');

        //此种方式，在使用动画第一次显示时有问题
        //解决方案，去掉动画fade样式
        var top = ($(window).height() - dialog.height()) / 2;
        dialog.css({
            marginTop:top
        });
    });
});
</script>
</head>
<body class="fix-header fix-sidebar card-no-border">
<!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            
                            <!-- Light Logo icon -->
                            <img src="./assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         
                         <!-- Light Logo text -->    
                         <img src="./assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="./assets/images/users/1.jpg" alt="user" class="profile-pic m-r-10" />Markarn Doe</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">                       
                        <li> <a class="waves-effect waves-dark" href="ClientInfo.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">个人中心</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="ClientOrders.jsp" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">我的订单</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="ClientGetRs.jsp" aria-expanded="false"><i class="mdi mdi-emoticon"></i><span class="hide-menu">点餐</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="ClientInfoChange.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">个人信息修改</span></a>
                        </li>  
                        <li> <a class="waves-effect waves-dark" href="ClientStatistics.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">个人信息统计</span></a>
                        </li>       
                    </ul>              
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
            <!-- Bottom points-->
            <div class="sidebar-footer">
                <!-- item--><a href="" class="link" data-toggle="tooltip" title="Settings" ><i class="ti-settings" style="visibility:hidden"></i></a>
                
                <!-- item--><a href="LogoutServlet" class="link" data-toggle="tooltip" title="Logout" ><i class="mdi mdi-power"></i></a> </div>
            <!-- End Bottom points-->
        </aside>
        <br>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->                
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->

                <div class="shopguide">
                    <div class="container">
                        <div class="shopguide-info">
                            <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560838083846&di=04c5d1b32b25162f7836f6b3db8b2000&imgtype=0&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20151127%2F1448617714957094.jpg">
                            <div class="shopguide-info-wrapper">
                                <div>
                                    <h1 id="title">
                                    </h1>
                                </div>
                                <div class="star-rating">
                                    <div class="star-rating-top" style="width: 50%">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                    <div class="star-rating-bottom">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shopguide-server">
                            <span>
                                <em>地址</em>
                                <em class="shopguide-server-value" id="address">111</em>
                            </span>

                            <span>
                                <em>优惠活动</em>
                                <em class="shopguide-server-value" id="discount"></em>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12" id="goodsList">

                    </div>

                </div>
                
                

                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>


        <div class="global_toolbar">
            <div class="toolbar_btn center" style="top:60%;margin-top:-150px;">
                <a class="bar_cart" data-id="global_toolbar" id="cart-icon-end">
                    <samp>
                        <i class="iconi icon-LiveChat1">
                            <img src="images/car-1.png">
                        </i>
                    </samp>
                </a>
            </div>
            <div class="toolbar_content">
                <div class="css_column cart_column js_column">
                    <h4>
                        购物车<a href="javascript:void(0)" class="icon-close "></a>
                    </h4>
                    <div class="resultData">
                        <ul style="height: auto;" id="cartList">

                        </ul>
                    </div>
                    <div class="shop-cartfooter">

                        <p class="shop-cartfooter-text price" id="sum">

                        </p>
                        <button class="shop-cartfooter-checkout" onclick="goPay()">去结算></button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">输入支付密码</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="wrap">
                            <div class="form-group">
                                <label class="col-sm-12">选择你的送餐地址</label>
                                <div class="col-sm-12">
                                    <select class="form-control form-control-line" id="caddress" name="caddress">
                                        <c:forEach items="${sessionScope.client.addresses}" var="item" varStatus="status">
                                            <option>${item}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="inputBoxContainer" id="inputBoxContainer">
                                <input type="text" class="realInput"/>
                                <div class="bogusInput">
                                    <input type="password" maxlength="6" disabled/>
                                    <input type="password" maxlength="6" disabled/>
                                    <input type="password" maxlength="6" disabled/>
                                    <input type="password" maxlength="6" disabled/>
                                    <input type="password" maxlength="6" disabled/>
                                    <input type="password" maxlength="6" disabled/>
                                </div>
                            </div>
                            <button class="confirmButton" onclick="confirmPay()">支付</button>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script type="text/javascript" src="./assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
    <script type="text/javascript" src="./assets/plugins/bootstrap/js/tether.min.js"></script>
    <script type="text/javascript" src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script type="text/javascript" src="./lite/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script type="text/javascript" src="./lite/js/waves.js"></script>
    <!--Menu sidebar -->
    <script type="text/javascript" src="./lite/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script type="text/javascript" src="./lite/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script type="text/javascript" src="./lite/js/custom.min.js"></script>
    <script type="text/javascript" src="statistics/js/requestAnimationFrame.js"></script>
    <script type="text/javascript" src="statistics/js/fly.js"></script>
    <script type="text/javascript" src="statistics/js/common.js"></script>
    <script type="text/javascript" src="css1/toastr.min.js"></script>
    <script type="text/javascript" src="statistics/js/cart.js"></script>
</body>
</html>