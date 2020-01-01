<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
this is index.jsp

 <a href="<%=request.getContextPath()%>/transactionTest">点击进入</a>
 
 <a href="<%=request.getContextPath()%>/serviceProxyTest">点击进入事务代理</a>
 
 <a href="<%=request.getContextPath()%>/serviceAsjTest">点击进入AsJxml配置事务代理</a>
</body>
</html>