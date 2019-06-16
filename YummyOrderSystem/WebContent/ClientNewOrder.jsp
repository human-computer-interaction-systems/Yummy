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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./css1/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
var maxtime = 120;//允许输入密码时长
function payment(){
	if($("#totalAmount").val() == ""){
		alert("您未选购商品！请添加商品。");
		return;
	}
	var identity = ${sessionScope.client.balance};
	if(Number($("#totalAmount").val()) > Number(identity)){
		alert("您账户余额不足！请重新选购商品。");
		return;
	}
	 $('#div_1').show();
	 $('#div_2').show();
	 window.setInterval(function(){CountDown();}, 1000); 
}

function CountDown() {
	if(maxtime>0){
		--maxtime;
	}else{
		alert("超过最大时长，订单取消！");
		location.reload();//重新加载页面清空表项
	}
	$("#time").val("您还有："+maxtime+" 秒的时间完成支付。");
}

function pay(){
	//判断密码
	var paymentCode = ${sessionScope.client.paymentCode};
	if($("#paymentCode").val() != paymentCode){
		alert("您输入支付密码不正确！请重新输入。");
		return;
	}
	
	//整理数据与数据库连接,此时数据合法
	var rid = (GetQueryString("rid"));
	var caddress = $("#caddress").val();
	//整理商品数据
	var rgoods = [];
	var tbody = document.getElementById('mycart');
	var tableObj = document.getElementById("mycartTable");
	
	for (var i = 1; i < tableObj.rows.length; i++) {  //遍历Table的所有Row
	 	//增加数量和总价
	 	var agoods = new Object();
		agoods.rid = rid;
		agoods.foodName = tableObj.rows[i].cells[0].innerHTML;
		agoods.number = tableObj.rows[i].cells[1].innerHTML;
		agoods.amount = tableObj.rows[i].cells[2].innerHTML;
		rgoods.push(agoods);
	 }
	//var obj = JSON.stringify(rgoods);
	var amount = $("#realAmount").val();
	var orderInfo = {
		rid: rid,
		cid: ${sessionScope.client.cid},
		goods: rgoods,
		caddress: caddress,
		totalAmount: amount
	}
	
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
	 
	 alert("下单成功！");
	 window.location.href='ClientOrders.jsp';
	
}

function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}
function show(){
	var rid = (GetQueryString("rid"));
	var rgoods = JSON.parse(sessionStorage.getItem('rgoods'));
	var tbody = document.getElementById('rgoods');
	for (var i = 0; i < rgoods.length; i++) {
        var trow = getDataRow(rgoods[i]); //定义一个方法,返回tr数据
		tbody.appendChild(trow);
    }
	$("#resName").text(rid);
	
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"ClientGetResDisServlet",
		dataType:"json",
		data:{"rid":rid},
		success:function(data){
			var tbody2 = document.getElementById('discounts');
			for (var i = 0; i < data.length; i++) {
		        var trow = addDiscounts(data[i]); //定义一个方法,返回tr数据
				tbody2.appendChild(trow);
		    }
		}
		});
	
}
function getDataRow(h){
	 var row = document.createElement('tr'); //创建行
	 
	 var idCell = document.createElement('td'); //
	 idCell.innerHTML = h.foodName; //填充数据
	 row.appendChild(idCell); //加入行  ，下面类似
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = h.price;
	 row.appendChild(nameCell);
	 
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = h.quantity;
	 row.appendChild(nameCell);
	 
	 //到这里，json中的数据已经添加到表格中，下面为每行末尾添加删除按钮
	 
	 var cancelCell = document.createElement('td');//创建第四列，操作列
	 row.appendChild(cancelCell);
	 var btnDel = document.createElement('input'); //创建一个input控件
	 btnDel.setAttribute('type','button'); //type="button"
	 btnDel.setAttribute('value','加入购物车'); 
	 
	 //将选购加入购物车列表
	 cancelCell.onclick=function(){
		 var tbody = document.getElementById('mycart');
		 var tableObj = document.getElementById("mycartTable");
		 var isNew = true;
		 for (var i = 0; i < tableObj.rows.length; i++) {  //遍历Table的所有Row
		 	//增加数量和总价
			if(tableObj.rows[i].cells[0].innerText == h.foodName){
				if(Number(tableObj.rows[i].cells[1].innerText) == h.quantity){
					alert("已经是最大库存，不可再添加！");
				}else{
					tableObj.rows[i].cells[1].innerHTML = Number(tableObj.rows[i].cells[1].innerHTML)+1;
					tableObj.rows[i].cells[2].innerHTML = Number(tableObj.rows[i].cells[2].innerHTML)+h.price;
				}
				
				isNew = false;
		 	} 
		 }
		 //新添加情况
		 if(isNew){
			 var trow = addNewGoods(h); //定义一个方法,返回tr数据
			 tbody.appendChild(trow);
		 }
		
		 var totalNum = 0;
		 //设置总金额
		 for (var i = 1; i < tableObj.rows.length; i++) {  //遍历Table的所有Row
			 	//增加数量和总价
			totalNum = totalNum + Number(tableObj.rows[i].cells[2].innerHTML);
		 }
		 
		 $("#totalAmount").val(totalNum);
	 	 
		 //设置优惠后的金额
		 var realNum = totalNum;
		 var tableObj2 = document.getElementById("discountsTable");
		 
		 var row = 0;
		 
		 for (var i = 1; i < tableObj2.rows.length; i++) {  //遍历Table的所有Row
			 	//增加数量和总价
		 	if(realNum > Number(tableObj2.rows[i].cells[0].innerHTML)){
		 		row = i;
		 	}
		 	
		 }
		 
		 if(row > 0){
			 realNum = realNum - Number(tableObj2.rows[row].cells[1].innerHTML);
		 }
		 
		 var identity = ${sessionScope.client.level};
		 if(identity == "1"){
			 realNum = realNum;
		 }else if(identity == "2"){
			 realNum = realNum * 0.95;
		 }
		 
		 $("#realAmount").val(realNum.toFixed(2));
	}
	 cancelCell.appendChild(btnDel);  //把删除按钮加入td，别忘了
	 
	 return row; //返回tr数据	 
}	
function addNewGoods(h){
	//新添加情况
	 var row = document.createElement('tr'); //创建行

	 var idCell = document.createElement('td'); //
	 idCell.innerHTML = h.foodName; //填充数据
	 row.appendChild(idCell); //加入行  ，下面类似
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = 1;
	 row.appendChild(nameCell);
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = h.price;
	 row.appendChild(nameCell);
	 
	 return row; //返回tr数据	 
}	  

