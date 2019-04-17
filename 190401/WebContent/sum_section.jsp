<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%@page import="DBPKG.dbconnection" %>
<section>
<%
	Connection con = dbconnection.getConnection();
	String query = "select"+
			" c.sale_no, c.sale_store_cd, c.sale_ymd, c.sale_pizza_cd, a.pizza_nm, c.sale_cnt, to_char(a.price*c.sale_cnt, '999,999,999') as price"+
			" from"+
			" pizza_tbl_002 a, store_tbl_002 b, sale_tbl_001 c"+
			" where"+
			" c.sale_store_cd = b.store_cd and"+
			" c.sale_pizza_cd = a.pizza_cd order by to_number(sale_no)";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();

%>
<div id="table_box">
	<table>
		<tr>
			<th colspan="7">통합매출현황조회</th>
		</tr>
		<tr>
			<td>매출전표번호</td><td>지점</td><td>판매일자</td><td>피자코드</td><td>피자명</td><td>판매수량</td><td>매출액</td>
		</tr>
		<%while(rs.next()) {%>
		<tr>
			<td><%=rs.getString("sale_no") %></td>
			<td><%=rs.getString("sale_store_cd") %></td>
			<td><%=rs.getString("sale_ymd") %></td>
			<td><%=rs.getString("sale_pizza_cd") %></td>
			<td><%=rs.getString("pizza_nm") %></td>
			<td><%=rs.getString("sale_cnt") %></td>
			<td><%=rs.getString("price") %></td>
		</tr>
		<%} %>
	</table>
</div>
</section>