<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.time.*,java.time.format.*,java.util.*"%>
<%
	List<VoteDto> list = DBUtils.getInstance().selectAllVote();
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
				<%
				for (VoteDto dto : list) {
				%>
				<tr>
					<td><%=dto.getV_name()%></td>
					<%
						String birthYear = dto.getV_jumin().substring(0,6);
						birthYear = "19" + birthYear;
						String yy = birthYear.substring(0, 4);
						String mm = birthYear.substring(4, 6);
						String dd = birthYear.substring(6, 8);
						out.print("<td>"+yy+"년"+mm+"월"+dd+"일생</td>");
					%>
					
					<%-- <td><%=dto.getV_jumin()%></td> --%>
					<%
						String age = dto.getV_jumin().substring(0,6);
						age = "19" + age;
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
						LocalDate date = LocalDate.parse(age,formatter);
						LocalDate today = LocalDate.now();
						int mAge = Period.between(date, today).getYears();
						out.print("<td>만 " +mAge+"세</td>");
					%>
					<%-- <td><%=dto.getV_age()%></td> --%>
					<%
						char gender = dto.getV_jumin().charAt(6);
						if (gender % 2 == 0)
							out.print("<td>여</td>");
						else
							out.print("<td>남</td>");
					%>
					<%-- <td><%=dto.getV_gender()%></td> --%>
					<td><%=dto.getM_no()%></td>
					<td><%=dto.getV_time()%></td>
					<%
						if("Y".equals(dto.getV_confirm())) {
							out.print("<td>확인</td>");
						} else {
							out.print("<td>미확인</td>");			
						}
					%>
					<%-- <td><%=dto.getV_confirm()%></td> --%>
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