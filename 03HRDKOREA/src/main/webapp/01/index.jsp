<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*,java.text.*"%>

<%
List<TeacherDto> list = DBUtils.getInstance().selectAllTeacher();
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
	min-height: 350px;
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
			<h2>강사조회</h2>
			<table>
				<tr>
					<th>강사코드</th>
					<th>강사명</th>
					<th>강의명</th>
					<th>수강료</th>
					<th>강사자격취득일</th>
				</tr>
				<%
				for (TeacherDto dto : list) {
				%>
				<tr>
					<td><%=dto.getTeacher_code() %></td>
					<td><%=dto.getTeacher_name() %></td>
					<td><%=dto.getClass_name() %></td>
					<%
						int price = dto.getClass_price();
						DecimalFormat formatter = new DecimalFormat("\\#,###");
						String formattedPrice = formatter.format(price);
						out.print("<td>"+formattedPrice+"</td>");
					%>
					<%-- <td><%=dto.getClass_price()%></td> --%>
					<%
						String yy = dto.getTeacher_regist_date().substring(0,4);
						String mm = dto.getTeacher_regist_date().substring(4,6);
						String dd = dto.getTeacher_regist_date().substring(6,8);
						out.print("<td>"+yy+"년"+mm+"월"+dd+"일</td>");
					%>					
					<%-- <td><%=dto.getTeacher_regist_date() %></td> --%>
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