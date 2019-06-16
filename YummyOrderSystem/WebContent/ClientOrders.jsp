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
    <title>ClientOrders</title>
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
<script type="text/javascript">
  function show(){
	 var cid = ${sessionScope.client.cid};
	 $.ajaxSetup({cache:false});
		$.ajax({
			type:"get",
			url:"ClientOrdersServlet",
			dataType:"json",
			data:{"cid":cid},
			success:function(data){
				for(var key in data){
					if(key=="undelivered"){
						var dataValue = data[key];
						var tbody = document.getElementById('undelivered');
						for(var i = 0;i < dataValue.length; i++){ //遍历一下json数据
							  var trow = getDataRow1(dataValue[i]); //定义一个方法,返回tr数据
						  	  tbody.appendChild(trow);
						}
					}
					if(key=="historyDelivered"){
						var dataValue = data[key];
						var tbody = document.getElementById('historyDelivered');
						for(var i = 0;i < dataValue.length; i++){ //遍历一下json数据
							  var trow = getDataRow2(dataValue[i]); //定义一个方法,返回tr数据
						  	  tbody.appendChild(trow);
						}
					}
					if(key=="historyUndelivered"){
						var dataValue = data[key];
						var tbody = document.getElementById('historyUndelivered');
						for(var i = 0;i < dataValue.length; i++){ //遍历一下json数据
							  var trow = getDataRow3(dataValue[i]); //定义一个方法,返回tr数据
						  	  tbody.appendChild(trow);
						}
					}
					
				}
				
					
			}
			});
  }
  function getDataRow1(h){
		 var row = document.createElement('tr'); //创建行
		 
		 var idCell = document.createElement('td'); //
		 idCell.innerHTML = h.oid; //填充数据
		 row.appendChild(idCell); //加入行  ，下面类似
		 
		 var nameCell = document.createElement('td');//
		 nameCell.innerHTML = h.rid;
		 row.appendChild(nameCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.orderTime;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.caddress;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.totalAmount;
		 row.appendChild(jobCell);
		 
		 //到这里，json中的数据已经添加到表格中，下面为每行末尾添加删除按钮
		 
		 var cancelCell = document.createElement('td');//创建第四列，操作列
		 row.appendChild(cancelCell);
		 var btnDel = document.createElement('input'); //创建一个input控件
		 btnDel.setAttribute('type','button'); //type="button"
		 btnDel.setAttribute('value','取消订单'); 
		 
		 //删除操作
		 cancelCell.onclick=function(){
			 if(confirm("确定取消该订单吗")){
				 //找到按钮所在行的节点，然后删掉这一行
				 //this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode);
				 //alert(this.parentNode.cells[0].innerHTML);//得到订单号
				 var oid = this.parentNode.cells[0].innerHTML;
				 //alert(this.parentNode.cells[2].innerHTML);
				 var orderTime = this.parentNode.cells[2].innerHTML;
				 var nowTime = new Date();//现在时间
				 var d1 = orderTime.replace(/\-/g, "/");//转换为js时间
				 var oldTime = new Date(d1);
				 //alert(parseInt(nowTime - oldTime) / 1000 / 60);
				 var diffTime = parseInt(nowTime - oldTime) / 1000 / 60;//获取时间差分钟数
				 if(diffTime>30){
					 alert("已经超过最大允许时间，不可退订");
				 }
				 else{
					 //根据oid退订，更新数据库
					 $.ajaxSetup({cache:false})
						$.ajax({
							type:"get",
							url:"ClientCancelOrderServlvt",
							dataType:"json",
							data:{"oid":oid},
							success:function(data) {
								
							}
									
							});
						location.reload();
						alert("取消订单成功！");
				 }
				 
				 //btnDel - td - tr - tbody - 删除(tr)
				 //刷新网页还原。实际操作中，还要删除数据库中数据，实现真正删除
				 }
			 }
		 cancelCell.appendChild(btnDel);  //把删除按钮加入td，别忘了
		 
		 return row; //返回tr数据	 
	}	  
  
  function getDataRow2(h){
		 var row = document.createElement('tr'); //创建行
		 
		 var idCell = document.createElement('td'); //
		 idCell.innerHTML = h.oid; //填充数据
		 row.appendChild(idCell); //加入行  ，下面类似
		 
		 var nameCell = document.createElement('td');//
		 nameCell.innerHTML = h.rid;
		 row.appendChild(nameCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.orderTime;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.deliveryTime;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.caddress;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.totalAmount;
		 row.appendChild(jobCell);
		 
		 return row; //返回tr数据	 
	}	  
  
  function getDataRow3(h){
		 var row = document.createElement('tr'); //创建行
		 
		 var idCell = document.createElement('td'); //
		 idCell.innerHTML = h.oid; //填充数据
		 row.appendChild(idCell); //加入行  ，下面类似
		 
		 var nameCell = document.createElement('td');//
		 nameCell.innerHTML = h.rid;
		 row.appendChild(nameCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.orderTime;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.totalAmount;
		 row.appendChild(jobCell);
		 
		 var jobCell = document.createElement('td');//
		 jobCell.innerHTML = h.refundAmount;
		 row.appendChild(jobCell);
		 
		 return row; //返回tr数据	 
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
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">未送达订单</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>订单号</th>                                            
                                                <th>餐厅识别码</th>
                                                <th>下单时间</th>
                                                <th>收货地址</th>
                                                <th>付款金额</th>
                                                <th>是否退订</th>                                                 
                                            </tr>
                                        </thead>
                                        <tbody id="undelivered">
                                          
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">历史送达订单</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>订单号</th>                                            
                                                <th>餐厅识别码</th>
                                                <th>下单时间</th>
                                                <th>送达时间</th>
                                                <th>收货地址</th>
                                                <th>付款金额</th>                                                                                             
                                            </tr>
                                        </thead>
                                        <tbody id="historyDelivered">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">历史退订订单</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>订单号</th>                                            
                                                <th>餐厅识别码</th>
                                                <th>下单时间</th>
                                                <th>付款金额</th>
                                                <th>退款金额</th>
                                            </tr>
                                        </thead>
                                        <tbody id="historyUndelivered">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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