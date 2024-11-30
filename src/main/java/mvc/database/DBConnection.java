package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "C##dbexam";
		String password = "m1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    System.out.println("드라이버 등록 성공");
	   
	    //JDBC연동위해 JDBC로딩
	    conn = DriverManager.getConnection(url,user,password);
	    System.out.println("접속 성공");
	    return conn;
	}
}
