package DBPKG;

import java.sql.*;

public class DBconnection {
	public static Connection con = null;
	
	public static Connection getConnection() throws Exception{
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "asdf","1234");
			return con;
		}catch(Exception e){
			System.out.println("ERROR-------------");
		}
		return con;
	}
}
