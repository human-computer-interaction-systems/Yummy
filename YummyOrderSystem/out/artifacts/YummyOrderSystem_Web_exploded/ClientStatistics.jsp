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
    
    
    <!-- Bootstrap Core CSS -->
<link href="./statistics/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="./statistics/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="./statistics/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!--skycons-icons-->
<script src="./statistics/js/skycons.js"></script>
<!--//skycons-icons-->

 <!-- js-->
  <script src="./statistics/js/bootstrap.js"></script>
<script src="./statistics/js/jquery-1.11.1.min.js"></script>
<script src="./statistics/js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='https://fonts.googleapis.com/css?family=Comfortaa:400,700,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
<!--//webfonts-->  
<!-- Metis Menu -->
<script src="./statistics/js/metisMenu.min.js"></script>
<script src="./statistics/js/custom.js"></script>
<link href="./statistics/css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<link href="./statistics/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="./statistics/js/jquery.sparkline.min.js"></script>

	<script src="./statistics/js/Chart.js"></script>
	
<!--pie-chart--->
<script src="./statistics/js/pie-chart.js" type="text/javascript"></script>
<script type="text/javascript">
function getDataRow(h){
	 var row = document.createElement('tr'); //创建行
	 
	 var idCell = document.createElement('td'); //
	 idCell.innerHTML = h.rname; //填充数据
	 row.appendChild(idCell); //加入行  ，下面类似
	 
	 var nameCell = document.createElement('td');//
	 nameCell.innerHTML = h.purchaseN;
	 row.appendChild(nameCell);
	 
	 var jobCell = document.createElement('td');//
	 var str=Number(h.ratio*100).toFixed(1);
	    str+="%"; //转换为百分数
	 jobCell.innerHTML = str;
	 row.appendChild(jobCell);
	 
	 return row; //返回tr数据	 
}	  
function show(){
	var chart1 = echarts.init(document.getElementById("chart1"));
	var chart2 = echarts.init(document.getElementById("chart2"));
	var chart3 = echarts.init(document.getElementById("chart3"));
	var chart4 = echarts.init(document.getElementById("chart4"));
	var chart5 = echarts.init(document.getElementById("chart5"));
	
	var cid = ${sessionScope.client.cid};
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"ClientModelServlet",
		dataType:"json",
		data:{"cid":cid},
		success:function(data){
			$('#yourDD').html(data.overview[0]); 
			$('#yourTD').html(data.overview[1]);
			$('#yourXF').html(data.overview[2]);
			$('#yourSJ').html(data.overview[3]);
			
			//将我喜爱的店数据加入到表中
			var tableValue = data.myFavor;
			var tbody = document.getElementById('myFavoriteRes');
			for(var i = 0;i < tableValue.length; i++){ //遍历一下json数据
				  var trow = getDataRow(tableValue[i]); //定义一个方法,返回tr数据
			  	  tbody.appendChild(trow);
			}
			
			option = {
				    
				    tooltip: {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['餐厅消费','商店消费']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },

				    xAxis: {
				        type: 'category',
				        boundaryGap: false,
				        data: ['周一','周二','周三','周四','周五','周六','周日']
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [
				        {
				            name:'餐厅消费',
				            type:'line',				            
				            data: data.c1[0]
				        },
				        {
				            name:'商店消费',
				            type:'line',
				            data: data.c1[1]
				        },
				        
				    ]
				};
			
			option2 = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data: ['工作日消费', '周末消费']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis:  {
				        type: 'value'
				    },
				    yAxis: {
				        type: 'category',
				        data: ['第一周','第二周','第三周','第四周']
				    },
				    series: [
				        {
				            name: '工作日消费',
				            type: 'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'insideRight'
				                }
				            },
				            data: data.c2[0]
				        },
				        {
				            name: '周末消费',
				            type: 'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'insideRight'
				                }
				            },
				            data: data.c2[1]
				        },
				        
				    ]
				};
			
			option3 = {
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b}: {c} ({d}%)"
				    },
				    legend: {
				        orient: 'vertical',
				        x: 'left',
				        data:['0-20元','20-50元','50-100元','100元以上']
				    },
				    series: [
				        {
				            name:'订单金额',
				            type:'pie',
				            selectedMode: 'single',
				            radius: [0, '30%'],

				            label: {
				                normal: {
				                    position: 'inner'
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            data:[
				                {value: data.c3[0][0], name:'餐厅消费'},
				                {value: data.c3[0][1], name:'商店消费'}
				            ]
				        },
				        {
				            name:'订单数量',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value: data.c3[1][0], name:'0-20元'},
				                {value: data.c3[1][1], name:'20-50元'},
				                {value: data.c3[1][2], name:'50-100元'},
				                {value: data.c3[1][3], name:'100元以上'}				              
				            ]
				        }
				    ]
				};
			
			option4 = {
				    legend: {},
				    tooltip: {},
				    dataset: {
				        source: [
				            ['product', '第一月', '第二月', '第三月'],
				            ['2018 夏', data.c4[0][0], data.c4[0][1], data.c4[0][2]],
				            ['2018 秋', data.c4[1][0], data.c4[1][1], data.c4[1][2]],
				            ['2018 冬', data.c4[2][0], data.c4[2][1], data.c4[2][2]],
				            ['2019 春', data.c4[3][0], data.c4[3][1], data.c4[3][2]]
				        ]
				    },
				    xAxis: {type: 'category'},
				    yAxis: {},
				    // Declare several bar series, each will be mapped
				    // to a column of dataset.source by default.
				    series: [
				        {type: 'bar'},
				        {type: 'bar'},
				        {type: 'bar'}
				    ]
				};
			
			option5 = {

				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data: ['甜品饮品','速食简餐','烧烤海鲜','生鲜水果','生活日用']
				    },
				    series : [
				        {
				            name: '购买次数',
				            type: 'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data:[
				                {value: data.c5[0], name:'甜品饮品'},
				                {value: data.c5[1], name:'速食简餐'},
				                {value: data.c5[2], name:'烧烤海鲜'},
				                {value: data.c5[3], name:'生鲜水果'},
				                {value: data.c5[4], name:'生活日用'}
				            ],
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				            }
				        }
				    ]
				};
			
			chart1.setOption(option);
			chart2.setOption(option2);
			chart3.setOption(option3);
			chart4.setOption(option4);
			chart5.setOption(option5);
		}
		});
	
	
}

