<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>clientRegister</title>
<link href="./css1/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css1/style.css">
<link rel="stylesheet" type="text/css" href="./css1/userpanel.css">
<link rel="stylesheet" type="text/css" href="./css1/jquery.ui.all.css">
<script src="./css1/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
function sendCode(){
	var email = document.getElementById("u_mail").value;
	$.ajaxSetup({cache:false})
	$.ajax({
		type:"get",
		url:"MailSendServlet",
		dataType:"json",
		data:{"email":email},
		success:function(data){
			$("#field").val(data);
		}
		});
}
function check(){
	    var name = document.getElementById("uname").value;
	    var pwd = document.getElementById("pwd").value;
	    var field = document.getElementById("field").value;
	    var securityCode = document.getElementById("securityCode").value;
	    if(name ==  null || name == '' ||pwd == null || pwd == ""){
	          alert("用户名密码不能为空！");
	          return false;
	    }
	    if(securityCode != field){
	    	alert("验证码错误！");
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
<form  action="ClientRegisterServlet" id="curst" method="post" onsubmit="return check()"><!-- action写要请求Servlet的名 -->
  <h2>用户名</h2>
  <label>
    <input type="text" id="uname" name="uname"  class="txt_input txt_input2" >
  </label>
  <h2>密码</h2>
  <label>
    <input type="password" id="pwd" name="pwd" class="txt_input"  >
  </label>
  <h2>邮箱</h2>
  <label>
    <input type="text" id="u_mail" name="u_mail" class="txt_inputShort txt_input2"  >
  	<button class="button" type="button" onclick="sendCode()">获取验证码</button>
  </label>
  <input type="hidden" id = "field" name = "field"></input>
  <h2>验证码</h2>
  <label>
    <input type="text" id="securityCode" name="securityCode" class="txt_input txt_input2" >
  </label>
  <h2>电话</h2>
  <label>
    <input type="text" id="phone" name="phone" class="txt_input txt_input2" >
  </label>
  <h2>支付密码</h2>
  <label>
    <input type="text" id="paymentCode" name="paymentCode" class="txt_input txt_input2" 
    maxlength="6" onkeyup="value=value.replace(/[^\d]/g,'')">
  </label>
  <h2>常用地址</h2>
  <label>
    <input type="text" id="address" name="address" class="txt_input txt_input2" >
  </label>
  
  
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