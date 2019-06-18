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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./css1/jquery-3.3.1.min.js"></script>
<script src="./css1/echarts.common.min.js"></script>
<script language="javascript" type="text/javascript">
function cancel(){
	if(confirm("确定注销会员吗，注销后不可恢复数据。")){
		var cid = ${sessionScope.client.cid};
		$.ajaxSetup({cache:false});
		$.ajax({
			type:"get",
			url:"ClientCancelServlet",
			dataType:"json",
			data:{"cid":cid},
			success:function(data){
				
			}
			});
		alert("注销会员成功。");
		window.location.href="Select.jsp"; 
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
	var orders = echarts.init(document.getElementById("orders"));
	var payInfo = echarts.init(document.getElementById("payInfo"));
	
	var cid = ${sessionScope.client.cid};
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"ClientStatisticsServlet",
		dataType:"json",
		data:{"cid":cid},
		success:function(data){
			var ctype1 = Number(data.ctype1);
			var ctype2 = Number(data.ctype2);
			var rtype1 = Number(data.rtype1);
			var rtype2 = Number(data.rtype2);
			
			var option = {
					title:{
				         text:"订单统计",
				         x:"center"
				         },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        data:['送达订单','退订订单']
				    },
				    calculable : true,
				    series : [
				        {
				            name:'订单占比',
				            type:'pie',
				            radius : ['50%', '70%'],
				            itemStyle : {
				                normal : {
				                    label : {
				                        show : false
				                    },
				                    labelLine : {
				                        show : false
				                    }
				                },
				                emphasis : {
				                    label : {
				                        show : true,
				                        position : 'center',
				                        textStyle : {
				                            fontSize : '18',
				                            fontWeight : 'bold'
				                        }
				                    }
				                }
				            },
				            data:[
				                {value:ctype1, name:'送达订单'},
				                {value:ctype2, name:'退订订单'}
				            ]
				        }
				    ]
				};
			var option2 = {
					title:{
				         text:"消费统计",
				         x:"center"
				         },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        data:['超过100的订单','小额订单']
				    },
				    calculable : true,
				    series : [
				        {
				            name:'占比',
				            type:'pie',
				            radius : ['50%', '70%'],
				            itemStyle : {
				                normal : {
				                    label : {
				                        show : false
				                    },
				                    labelLine : {
				                        show : false
				                    }
				                },
				                emphasis : {
				                    label : {
				                        show : true,
				                        position : 'center',
				                        textStyle : {
				                            fontSize : '18',
				                            fontWeight : 'bold'
				                        }
				                    }
				                }
				            },
				            data:[
				                {value:rtype1, name:'超过100的订单'},
				                {value:rtype2, name:'小额订单'}
				            ]
				        }
				    ]
				};
			orders.setOption(option);
		 	payInfo.setOption(option2);
		}
		});
	//alert(jsondata);
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
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="d-flex flex-wrap">
                                            <div>
                                                <h3 class="card-title">Sales Overview</h3>
                                                <h6 class="card-subtitle">Ample Admin Vs Pixel Admin</h6> </div>
                                            <div class="ml-auto">
                                                <ul class="list-inline">
                                                    <li>
                                                        <h6 class="text-muted text-success"><i class="fa fa-circle font-10 m-r-10 "></i>Ample</h6> </li>
                                                    <li>
                                                        <h6 class="text-muted  text-info"><i class="fa fa-circle font-10 m-r-10"></i>Pixel</h6> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="amp-pxl" style="height: 360px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5">
                         <!-- Column -->
                        <div class="card">
                            <img class="card-img-top" src="./assets/images/background/profile-bg.jpg" alt="Card image cap">
                            <div class="card-block little-profile text-center">
                                <div class="pro-img"><img src="./assets/images/users/4.jpg" alt="user" /></div>
                                <h3 class="m-b-0" >${sessionScope.client.cname}</h3>
                                <p>${sessionScope.client.email}</p>
                                
                           		<div class="row text-center m-t-20">
                           			 <div class="col-lg-4 col-md-4 m-t-20">
                                        <h5 class="m-b-0 font-light" ><span id="yourlevel" style="color:#38D0D1;font-size:13px" > </span></h5><small>会员级别</small></div>
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h5 class="m-b-0 font-light"><span style="color:#38D0D1">${sessionScope.client.phone}</span></h5><small>电话</small></div>
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h5 class="m-b-0 font-light" ><span id="yourbalance" style="color:#38D0D1"> </span></h5><small>余额</small></div>
                                   
                                </div>
                           
                            </div> 
                               
                            
                        </div>
                    </div>
                </div>
                <!-- Row -->
                
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-block">
                                <form class="form-horizontal form-material">
                                    <div class="form-group">
                                        <label class="col-md-12">姓名</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" value="${sessionScope.client.cname}"  readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">电子邮箱</label>
                                        <div class="col-md-12">
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
                                    <div class="form-group">
                                        <label class="col-md-12">送餐地址</label>
                                        <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>地址</th>
                                            </tr>
                                        </thead>
                                        <tbody>                                          
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
                                    
                                     <div class="form-group">
                                        <div class="col-sm-12">
                                            <button class="btn btn-success" onclick="cancel()" type="button">注销会员</button>
                                        </div>
                                    </div>
                                             
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Column -->
                        <div class="card">
                            <div class="card-block bg-info">
                                <h4 class="text-white card-title">My Contacts</h4>
                                <h6 class="card-subtitle text-white m-b-0 op-5">Checkout my contacts here</h6>
                            </div>
                            <div class="card-block">
                                <div class="message-box contact-box">
                                    <h2 class="add-ct-btn"><button type="button" class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button></h2>
                                    <div class="message-widget contact-widget">
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img"> <img src="./assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">info@wrappixel.com</span></div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img"> <img src="./assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Sonu Nigam</h5> <span class="mail-desc">pamela1987@gmail.com</span></div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img"> <span class="round">A</span> <span class="profile-status away pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Arijit Sinh</h5> <span class="mail-desc">cruise1298.fiplip@gmail.com</span></div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img"> <img src="./assets/images/users/4.jpg" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">kat@gmail.com</span></div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                    	<div class="card">
                            <div class="card-block">
                            <div id="orders" style="width: 600px;height: 300px;"></div>
                             <div id="payInfo" style="width: 600px;height: 300px;"></div>
                          </div>
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
</body>
</html>