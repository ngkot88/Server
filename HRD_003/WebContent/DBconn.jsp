<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String query = "";
String table = "";
ResultSet res = null;
PreparedStatement pstmt;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String password = "1234";
Connection conn = null;
try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url,user,password);
}catch(ClassNotFoundException e){
	System.out.println("드라이버 실패");
}catch(SQLException e){
	System.out.println("오라클 실패");
}
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