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
    <title>ManagerStatistics</title>
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

<script src="./css1/jquery-3.3.1.min.js"></script>
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
	var chart10 = echarts.init(document.getElementById("chart10"));
	var chart11 = echarts.init(document.getElementById("chart11"));
	
	$.ajaxSetup({cache:false});
	$.ajax({
		type:"get",
		url:"ManagerModelServlet",
		dataType:"json",
		success:function(data){
			$('#yourGK').html(data.overview[0]); 
			$('#yourCT').html(data.overview[1]);
			$('#yourDD').html(data.overview[2]);
			$('#yourSY').html(data.overview[3]);
			
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
				            data: data.c1[0],
				        	
				        },
				        {
				            name:'下午时段',
				            type:'line',				            
				            data: data.c1[1],
				        	
				        },
				        {
				            name:'全天',
				            type:'line',
				            data: data.c1[2],
				        	
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
				                  show: true,
				                  position: 'outside',
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
				          data: ['18年春','18年夏','18年秋','18年冬','19年春','19年夏'],
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
				          name: '平均订单价格',
				          type: 'bar',
				          data: data.c6[0],
				          barWidth: '12',
				        },
				        {
				          name: '订单成功率',
				          type: 'line',
				          yAxisIndex: 1,
				          data: data.c6[1],
				          label: {
				        	  normal: {
				                  show: true,
				                  position: 'outside',
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
				        data:['200元以下','200-400元','400-600元','600元以上']
				    },
				    series: [
				        {
				            name:'会员数量',
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
				                {value: data.c7[0][0], name:'普通会员'},
				                {value: data.c7[0][1], name:'高级会员'}
				            ]
				        },
				        {
				            name:'会员数量',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value: data.c7[1][0], name:'200元以下'},
				                {value: data.c7[1][1], name:'200-400元'},
				                {value: data.c7[1][2], name:'400-600元'},
				                {value: data.c7[1][3], name:'600元以上'}				              
				            ]
				        }
				    ]
				};
			
			option8 = {
					title: {
				        left: 'center',
				        text: '按年龄和性别分类',
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
				            name:'会员数量',
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
				                {value: data.c8[0][0], name:'男性顾客'},
				                {value: data.c8[0][1], name:'女性顾客'}
				            ]
				        },
				        {
				            name:'会员数量',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value: data.c8[1][0], name:'20岁以下'},
				                {value: data.c8[1][1], name:'20-35岁'},
				                {value: data.c8[1][2], name:'35-50岁'},
				                {value: data.c8[1][3], name:'50岁以上'}				              
				            ]
				        }
				    ]
				};
			
			option9 = {
				    tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'cross',
				            crossStyle: {
				                color: '#999'
				            }
				        }
				    },
				    
				    legend: {
				        data:['营业额','订单数量']
				    },
				    xAxis: [
				        {
				            type: 'category',
				            data: ['18年6月', '18年7月', '18年8月', '18年9月', '18年10月', '18年11月', '18年12月','19年1月','19年2月','19年3月','19年4月','19年5月'],
				            axisPointer: {
				                type: 'shadow'
				            }
				        }
				    ],
				    yAxis: [
				        {
				            type: 'value',
				            name: '营业额',
	
				            axisLabel: {
				                formatter: '{value} 元'
				            },
				        
				        },
				        {
				            type: 'value',
				            name: '订单数量',
				           
				            axisLabel: {
				                formatter: '{value} 条'
				            },
				        	splitLine: { show: false },
				        }
				    ],
				    series: [
				        {
				            name:'营业额',
				            type:'bar',
				            color:'#3398DB',
				            data: data.c9[0]
				        },
				        {
				            name:'订单数量',
				            type:'line',
				            yAxisIndex: 1,
				            itemStyle : {  
                                normal : {  
                                    lineStyle:{  
                                        color:'#FF0000'
                                    }  
                                }  
                            },  
				            data: data.c9[1]
				        }
				    ]
				};
			
			option10= {
					title: {
					        left: 'center',
					        text: '按每月营业额分类',
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
				        data:['1万元以下','1万-2万元','2万-3万元','3万元以上']
				    },
				    series: [
				        {
				            name:'餐厅个数',
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
				                {value: data.c10[0][0], name:'餐厅'},
				                {value: data.c10[0][1], name:'商店'}
				            ]
				        },
				        {
				            name:'餐厅个数',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value: data.c10[1][0], name:'1万元以下'},
				                {value: data.c10[1][1], name:'1万-2万元'},
				                {value: data.c10[1][2], name:'2万-3万元'},
				                {value: data.c10[1][3], name:'3万元以上'}				              
				            ]
				        }
				    ]
				};
			
			option11 = {
					title: {
				        left: 'center',
				        text: '按餐厅类型分类',
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
				        data:['甜品店','快餐店','蔬果超市','便利店']
				    },
				    series: [
				        {
				            name:'餐厅个数',
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
				                {value: data.c11[0][0], name:'24小时营业'},
				                {value: data.c11[0][1], name:'白天营业'}
				            ]
				        },
				        {
				            name:'餐厅个数',
				            type:'pie',
				            radius: ['40%', '55%'],
				           
				            data:[
				                {value: data.c11[1][0], name:'甜品店'},
				                {value: data.c11[1][1], name:'快餐店'},
				                {value: data.c11[1][2], name:'蔬果超市'},
				                {value: data.c11[1][3], name:'便利店'}				              
				            ]
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
			chart10.setOption(option10);
			chart11.setOption(option11);
		}
		});
	
	
}


 </script>
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
						<li> <a class="waves-effect waves-dark" href="ManagerStatistics.jsp" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">平台信息统计</span></a>
						</li>
						<li> <a class="waves-effect waves-dark" href="ManagerApproval.jsp" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">审核信息</span></a>
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
				<div class="row page-titles">
					<div class="col-md-5 col-8 align-self-center">
						<h3 class="text-themecolor m-b-0 m-t-0">平台信息统计</h3>

					</div>
				</div>
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->  
                             
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                

			<div class="main-page">
				<div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-grid1">
							<div class="icon">
								<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月活跃顾客</h3>
								<h4><span id="yourGK" > </span></h4>
								
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid2">
							<div class="icon">
								<i class="glyphicon glyphicon-align-justify " aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月营业餐厅</h3>
								<h4><span id="yourCT" > </span></h4>
								
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-grid3">
							<div class="icon">
								<i class="glyphicon glyphicon-bell" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>本月订单数</h3>
								<h4><span id="yourDD" > </span></h4>
								
								
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
								<h4><span id="yourSY" > </span></h4>
								
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
									<h3>平台每月订单走势</h3>
									<div id="chart5" style="width: 450px;height: 300px;"></div>
									
								</div>
					</div>
					<div class="col-md-6 chat-grid1">
						<div class="grid-1">
								<h3>平台每季度订单走势</h3>
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
				
				<div class="play-grid">
				
					<div id="chartdiv">
					  
					  <h3 style="color:#009100">餐厅分析</h3>
						<br></br>
								<div id="chart10" style="width: 445px;height: 500px;display:inline-block"></div>
								<div id="chart11" style="width: 445px;height: 500px;display:inline-block"></div>
					  
					</div>
				</div>
				
				
				<div class="clearfix"> </div>
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