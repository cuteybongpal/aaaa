<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 

try{
	   String url = "jdbc:oracle:thin:@localhost:1521:xe";
	   String user = "C##dbexam";
	   String password = "m1234";
	   
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   conn = DriverManager.getConnection(url, user, password);
	   if(conn != null) System.out.println("db연결 확인 성공");
}catch(Exception e){
	   System.out.println("데이터베이스 연결이 실패!!<br>");
	   System.out.println("Exception : "+e.getMessage());
	   
}
%>
</body>
</html>