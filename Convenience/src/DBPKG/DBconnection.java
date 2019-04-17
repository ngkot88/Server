package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	
	public static Connection con = null;
	
	public static Connection getConnectino() throws Exception{
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "asdf", "1234");
			return con;
		}catch(Exception e){
			System.out.println("ERROR----------------------");
		}
		return con;
	}
}
