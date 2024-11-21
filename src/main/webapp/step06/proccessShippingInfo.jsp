<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");

   Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
   Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
   Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
   Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
   Cookie address = new Cookie("Shipping_address",URLEncoder.encode(request.getParameter("address"),"utf-8"));
   Cookie detailAddress = new Cookie("Shipping_detailAddress",URLEncoder.encode(request.getParameter("detailAddress"),"utf-8"));
   
   //쿠키의 유효기간 2시간으로 설정
   cartId.setMaxAge(2*60*60);
   name.setMaxAge(2*60*60);
   shippingDate.setMaxAge(2*60*60);
   zipCode.setMaxAge(2*60*60);
   address.setMaxAge(2*60*60);
   detailAddress.setMaxAge(2*60*60);
   
   //쿠키 등록
   response.addCookie(cartId);
   response.addCookie(name);
   response.addCookie(shippingDate);
   response.addCookie(zipCode);
   response.addCookie(address);
   response.addCookie(detailAddress);
   
   //주문 목록을 볼 수 있는 주문 정보 페이지로 이동 orderConfirmation.jsp
   response.sendRedirect("orderConfirmation.jsp");
%>
</body>
</html>