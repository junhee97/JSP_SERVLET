<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*"%>
<%
List<MemberDto2> list = DBUtils.getInstance().rankMember();
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
}

.wrapper>main>h2 {
	text-align: center;
	font-size: 1.8rem;
	font-weight: 400;
}

.wrapper>main table {
	border: 1px solid;
	border-collapse: collapse;
	min-width: 500px;
	margin: 0 auto;
	min-height: 250px;
	text-align: center;
}

.wrapper>main table th, .wrapper>main table td {
	min-width: 80px;
	min-height: 35px;
	border: 1px solid;
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
			<h2>후보자등수</h2>
			<table>
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>
				<%
				for (MemberDto2 dto : list) {
				%>
				<tr>
					<td><%=dto.getM_no()%></td>
					<td><%=dto.getM_name()%></td>
					<td><%=dto.getV_total()%></td>
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