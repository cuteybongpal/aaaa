package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {
		
	}
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance; 
	}
	public int getListCount(String items, String text) {
		//items : 컬럼명, text : 검색 문자열
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0; //선택된 총 게시글의 갯수
		String sql = "";
		if (items == null && text == null)
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where " + items+" like '% " + text +"%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next())
				x = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("getListCount 에러 : "+e);
		}
		finally {
			
			try {
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return x;
	}
}
