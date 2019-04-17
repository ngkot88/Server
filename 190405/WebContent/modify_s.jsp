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
	String custno = request.getParameter("id");
	String query="select custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate, grade, city from member_tbl_02 where custno = "+custno;
	PreparedStatement pstmt = con.prepareStatement(query);
	
	ResultSet rs = pstmt.executeQuery();
%>
<body>
	<div id="wrap">
		<jsp:include page="./header.jsp"/>
		<jsp:include page="./menu.jsp"/>
		<section>
			<form action="./modify_ok.jsp" method="post" name="member_form" onsubmit="return chWrite();">
				<div id="table_box">
					<table>
						<tr>
							<th colspan="2">홈쇼핑 회원 정보 수정</th>
						</tr>
						<%while(rs.next()){ %>
						<tr>
							<td>회원번호(자동발생)</td><td><input type="text" value="<%=custno%>" readonly name="custno"></td>
						</tr>
						<tr>
							<td>회원성명</td><td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>
						</tr>
						<tr>
							<td>회원전화</td><td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
						</tr>
						<tr>
							<td>회원주소</td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
						</tr>
						<tr>
							<td>가입일자</td><td><input type="text" name="date" value="<%=rs.getString("joindate")%>"></td>
						</tr>
						<tr>
							<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade" value="<%=rs.getString("grade")%>"></td>
						</tr>
						<tr>
							<td>도시코드</td><td><input type="text"  name="city" value="<%=rs.getString("city")%>"></td>
						</tr>
						<%} %>
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