package DBPKG;

import java.sql.*;

public class dbconnection {
	public static Connection getConnection() throws Exception{
		Connection con = null;
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","asdf","1234");
			return con;
		}catch(Exception e){
			System.out.println("ERROR------------------------");
		}
		return con;
	}
}
