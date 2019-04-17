<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./index.css" rel="stylesheet">
<script type="text/javascript">
	function writeCh() {
		var form = document.moeny_form;
	}
</script>
</head>
<%
	Connection con = DBconnection.getConnectino();

	String query="select"+
			" goods_cd,"+
			" goods_nm,"+
			" goods_price,"+
			" cost,"+
			" to_char(in_date,'yyyy-mm-dd') as in_date"+
			" from"+
			" goods_tbl_003";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./nav.jsp"/>
		<section>
				<table>
					<tr>
						<th colspan="5">상품관리</th>
					</tr>
					<tr>
						<td>상품코드</td><td>상품명</td><td>단가</td><td>원가</td><td>입고일자</td>
					</tr>
					<%while(rs.next()){ %>
					<tr>
						<td><a href="./modify.jsp?id=<%=rs.getString("goods_cd") %>"><%=rs.getString("goods_cd") %></a></td>
						<td><%=rs.getString("goods_nm") %></td>
						<td>￦<%=rs.getString("goods_price") %></td>
						<td>￦<%=rs.getString("cost") %></td>
						<td><%=rs.getString("in_date") %></td>
					</tr>
					<%} %>
					<tr>
						<td colspan="5"><a href="./item_insert.jsp"><input type="button" value="등록"></a></td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>