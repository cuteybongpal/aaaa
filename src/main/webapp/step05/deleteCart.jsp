<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("cartId");
if(id==null || id.trim().equals("")){
	response.sendRedirect("index.jsp#products");
	return;
}

session.invalidate(); //세션에 값이 있으면 모두 무효화하는 메소드
response.sendRedirect("cart.jsp");
%>
</body>
</html>




