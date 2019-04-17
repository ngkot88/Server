<%@page import="DBPKG.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
<script>
	function chWrite() {
		var form = document.member_form;
		
		if(! form.custname.value){
			alert("회원성명이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		}
		if(! form.phone.value){
			alert("전화번호가 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		}
		if(! form.address.value){
			alert("주소가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		}
		if(! form.date.value){
			alert("가입일자가 입력되지 않았습니다.");
			form.date.focus();
			return false;
		}
		if(! form.grade.value){
			alert("회원등급이 입력되지 않았습니다.");
			form.grade.focus();
			return false;
		}
		if(! form.city.value){
			alert("도시코드가 입력되지 않았습니다.");
			form.city.focus();
			return false;
		}
	}
</script>
</head>
<%
	Connection con = DBconnection.getConnection();
	String query="select max(custno+1) as custno from member_tbl_02";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./menu.jsp"/>
		<section>
			<form action="./member_ok.jsp" method="post" name="member_form" onsubmit="return chWrite();">
				<div id="table_box_1">
					<table>
						<tr>
							<th colspan="2">홈쇼핑 회원 등록</th>
						</tr>
						<tr>
							<td>회원번호(자동발생)</td><td><input type="text" value="<%=rs.getString("custno")%>" readonly name="custno"></td>
						</tr>
						<tr>
							<td>회원성명</td><td><input type="text" name="custname"></td>
						</tr>
						<tr>
							<td>회원전화</td><td><input type="text" name="phone"></td>
						</tr>
						<tr>
							<td>회원주소</td><td><input type="text" name="address"></td>
						</tr>
						<tr>
							<td>가입일자</td><td><input type="text" name="date"></td>
						</tr>
						<tr>
							<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade"></td>
						</tr>
						<tr>
							<td>도시코드</td><td><input type="text"  name="city"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록"><input type="button" value="조회"></td>
						</tr>
					</table>
				</div>
			</form>
		</section>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>