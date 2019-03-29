<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DBPKG.dbconnection" %>
    <%@page import="java.sql.*" %>
<section>
<%
	String query = "select cust_no,cust_name,phone,address,to_char(join_date,'yyyy-mm-dd') as join_date,decode(stat_fg,'0','정상','1','휴면','2','탈퇴') as stat_fg from member_tbl_001";

	ResultSet rs = null;
	
	Connection con = dbconnection.getConnection();
	PreparedStatement pstmt = null;
	pstmt = con.prepareStatement(query);
	
	rs = pstmt.executeQuery();
%>
	<div id="table_box">
		<table>
			<tr>
				<th>회원등록</th>
			</tr>
			<tr>
				<td>회원번호</td><td>회원성명</td><td>핸드폰번호</td><td>주소</td><td>가입일자</td><td>상태구분</td>
			</tr>
			<% while(rs.next()){%>
			<tr>
				<td><a href="./modify.jsp?id=<%=rs.getString("cust_no")%>"><%=rs.getString("cust_no") %></a></td>
				<td><%=rs.getString("cust_name") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
				<td><%=rs.getString("join_date") %></td>
				<td><%=rs.getString("stat_fg") %></td>
			</tr>
					<%} %>
		</table>
	</div>
</section>