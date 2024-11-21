<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>  
<%@ page import="dao.ProductRepository" %> 
<%

//상품의 id를 전송받아 저장하고 전송된 아이디가 없을 때 index.jsp로 이동
String id = request.getParameter("id");
if(id == null || id.trim().equals("")){
	response.sendRedirect("index.jsp");
	return;
}
//상품 데이터 싱글톤 객체 얻어오기
ProductRepository dao = ProductRepository.getInstance();
//상품 아이디를 이용해서 상품객체를 얻어오기
Product product = dao.getProductById(id);
//상품객체가 없으면 예외처리 페이지로 이동
if(product == null){
	response.sendRedirect("exceptionNoProductId.jsp");
}

//상품 목록을 얻어오도록 getAllProducts() 호출하고 리스트로 저장
ArrayList<Product> goodsList = dao.getAllProducts();
Product goods = new Product();
for(int i=0; i<goodsList.size(); i++){
	goods = goodsList.get(i);
	if(goods.getProductId().equals(id)){
		break;
	}
}
//세션 속성이름 cartlist(장바구니)의 세션 정보(장바구니에 등록된 데이터)를 얻어와 리스트 객체에 저장
ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
if(list == null){
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}
//cnt변수 생성
int cnt = 0;
Product goodsQnt = new Product();
for(int i=0; i<list.size(); i++){ //장바구니에 담긴 상품 리스트의 수만큼 loop를 돌려서 
	goodsQnt  = list.get(i); //첫번째 상품부터 객체에 담고
	if(goodsQnt.getProductId().equals(id)){ //요청한 파라미터 아이디 상품이 장바구니에 담긴 목록이라면
		cnt++;
		int orderQuantity   = goodsQnt.getQuantity()+1; //기존의 장바구니 수량에 1을 더하여
		goodsQnt.setQuantity(orderQuantity); //해당 수량으로 저장
	}
}

if(cnt == 0){
	goods.setQuantity(1);
	list.add(goods); //장바구니 리스트에 새로운 제품을 추가
}

response.sendRedirect("product.jsp?id="+id);
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