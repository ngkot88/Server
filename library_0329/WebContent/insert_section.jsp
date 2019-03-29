<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.transform.Result"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection" %>
<%@page import="java.sql.*" %>

<section class="insert_section">
<%
	String query1 = "select rent_no from rental_tbl_001 order by rent_no desc";
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	con = dbconnection.getConnection();
	pstmt = con.prepareStatement(query1);
	rs = pstmt.executeQuery();
	rs.next();
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
	
	Date time = new Date();
	
	String rent_ymd = format1.format(time);
%>
	<form action="./insert_ok.jsp" method="post" >
		<table id="insert_tb">
			<tr>
				<th colspan="2">대여도서 등록</th>
			</tr>
			<tr>
				<td>대여일자</td><td><input type="text" name="rent_ymd" value="<%=rent_ymd%>"></td>
			</tr>
			<tr>
				<td>대여번호(자동채번)</td><td><input type="text" name="rent_no" value="<%=(rs.getInt("rent_no"))+1%>"></td>
			</tr>
			<tr>
				<td>도서코드</td><td><input type="text" name="rent_book"></td>
			</tr>
			<tr>
				<td>고객번호</td><td><input type="text" name="rent_rent"></td>
			</tr>
			<tr>
				<td>반납기한(대여일 7일 후)</td><td><input type="text" name="close_ymd" value="<%=rent_ymd%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>
</section>