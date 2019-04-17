<%@page import="DBPKG.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<%
	Connection con = DBconnection.getConnection();
	String query="select"+
			" a.custno,"+
			" a.custname,"+
			" decode(a.grade,'A','VIP','B','일반','C','') grade,"+
			" to_char(sum(b.price), '999,999,999') as price"+
			" from"+
			" member_tbl_02 a, money_tbl_02 b"+
			" where"+
			" a.custno = b.custno"+
			" group by"+
			" a.custno, a.custname, a.grade"+
			" order by price desc";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	ResultSet rs = pstmt.executeQuery();
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./menu.jsp"/>
		<section>
				<div id="table_box">
					<table>
						<tr>
							<th colspan="4">회원매출조회</th>
						</tr>
						<tr>
							<td>회원번호</td><td>회원성명</td><td>고객등급</td><td>매출</td>
						</tr>
						<%while(rs.next()){ %>
						<tr>
							<td><%=rs.getString("custno")%></td>
							<td><%=rs.getString("custname") %></td>
							<td><%=rs.getString("grade") %></td>
							<td><%=rs.getString("price") %></td>
						</tr>
						<%} %>
					</table>
				</div>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>