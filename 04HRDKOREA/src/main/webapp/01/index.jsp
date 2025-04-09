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
			<h2>백신예약</h2>
			<form name="resv_form" action="./create.jsp" method="post">
				<table>
					<tr>
						<th>예약번호</th>
						<td><input type="text" name="resvno" readonly /></td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td><input type="text" name="jumin" /> ex) 790101-1111111</td>
					</tr>
					<tr>
						<th>백신코드</th>
						<td>
							<select name="vcode" style="width : 177px; height : 21px;">
								<option value="V001">A백신</option>
								<option value="V002">B백신</option>
								<option value="V003">C백신</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>병원코드</th>
						<td>
							<input type="radio" name="hospcode" />가_병원
							<input type="radio" name="hospcode" />나_병원
							<input type="radio" name="hospcode" />다_병원
							<input type="radio" name="hospcode" />라_병원
						</td>
					</tr>
					<tr>
						<th>예약날짜</th>
						<td><input type="text" name="resvdate" /> ex) 20210101</td>
					</tr>
					<tr>
						<th>예약시간</th>
						<td><input type="text" name="resvtime" /> ex) 0930, 1130</td>
					</tr>
					<tr>
						<th colspan = 2>
							<button type="submit">등록</button>
							<button type="button" onclick="resetFunc();">취소</button>
						</th>
					</tr>
				</table>
			</form>
		</main>

		<%@ include file="/layouts/Footer.jsp"%>

	</div>
	
	<script>
		function resetFunc() {
			alert('모든 정보를 지우고 처음부터 다시 입력합니다!');
			form.reset();
			form.jumin.focus();
		}
	</script>


</body>
</html>