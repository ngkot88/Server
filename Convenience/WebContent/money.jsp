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
<script type="text/javascript" src="./index.js"></script>
</head>
<%
	Connection con = DBconnection.getConnectino();

	String query="select lpad(max(sale_no)+1,4,'0') as sale_no from sale_tbl_003";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String sale_no = rs.getString(1);
	
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
	Date time = new Date();
	String date = dateformat.format(time);
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./nav.jsp"/>
		<section>
			<form action="./money_ok.jsp" method="post" name="money_form" onsubmit="return writeCh()">
				<table id="money_table">
					<tr>
						<th colspan="2">매출 등록</th>
					</tr>
					<tr>
						<td>판매번호(자동발생)</td><td><input type="text" value="<%=sale_no%>" readonly name="sale_no"></td>
					</tr>
					<tr>
						<td>판매일자(자동발생)</td><td><input type="text" value="<%=date %>" name="date" readonly></td>
					</tr>
					<tr>
						<td>판매구분</td>
						<td>
							<select name="pan">
								<option value="">선택</option>
								<option value="1">판매</option>
								<option value="2">판매취소</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매점포</td>
						<td>
							<select name="popo">
								<option value="">선택</option>
								<option value="A001">이태원점</option>
								<option value="A002">한남점</option>
								<option value="A003">도원점</option>
								<option value="B001">혜화점</option>
								<option value="C001">방배점</option>
								<option value="D001">사당점</option>
								<option value="D002">흑석점</option>
								<option value="E001">금호점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매상품</td>
						<td>
							<select name="item">
								<option value="">선택</option>
								<option value="110001">라면</option>
								<option value="110002">빵</option>
								<option value="110003">과자</option>
								<option value="110004">탄산음료</option>
								<option value="110005">삼각김밥</option>
								<option value="110006">초콜릿</option>
								<option value="110007">우유</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매수량</td><td><input type="text" value="" name="sale_cnt"></td>
					</tr>
					<tr>
						<td>수취구분</td>
						<td>
							<select name="pay_type">
								<option value="">선택</option>
								<option value="01">현금</option>
								<option value="02">카드</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="등록"><a href="./view.jsp"><input type="button" value="조회"></a></td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>