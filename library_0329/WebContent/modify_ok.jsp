<%@page import="javax.print.attribute.standard.PresentationDirection"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cust_no = request.getParameter("cust_no");
	String cust_name = request.getParameter("cust_name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String join_date = request.getParameter("join_date");
	String stat_fg = request.getParameter("stat_fg");
	
	String query = "update member_tbl_001 set cust_no=?, cust_name=?, phone=?, address=?, join_date=?, stat_fg=? where cust_no = "+cust_no;
	Connection con = dbconnection.getConnection();

	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, cust_no);
	pstmt.setString(2, cust_name);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, join_date);
	pstmt.setString(6, stat_fg);
	
	pstmt.executeQuery();
	
%>
<script>
	alert("수정이 완료되었습니다.");
</script>
<%
response.sendRedirect("./index.jsp");
%>