</script>
 <script type="text/javascript">
 
        $(document).ready(function () {
            $('#demo-pie-1').pieChart({
                barColor: '#68b828',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 10,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-2').pieChart({
                barColor: '#7c38bc',
                trackColor: '#eee',
                lineCap: 'butt',
                lineWidth: 10,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-3').pieChart({
                barColor: '#0e62c7',
                trackColor: '#eee',
                lineCap: 'square',
                lineWidth: 10,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

           
        });

    </script>
    <!--Calender-->
<link rel="stylesheet" href="./statistics/css/clndr.css" type="text/css" />
<script src="./statistics/js/underscore-min.js" type="text/javascript"></script>
<script src= "./statistics/js/moment-2.2.1.js" type="text/javascript"></script>
<script src="./statistics/js/clndr.js" type="text/javascript"></script>
<script src="./statistics/js/site.js" type="text/javascript"></script>
<!--End Calender-->
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./css1/jquery-3.3.1.min.js"></script>
<script src="./css1/echarts.common.min.js"></script>

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
                        <h3 class="text-themecolor m-b-0 m-t-0">个人统计信息汇总</h3>
                        
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                
                <div id="page-wrapper">
			<div class="main-page">
				<div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-grid1">
							<div class="icon">
								<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月订单数</h3>
								<h4><span id="yourDD" > </span></h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid2">
							<div class="icon">
								<i class="glyphicon glyphicon-align-justify " aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月退订数</h3>
								<h4><span id="yourTD" > </span></h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid3">
							<div class="icon">
								<i class="glyphicon glyphicon-bell" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月消费额</h3>
								<h4><span id="yourXF" > </span></h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid4">
							<div class="icon">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月光临商家</h3>
								<h4><span id="yourSJ" > </span></h4>
								
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
					<div class="grid-1">
									<h3>上周每日消费</h3>
									<div id="chart1" style="width: 430px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>本月不同时段消费</h3>
								<div id="chart2" style="width: 430px;height: 300px;"></div>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
					<div class="grid-1">
									<h3>本月消费比例统计</h3>
									<div id="chart3" style="width: 530px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>历史消费种类统计</h3>
								<div id="chart5" style="width: 530px;height: 300px;"></div>
							</div>
						
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
								<div class="grid-1">
									<h3>我喜爱的店</h3>
									<table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th><h4>店名</h4></th>
                                                <th><h4>购买次数</h4></th>
                                                <th><h4>占比</h4></th>
                                            </tr>
                                        </thead>
                                        <tbody id="myFavoriteRes">                                          
                                           
                                        </tbody>
                                    </table>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>历史消费金额统计</h3>
								<div id="chart4" style="width: 470px;height: 235px;"></div>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				



					
						
				<div class="clearfix"> </div>
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