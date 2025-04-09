<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*"%>

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
	min-width: 400px;
	min-height: 50px;
	margin: 0 auto;
}

.wrapper>main table th, .wrapper>main table td {
	min-width: 80px!import;
	min-height: 25px!import;
	border: 1px solid;
	text-align: center;
}

.wrapper>main table td {
	text-align: left;
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
			<h2>백신예약조회</h2>
			<table>
				<tr>
					<th>예약번호</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th colspan=2>
						<button>조회하기</button>
						<button>홈으로</button>
					</th>
				</tr>
			</table>

		</main>

		<%@ include file="/layouts/Footer.jsp"%>

	</div>


</body>
</html>