<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@page import="java.util.List"%>
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
  <!-- 절대 경로로 수정 -->
<link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
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
</head>

<body>
	<%
		 String edit = request.getParameter("edit");
		 if (edit == null) edit = "";
	 %>
  <!-- header include-->
  <%@ include file="../step06/navi.jsp" %>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  
  <section id="products" class="portfolio section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Product</h2>
      </div><!-- End Section Title -->
	  <div class="container mb-5">
	 	 <form class="row center">
		  <div class="col-11">
		    <input type="text" class="form-control form-control-lg" placeholder="검색" name="Constraint">
		  </div>
		  <div class="col-1 center">
		    <button type="submit" class="btn btn-success form-control-lg">검색</button>
		  </div>
		</form>
	  </div>
      <%-- <%
      ProductRepository dao = productDAO.getInstance();
      ArrayList<Product> listOfProducts = dao.getAllProducts();
      %> --%>
      
      <div class="container">
        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">App</li>
            <li data-filter=".filter-product">Product</li>
            <li data-filter=".filter-branding">Branding</li>
            <li data-filter=".filter-books">Books</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

			<!-- 상품 목록 loop -->
			<%-- <%
				for(int i=0; i<listOfProducts.size(); i++){
					Product product = listOfProducts.get(i);
				
			%> --%>
			<%
	        	List<Product> products = (List)request.getAttribute("products");
				for (int i =0; i < products.size(); i++)
				{
            %>

			<!-- 시작 상품 Item -->
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <div class="portfolio-content h-100">
                <a href="${pageContext.request.contextPath}/resources/assets/img/portfolio/app-1.jpg" data-gallery="portfolio-gallery-app" class="glightbox">
                   <img src="${pageContext.request.contextPath}/resources/assets/img/product/<%=products.get(i).getFilename()%>" class="img-fluid" alt="">
                </a>
                <div class="portfolio-info">
                  <h4><a href="portfolio-details.html" title="More Details"><%=products.get(i).getPname()%></a></h4>
                  <p><%=products.get(i).getDescription() %></p>
                  <p><%=products.get(i).getUnitPrice()%></p>
                  <p><%=products.get(i).getCondition()%></p>
                  <br>
				  <a href="${pageContext.request.contextPath}/step06/product.jsp?id=<%=products.get(i).getProductId()%>" class="btn btn-secondary">상세 정보 바로가기 &raquo;</a> 
                    
                     <%
                        if(edit.equals("update")){
                     %>
                     <a href="${pageContext.request.contextPath}/step06/editProduct.jsp?id=<%=products.get(i).getProductId() %>" class="btn btn-success">수정 &raquo;</a>
                     <%
                        }else if(edit.equals("delete")){
                     %>
                     <a href="#" class="btn btn-danger" onclick="deleteConfirm('<%=products.get(i).getProductId() %>')">삭제 &raquo;</a>
                     <%
                        }
                     %>
                </div>
              </div>
            </div>
            
            <%
				}
            %>
            <!-- 끝 상품 Item 
            상품에 들어갈 이미지 이름 목록
            product-1.jpg
            branding-2.jpg
            books-1.jpg
			app-2.jpg-->

          </div><!-- End Portfolio Container -->

        </div>

      </div>
      
    </section><!-- /Portfolio Section -->
  
  
  
  
	
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