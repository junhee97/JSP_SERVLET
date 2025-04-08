<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import ="java.time.format.*,java.time.*" %>

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
}

.wrapper>main>h2 {
	text-align: center;
	font-size: 1.8rem;
	font-weight: 400;
}

.wrapper>main form {
	
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

		<!-- 파라미터 받기(액션 태그) : useBean -->
		<jsp:useBean id="voteDto2" class="Utils.VoteDto" scope="request" />
		<jsp:setProperty property="*" name="voteDto2" />

		<main>
			<h2>투표검수조회</h2>
			<table>
				<tr>
					<th>성명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
				</tr>
				<tr>
					<td><%=voteDto2.getV_name() %></td>
					<td><%=voteDto2.getV_jumin() %></td>
					<%
						String age = voteDto2.getV_jumin().substring(0,6);
						age = "19" + age;
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
						LocalDate date = LocalDate.parse(age,formatter);
						LocalDate today = LocalDate.now();
						int mAge = Period.between(date, today).getYears();
						out.print("<td>만" +mAge+"세</td>");
					%>
					<%-- <td><%=voteDto2.getV_jumin() %></td> --%>
					<%
						char gender = voteDto2.getV_jumin().charAt(6);
						if(gender%2 == 0)
							out.print("<td>여</td>");
						else
							out.print("<td>남</td>");
					%>
					<%-- <td><%=voteDto2.getV_jumin() %></td> --%>
					<td><%=voteDto2.getM_no() %></td>
					<td><%=voteDto2.getV_time() %></td>
					<td><%=voteDto2.getV_confirm() %></td>
				</tr>
			</table>

		</main>

		<%@ include file="/layouts/Footer.jsp"%>

	</div>

</body>
</html>