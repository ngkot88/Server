<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String date = request.getParameter("date");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String query="update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno ="+custno;
	
	Connection con = DBconnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(query);
	
	
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, date);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	
	pstmt.executeQuery();
	
	response.sendRedirect("./index.jsp");
%>