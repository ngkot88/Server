<%@page import="javax.print.attribute.standard.PresentationDirection"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = dbconnection.getConnection();

	String query = "select c.rent_ymd, c.rent_no, rent_book, c.close_ymd, b.book_name, a.cust_name, c.close_ymd from member_tbl_001 a, book_tbl_001 b, rental_tbl_001 c where c.rent_book = b.book_code and c.rent_rent = a.cust_no";
	PreparedStatement pstmt = con.prepareStatement(query);	
	
	ResultSet rs = pstmt.executeQuery();
%>
<section>
	<div id="table_Box">
			<table>
				<tr>
					<th colspan="7">도서대여현황</th>
				</tr>
				<tr>
					<td>대여일자</td><td>대여번호</td><td>도서코드</td><td>대여도서명</td><td>고객번호</td><td>대여고객명</td><td>반납기한</td>
				</tr>
				<%
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("rent_ymd")%></td>
					<td><%=rs.getString("rent_no")%></td>
					<td><%=rs.getString("rent_book")%></td>
					<td><%=rs.getString("close_ymd")%></td>
					<td><%=rs.getString("book_name")%></td>
					<td><%=rs.getString("cust_name")%></td>
					<td><%=rs.getString("close_ymd")%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
</section>
</body>
</html>