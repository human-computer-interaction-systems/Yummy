<%@page import="yummy.model.Client"%>
<%@ page language="java" import="java.util.*" %>
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
    <title>ClientInfo</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="./assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./lite/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="./lite/css/colors/blue.css" id="theme" rel="stylesheet">
    <link href="css1/toastr.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <script src="./css1/jquery-3.3.1.min.js"></script>
    <script src="./css1/echarts.common.min.js"></script>


<script language="javascript" type="text/javascript">
    function checkInfo(){
        var name = document.getElementById("name").value;
        var pwd = document.getElementById("phone").value;
        if(name ==  "" && pwd == ""){
            toastr.info("请至少填入一项");
            return false;
        }else{
            toastr.success("修改信息成功！");
            return true;
        }
    }

    function checkAddress(){
        var field = document.getElementById("address").value;
        if(field == ""){
            toastr.info("请输入您的新地址！");
            return false;
        }else{
            toastr.success("修改信息成功！");
            return true;
        }
    }

function show(){
	var balance = ${sessionScope.client.balance};
	balance = balance.toFixed(2);
	$('#yourbalance').html(balance); 
	$("#balance").val(balance);
	
	var identity = ${sessionScope.client.level};
	if(identity == '1'){
		$("#level").val("普通会员");
		$('#yourlevel').html("普通会员"); 
		
	}else if(identity == '2'){
		$("#level").val("高级会员");
		$('#yourlevel').html("高级会员"); 
		
	}

    toastr.options = {
        closeButton: false,
        debug: false,
        progressBar: false,
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
    $('#infoModal').on('shown.bs.modal', function () {
        var $this = $(this);
        var dialog = $this.find('.modal-dialog');

        //此种方式，在使用动画第一次显示时有问题
        //解决方案，去掉动画fade样式
        var top = ($(window).height() - dialog.height()) / 2;
        dialog.css({
            marginTop:top
        });
    });
    $('#addressModal').on('shown.bs.modal', function () {
        var $this = $(this);
        var dialog = $this.find('.modal-dialog');

        //此种方式，在使用动画第一次显示时有问题
        //解决方案，去掉动画fade样式
        var top = ($(window).height() - dialog.height()) / 2;
        dialog.css({
            marginTop:top
        });
    });
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
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">个人信息</h3>
                        
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                
                <!-- Row -->
                
                
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">


                            <div class="card-block">

                                <div class="row" style="height: 50px;">
                                    <img src="images/edit.png" style="top:5%;right:5%;position:absolute;height: 30px;width: 30px; cursor: pointer;float: right;" data-toggle="modal" data-target="#infoModal">
                                </div>

                                <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="background-color: #eaf0f4;">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">修改会员信息</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">

                                                    <div class="card-block">
                                                        <form class="form-horizontal form-material" action="ClientInfoChangeServlet" id="curst" method="post" onsubmit="return checkInfo()">
                                                            <div class="form-group">
                                                                <label class="col-md-12">会员名称</label>
                                                                <div class="col-md-12">
                                                                    <input type="text" class="form-control form-control-line"   id="name" name="name">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-12">电话号码</label>
                                                                <div class="col-md-12">
                                                                    <input type="text" class="form-control form-control-line"  id="phone" name="phone" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <br>
                                                                <div class="col-sm-12">
                                                                    　　　
                                                                    <button class="btn btn-success" type="submit" style="font-size: 18px;" >提交修改</button>
                                                                    　　　　　
                                                                    <button type="button" class="btn btn-primary" data-dismiss="modal" style="font-size: 18px;">　取消　</button>
                                                                </div>
                                                            </div>

                                                        </form>
                                                    </div>

                                            </div>

                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>


                                <form class="form-horizontal form-material">
                                    <div class="form-group">
                                        <label class="col-md-12">姓名</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" value="${sessionScope.client.cname}"  readonly>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-md-12">电子邮箱</label>
                                        <div class="col-md-12" style="display: block;">                                       	
                                            <input type="text" class="form-control form-control-line"  id="example-email" value="${sessionScope.client.email}" readonly>                                       		
                                        </div>
                             
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">电话</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" value="${sessionScope.client.phone}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">会员级别</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" id="level" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">账户余额</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" id="balance" name="balance" readonly>
                                        </div>
                                    </div>
                                            
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Column -->
                        <div class="card">
                            <div class="card-block bg-info">
                                <h3 class="text-white card-title">我的送餐地址</h3>
                                
                            </div>
                            <div class="card-block">
                                <div class="message-box contact-box">
                                    <h2 class="add-ct-btn"><button type="button" data-toggle="modal" data-target="#addressModal" class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button></h2>
                                    <div class="message-widget contact-widget">
                                        <!-- Message -->
                                        <div class="form-group">
                                        
                                        <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>地址</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table table-striped">                                          
                                           <c:forEach items="${sessionScope.client.addresses}" var="item" varStatus="status">
												<tr id="list">
													<td>${status.count}</td>
													<td>${item}</td>
					
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                    </div>
                                    </div>
                                </div>
                            </div>


                            <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content" style="background-color: #eaf0f4;">
                                        <div class="modal-header">
                                            <h4 class="modal-title" >添加新送餐地址</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">

                                            <div class="card-block">
                                                <form class="form-horizontal form-material" action="ClientInfoChangeServlet" id="curst2" method="post" onsubmit="return checkAddress()">
                                                    <div class="form-group">
                                                        <label class="col-md-12">新送餐地址</label>
                                                        <div class="col-md-12">
                                                            <input type="text" class="form-control form-control-line" id="address" name="address">
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <br>
                                                        <div class="col-sm-12">
                                                            　　　
                                                            <button class="btn btn-success" type="submit" style="font-size: 18px;" >提交修改</button>
                                                            　　　　　
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal" style="font-size: 18px;">　取消　</button>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>

                                        </div>

                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>

                        </div>
                    
                    
                    <!-- Column -->
                </div>
                <!-- Row -->
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
    <script src="css1/toastr.min.js"></script>

</body>
</html>