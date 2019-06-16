<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>yummyLogin</title>
<link href="./css1/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css1/style.css">
<link rel="stylesheet" type="text/css" href="./css1/userpanel.css">
<link rel="stylesheet" type="text/css" href="./css1/jquery.ui.all.css">
<script src="./css1/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}
function show(){
	var identity = (GetQueryString("identity"));
	if(identity == '1'){
		//$("#field").val("ClientLoginServlet");
		document.getElementById("form").action="ClientLoginServlet" ; 
	}else if(identity == '2'){
		//$("#field").val("RegisterLoginServlet");
		document.getElementById("form").action="RestaurantLoginServlet" ; 
	}else{
		//$("#field").val("ManagerLoginServlet");
		document.getElementById("form").action="ManagerLoginServlet" ; 
	}
}

</script>
</head>
<body onload="show()">
<div class="login_m">
<div class="login_logo"><img src="./images/yummy.png" width="230" height="69"></div>
<div class="login_boder">
<%String servletName = request.getParameter("field"); %>
<div class="login_padding" id="login_model">
<form  method="post" id="form"><!-- action写要请求Servlet的名 -->
	<input type="hidden" id = "field" name = "field"></input>
  <h2>USERNAME</h2>
  <label>
    <input type="text" id="uname" name="uname" class="txt_input txt_input2" onfocus="if (value ==&#39;Your name&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;Your name&#39;}" value="Your name">
  </label>
  <h2>PASSWORD</h2>
  <label>
    <input type="password" id="pwd" name="pwd" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
  </label>
  
 <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
 	<input type="submit" class="sub_buttons" value="登录" style="opacity: 0.7;">  
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
