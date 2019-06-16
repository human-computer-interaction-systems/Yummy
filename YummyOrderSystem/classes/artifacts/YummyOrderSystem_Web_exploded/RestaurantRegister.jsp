<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>RestaurantRegister</title>
<link href="./css1/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css1/style.css">
<link rel="stylesheet" type="text/css" href="./css1/userpanel.css">
<link rel="stylesheet" type="text/css" href="./css1/jquery.ui.all.css">
<script src="./css1/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
function sendCode(){
	$.ajaxSetup({cache:false})
	$.ajax({
		type:"get",
		url:"RestaurantRegister",
		async : false,
		dataType:"json",
		success:function(data){
			$("#rid").val(data);
		}
		});
}
function check(){
	    var name = document.getElementById("rname").value;
	    var pwd = document.getElementById("pwd").value;
	    if(name ==  null || name == '' ||pwd == null || pwd == ""){
	          alert("用户名密码不能为空！");
	          return false;
	    }
	    
	    return true;
	  }

</script>

</head>
<body>

<div class="login_m">
<div class="login_logo"><img src="./images/yummy.png" width="230" height="69"></div>
<div class="login_boder2">

<div class="login_padding" id="login_model">
<form action="RestaurantRegister" id="curst" method="post" onsubmit="return check()"><!-- action写要请求Servlet的名 -->
  <h2>餐厅识别码</h2>
  <label>
    <input type="text" id="rid" name="rid" class="txt_inputShort txt_input2" readonly>
    <button class="button" type="button" onclick="sendCode()">获取识别码</button>
  </label>
  <h2>餐厅名称</h2>
  <label>
    <input type="text" id="rname" name="rname" class="txt_input txt_input2" >
  </label>
  <h2>密码</h2>
  <label>
    <input type="password" id="pwd" name="pwd" class="txt_input" >
  </label>
   <h2>地址</h2>
  <label>
    <input type="text" id="address" name="address" class="txt_input txt_input2" >
  </label>
  <h2>餐厅种类</h2>
   <label>
  	<input type="radio" class="checkBox" name="rtype" value="1" checked="checked" onclick="hidd();"><font size="4" color="#008CBA">  餐厅        </font>
  	<input type="radio" class="checkBox" name="rtype" value="2" onclick="show();"><font size="4" color="#008CBA">  商店      </font>
  </label>
  <br>
  <br>
  
 
  
  
 <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
 	<input type="submit" class="sub_buttons" value="注册" style="opacity: 0.7;">  
	<input type="reset" class="sub_button" value="重置" style="opacity: 0.7;"> 
 </div>
 
</form>

</div>



 
 
</div>


<!--login_padding  Sign up end-->
</div><!--login_boder end-->
 <br> <br>

</body>
</html>