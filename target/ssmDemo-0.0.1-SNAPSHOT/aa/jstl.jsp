<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false"%>
<jsp:useBean class="min.spring.bean.JstlBean" id="jstlBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = "啊哈哈哈";
		request.setAttribute("username", username);
		
	%>
	<!-- 使用out标签输出常量 -->
	<c:out value="我是常量"></c:out><br>
	<!-- 使用out标签输出变量 -->
	<c:out value="${username}"></c:out><br>
	<!-- 当变量不存在时，通过default输出默认值 -->
	<c:out value="${name}" default="默认值" ></c:out><br>
	<!-- 设置输出转义后的字符需要escapeXml属性值设置为false -->
	<c:out value="&lttest标签&gt" escapeXml="false"></c:out><br>
	<!-- empty用来判断是否为空 -->
	<c:out value="${empty username}"></c:out><br>
	
	<!-- 存值到scope中 -->
	<c:set value="today" var="day" scope="session"></c:set>
	<c:out value="${day }"></c:out>
	<c:set var="age" scope="request">11</c:set>
	<c:out value="${age }"></c:out>
	
	<!-- 通过set标签给javaBean赋值 jstlBean -->
	<c:set target="${jstlBean }" property="name2" value="葫芦娃"></c:set>
	<c:out value="${jstlBean.name2}"></c:out>
	<c:set target="${jstlBean }" property="age2">180</c:set>
	<c:out value="${jstlBean.age2}"></c:out><br>
	
	<!-- remove标签的用法，var属性必选，scope属性可选 -->
	<c:set var="removeTest">哈哈</c:set>
	<c:out value="${removeTest}"></c:out>
	<c:set var="removeTest2">嘻嘻</c:set>
	<c:remove var="removeTest2"/>
	<c:out value="${removeTest2}"></c:out>
	
	<!-- catch标签的用法 -->
	<c:catch var="error">
		<c:set target="aa" value="bb"></c:set>
	</c:catch>
	<c:out value="${ error}"></c:out>
	
	<!-- if标签的用法  -->
	<form action="jstl.jsp" method="post">
		<input type="text" name="score" value="${param.score}" />
			<input type="submit" />
	</form>
	<c:if test="${ param.score >=90}" var="result">
		<c:out value="恭喜，您的成绩为优秀"></c:out>
	</c:if>
	<c:if test="${ param.score<90 and param.score>=80}">
		<c:out value="恭喜，您的成绩为良好"></c:out>
	</c:if>
	<c:if test="${ param.score<80 and param.score>=60}" >
		<c:out value="sorry，您的成绩为一般"></c:out>
	</c:if>
	<c:if test="${param.score<60}" >
		<c:out value="sorry，您的成绩需要提升"></c:out>
	</c:if>
	<c:out value="${result}"></c:out><br>
	
	<!-- choose  when otherwise -->
	<c:choose>
		<c:when test="${param.score>=90 and param.score<=100}">
			
			<c:out value="恭喜，您的成绩为优秀"></c:out>
		</c:when>
		<c:when test="${param.score>=80 and param.score<90}">
			<c:out value="恭喜，您的成绩为良好"></c:out>
		</c:when>
		<c:when test="${param.score>=60 and param.score<80}">
			<c:out value="sorry，您的成绩为一般"></c:out>
		</c:when>
		<c:when test="${param.score>=0 and param.score<60}">
			<c:out value="sorry，您的成绩需要提升"></c:out>
		</c:when>
		<c:otherwise>
			<c:out value="sorry，请输入正确的成绩"></c:out>
		</c:otherwise>
	</c:choose>
	<br>
	<!-- forEach标签的用法 -->
	<%
		List<String> fruits = new ArrayList<String>();
		fruits.add("apple");
		fruits.add("orange");
		fruits.add("pear");
		fruits.add("banana");
		fruits.add("grape");
		request.setAttribute("fruits", fruits);
	%>
	<!-- 用法一：全部遍历 -->
	<c:forEach items="${fruits}" var="fruit" >
		<c:out value="${fruit }"></c:out>&nbsp;&nbsp;
	</c:forEach>
	<br>
	<c:out value="================="></c:out><br>
	<!-- 用法二：部分遍历 -->
	<c:forEach items="${fruits}" var="fruit" begin="1" end="3">
		<c:out value="${fruit }"></c:out>&nbsp;&nbsp;
	</c:forEach>
	<br>
	<c:out value="================="></c:out>	<br>
	<!-- 用法三：部分遍历 并且指定步长-->
	<c:forEach items="${fruits}" var="fruit" begin="1" end="3" step="2">
		<c:out value="${fruit }"></c:out>&nbsp;&nbsp;
	</c:forEach>
	<br>
	<c:out value="================="></c:out><br>
	<!-- 用法四：遍历并输出元素状态-->
	<c:forEach items="${fruits}" var="fruit"  varStatus="fru">
		<c:out value="${fruit }的四个属性状态"></c:out><br>
		<c:out value="index属性:${fru.index }"></c:out><br>
		<c:out value="count属性:${fru.count }"></c:out><br>
		<c:out value="first属性:${fru.first }"></c:out><br>
		<c:out value="last属性:${fru.last }"></c:out><br>
		<c:out value="-------------------"></c:out><br>
	</c:forEach>
	<br>
	<c:out value="================="></c:out><br>
	
	
	<!-- forTokens标签的用法：用于浏览字符串，并根据指定的字符将将字符串截取 -->
	<c:forTokens items="000-111-222-333" delims="-" var="num">
		<c:out value="${num }"></c:out>
	</c:forTokens>
	
	
