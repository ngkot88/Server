<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.*" %>
<%
Connection con = dbconnection.getConnection();
PreparedStatement  pstmt = null;
ResultSet rs = null;
String query = "select max(to_number(sale_no)+1) as sale_no from sale_tbl_001";
pstmt = con.prepareStatement(query);
rs = pstmt.executeQuery();
rs.next();
String sale_no = rs.getString(1);
query = "select pizza_nm, pizza_cd from pizza_tbl_002";
pstmt = con.prepareStatement(query);
rs = pstmt.executeQuery();
%>
<script src="./index.js"></script>
<section>
	<form action="./item_ok.jsp" method="post" name="pizza_form" onsubmit="return writeCh();">
		<div id="table_box">
			<table>
				<tr>
					<th colspan="2">매출전표등록</th>
				</tr>
				<tr>
					<td>매출전표번호</td><td><input type="text" name="sale_num" value="<%=sale_no %>" readonly></td>
				</tr>
				<tr>
					<td>지점코드</td><td><input type="text" name="jim_code"></td>
				</tr>
				<tr>
					<td>판매일자</td><td><input type="text" name="sale_date"></td>
				</tr>
				<tr>
					<td>피자코드</td>
					<td>
						<select name="pizza_code">
							<option value="">피자선택</option>
							<%while(rs.next()){ %>
							<option value="<%=rs.getString("pizza_cd")%>"><%=rs.getString("pizza_nm") %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매수량</td><td><input type="text" name="pan"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="전표등록"><input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</div>
	</form>
</section>