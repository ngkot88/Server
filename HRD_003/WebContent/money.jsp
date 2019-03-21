<%@page import="java.util.HashMap"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="./index.css" />
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>

<section>
	<%
		dbconnection db = new dbconnection();
		ResultSet rs = null;
		
		String query2="select a.custno, a.custname, decode(a.grade,'A','VIP','B','일반','C','직원','')grade, sum(b.price)price from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custno, a.custname, a.grade order by price desc";
		
		rs = dbconnection.exec_sql(query2);
	%>	
	<div class="section_tit">회원매출조회</div>
	<div id="table_box">
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
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("price") %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
</section>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>