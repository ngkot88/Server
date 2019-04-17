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
	String id = request.getParameter("id");
	String query="select"+
			" DECODE(s.sale_fg,'1','판매','2','판매취소') AS SALE_FG,"+
			" s.sale_no,"+
			" to_char(s.sale_ymd,'yyyy-mm-dd') AS SALE_YMD,"+
			" g.goods_nm,"+
			" s.sale_cnt,"+
			" sum(g.goods_price*s.SALE_CNT) AS GOODS_price,"+
			" decode(s.pay_type,'01','현금','02','카드') as pay_type"+
			" from"+
			" sale_tbl_003 s, goods_tbl_003 g, STORE_TBL_003 t"+
			" WHERE"+
			" s.GOODS_CD = g.GOODS_CD AND"+
			" s.STORE_CD = t.STORE_CD AND"+
			" t.STORE_NM = "+"'"+id+"'"+
			" GROUP BY s.SALE_FG, s.SALE_NO, s.SALE_YMD, g.GOODS_NM, s.SALE_CNT, s.PAY_TYPE"+
			" ORDER BY GOODS_PRICE";
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
						<th colspan="7">상품정보 등록</th>
					</tr>
					<tr>
						<td>판매구분</td><td>판매번호</td><td>판매일자</td><td>상품명</td><td>판매수량</td><td>판매금액</td><td>수취구분</td>
					</tr>
					<%while(rs.next()) {%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %>원</td>
						<td><%=rs.getString(7) %></td>
					</tr>
					<%} %>
				</table>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>