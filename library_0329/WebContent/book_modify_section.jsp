<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.transform.Result"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>

<section class="insert_section">
<%
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	
	String query = "select book_code, book_name, decode(book_type, 'A','에세이','B','인문','C','소설') as book_type, book_author, to_char(in_date,'yyyy-dd-mm') as in_date, decode(stat_fg,'0','대여가능','1','대여중') as stat_fg from book_tbl_001 where book_code = '"+id+"'";
	Connection con = dbconnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();
	rs.next();
%>
	<form action="./book_modify_ok.jsp" method="post" >
		<table id="insert_tb">
			<tr>
				<th colspan="6">보유도서관리(수정)</th>
			</tr>
			<tr>
				<td>도서코드(자동채번)</td><td><input type="text" name="book_code" value="<%=id%>"></td>
			</tr>
			<tr>
				<td>도서명</td><td><input type="text" name="book_name" value="<%=rs.getString("book_name")%>"></td>
			</tr>
			<tr>
				<td>장르(A:에세이, B:인문, C:소설)</td><td><input type="text" name="book_type" value="<%=rs.getString("book_type")%>"></td>
			</tr>
			<tr>
				<td>작가</td><td><input type="text" name="book_author" value="<%=rs.getString("book_author")%>"></td>
			</tr>
			<tr>
				<td>입고일자</td><td><input type="text" name="in_date" value="<%=rs.getString("in_date")%>"></td>
			</tr>
			<tr>
				<td>
					도서상태
				</td>
				<td>
				<select name="stat_fg">
							<option value="0"<%=rs.getString("stat_fg")=="0"?"selected":"" %>>대여가능</option>
							<option value="1"<%=rs.getString("stat_fg")=="1"?"selected":"" %>>애뎌중</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>
</section>