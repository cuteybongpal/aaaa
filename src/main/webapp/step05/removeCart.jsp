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
String id = request.getParameter("id");
if(id==null || id.trim().equals("")){
	response.sendRedirect("index.jsp#products");
	return;
}

ProductRepository dao = ProductRepository.getInstance();

Product product = dao.getProductById(id); //상품 아이디에 해당하는 객체 얻어옴
if(product == null) {
	response.sendRedirect("exceptionNoProductId.jsp");
}

//세션에 저장되어 있는 장바구니 리스트를 얻어와서 카트에 등록된 모든 상품을 가져옴
ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
//제품 객체 생성
Product goodsQnt = new Product();
for(int i=0; i<cartList.size(); i++){//카트리스트에 등록된 상품을 하나씩 가져와서
	goodsQnt = cartList.get(i);
	if(goodsQnt.getProductId().equals(id)){
		cartList.remove(goodsQnt);
	}
}
response.sendRedirect("cart.jsp");
%>
</body>
</html>




