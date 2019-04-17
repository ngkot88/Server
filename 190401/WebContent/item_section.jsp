<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<section>
<%
	Connection con = dbconnection.getConnection();
	String query = "select"+
			" a.pizza_cd, a.pizza_nm, sum(a.price*b.sale_cnt) as price"+
			" from"+
			" pizza_tbl_002 a, sale_tbl_001 b"+
			" where"+
			" b.sale_pizza_cd = a.pizza_cd"+
			" group by"+
			" a.pizza_cd, a.pizza_nm"+
			" order by price desc";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
%>
<div id="table_box">
	<table>
		<tr>
			<th colspan="3">상품별 매출 현황</th>
		</tr>
		<tr>
			<td>피자 코드</td><td>피자 명</td><td>총매출액</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("pizza_cd") %></td>
			<td><%=rs.getString("pizza_nm") %></td>
			<td><%=rs.getString("price") %></td>
		</tr>
		<%} %>
	</table>
</div>
</section>