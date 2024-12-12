<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="mvc.model.BoardDTO"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Index - Impact Bootstrap Template</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

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
html, body {
	padding-top: 100px;
}
</style>
<script>
	function checkForm(){
		if(!document.newWrite.b_name.value){
			alert("성명을 입력하세요.");
			document.newWrite.b_name.focus();
			return false;
		}
		if(!document.newWrite.b_subject.value){
			alert("제목을 입력하세요.");
			document.newWrite.b_subject.focus();
			return false;
		}
		if(!document.newWrite.b_content.value){
			alert("내용을 입력하세요.");
			document.newWrite.b_content.focus();
			return false;
		}
	}
</script>
</head>
<%
	BoardDTO notice = (BoardDTO)request.getAttribute("board");
	int pageNum = (Integer)request.getAttribute("pageNum");
%>
<body>

	<!-- header include-->
	<%@ include file="../step06/navi.jsp"%>


	<div class="container section-title">
		<h2>게시판</h2>
	</div>
	<div class="container">
		<section id="contact" class="contact section">
			<div class="col-lg-12" align="center">
				<form action="./BoardUpdateAction.do?num=<%= notice.getNum() %>&pageNum=<%= pageNum %>" name = "newWrite" method="post" onsubmit="return checkForm()">
					
					<div class="row gy-4">
						<div class="col-md-12">
							<label for="subject">제목</label>
							<input type="text" class="form-control" name="b_subject"
								placeholder="Subject" id ="subject" value = "<%= notice.getSubject() %>">
						</div>
						<div class="col-md-12">
							<label for="name">이름</label>
							<input type="text" class="form-control" name="b_name"
								placeholder="name" value="<%= notice.getName() %>" id="name">
						</div>
						<div class="col-md-12">
							<label for="content">내용</label>
							<textarea class="form-control" name="b_content" rows="8"
								placeholder="content" id = "content"><%= notice.getContent() %></textarea>
						</div>

						<div class="col-md-12 text-center">
							<c:set var = "userId" value = "<%= notice.getId() %>"/>
							<c:if test ="${sessionId == userId }">
								<input type="submit" class="btn btn-info" value="수정">
								<a href="./BoardDeleteAction.do?pageNum=<%= pageNum %>" class="btn btn-success">목록</a>
							</c:if>
							<a href="./BoardListAction.do?pageNum=<%= pageNum %>" class="btn btn-success">목록</a>
							
						</div>
					</div>
				</form>
			</div>
			<!-- End Contact Form -->
		</section>
	</div>

	<!-- footer include -->
	<%@ include file="../step06/footer.jsp"%>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>

</html>