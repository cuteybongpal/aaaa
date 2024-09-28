package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); //
	//싱글톤 객체 생성
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "삼성Phone 8v", 500000);
		phone.setDescription("최신 신상폰으로 ai가 탑재된 폰입니다.");
		phone.setCategory("스마트폰");
		phone.setCondition("신상품");
		phone.setFilename("01_samsungPhone.png");
		
		Product watch = new Product("P1235", "iphone 와치", 600000);
		watch.setDescription("폰의 기능을 가진 시계");
		watch.setCategory("스마트폰");
		watch.setCondition("중고품");
		watch.setFilename("02_iphone.png");
		
		Product robot = new Product("P1239", "AI로봇", 700000);
		robot.setDescription("최신 신상폰으로 ai가 탑재된 로봇입니다.");
		robot.setCategory("로봇");
		robot.setCondition("신상품");
		robot.setFilename("03_ai로봇.jpg");
		
		//상품목록을 리스트에 추가
		listOfProducts.add(phone);
		listOfProducts.add(watch);
		listOfProducts.add(robot);
	}
	
	public ArrayList<Product> getAllProducts(){
		return  listOfProducts;
	}
	
	//상품의 아이디를 이용해서 제품에 대한 정보를 얻어오는 메소드
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
		
	}
	//하나의 제품에 대한 다양한 정보를 제품
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
	
	

