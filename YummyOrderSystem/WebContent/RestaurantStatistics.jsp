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
    <title>RestaurantStatistics</title>
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
function show(){
	var chart1 = echarts.init(document.getElementById("chart1"));
	var chart2 = echarts.init(document.getElementById("chart2"));
	var chart3 = echarts.init(document.getElementById("chart3"));
	var chart4 = echarts.init(document.getElementById("chart4"));
	var chart5 = echarts.init(document.getElementById("chart5"));
	var chart6 = echarts.init(document.getElementById("chart6"));
	var chart7 = echarts.init(document.getElementById("chart7"));
	var chart8 = echarts.init(document.getElementById("chart8"));
	var chart9 = echarts.init(document.getElementById("chart9"));
	
	var rid = ${sessionScope.res.rid};
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"RestaurantModelServlet",
		dataType:"json",
		data:{"rid":rid},
		success:function(data){
			$('#yourDD').html(data.overview[1]); 
			$('#yourTD').html(data.overview[2]);
			$('#yourXF').html(data.overview[3]);
			$('#yourSJ').html(data.overview[0]);
			
			option = {
				    
				    tooltip: {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['上午时段','下午时段','全天']
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
				            name:'上午时段',
				            type:'line',
				            data: data.c1[0]
				        },
				        {
				            name:'下午时段',
				            type:'line',
				            data: data.c1[1]
				        },
				        {
				            name:'全天',
				            type:'line',
				            data: data.c1[2]
				        }
				        
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
				        data: ['工作日营业额', '周末营业额']
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
				            name: '工作日营业额',
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
				            name: '周末营业额',
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
				        trigger: 'axis'
				    },
				    legend: {
				        data:['成交订单数量','退订订单数量']
				    },
				    
				    xAxis:  {
				        type: 'category',
				        boundaryGap: false,
				        data: ['周一','周二','周三','周四','周五','周六','周日']
				    },
				    yAxis: {
				        type: 'value',
				    },
				    series: [
				        {
				            name:'成交订单数量',
				            type:'line',
				            data: data.c3[0],
				            
				            markLine: {
				                data: [
				                    {type: 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'退订订单数量',
				            type:'line',
				            data: data.c3[1],
				            
				            markLine: {
				                data: [
				                    {type: 'average', name: '平均值'},
				                    
				                ]
				            }
				        }
				    ]
				};
			
			option4 = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data: ['成交订单数量', '退订订单数量']
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
				            name: '成交订单数量',
				            type: 'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'insideRight'
				                }
				            },
				            data: data.c4[0]
				        },
				        {
				            name: '退订订单数量',
				            type: 'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'insideRight'
				                }
				            },
				            data: data.c4[1]
				        },
				        
				    ]
				};
			
			option5 ={
				    color: ['#009CFF', '#FF072F'],  //设置多个颜色值时代表的是图例颜色
				      tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				          type: 'line',
				        },
				      },
				      legend: {
				        right: '5%',
				        bottom: '0',
				        data: ['平均订单价格', '订单成功率'],
				        textStyle: {
				          fontSize: 14,
				          fontWeight: 'normal',
				        },
				      },
				      grid: {
				        left: '15%',
				        bottom: '20%',
				        top: '8%',
				      },
				      xAxis: [
				        {
				          type: 'category',
				          data: ['一月','二月','三月','四月','五月','六月'],
				          textStyle: {
				            fontWeight: 'normal',
				          },
				          axisLabel: {
				            textStyle: {
				              fontSize: 12,
				              fontWeight: 'normal',
				            },
				            rotate: '45',
				          },
				        },
				      ],
				      yAxis: [   //当有两个y轴时，设置两个{}{}来承载y轴的值
				        {
				          type: 'value',
				          min: 0,
				          axisLabel: {
				            textStyle: {
				              fontSize: 14,
				              fontWeight: 'normal',
				            },
				          },
				          splitLine: { show: false },  //y轴网格线，一般都会隐藏，x轴亦是如此

				        },
				        {
				          type: 'value',
				          axisLabel: {
				            textStyle: {
				              fontSize: 14,
				              fontWeight: 'normal',
				              formatter: '{value}%'
				            },
				          },
				          show: true  
				          
				        },
				      ],
				      series: [    //对应折线图和柱形图，进行数据加载
				    	  
				        {
				          name: '平均订单价格',
				          type: 'bar',
				          data: data.c5[0],
				          barWidth: '12',
				        },
				        {
				          name: '订单成功率',
				          type: 'line',
				          yAxisIndex: 1,
				          data: data.c5[1],
				          label: {
				        	  normal: {
				                  show: false,
				                  position: 'inside',
				                  formatter: '{c}%'
				              }
				          },
				          lineStyle: {
				            normal: {
				              width: 1,
				            },
				          },
				        },
				      ],
				};
			
			option6 ={
				    color: ['#009CFF', '#FF072F'],  //设置多个颜色值时代表的是图例颜色
				      tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				          type: 'line',
				        },
				      },
				      legend: {
				        right: '5%',
				        bottom: '0',
				        data: ['平均订单价格指数', '市场占比'],
				        textStyle: {
				          fontSize: 14,
				          fontWeight: 'normal',
				        },
				      },
				      grid: {
				        left: '15%',
				        bottom: '20%',
				        top: '8%',
				      },
				      xAxis: [
				        {
				          type: 'category',
				          data: ['一月','二月','三月','四月','五月','六月'],
				          textStyle: {
				            fontWeight: 'normal',
				          },
				          axisLabel: {
				            textStyle: {
				              fontSize: 12,
				              fontWeight: 'normal',
				            },
				            rotate: '45',
				          },
				        },
				      ],
				      yAxis: [   //当有两个y轴时，设置两个{}{}来承载y轴的值
				        {
				          type: 'value',
				          min: 0,
				          axisLabel: {
				            textStyle: {
				              fontSize: 14,
				              fontWeight: 'normal',
				              formatter: '{value} %'
				            },
				          },
				          splitLine: { show: false },  //y轴网格线，一般都会隐藏，x轴亦是如此

				        },
				        {
				          type: 'value',
				          axisLabel: {
				            textStyle: {
				              fontSize: 14,
				              fontWeight: 'normal',
				              formatter: '{value} %'
				            },
				          },
				          show: true  
				          
				        },
				      ],
				      series: [    //对应折线图和柱形图，进行数据加载
				    	  
				        {
				          name: '平均订单价格指数',
				          type: 'bar',
				          data: data.c6[0],
				          barWidth: '12',
				        },
				        {
				          name: '市场占比',
				          type: 'line',
				          yAxisIndex: 1,
				          data: data.c6[1],
				          label: {
				        	  normal: {
				                  show: true,
				                  position: 'inside',
				                  formatter: '{c}%'
				              }
				          },
				          lineStyle: {
				            normal: {
				              width: 1,
				            },
				          },
				        },
				      ],
				};
			
			option7 = {
					title: {
				        left: 'center',
				        text: '按每天不同时段统计订单',
				        textStyle: {
				        	color:'#0E62C7'
				        },
				        	
					},
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b}: {c} ({d}%)"
				    },
				    grid: {
				        
				        top: '20%',
		
				      },
				    legend: {
				        orient: 'vertical',
				        x: 'left',
				        data:['8-12时','12-16时','16-20时','20时以后']
				    },
				    series: [
				        {
				            name:'订单数量',
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
				                {value:data.c7[0][0], name:'普通会员'},
				                {value:data.c7[0][1], name:'高级会员'}
				            ]
				        },
				        {
				            name:'订单数量',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value:data.c7[1][0], name:'8-12时'},
				                {value:data.c7[1][1], name:'12-16时'},
				                {value:data.c7[1][2], name:'16-20时'},
				                {value:data.c7[1][3], name:'20时以后'}				              
				            ]
				        }
				    ]
				};
			
			option8 = {
					title: {
				        left: 'center',
				        text: '按每周消费金额和客户等级分类',
				        textStyle: {
				        	color:'#0E62C7'
				        },
				        	
					},
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b}: {c} ({d}%)"
				    },
 					grid: {
				        
				        top: '20%',
		
				      },
				    legend: {
				        orient: 'vertical',
				        x: 'left',
				        data:['20岁以下','20-35岁','35-50岁','50岁以上']
				    },
				    series: [
				        {
				            name:'客户数量',
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
				                {value:data.c8[0][0], name:'男性顾客'},
				                {value:data.c8[0][1], name:'女性顾客'}
				            ]
				        },
				        {
				            name:'客户数量',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value:data.c8[1][0], name:'20岁以下'},
				                {value:data.c8[1][1], name:'20-35岁'},
				                {value:data.c8[1][2], name:'35-50岁'},
				                {value:data.c8[1][3], name:'50岁以上'}				              
				            ]
				        }
				    ]
				};
			
			option9 = {
				    color: ['#3398DB'],
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : ['18年6月', '18年7月', '18年8月', '18年9月', '18年10月', '18年11月', '18年12月','19年1月','19年2月','19年3月','19年4月','19年5月'],
				            axisTick: {
				                alignWithLabel: true
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'营业额',
				            type:'bar',
				            barWidth: '60%',
				            data: data.c9
				        }
				    ]
				};
			
			
			
			chart1.setOption(option);
			chart2.setOption(option2);
			chart3.setOption(option3);
			chart4.setOption(option4);
			chart5.setOption(option5);
			chart6.setOption(option6);
			chart7.setOption(option7);
			chart8.setOption(option8);
			chart9.setOption(option9);
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
                        <li> <a class="waves-effect waves-dark" href="RestaurantInfo.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">个人中心</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="RestaurantOrders.jsp" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">本店订单</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="RestaurantAddGoods.jsp" aria-expanded="false"><i class="mdi mdi-emoticon"></i><span class="hide-menu">新品发布</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="RestaurantStatistics.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">餐厅信息统计</span></a>
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
                        <h3 class="text-themecolor m-b-0 m-t-0">餐厅信息统计</h3>
                        
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
								<h3>本月光临顾客</h3>
								<h4><span id="yourSJ" > </span></h4>
								
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid2">
							<div class="icon">
								<i class="glyphicon glyphicon-align-justify " aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月订单数</h3>
								<h4><span id="yourDD" > </span></h4>
								
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid3">
							<div class="icon">
								<i class="glyphicon glyphicon-bell" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月退订数</h3>
								<h4><span id="yourTD" > </span></h4>
								
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid4">
							<div class="icon">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月营业额</h3>
								<h4><span id="yourXF" > </span></h4>
								
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="play-grid">
				
					<div id="chartdiv">
					  
					  <h3 style="color:#009100">历史营业额</h3>
						
								<div id="chart9" style="width: 900px;height: 450px;display:inline-block"></div>
								
					</div>
				</div>
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
					<div class="grid-1">
									<h3>上周每日营业额</h3>
									<div id="chart1" style="width: 430px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>本月不同时段营业额</h3>
								<div id="chart2" style="width: 300px;height: 300px;"></div>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
					<div class="grid-1">
									<h3>上周每日订单数量</h3>
									<div id="chart3" style="width: 450px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>本月不同时段订单数量统计</h3>
								<div id="chart4" style="width: 430px;height: 300px;"></div>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="chat-grids">
					<div class="col-md-6 chat-grid">
					<div class="grid-1">
									<h3>本店每月订单走势</h3>
									<div id="chart5" style="width: 450px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>市场分析</h3>
								<div id="chart6" style="width: 430px;height: 300px;"></div>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="play-grid">
				
					<div id="chartdiv">
					  
					  <h3 style="color:#009100">客户分析</h3>
						<br></br>
								<div id="chart7" style="width: 445px;height: 500px;display:inline-block"></div>
								<div id="chart8" style="width: 445px;height: 500px;display:inline-block"></div>
					  
					</div>
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