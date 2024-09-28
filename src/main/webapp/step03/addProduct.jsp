<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>  
<%@ page import="dao.ProductRepository" %>  
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Impact Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="../resources/assets/img/favicon.png" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="../resources/assets/css/main.css" rel="stylesheet">
<style>
input[type="file"]{
opacity:0}
.file-label{
background-color:lightgray;
padding:10px 20px;
border-radius:5px;
cursor:pointer}
#file-name{
position:relative;
top:-65px;
left:140px;
display:inline-block;
}
</style>
<script>
function updateFileName(){
	const input = document.getElementById("pImg")
	const fileNameLabel =  document.getElementById("file-name")
	if(input.files.length > 0){
		fileNameLabel.textContent = input.files[0].name;
	}else{
		fileNameLabel.textContent ="선택된 파일 없음"
	}
}


//언어 변경 함수
function changeLanguage(lang){
	const fileLabelText = document.getElementById("file-label-text");
	const fileNameLabel = document.getElementById("file-name");
	
	if(lang=="ko"){
		fileLabelText.textContent="파일 선택"
		fileNameLabel.textContent="선택된 파일 없음"
	}else if(lang=="en"){
		fileLabelText.textContent="Choose File"
		fileNameLabel.textContent="No file chosen"
	}
}

/* const koBtn= document.getElementById("koBtn")
const enBtn= document.getElementById("enBtn")
koBtn.addEventListener("click",function(){
	changeLanguage("ko");
	setTimeout(() => window.location.href = "?language=ko", 100);
})
enBtn.addEventListener("click",function(){
	changeLanguage("en");
	 setTimeout(() => window.location.href = "?language=en", 100);
}) */
</script>
</head>

<body class="index-page">

  <!-- 한글과 영문 중에 원하는 언어를 선택할 수 있도록 설정 -->
  <fmt:setLocale value='<%=request.getParameter("language") %>'/>
  <fmt:bundle basename="bundle.message">
  <!-- header include-->
  <%@ include file="navi.jsp" %>
  <main class="main">
  	<section id="#" class="section bs-warning mt-5 ">
  		<div class="container position-relative mt-5">
  			
  				<div class="row mt-5">
	  				<div class="col">
	  				    <h1><fmt:message key="title"/>  </h1> 
	  				    <br />
	  				</div>
	  				<div class="col-3">
	  				    <h3>
	  				       <a id="koBtn" href="?language=ko">Korean</a> | 
	  				       <a id="enBtn" href="?language=en">English</a>
	  				    </h3>
	  				</div>
	  			</div>
	  			<br />
				<div class="row">
					<form class="g-3" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data" name="registerNewProduct">
						<div class="row m-3">
							<div class="col-2">
								<label for="newProduct" class="">
                                     <fmt:message key="productId"/>
                                </label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="newProduct" placeholder="" name="newProduct">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="pName" class="">
                                    <fmt:message key="pname"/>
                                </label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="pName"
									placeholder="" name="pName">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="unitPrice" class="">
								     <fmt:message key="unitPrice"/>
								</label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="unitPrice" placeholder="" name="unitPrice">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="description" class="">
                                      <fmt:message key="description"/>
                                </label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="description" placeholder="" name="description">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="category" class="">
								     <fmt:message key="category"/>
								</label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="category"
									placeholder=""  name="category">
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="condition" class="">
								     <fmt:message key="condition"/>
								</label>
							</div>
							<div class="col-4">
								<input type="radio" id="New"
									placeholder="" value="New" name="condition" checked>  
								<label for="New">
								       <fmt:message key="condition_New"/>
								</label>
								<input type="radio" id="Old"
									placeholder="" value="Old" name="condition">  
								<label for="Old">
								      <fmt:message key="condition_Old"/>
								</label>
							</div>
						</div>
						<div class="row m-3">
							<div class="col-2">
								<label for="pImg" class="">
								      <fmt:message key="filename"/>
								</label>
							</div>
							<div class="col-4">
							    <label for="pImg" class="file-label">
							        <span id="file-label-text">
							            <fmt:message key="selectFile"/>
							        </span>
							    </label>
								<input type="file" id="pImg"
									name="pImg" onchange="updateFileName()">
								<span id="file-name">
								     <fmt:message key="noFile"/>
								</span> 
							</div>
						</div>
						<div class="row m-3">
							<div class="col-6">
								<input type="button" class="btn btn-secondary mb-3 btn-block" value="<fmt:message key="button"/>" onclick="form_check_addProduct()">
							</div>
						</div>
					</form>
				</div>
			</div>
  	</section>
  </main>
  
  
	
 <!-- footer include -->
 <%@ include file="footer.jsp" %>
 
 </fmt:bundle>
 
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="../resources/assets/vendor/aos/aos.js"></script>
  <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="../resources/assets/js/main.js"></script>
  <!-- 유효성 검증 js -->
  <script src="../resources/assets/js/validation.js?"></script>

</body>

</html>