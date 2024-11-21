<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../step06/navi.jsp" %>
   <%
      request.setCharacterEncoding("UTF-8");
   
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
   %>
   <sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver"
user="C##dbexam" password="m1234"/>
   <sql:query dataSource="${dataSource}" var="resultSet">
       select * from member where id=? and password =?
       <sql:param value="<%=id %>"/>
	   <sql:param value="<%=pw %>"/>
    </sql:query>
    <c:forEach items="${resultSet.rows}" var="row">
         <%
         session.setAttribute("sessionId", id);
         %>
         <c:redirect url="resultMember.jsp?msg=2"/>
    </c:forEach>
    <c:redirect url="loginMember.jsp?error=1"/>
</body>
</html>