<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	Connection con = DBconnection.getConnectino();
	
	String goods_cd = request.getParameter("goods_cd");
	String goods_nm = request.getParameter("item");
	String goods_price = request.getParameter("goods_price");
	String cost = request.getParameter("cost");
	String in_date = request.getParameter("date");

	String query="update goods_tbl_003 set goods_cd=?, goods_nm=?,goods_price=?,cost=?,in_date=? where goods_cd ="+goods_cd;
	
	PreparedStatement pstmt=con.prepareStatement(query);
	
	pstmt.setString(1, goods_cd);
	pstmt.setString(2, goods_nm);
	pstmt.setString(3, goods_price);
	pstmt.setString(4, cost);
	pstmt.setString(5, in_date);
	
	pstmt.executeQuery();
	
%>
<script>
	window.onload = function(){
		alert("업데이트가 완료되었습니다.");
		location.replace("./index.jsp");
	}
</script>
