<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.dbconnection" %>
<%
	String num = request.getParameter("sale_num");
	String ji_cd = request.getParameter("jim_code");
	String date = request.getParameter("sale_date");
	String pizza_code = request.getParameter("pizza_code");
	String pan = request.getParameter("pan");
	
	Connection con = dbconnection.getConnection();
	String query = "insert into sale_tbl_001 values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, num);
	pstmt.setString(2, ji_cd);
	pstmt.setString(3, date);
	pstmt.setString(4, pizza_code);
	pstmt.setString(5, pan);
	
	pstmt.executeQuery();
	
	response.sendRedirect("./index.jsp");
%>    
    