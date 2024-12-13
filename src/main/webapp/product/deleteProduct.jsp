<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../step06/dbconn.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteProduct.jsp</title>
</head>
<body>
<%
   String productId = request.getParameter("id");

   String sql = "select * from product";
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();
   
   if(rs.next()){
	  sql = "delete from product where p_productId = ?";
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, productId);
	  pstmt.executeUpdate();
   }else{
	  out.println("일치하는 상품이 없습니다."); 
   }
   if (rs != null) pstmt.close();
   if (pstmt != null) pstmt.close();
   if (conn != null) conn.close();
   
   response.sendRedirect("../ProductListAction.do");
%>
</body>
</html>