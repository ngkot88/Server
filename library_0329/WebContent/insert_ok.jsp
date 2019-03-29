<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = dbconnection.getConnection();
	PreparedStatement pstmt = null;
	
	String rent_ymd = request.getParameter("rent_ymd");
	String rent_no = request.getParameter("rent_no");
	String rent_book = request.getParameter("rent_book");
	String rent_rent = request.getParameter("rent_rent");
	String close_ymd = request.getParameter("close_ymd");
	
	String query = "insert into rental_tbl_001(rent_ymd,rent_no,rent_book,rent_rent,close_ymd,return_fg) values(?,?,?,?,?,0)";
	pstmt = con.prepareStatement(query);
	
	pstmt.setString(1,rent_ymd);
	pstmt.setString(2,rent_no);
	pstmt.setString(3,rent_book);
	pstmt.setString(4,rent_rent);
	pstmt.setString(5,close_ymd);
	
	
	pstmt.executeQuery();

%>
<script>
	alert("대여도서등록이 완료되었습니다.");
</script>
<%
response.sendRedirect("./index.jsp");
%>