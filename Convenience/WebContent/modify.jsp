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
		var form = document.modify_form;
		
		if(! form.item.value){
			alert("상품명을 입력하세요.");
			form.item.focus();
			return false;
		}
		if(! form.goods_price.value){
			alert("단가를 입력하세요.");
			form.goods_price.focus();
			return false;
		}
		if(! form.cost.value){
			alert("원가를 입력하세요.");
			form.cost.focus();
			return false;
		}
	}
</script>
</head>
<%
	Connection con = DBconnection.getConnectino();
	String id = request.getParameter("id");

	String query="select"+
			" goods_cd,"+
			" goods_nm,"+
			" goods_price,"+
			" cost,"+
			" to_char(in_date,'yyyy-mm-dd') as in_date"+
			" from"+
			" goods_tbl_003"+
			" where goods_cd="+id;
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./nav.jsp"/>
		<section>
			<form action="./modify_ok.jsp" method="post" name="modify_form" onsubmit="return writeCh()">
				<table>
					<tr>
						<th colspan="2">상품정보 등록</th>
					</tr>
					<tr>
						<td>상품코드(자동채번)</td><td><input type="text" value="<%=id%>" readonly name="goods_cd"></td>
					</tr>
					<tr>
						<td>상품명</td><td><input type="text" name="item" value="<%=rs.getString("goods_nm")%>"></td>
					</tr>
					<tr>
						<td>단가</td><td><input type="text" name="goods_price" value="<%=rs.getString("goods_price")%>"></td>
					</tr>
					<tr>
						<td>원가</td><td><input type="text" name="cost" value="<%=rs.getString("cost")%>"></td>
					</tr>
					<tr>
						<td>입고일자(변경불가)</td><td><input type="text" readonly value="<%=rs.getString("in_date")%>" name="date"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="저장"><a href="./item.jsp"><input type="button" value="상품목록"></a></td>
					</tr>
				</table>
				<%} %>
			</form>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>