function addDiscounts(h){
	 var row = document.createElement('tr'); //创建行

	 var idCell = document.createElement('td'); //
	 idCell.innerHTML = h.amount; //填充数据
	 row.appendChild(idCell); //加入行  ，下面类似
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = h.discount;
	 row.appendChild(nameCell);
	 
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
                                <h4 class="card-title" id="resName" name="resName"></h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>商品名称</th>
                                                <th>单价</th>
                                                <th>库存数量</th>
                                                <th>加入购物车</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody id="rgoods">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title" id="resName" name="resName"></h4>
                                <div class="table-responsive">
                                    <table class="table" id="discountsTable">
                                        <thead>
                                            <tr>
                                                <th>满</th>
                                                <th>减</th>                                              
                                            </tr>
                                        </thead>
                                        <tbody id="discounts">
                                           
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
                                <h4 class="card-title">我的购物车</h4>
                                <div class="table-responsive">
                                    <table class="table" id="mycartTable">
                                        <thead>
                                            <tr>
                                                <th>商品名称</th>
                                                <th>购买数量</th>
                                                <th>价格</th>
                                            </tr>
                                        </thead>
                                        <tbody id="mycart">
                                           
                                        </tbody>
                                    </table>
                                </div>
                                <div class="form-group">
                                        <label class="col-md-12">总金额</label>
                                        <div class="col-md-12">
                                            <input type="text" style="border-radius:4px" id="totalAmount" name="totalAmount" readonly>
                                        </div>
                                        
                                 </div>
                                 
                                 <div class="form-group">
                                        <label class="col-md-12">实付</label>
                                        <div class="col-md-12">
                                            <input type="text" style="border-radius:4px" id="realAmount" name="realAmount" readonly>
                                        </div>
                                        
                                 </div>
                                 
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
                                 
                                 <div class="form-group">
                                        <div class="col-sm-12">
                                            <button class="btn btn-success" onclick="payment()">去结算</button>
                                        </div>
                                    </div>
                                    <div class="form-group" id="div_1" style="display:none">
                                        <label class="col-md-12">请输入您的支付密码</label>
                                        <div class="col-md-12">
                         				    <input type="text" style="border-radius:4px" id="paymentCode" name="paymentCode" maxlength="6" onkeyup="value=value.replace(/[^\d]/g,'')">
                         				     <input type="text" style="border-radius:4px" id="time" name="time" readonly>
                                        </div>
                                        
                                 </div>
                                 <div class="form-group" id="div_2" style="display:none">
                                        <div class="col-sm-12">
                                            <button class="btn btn-success" onclick="pay()">确认</button>
                                        </div>
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