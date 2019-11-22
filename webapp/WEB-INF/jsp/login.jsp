<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<form class="login-form" method="post" action="${pageContext.request.contextPath}/login">
 <center>
 <h2>管理登录</h2>
<input type="text" placeholder="用户名" id="username" name="username"/>
<input type="password" placeholder="密码" name="password" id="password" />
<button id="login">登　录</button>
 </center>
</form>
</div>
</div>

<script src="js/jquery.min.js"></script>
<%--<script type="text/javascript">
	function check_login()
	{
	 var name=$("#user_name").val();
	 var pass=$("#password").val();
	 if(name=="admin" && pass=="admin")
	 {
	  alert("登录成功！");
	  $("#user_name").val("");
	  $("#password").val("");
       $(location).attr('href', 'index.html');
	 }
	 else
	 {
	  $("#login_form").removeClass('shake_effect');  
	  setTimeout(function()
	  {
	   $("#login_form").addClass('shake_effect')
	  },1);  
	 }
	}
	function check_register(){
		var name = $("#r_user_name").val();
		var pass = $("#r_password").val();
		var email = $("r_email").val();
		if(name!="" && pass=="" && email != "")
		 {
		  alert("注册成功！");
		  $("#user_name").val("");
		  $("#password").val("");
		 }
		 else
		 {
		  $("#login_form").removeClass('shake_effect');  
		  setTimeout(function()
		  {
		   $("#login_form").addClass('shake_effect')
		  },1);  
		 }
	}
	$(function(){
		$("#create").click(function(){
			check_register();
			return false;
		})
		$("#login").click(function(){
			check_login();
			return false;
		})
		$('.message a').click(function () {
		    $('form').animate({
		        height: 'toggle',
		        opacity: 'toggle'
		    }, 'slow');
		});
	})
	</script>--%>
</body>
</html>