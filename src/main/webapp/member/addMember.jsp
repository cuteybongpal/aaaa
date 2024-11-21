<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
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
<link href="../resources/assets/img/favicon.png" rel="icon">
<link href="../resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="../resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="../resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
#form_layout {
	/* border:1px solid red; */
	margin: 200px 100px;
}

.form-group {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<script>
	function checkForm(){
		if(!document.newMember.id.value){
			alert("아이디를 입력해주세요")
			return false;
		}
		if(!document.newMember.password.value){
			alert("비밀번호를 입력해주세요")
			return false;
		}
		if(!document.newMember.password_confirm.value){
			alert("비밀번호 확인을 입력해주세요")
			return false;
		}
		if(!document.newMember.name.value){
			alert("성명을 입력해주세요")
			return false;
		}
		if(!document.newMember.gender.value){
			alert("성별을 입력해주세요")
			return false;
		}
		var select_month = document.getElementById("month");
		
		if(!document.newMember.birthyy.value || !document.newMember.birthdd.value || select_month.value == "" ){
			alert("생년월일을 입력해주세요")
			return false;
		}
		if(!document.newMember.mail1.value || !document.newMember.mail2.value){
			alert("이메일을 입력해주세요")
			return false;
		}
		if(!document.newMember.phone.value){
			alert("전화번호를 입력해주세요")
			return false;
		}
		if(!document.newMember.address.value){
			alert("주소를 입력해주세요")
			return false;
		}
		document.newMember.submit();
	}
</script>

</head>

<body>

	<!-- header include-->
	<%@ include file="/step06/navi.jsp"%>
	<div class="container" id="form_layout">
		<div class="mb-3">
			<div class="col">
				<h1 class="display-3 text-center">회원 가입</h1>
			</div>
		</div>
		<form name="newMember" class="form-horizontal"
			action="<c:url value="/member/processAddMember.jsp"/>" method="post">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id"
						required autofocus>
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control"
						placeholder="password">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control"
						placeholder="password confirm">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="name">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 <input
						name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-6">
					<!-- <input type="number" min="1900" max="2023" value="1980" class="form-control" placeholder="ID" name='id'> -->
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)"
						size="6" class="form-control w-25 d-inline"> 
					<select
						name="birthmm" class="form-control w-25 d-inline" id="month">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 
					<input type="text" name="birthdd" maxlength="2" placeholder="일"
						size="4" class="form-control w-25 d-inline">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50">@ 
					<select
						name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control"
						placeholder="phone">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control"
						placeholder="address">
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary " value="등록 "
						onclick="checkForm()"> <input type="reset"
						class="btn btn-primary " value="취소 " onclick="reset()">
				</div>
			</div>
		</form>
	</div>






	<!-- footer include -->
	<%@ include file="/step06/footer.jsp"%>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="../resources/assets/vendor/aos/aos.js"></script>
	<script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="../resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="../resources/assets/js/main.js"></script>

</body>

</html>