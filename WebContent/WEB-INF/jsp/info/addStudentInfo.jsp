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
	function findByTeacher(a){
		//获取被选中的option标签
		 var schoolCode = $('select  option:selected').val();
		$.ajax({
			url:"<%=request.getContextPath()%>/student/findTeacherBySchool",
			type:"post",
			data:{'schoolCode':schoolCode},
			success:function(data){
// 				var result = eval("("+data+")");
// 				alert(result);
				$("#findTeacher").find("option").remove();
				$("#studentCode").val(data[0]);
				var result = data[1];
				for(var i=0;i<result.length;i++){
					$("#findTeacher").append("<option>"+result[i].teacherName+"</option>");
					$("#findTeacher option").attr("value",result[i].teacherCode);
				}
				
			},
		});
	}
	
</script>

<body>
	
<form id="baseForm" action="<%=request.getContextPath()%>/student/addStudentInfo" method="post">
  
	  <table border="1">
	  	
	  	<tr>
	  		<td>
	  			所属学校：
	  			<select name="studentSchool" onchange="findByTeacher()">
					<c:forEach items="${schoolInfos }" var="schoolInfo" >
						<option id="schoolCode"  value="${schoolInfo.schoolCode}">
							${schoolInfo.schoolName }
						</option>
					</c:forEach>
					
				</select>
	  		</td>
	  		<td>
	  			所属年级：
	  			<select  name="studentGrade">
	  				<c:forEach items="${gradeInfos }" var="gradeInfo">
	  					<option id="studentGrade" value="${gradeInfo.gradeId }">${gradeInfo.gradeName}</option>
	  				</c:forEach>	
				</select>
	  		</td>
	  	</tr>
	  	
	  	<tr>
	  		<td>
	  			主管教师：
	  			<select id="findTeacher" name="teacherCode">
					<c:forEach items="${teacherInfos }" var="teacherInfo" >
						<option id="teacherCode"  value="${teacherInfo.teacherCode}">
							${teacherInfo.teacherName }
						</option>
					</c:forEach>
				</select>
	  		</td>
	  		<td>
	  			所属班级：
	  			<select name="studentClass" >
	  				<c:forEach items="${classInfos }" var="classInfo">
	  					<option id="studentClass" value="${classInfo.classId }">${classInfo.className}</option>
	  				</c:forEach>	
				</select>
	  		</td>
	  	</tr>
	  	
	  	
	  	<tr>
	  		<td>
	  			学生编号：<input readonly="readonly"  id="studentCode" name="studentCode" value="${studentCode}"/>
	  		</td>
	  		<td>
	  			学生姓名：<input id="studentName" name="studentName" />
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			学生年龄：<input id="studentAge" name="studentAge" />
	  		</td>
	  		<td>
	  			学生性别：
	  			<select name="studentGender">
	  				<option  value="1">男</option>	
	  				<option  value="2">女</option>	
	  			</select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			手机号码：<input id="studentTel" name="studentTel" />
	  		</td>
	  		<td>
	  			家庭地址：<input id="studentAddress" name="studentAddress" />
	  		</td>
	  	</tr>
	  	<tr>
	  		<td colspan="2" align="center" ><input type="submit" value="提交"></td>
	  	</tr>
	  </table>
 </form>
</body>
</html>