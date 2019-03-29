package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnection {
	public static Connection con = null;
	
	public static Connection getConnection() throws Exception{
		
		try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","asdf","1234");
		
			return con;
		}catch(Exception e1){
			System.out.println("ERROR");
		}
		return con;
	}
}