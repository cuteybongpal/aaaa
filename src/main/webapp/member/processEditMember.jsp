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
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm"); 
	String day = request.getParameter("birthdd");
	String birth = year+"-"+month+"-"+day;
	
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");  
	String mail = mail1+"@"+mail2;
	
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
%>
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver"
user="C##dbexam" password="m1234"/>

<sql:update dataSource="${dataSource}" var="resultSet">
	update member set name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ? where id = ?
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=gender %>"/>
	<sql:param value="<%=birth %>"/>
	<sql:param value="<%=mail %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=id %>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=3"/>
</c:if>

</body>
</html>







