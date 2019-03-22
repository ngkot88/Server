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
		ResultSet rs = null;
		
		String id = request.getParameter("id");
		String query2="select custno,custname,phone,address,grade,city,to_char(joindate,'yyyy-dd-mm') as joindate from member_tbl_02 where custno="+id;

		rs = dbconnection.exec_sql(query2);
	while(rs.next()){
	%>	
<div id="table_box">
<div class="section_tit">홈쇼핑 회원 정보 수정</div>
	<form action="./modify_ok.jsp" method="post">
		<table>
		<tr>
			<td>회원번호</td><td><input type="text" name="custno" value="<%=rs.getString("custno")%>"></td>
		</tr>
		<tr>
			<td>회원성명</td><td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>
		</tr>
		<tr>
			<td>회원전화</td><td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
		</tr>
		<tr>
			<td>가입일자</td><td><input type="text" name="joindate" value="<%=rs.getString("joindate")%>"></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade" value="<%=rs.getString("grade")%>"></td>
		</tr>
		<tr>
			<td>도시코드</td><td><input type="text" name="city" value="<%=rs.getString("city")%>"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"><input type="submit" value="조회"></td>
		</tr>
		</table>
	</form>
	<%} %>
</div>
</section>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>