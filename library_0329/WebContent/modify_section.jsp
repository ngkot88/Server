<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.dbconnection" %>
<section>
<%
	ResultSet rs = null;

	String id = request.getParameter("id");

	String query = "select cust_name, phone, address, to_char(join_date, 'yyyy-mm-dd') as join_date, stat_fg from member_tbl_001 where cust_no="+id;
	
	Connection con = dbconnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();
	rs.next();
%>
	<div id="table_Box">
		<form action="./modify_ok.jsp" method="post">
			<table>
				<tr>
					<th colspan="2">회원정보관리(수정)</th>
				</tr>
				<tr>
					<td>회원번호</td><td><input type="text" value="<%=id%>" name="cust_no" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td><td><input type="text" value="<%=rs.getString("cust_name")%>" name="cust_name"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td><td><input type="text" value="<%=rs.getString("phone")%>" name="phone"></td>
				</tr>
				<tr>
					<td>주소</td><td><input type="text" value="<%=rs.getString("address")%>" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td><td><input type="text" value="<%=rs.getString("join_date")%>" name="join_date" readonly></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<td>
						<select name="stat_fg">
							<option value="0"<%=rs.getInt("stat_fg")==0?"selected":"" %>>정상</option>
							<option value="1"<%=rs.getInt("stat_fg")==1?"selected":"" %>>휴먼</option>
							<option value="2"<%=rs.getInt("stat_fg")==2?"selected":"" %>>탈퇴</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>
	</div>
</section>