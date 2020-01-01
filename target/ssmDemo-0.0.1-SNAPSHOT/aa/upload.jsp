<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javaScript">
	
</script>
<body>
	<h1>hello,SSM</h1>
	<form action="<%=request.getContextPath()%>/min/read" method="post" enctype="multipart/form-data">
			<input name="file" id="fileId" type="file" style="width: 70%"/>
			<input type="submit" value="提交" />
	</form>
</body>
</html>