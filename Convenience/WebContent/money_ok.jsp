<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = DBconnection.getConnectino();
	

	String sale_no = request.getParameter("sale_no");
	String date = request.getParameter("date");
	String pan = request.getParameter("pan");
	String popo = request.getParameter("popo");
	String item = request.getParameter("item");
	String sale_cnt = request.getParameter("sale_cnt");
	String pay_type = request.getParameter("pay_type");
	
	String query = "insert into sale_tbl_003 values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setString(1, sale_no);
	pstmt.setString(2, date);
	pstmt.setString(3, pan);
	pstmt.setString(4, popo);
	pstmt.setString(5, item);
	pstmt.setString(6, sale_cnt);
	pstmt.setString(7, pay_type);
	
	pstmt.executeQuery();
	
%>

<script>
	/* window.onload = function(){
		alert("등록이 완료되었습니다.");
		location.replace("./index.jsp");
	} */
	alert("등록이 완료되었습니다.");
	location.replace("./index.jsp");
</script>