<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
    request.setCharacterEncoding("UTF-8");
    String productId = request.getParameter("newProduct");
    String pName = request.getParameter("pName");
    String unitPrice = request.getParameter("unitPrice");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String condition = request.getParameter("condition");
    
    int price;
    if(unitPrice.isEmpty()) price = 0;
    else price = Integer.valueOf(unitPrice);
    
    /* ProductRepository타입의 instance객체를 리턴받는다. */
    ProductRepository dao = ProductRepository.getInstance();
    
    //Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정
    Product newProduct = new Product();
    newProduct.setProductId(productId);
    newProduct.setPname(pName);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setCategory(category);
    newProduct.setCondition(condition);
    
    dao.addProduct(newProduct);
    System.out.print(newProduct.getProductId());
    System.out.print("test");    
    System.out.print(dao);
    response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>