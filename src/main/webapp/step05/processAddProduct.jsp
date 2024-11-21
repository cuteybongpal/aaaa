<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %> --%>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    String filename = "";
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
    String pQuantity = multi.getParameter("pQuantity");
    
    int price;
    if(unitPrice.isEmpty()) price = 0;
    else price = Integer.valueOf(unitPrice);
    
    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String fileName = multi.getFilesystemName(fname);
    
    int quantity = Integer.valueOf(pQuantity);
    
    
    
    /* ProductRepository타입의 instance객체를 리턴받는다. => db로 이전하면서 삭제
    ProductRepository dao = ProductRepository.getInstance();*/
    
    /*Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정 => db로 이전하면서 삭제
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
    System.out.print(dao);
    */
    //PreparedStatement pstmt = null;
    String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, pName);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	/* pstmt.setString(6, manufacturer);
	pstmt.setLong(7, stock); */
	pstmt.setString(6, condition);
	pstmt.setString(7, fileName);
	pstmt.setInt(8, quantity);
	
    pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
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