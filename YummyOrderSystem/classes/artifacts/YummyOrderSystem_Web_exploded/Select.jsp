<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>yummySelect</title>
<link href="./css1/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css1/style.css">
<link rel="stylesheet" type="text/css" href="./css1/userpanel.css">
<link rel="stylesheet" type="text/css" href="./css1/jquery.ui.all.css">
</head>
<body>
<div class="login_m">
<div class="login_logo"><img src="./images/yummy.png" width="230" height="69"></div>
<div class="login_boder">

<div class="login_padding" id="login_model">
<form action="SelectServlet" method="post"><!-- action写要请求Servlet的名 -->
  <h0>选择你的身份</h0>
  <br>
  <br>
  <label>
  	<input type="radio" class="checkBox" name="identity" value="1" checked="checked" onclick="hidd();"><font size="4" color="#008CBA">  会员        </font>
  	<input type="radio" class="checkBox" name="identity" value="2" onclick="show();"><font size="4" color="#008CBA">  餐厅      </font>
  	<input type="radio" class="checkBox" name="identity" value="3" onclick="show();"><font size="4" color="#008CBA">  管理员     </font>
  </label>
  <br>
  <br>
  <br>
  <h0>选择你的操作</h0>
  <br>
  <br>
  <label>
  	<input type="radio" class="checkBox" name="loginOrR" value="1" checked="checked" onclick="hidd();"><font size="4" color="#008CBA">  登录        </font>
  	<input type="radio" class="checkBox" name="loginOrR" value="2" onclick="show();"><font size="4" color="#008CBA">  注册      </font>
  </label>
  
 <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
 	<input type="submit" class="sub_buttonCenter" value="确定" style="opacity: 0.7;">  
 </div>
 
</form>
 
  
</div>



 
 
</div>






<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->
 <br> <br>
 
</body>
</html>