<!-- 		import标签的用法:可以把静态或动态的文件包含到本jsp页面中 -->
<%-- 		 和<jsp:include>的区别： --%>
<%-- 		<jsp:include>只能包含同一个web应用中的文件 --%>
<%-- 		而<c:import>可以包含其他web应用中的文件 --%>
	 <!-- url：被导入资源的url路径
	 	  context:相同服务器下的其他的web工程,必须以"/"开头
	 	  var： 以String类型存入被包含文件的内容
	 	  scope： var变量的jsp范围
	 	  charEncoding: 被导入文件的编码格式
	 	  varReader:以Reader类型存储被包含文件的内容
	  -->
	  <!-- 导入网络上的文件 -->
<%-- 	  <c:catch var="errorTest"> --%>
<%-- 	  	<c:import url="http://www.baidu.com" charEncoding="utf-8"></c:import> --%>
<%-- 	  </c:catch> --%>
<%-- 	  <c:out value="${errorTest}"></c:out> --%>
	  
	  <!-- 导入相对路径文件 -->
	   <c:catch var="error08">
	  	<c:import url="name.jsp"></c:import>
	  </c:catch>
	  <c:out value="${error08}"></c:out>
	  
	  <!-- c:redirect标签的用法 -->
<%-- 	  <c:redirect url="name.jsp"> --%>
<%-- 	  	<c:param name="username">海绵宝宝</c:param> --%>
<%-- 	  	<c:param name="password">123456</c:param> --%>
<%-- 	  	<c:param name="email">84@qq.com</c:param> --%>
<%-- 	  </c:redirect> --%>

		<!-- url标签 -->
		<c:if test="${1<3}">
			<c:set var="partUrl">upload.jsp</c:set>
		</c:if>
		<c:url value="http://localhost:8080/spring/aa/${partUrl}" var="newUrl"></c:url>
		<a href="${newUrl }">点击</a>
		
		<!-- 函数的使用 -->
		<!-- contains -->
		<c:out value="${fn:contains('Hello world','hello')}"></c:out><br>
		<!-- containsIgnoreCase忽略大小写 -->
		<c:out value="${fn:containsIgnoreCase('Hello world','hello')}"></c:out><br>
</body>
</html>