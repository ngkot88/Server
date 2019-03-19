<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBconn.jsp" %>
<%
table = "userInfo";
query = "select * from "+table;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="index.css" />
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>

<section>
	<%
		dbconnection db = new dbconnection();
		ResultSet rs = null;
		String query2="";
	%>	
</section>

<!-- <section>
	<div class="section_tit">회원매출조회</div>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</section> -->
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>