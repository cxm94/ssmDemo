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
		$("#baseForm").attr("action","<%=request.getContextPath()%>/student/addView");
		$("#baseForm").submit();
	}
	
</script>

<body>
	
<form id="baseForm" action="<%=request.getContextPath()%>/student/findStudentInfoBy" method="post">
  
  	学号编号：<input type="text" id="id" name="studentCode" value="${studentCode}" />
  	学生姓名：<input type="text" id="name" name="studentName" value="${studentName}" />
  		<input type="submit" value="查询" />
  		<input type="button" value="新增" onclick="add()"/>
	  <table border="1">
	 	<thead>
	 		<th>学生编号：</th>
	 		<th>学生姓名：</th>
	 		<th>学生年龄：</th>
	 		<th>学生性别：</th>
	 		<th>手机号码：</th>
	 		<th>家庭地址：</th>
	 		<th>所属学校：</th>
	 		<th>主管老师：</th>
	 		<th>所属年级：</th>
	 		<th>所属班级：</th>
	 	</thead>
	 	<c:if test="${studentInfos.size() >0}">
<%-- 	 		<c:out value="${students.size() }"></c:out> --%>
		 	<c:forEach items="${studentInfos}" var="studentInfo">
			 	<tr>
			 		<td>${studentInfo.studentCode}</td>
			 		<td>${studentInfo.studentName}</td>
			 		<td>${studentInfo.studentAge}</td>
			 		<td>${studentInfo.studentGender}</td>
			 		<td>${studentInfo.studentTel}</td>
			 		<td>${studentInfo.studentAddress}</td>
			 		<td>${studentInfo.schoolInfo.schoolName}</td>
			 		<td>${studentInfo.teacherInfo.teacherName}</td>
			 		<td>${studentInfo.gradeInfo.gradeName}</td>
			 		<td>${studentInfo.classInfo.className}</td>
			 		<td><a href="<%=request.getContextPath()%>/student/updateView?studentCode=${studentInfo.studentCode}" >修改</a></td>
			 		<td><a href="<%=request.getContextPath()%>/student/deleteStudentInfo?studentCode=${studentInfo.studentCode}" >删除</a></td>
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