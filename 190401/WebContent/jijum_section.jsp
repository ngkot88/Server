<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.dbconnection" %>
<%
	Connection con= dbconnection.getConnection();
	String query = "select"+
			" b.store_cd, b.store_nm, sum(a.sale_cnt*c.price) as price"+
			" from"+
			" sale_tbl_001 a, store_tbl_002 b, pizza_tbl_002 c"+
			" where"+
			" a.sale_store_cd = store_cd and"+
			" a.sale_pizza_cd = c.pizza_cd"+
			" group by"+
			" b.store_cd, b.store_nm";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
%>
<section>
<div id="table_box">
	<table>
		<tr>
			<th colspan="3">지점별 매출 현황</th>
		</tr>
		<tr>
			<td>지점 코드</td><td>지점 명</td><td>총매출액</td>
		</tr>
		<%while(rs.next()){%>
		<tr>
			<td><%=rs.getString("store_cd") %></td>
			<td><%=rs.getString("store_nm") %></td>
			<td><%=rs.getString("price") %></td>
		</tr>
		<%}%>
	</table>
</div>
</section>