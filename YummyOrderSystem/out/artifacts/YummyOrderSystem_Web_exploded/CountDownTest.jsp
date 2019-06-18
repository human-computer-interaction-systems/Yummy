<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./css1/jquery-3.3.1.min.js"></script>
<script src="./css1/echarts.common.min.js"></script>
<script language="javascript" type="text/javascript"> 

var interval = 1000; 
function ShowCountDown(year,month,day,divname) 
{ 
var now = new Date(); 
var endDate = new Date(year, month-1, day); 
var leftTime=endDate.getTime()-now.getTime(); 
var leftsecond = parseInt(leftTime/1000); 
//var day1=parseInt(leftsecond/(24*60*60*6)); 
var day1=Math.floor(leftsecond/(60*60*24)); 
var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
var cc = document.getElementById(divname); 
cc.innerHTML = "距离"+year+"年"+month+"月"+day+"日还有："+day1+"天"+hour+"小时"+minute+"分"+second+"秒"; 
} 
window.setInterval(function(){ShowCountDown('2016','02','07','divdown1');}, interval); 


</script> 
</head>
<body>
<div id="main" style="width: 800px;height: 400px;"></div>
<script type="text/javascript">
       var myChart = echarts.init(document.getElementById("main"));
       var option = {
         title:{
         text:"会员统计",
         x:"center"
         },
         series:[{
         type:"pie",
         name:"会员级别",
         data:[{
         value:335,
         name:"普通会员"
        },
        {
        value:310,
        name:"高级会员"
        },
        ],
        center:["50%","60%"],//圆心坐标
        radius:"55%"         //远的半径
        }],
        tooltip:{  //提示框
           trigger:"item",      //触发类型
           formatter:"{a}<br>{b}:{c} ({d}%)" ,//鼠标指上时显示的数据a:系列名称     b:类目值     c:数值      d:占的百分比
           backgroundColor:"rgba(0,0,0,0.7)" //提示框的背景色，默认为透明度为0.7的黑色
        },
        legend:{
           orient:"vertical",
           x:"left",
           data:['普通会员','高级会员']
        },
       
 }
    myChart.setOption(option);
</script>
<div id="divdown1"></div> 

</body>
</html>