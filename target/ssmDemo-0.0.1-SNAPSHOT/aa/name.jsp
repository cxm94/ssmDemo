<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javaScript">
	function regs(){
		$("font").remove();
		var username = $("#username").val();
		if(username!=null || ""!=username || username!="undefined"){
			var reg = /(^[0-9]{8})$/;//只能为8位数字
			var reg1 = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{6,10}$/;//中文、数字加字母最少6位最多10位
			if(!reg1.test(username)){
				$("#test").append("<font color='red'>请输入中文、数字加字母最少6位最多10位")
			}
		}else{
			$("#test").append("<span>请输入用户名</span>");
		}
		
	}
	
	function ps(){
		$("span").remove();
		var password = $("#password").val();
		if(password !=null || ""!=password || password!="undefined"){
			var reg = /^[a-zA-Z]\w{5,9}$/; //数字加字母最少6位最多10位，且必须以字母开头
			if(!reg.test(password)){
				$("#ps").append("<span><font color='red'>数字加字母最少6位最多10位，且必须以字母开头</span>");
			}
		}else{
			$("#ps").append("<span><font color='red'>数字加字母最少6位最多10位，且必须以字母开头</span>");
		}
	}
	function em(){
		$("span").remove();
		var email = $("#email").val();
		if(email !=null || ""!=email || email!="undefined"){
			var reg = /^([a-zA-Z0-9])(\w|\-)+@[0-9a-zA-Z]+\.[a-zA-Z]{2,4}$/;
			if(!reg.test(email)){
				$("#ema").append("<span><font color='red'>请填写正确的邮箱</span>");
			}
		}else{
			$("#ema").append("<span><font color='red'>请填写正确的邮箱</span>");
		}
	}
	
</script>
</head>
<body>
	用户名：<input type="text" value="${param.username}" id="username" name="username" onchange="regs()" /><p id="test"></p>
	密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" value="${param.password }" id="password" name="password" onchange="ps()" /><p id="ps"></p>
	邮  &nbsp;&nbsp;&nbsp;箱：<input type="text" id="email" value="${param.email }"  name="email" onchange="em()" /><p id="ema"></p>
</body>
</html>