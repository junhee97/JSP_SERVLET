<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*,java.text.*"%>

<%
List<MemberDto> list = DBUtils.getInstance().selectAllMember();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
:root {
	
}

* {
	box-sizing: border-box;
}

body {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

.wrapper {
	
}

.wrapper>header {
	height: 80px;
}

.wrapper>nav {
	height: 50px;
}

.wrapper>main {
	height: calc(100vh - 80px - 50px - 80px);
	overflow: auto;
	background-color : lightgray;
}

.wrapper>main>h2 {
	text-align: center;
	font-size: 1.8rem;
	font-weight: 600;
}

.wrapper>main table {
	border: 1px solid;
	border-collapse: collapse;
	min-width: 500px;
	min-height: 200px;
	margin: 0 auto;
}

.wrapper>main table th, .wrapper>main table td {
	min-width: 80px!import;
	min-height: 25px!import;
	border: 1px solid;
	text-align: center;
}

.wrapper>footer {
	height: 80px;
}
</style>

</head>
<body>

	<div class="wrapper">

		<%@ include file="/layouts/Header.jsp"%>
		<%@ include file="/layouts/Nav.jsp"%>

		<main>
			<h2>회원정보조회</h2>
			<table style="width: 1200px; height : 300px;">
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>
				<%
				for (MemberDto dto : list) {
				%>
				<tr>
					<td><%=dto.getRegist_month()%></td>
					<td><%=dto.getM_no()%></td>
					<td><%=dto.getM_name()%></td>
					<td><%=dto.getC_name()%></td>
					<td><%=dto.getC_area()%></td>
					<%
					int price = dto.getTuition();
					DecimalFormat formatter = new DecimalFormat("\\#,###");
					String formattedPrice = formatter.format(price);
					out.print("<td>" + formattedPrice + "</td>");
					%>
					<%-- <td><%=dto.getTuition()%></td> --%>
					<td><%=dto.getM_grade()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</main>

		<%@ include file="/layouts/Footer.jsp"%>

	</div>


</body>
</html>