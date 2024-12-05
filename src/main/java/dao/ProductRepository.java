package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Product;
import mvc.database.DBConnection;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); //
	//싱글톤 객체 생성
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	public ArrayList<Product> getAllProducts(){
		return  listOfProducts;
	}
	
	//하나의 제품에 대한 다양한 정보를 제품
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	public List<Product> getAllProduct(String Constraint){
		List<Product> products = new ArrayList<Product>();
		Connection conn = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
				try {
			conn = DBConnection.getConnection();
			if (!Constraint.isEmpty()) {
				sql = "select * from product where p_pname like '%"+ Constraint +"%'";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("p_productId"));
				product.setPname((rs.getString("p_pname")));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setCondition(rs.getString("p_condition"));
				product.setFilename(rs.getString("p_filename"));
				product.setQuantity(rs.getInt("p_quantity"));
				products.add(product);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return products;
	}
	public Product getProductById(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Connection conn = null;
		Product product = null;
		try {
			conn = DBConnection.getConnection();
			sql = "select * from product where p_productId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next())
				return null;
			System.out.println(rs.getString("p_productId"));
			product = new Product();
			product.setProductId(rs.getString("p_productId"));
			product.setPname((rs.getString("p_pname")));
			product.setUnitPrice(rs.getInt("p_unitPrice"));
			product.setDescription(rs.getString("p_description"));
			product.setCategory(rs.getString("p_category"));
			product.setCondition(rs.getString("p_condition"));
			product.setFilename(rs.getString("p_filename"));
			product.setQuantity(rs.getInt("p_quantity"));
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return product;
	}
}
	
	

