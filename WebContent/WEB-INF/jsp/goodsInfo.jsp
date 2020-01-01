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
<body>
	
  <form action="" method="post">
  	商品编号：<input type="text" id="goodsId" name="goodsId" value="${goodsId}" />
  	商品名称：<input type="text" id="goodsName" name="goodsName" value="${goodsName}" />
  	<input type="submit" value="查询">
	  <table>
	 	<thead>
	 		<th>商品编号：</th>
	 		<th>商品名称：</th>
	 		<th>商品品牌：</th>
	 		<th>商品类别：</th>
	 		<th>商品价格：</th>
	 		<th>是否上架：</th>
	 		<th>是否售空：</th>
	 		<th>类型对应的ID：</th>
	 		<th>商品类别：</th>
	 	</thead>
	 	<c:if test="${goodsList.size() >0}">
<%-- 	 		<c:out value="${students.size() }"></c:out> --%>
		 	<c:forEach items="${goodsList}" var="goods">
			 	<tr>
			 		<td>${goods.goodsId}</td>
			 		<td>${goods.goodsName}</td>
			 		<td>${goods.goodsCate}</td>
			 		<td>${goods.brandName}</td>
			 		<td>${goods.goodsPrice}</td>
			 		<td>${goods.isShow}</td>
			 		<td>${goods.isSaleoff}</td>
			 		<td>${goods.goodsBrand.id}</td>
			 		<td>${goods.goodsBrand.brandName}</td>
			 	</tr>
			 </c:forEach>
	 	</c:if>
	 </table>
 </form>
</body>
</html>