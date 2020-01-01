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
	function aa(){
		$.ajax({
			url:"<%=request.getContextPath()%>/min/jsonService",
			async:true,
			success:function(data){
				alert(data);
				var result = eval("("+data+")");
			}
		})
	}
	function bb(){
		$.ajax({
			url:"<%=request.getContextPath()%>/min/bodyService",
			async:true,
			success:function(data){
				alert(data);
			}
		})
	}
</script>
<body>
	<h1>hello,SSM</h1>
	<table>
		<tr>
			<td>商品编号：</td>
			<td><input id="goodsId" name="goodsId" value="${goods.goodsId} "></td>
			<td>商品名称：</td>
			<td><input id="goodsName" name="goodsName" value="${goods.goodsName} "></td>
		</tr>
		<tr>
			<td>商品品牌：</td>
			<td><input id="goodsCate" name="goodsCate" value="${goods.goodsCate} "></td>
			<td>商品类型：</td>
			<td><input id="brandName" name="brandName" value="${goods.brandName} "></td>
		</tr>
		<tr>
			<td>商品价格：</td>
			<td><input id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice} "></td>
			<td>商品是否上架：</td>
			<td><input id="isShow" name="isShow" value="${goods.isShow} "></td>
		</tr>
		<tr>
			<td>商品是否售空：</td>
			<td><input id="isSaleoff" name="isSaleoff" value="${goods.isSaleoff} "></td>
		</tr>
	</table>
	<input type="button" onclick="aa()" value="使用response.getWriter().write()返回数据" />
	<input type="button" onclick="bb()" value="使用@responseBod注解返回" />
</body>
</html>