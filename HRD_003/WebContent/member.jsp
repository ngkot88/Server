<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<link rel="stylesheet" href="index.css" />
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>
	<section>
	<div class="section_tit">회원목록조회/수정</div>
	<%
		dbconnection db = new dbconnection();
		ResultSet rs = null;
		
		String query2="select * from member_tbl_02";
		
		rs = dbconnection.exec_sql(query2);

	%>	
	<table class="table_comm" border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		</thead>
		<tbody>
		<%
				while(rs.next()){
					%>
			<tr>
				<td><a href="./modify.jsp?id=<%=rs.getString("custno")%>"><%=rs.getString("custno") %></a></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
				<td><%=rs.getString("joindate") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("city") %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</section>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>