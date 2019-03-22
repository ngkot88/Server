<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>
<section>
<%
		String query = "select custno from member_tbl_02 order by custno desc";
	 	ResultSet rs = dbconnection.exec_sql(query);
	 	rs.next();
	%>	
<div id="table_box">
<div class="section_tit">홈쇼핑 회원 등록</div>
	<form action="./join_ok.jsp" method="post">
		<table>
		<tr>
			<td>회원번호</td><td><input type="text" name="custno" value="<%=(rs.getInt("custno"))+1%>"></td>
		</tr>
		<tr>
			<td>회원성명</td><td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td><td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td><td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td><td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록"><input type="submit" value="조회"></td>
		</tr>
		</table>
	</form>
</div>
</section>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>