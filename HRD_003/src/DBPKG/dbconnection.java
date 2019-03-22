package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbconnection {
	
	public static Connection conn = null;
	
	public static Connection getConnection() throws Exception{
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@//localhost:1521/xe";
			String user = "asdf";
			String password = "1234";
			
			conn = DriverManager.getConnection(url, user, password);
			return conn;
			
		}catch(Exception e){
			System.out.println("ERROR--------------------------------------------");
		}
		
		return conn;
	}
	
	public static ResultSet exec_sql(String args) throws Exception{
		
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query = args;
		conn = dbconnection.getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		return rs;
		
	}
}
