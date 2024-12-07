<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="dto.Product" %>    
<%@ page import="mvc.model.BoardDTO" %>    
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Impact Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
<link href="+/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
  	html, body{
  		padding-top : 100px;
  	}
  </style>
  
</head>

<%
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
	List boardList = (List)request.getAttribute("boards");
	int totoal_record = (Integer)request.getAttribute("total_record");
	int total_page = (Integer)request.getAttribute("total_page");
	String items = (String)request.getAttribute("items");
	String text = (String)request.getAttribute("text");
%>

<body>
  
  <!-- header include-->
  <%@ include file="../step06/navi.jsp" %>
  <script>
  	function checkForm(){
  		if (${sessionId==null}){
  			alert("로그인해 주세요")
  			location.href="./member/loginMember.jsp";
  			return false;
  		}
  		location.href="./BoardWriteForm.do?id=<%= sessionId %>";
  		
  	}
  </script>
    <div class = "container section-title">
  	  	<h2>게시판</h2>
  	  	<p>lorem inputsume</p>
  	</div>
  	<div class="container">
		<form action="<c:url value = "/BoardListAction.do"/>" method="get">
			<div class="text-right">
				<span class="">전체 <%= totoal_record %> 건</span>
			</div>
			<div style="padding-top:100px" class = "mb-5">
				<table class= "table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for (int i = 0; i < boardList.size(); i++){
							BoardDTO board = (BoardDTO)boardList.get(i);
					%>
					<tr>
						<td><%= board.getNum() %></td>
						<td><a href="./BoardViewAction.do?num=<%= board.getNum() %>&pageNum=<%= pageNum %>"><%= board.getSubject() %></a></td>
						<td><%= board.getRegist_day() %></td>
						<td><%= board.getUpdate_day() %></td>
						<td><%= board.getHit() %></td>
						<td><%= board.getName() %></td>
					</tr>
					<%
						}	
					%>
				</table>
			</div>
			<div class="text-center">
				<table width="100%">
					<tr>
						<td width = "150px" align="left">
							<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본분에서</option>
								<option value="name">글쓴이에서</option>
							</select>
							<input type="text" name = "text">
							<input type ="submit" class="btn btn-info" value="검색">
							<a class="btn btn-danger" href="<c:url value = "/BoardListAction.do?pageNum=1"/>">검색 초기화</a>
						</td>
						<td width="100" align = "right">
							<a href="#" class="btn btn-warning" onClick="checkForm()">글쓰기</a>
						</td>
					</tr>
				</table>				
			</div>
			
			<div align="center">
				<c:set var="pageNum" value = "<%= pageNum %>"/>
				<c:forEach var="i" begin = "1" end="<%= total_page %>">
					<c:if test="${items != null && text != null}">
						<a href='<c:url value = "/BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>'>
							<c:choose>
								 <c:when test="${pageNum== i }">
									<b>[${i}]</b>								 
								 </c:when>
								 <c:otherwise>
								 	[${i}]
								 </c:otherwise>
							</c:choose>
						</a>
					</c:if>
					<c:if test="${items == null && text == null}">
						<a href="<c:url value = "/BoardListAction.do?pageNum=${i}"/>">
							<c:choose>
								 <c:when test="${pageNum== i }">
									<b>[${i}]</b>								 
								 </c:when>
								 <c:otherwise>
								 	[${i}]
								 </c:otherwise>
							</c:choose>
						</a>
					</c:if>
				</c:forEach>
			</div>
		</form>  
  	</div>
  
  
  
  
  
	
  <!-- footer include -->
  <%@ include file="../step06/footer.jsp" %>
 
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>

</html>