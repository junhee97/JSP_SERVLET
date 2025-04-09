<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*,java.text.*"%>

<%

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
	background-color: lightgray;
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
			<h2>백신예약현황</h2>
			<table>
				<tr>
					<th>병원지역</th>
					<th>병원지역명</th>
					<th>접종예약건수</th>
				</tr>
				<tr>
					<td>10</td>
					<td>서울</td>
					<td>5</td>
				</tr>
				<tr>
					<td colspan=2>총합</td>
					<td>10</td>
				</tr>
			</table>

		</main>

		<%@ include file="/layouts/Footer.jsp"%>

	</div>


</body>
</html>