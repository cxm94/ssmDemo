<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	function add(){
	}
</script>

<body>
	
  <input type="button" value="新增" onclick="add()"/><br>
  <form id="baseForm" action="<%=request.getContextPath()%>/student/addStudents" method="post">
	 <table>
	 	<thead>
	 		<th>学号：</th>
	 		<th>姓名：</th>
	 		<th>年龄：</th>
	 		<th>性别：</th>
	 		<th>生日：</th>
	 	</thead>
	 </table>
 </form>
</body>
</html>