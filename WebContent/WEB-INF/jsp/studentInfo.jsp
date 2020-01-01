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
	function pageRurn(value){
		var currentPage =parseInt($("#currentPage").val());
		var totalPage = parseInt($("#totalPage").val());
		if(value=="上一页"){
			if(currentPage == 1){
				return;
			}else{
				$("#currentPage").attr("value",currentPage-1);
				$("#baseForm").submit();
			}
		}else{
			if(currentPage == totalPage){
				return;
			}else{
				$("#currentPage").attr("value",currentPage+1);
				$("#baseForm").submit();
			}
		}
	}
	
	function jumps(){
		$('font').remove();
		var ju = $("#ju").val();
		var reg = /^[0-9]{1,10}$/;
		if(reg.test(ju)){
			$("#currentPage").attr("value",parseInt(ju));
			$("#baseForm").submit();
		}else{
			$('span').append("<font color='red'>请输入正确的数字");
		}
	}
	
	function add(){
		$("#baseForm").attr("action","<%=request.getContextPath()%>/student/add");
		$("#baseForm").submit();
	}
	
</script>

<body>
	
<%--   <form action="<%=request.getContextPath()%>/student/selectStudent" method="post"> --%>
<form id="baseForm" action="<%=request.getContextPath()%>/student/test" method="post">
  
  	学号：<input type="text" id="id" name="id" value="${id}" />
  	姓名：<input type="text" id="name" name="name" value="${name}" />
  		<input type="submit" value="查询" />
  		<input type="button" value="新增" onclick="add()"/>
	  <table>
	 	<thead>
	 		<th>学号：</th>
	 		<th>姓名：</th>
	 		<th>年龄：</th>
	 		<th>性别：</th>
	 		<th>生日：</th>
	 	</thead>
	 	<c:if test="${students.size() >0}">
<%-- 	 		<c:out value="${students.size() }"></c:out> --%>
		 	<c:forEach items="${students}" var="student">
			 	<tr>
			 		<td>${student.id}</td>
			 		<td>${student.name}</td>
			 		<td>${student.age}</td>
			 		<td>${student.gender}</td>
			 		<td>${student.birthday}</td>
			 	</tr>
			 </c:forEach>
			 
	 	</c:if>
	 </table>
	 <div>
	 	<c:out value="总条数：${pageLimit.totalNumber }"></c:out>
	 	<input type="button" id="top" value="上一页" onclick="pageRurn(this.value)"/>
	 	<input type="text" id="currentPage" name="currentPage" style="display:none" value="${pageLimit.currentPage}"/>
	 	<input type="text" id="totalPage" name="totalPage" style="display:none" value="${pageLimit.totalPage}"/>
	 	<c:out value="${pageLimit.currentPage}/${pageLimit.totalPage}"></c:out>
	 	<input type="button" id="next" value="下一页" onclick="pageRurn(this.value)"/>
	 	<input type="text" style="width:25px" name="jump" id="ju" value="${pageLimit.jump }" /><span></span>&nbsp;&nbsp;
	 	<input type="button" value="GO" onclick="jumps()" />
	 </div>
 </form>
</body>
</html>