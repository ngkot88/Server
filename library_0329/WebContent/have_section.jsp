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

	String query = "select rownum, book_code, book_name, book_type, book_author, to_char(in_date,'yyyy-dd-mm') as in_date, decode(stat_fg,'0','대여가능','1','대여중') as stat_fg from book_tbl_001";
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
					<td></td><td>도서코드</td><td>도서명</td><td>장르</td><td>작가</td><td>입고일자</td><td>도서상태</td>
				</tr>
				<%
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("rownum")%></td>
					<td><a href="./book_modify.jsp?id=<%=rs.getString("book_code")%>"><%=rs.getString("book_code")%></a></td>
					<td><%=rs.getString("book_name")%></td>
					<td><%=rs.getString("book_type")%></td>
					<td><%=rs.getString("book_author")%></td>
					<td><%=rs.getString("in_date")%></td>
					<td><%=rs.getString("stat_fg")%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
</section>
</body>
</html>