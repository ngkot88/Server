<%@page import="com.sun.prism.Presentable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DBconnection" %>

<%
	request.setCharacterEncoding("UTF-8");

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String date = request.getParameter("date");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String query = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	
	
	Connection con = DBconnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, custno);
	pstmt.setString(2, custname);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, date);
	pstmt.setString(6, grade);
	pstmt.setString(7, city);
	
	pstmt.executeQuery();
%>
<script>
	alert("등록이 완료되었습니다.");
</script>
<%
 response.sendRedirect("./index.jsp");
%>