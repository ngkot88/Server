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
</head>
<%
	Connection con = DBconnection.getConnectino();

	String query="SELECT b.STORE_NM,"+
			 " sum(decode(a.pay_type, '01', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))||'원' AS cash_amt,"+   
			 " sum(decode(a.pay_type, '02', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))||'원' AS card_amt,"+
			 " (sum(decode(a.pay_type, '01', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))"+
			 " +sum(decode(a.pay_type, '02', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1)))||'원' AS tot_amt"+
			 " FROM sale_tbl_003 a, store_tbl_003 b, GOODS_TBL_003 c"+
			 " WHERE a.STORE_CD = b.STORE_CD"+
			 " AND a.GOODS_CD = c.GOODS_CD"+
			 " GROUP BY b.STORE_NM"+
			 " ORDER BY tot_amt desc";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./nav.jsp"/>
		<section>
			<form action="./item_ok.jsp" method="post" name="money_form" onsubmit="return writeCh()">
				<table>
					<tr>
						<th colspan="4">상품정보 등록</th>
					</tr>
					<tr>
						<td>점포명</td><td>현금매출</td><td>카드매출</td><td>총매출</td>
					</tr>
					<%while(rs.next()){ %>
					<tr>
						<td><a href="./hohoho.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
					</tr>
					<%} %>
				</table>
			</form>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>