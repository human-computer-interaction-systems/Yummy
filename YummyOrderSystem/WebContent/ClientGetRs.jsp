<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>ClientGetRs</title>
    <!-- Bootstrap Core CSS -->
    <link href="./assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./lite/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="./lite/css/colors/blue.css" id="theme" rel="stylesheet">

    <style type="text/css">

        @import url(https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
        .restaurant:hover {
            background-color: #f5f5f5;
        }

        .restaurant{
            background-color: #fff;
            border-bottom: 1px #f5f5f5 solid;
            width: 32%;
            height: 140px;
            float: left;
            font-size: 12px;
            position: relative;
            cursor: pointer;
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


        .aui-palace-grid {
            position: relative;
            float: left;
            padding: 1px;
            width: 16.6%;
            box-sizing: border-box;
            margin: 5px 0;
            cursor: pointer;
        }

        .aui-palace-grid:hover {
            background-color: #f5f5f5;
        }

        .aui-palace-grid-active {
            background-color: #f5f5f5;
        }

        .aui-palace-grid-icon {
            width: 50px;
            height: 50px;
            margin: 0 auto;
        }

        .aui-palace-grid-icon img {
            display: block;
            width: 100%;
            height: 100%;
            border: none;
        }

        .aui-palace-grid-text {
            display: block;
            text-align: center;
            color: #333;
            font-size: 0.85rem;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            padding-top: 0.2rem;
        }



    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


<![endif]-->
<script src="./css1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function show(){
	 $.ajaxSetup({cache:false});
		$.ajax({
			type:"get",
			url:"ClientGetRsServlet",
			dataType:"json",
			success:function(data){

				for(var key in data){
				    var list = data[key];
				    for(var i=0;i<list.length;i++) {
                        var dataValue = list[i];
                        sessionStorage.setItem('restaurant_'+dataValue.rid, JSON.stringify(dataValue));
                        var scorePercent = dataValue.score*100.0/5.0 + "%";
                        var rtypeDetail = "rtypeDetail-"+dataValue.rtypedetail;

                        $("#restaurant-list").append("<a class=\"restaurant "+rtypeDetail+"\" href=\"ClientNewOrder.jsp?rid="+dataValue.rid+"\">\n" +
                            "                        <div class=\"restaurant-logo\">\n" +
                            "                            <img class=\"restaurant-logo-icon\" width=\"80px\" height=\"80px\" src=\""+dataValue.url+"\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"restaurant-content\">\n" +
                            "                            <div class=\"restaurant-title\">" + dataValue.rname + "</div>\n" +
                            "                            <div class=\"star-rating\">\n" +
                            "                                <div class=\"star-rating-top\" style=\"width:"+scorePercent+"\">\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                </div>\n" +
                            "                                <div class=\"star-rating-bottom\">\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                    <span></span>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"restaurant-address\">" + dataValue.raddress + "</div>\n" +
                            "                        </div>\n" +
                            "                    </a>");
                    }
                }
					
			}
			});
}

function showAll(){

    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(0).addClass("aui-palace-grid-active");

    $(".rtypeDetail-0").show();
    $(".rtypeDetail-1").show();
    $(".rtypeDetail-2").show();
    $(".rtypeDetail-3").show();
    $(".rtypeDetail-4").show();

}

function showDessert(){
    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(1).addClass("aui-palace-grid-active");


    $(".rtypeDetail-0").show();
    $(".rtypeDetail-1").hide();
    $(".rtypeDetail-2").hide();
    $(".rtypeDetail-3").hide();
    $(".rtypeDetail-4").hide();
}

function showFastFood() {
    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(2).addClass("aui-palace-grid-active");

    $(".rtypeDetail-0").hide();
    $(".rtypeDetail-1").show();
    $(".rtypeDetail-2").hide();
    $(".rtypeDetail-3").hide();
    $(".rtypeDetail-4").hide();
}

function showBBQ() {
    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(3).addClass("aui-palace-grid-active");

    $(".rtypeDetail-0").hide();
    $(".rtypeDetail-1").hide();
    $(".rtypeDetail-2").show();
    $(".rtypeDetail-3").hide();
    $(".rtypeDetail-4").hide();
}

function showFruit() {

    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(4).addClass("aui-palace-grid-active");
    $(".rtypeDetail-0").hide();
    $(".rtypeDetail-1").hide();
    $(".rtypeDetail-2").hide();
    $(".rtypeDetail-3").show();
    $(".rtypeDetail-4").hide();
}

function showNecessities() {
    $(".aui-palace-grid").removeClass("aui-palace-grid-active");
    $(".aui-palace-grid").eq(5).addClass("aui-palace-grid-active");

    $(".rtypeDetail-0").hide();
    $(".rtypeDetail-1").hide();
    $(".rtypeDetail-2").hide();
    $(".rtypeDetail-3").hide();
    $(".rtypeDetail-4").show();
}
 </script>
</head>
<body class="fix-header fix-sidebar card-no-border" onload="show()">
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
                    <a class="navbar-brand" href="ClientGetRs.jsp">
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
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="ClientInfo.jsp"  aria-haspopup="true" aria-expanded="false"><img src="./assets/images/users/1.jpg" alt="user" class="profile-pic m-r-10" />Markarn Doe</a>
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


                <div class="row" style="background-color: #fff">

                    <a class="aui-palace-grid aui-palace-grid-active" onclick="showAll()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/all.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>全部</h2>
                        </div>
                    </a>

                    <a class="aui-palace-grid" onclick="showDessert()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/dessert.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>甜品饮品</h2>
                        </div>
                    </a>

                    <a class="aui-palace-grid" onclick="showFastFood()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/fastFood.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>速食简餐</h2>
                        </div>
                    </a>

                    <a class="aui-palace-grid" onclick="showBBQ()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/bbq.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>烧烤海鲜</h2>
                        </div>
                    </a>

                    <a class="aui-palace-grid" onclick="showFruit()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/fruit.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>生鲜水果</h2>
                        </div>
                    </a>

                    <a class="aui-palace-grid" onclick="showNecessities()">
                        <div class="aui-palace-grid-icon">
                            <img src="images/necessities.png" alt="">
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>生活日用</h2>
                        </div>
                    </a>
                </div>

                <br><br>


                <div class="row" id="restaurant-list">

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
</body>
</html>