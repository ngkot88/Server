<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

		Connection conn = dbconnection.getConnection();
		PreparedStatement pstmt = null;
		
		String custno = request.getParameter("custno");
		String name = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");

		
		String query2 = "update member_tbl_02 set custno=?,custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno = "+custno;	
		pstmt = conn.prepareStatement(query2);
		pstmt.setString(1, custno);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		
		pstmt.executeQuery();
		
		response.sendRedirect("index.jsp");
%>	
</body>
</html>