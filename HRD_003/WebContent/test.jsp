<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String query = "select * from money_tbl_02";
ResultSet res = null;
PreparedStatement pstmt = null;
Class.forName("oracle.jdbc.OracleDriver");
String url = "jdbc:oracle:thin:@//localhost:1521/xe";
String user = "asdf";
String password = "1234";
Connection conn = DriverManager.getConnection(url, user, password);

pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
res.next();
out.print(res.getString("custno"));
%>