<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection con = DBconnection.getConnectino();
	String sale_no = request.getParameter("sale_no");
	String item = request.getParameter("item");
	String goods_price = request.getParameter("goods_price");
	String cost = request.getParameter("cost");
	String date = request.getParameter("date");
	
	String query = "insert into goods_tbl_003 values(?,?,?,?,?)";
	PreparedStatement pstmt= con.prepareStatement(query);
	pstmt.setString(1, sale_no);
	pstmt.setString(2, item);
	pstmt.setString(3, goods_price);
	pstmt.setString(4, cost);
	pstmt.setString(5, date);
	
	pstmt.executeQuery();
	
%>