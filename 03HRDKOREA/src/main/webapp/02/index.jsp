<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	overflow : auto;
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
	min-height: 350px;
	margin: 0 auto;
}

.wrapper>main table th, .wrapper>main table td {
	min-width: 80px !import;
	min-height: 25px !import;
	border: 1px solid;
	text-align : center;
}

.wrapper>main table td {
	text-align : left;
}

.wrapper>footer {
	height: 80px;
}
</style>

</head>
<body>

	<div class="wrapper">
	
		<%@ include file = "/layouts/Header.jsp" %>
		<%@ include file = "/layouts/Nav.jsp" %>
		
		<main>
			<h2>수강신청</h2>
			<form name="join_form" action="./create.jsp" method="post">
				<table style="width: 600px;">
				<colgroup>
				<col width="30%;">
				<col width="70%;">
				</colgroup>
					<tr>
						<th>수강월</th>
						<td><input type="text" />예) 2022년03월 -> 202203</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td>
							<select name="" id="">
								<option value="">회원명</option>
								<option value="10001">홍길동</option>
								<option value="10002">장발장</option>
								<option value="10003">임꺽정</option>
								<option value="20001">성춘향</option>
								<option value="20002">이몽룡</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>회원번호</th>
						<td><input type="text" readonly />예) 10001</td>
					</tr>
					<tr>
						<th>강의장소</th>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<th>강의명</th>
						<td>
							<select name="" id="">
								<option value="">강의신청</option>
								<option value="100">초급반</option>
								<option value="200">중급반</option>
								<option value="300">고급반</option>
								<option value="400">심화반</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강료</th>
						<td><input type="text" readonly />원</td>
					</tr>
					<tr>
						<th colspan = 2>
							<button type="submit">수강신청</button>
							<button type="reset">다시쓰기</button>
						</th>
					</tr>
				</table>
			</form>
		</main>
				
		<%@ include file = "/layouts/Footer.jsp" %>
	
	</div>


</body>
</html>