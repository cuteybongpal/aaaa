<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Product" %>    
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

  <!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- header include-->
  <%@ include file="navi.jsp" %>
  <div class="container-fluid bg-light p-5">
       <h1 class="p-5 display-3 mt-5">배송 정보</h1>
  </div>
  <div class="container">
    <div class="row my-5">
        <form action="./proccessShippingInfo.jsp">
                <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>"/>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="성함 입력" name="name">
					</div>
				</div>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">배송일 예약</label>
					<div class="col-sm-10">
						<input type="date" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="" name="shippingDate">
					</div>
				</div>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">주소</label>
					<div class="col-sm-10">
						<!-- <input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="주소 입력"> -->
						<div class="row">
							<div class="col-10">
								<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" name="zipCode">

							</div>
							<div class="col-2">
								<input type="button" onclick="sample6_execDaumPostcode()"
									value="우편번호 찾기" class="btn btn-warning btn-block">
							</div>
						</div>
						<div class="row">
							<div class="col px-4">
								<input type="text" id="sample6_address" placeholder="주소" class="form-control my-2" name="address"> 
								<input type="text"
									id="sample6_detailAddress" placeholder="상세주소" class="form-control my-2" name="detailAddress"> 
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control my-2">
							</div>
						</div>

					</div><!-- col-sm-10 -->
				</div>
				

				<script
					src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					function sample6_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = ' (' + extraAddr
														+ ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document
													.getElementById("sample6_extraAddress").value = extraAddr;

										} else {
											document
													.getElementById("sample6_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample6_postcode').value = data.zonecode;
										document
												.getElementById("sample6_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById(
												"sample6_detailAddress")
												.focus();
									}
								}).open();
					}
				</script>

				
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">연락처</label>
					<div class="col-sm-10">
						<input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="연락처 입력" size="4">
					</div>
				</div>
				<div class="form-group row">
				     <div class="col">
				          <a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary">이전</a>
				          <input type="submit" value="등록" class="btn btn-primary"/>
				          <a href="./checkOutCancelled.jsp" class="btn btn-secondary">취소</a>
				     </div>
				</div>
		</form>
    </div>
  </div>  
  
  
  
  
  
	
  <!-- footer include -->
  <%@ include file="footer.jsp" %>
 
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

</body>

</html>