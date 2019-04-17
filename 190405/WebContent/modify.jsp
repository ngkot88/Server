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
			" custno,"+
			" custname,"+
			" phone,"+
			" address,"+
			" to_char(joindate, 'yyyy-mm-dd')as joindate,"+
			" decode(grade, 'A','VIP','B','일반','C','직원') as grade,"+
			" city"+
			" from"+
			" member_tbl_02";
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
							<th colspan="7">홈쇼핑 회원목록조회/수정</th>
						</tr>
						<tr>
							<td>회원번호</td><td>회원성명</td><td>전화번호</td><td>주소</td><td>가입일자</td><td>고객등급</td><td>거주지역</td>
						</tr>
						<%while(rs.next()){ %>
						<tr>
							<td><a href="./modify_s.jsp?id=<%=rs.getString("custno")%>"><%=rs.getString("custno") %></a></td>
							<td><%=rs.getString("custname") %></td>
							<td><%=rs.getString("phone") %></td>
							<td><%=rs.getString("address") %></td>
							<td><%=rs.getString("joindate") %></td>
							<td><%=rs.getString("grade") %></td>
							<td><%=rs.getString("city") %></td>
						</tr>
						<%} %>
					</table>
				</div>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>