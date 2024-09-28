<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
    request.setCharacterEncoding("UTF-8");

    //String filename = "";
    String realFolder = application.getRealPath("/resources/assets/img/product/");
    String encType ="utf-8";
    int maxSize = 5 * 1024 * 1024; //5MB
    
    //이미지 등록시 필요한 MultipartRequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
    String productId = multi.getParameter("newProduct");
    String pName = multi.getParameter("pName");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String condition = multi.getParameter("condition");
    
    int price;
    if(unitPrice.isEmpty()) price = 0;
    else price = Integer.valueOf(unitPrice);
    
    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String fileName = multi.getFilesystemName(fname);
    
    
    
    /* ProductRepository타입의 instance객체를 리턴받는다. */
    ProductRepository dao = ProductRepository.getInstance();
    
    //Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정
    Product newProduct = new Product();
    newProduct.setProductId(productId);
    newProduct.setPname(pName);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setCategory(category);
    newProduct.setCondition(condition);
    newProduct.setFilename(fileName);
    
    dao.addProduct(newProduct);
    System.out.print(newProduct.getProductId());
    System.out.print("test");    
    System.out.print(dao);
    response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>