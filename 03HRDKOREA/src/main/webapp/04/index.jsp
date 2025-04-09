<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*,java.util.*,java.text.*"%>

<%
List<TeacherDto> list = DBUtils.getInstance().selectAllPrice();
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
	min-width: 80px !import;
	min-height: 25px !import;
	border: 1px solid;
	text-align : center;
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
			<h2>강사매출현황</h2>
			<table style="width: 800px;">
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
				<%
				for (TeacherDto dto : list) {
				%>	
				<tr>
					<td><%=dto.getTeacher_code()%></td>
					<td><%=dto.getClass_name()%></td>
					<td style="text-align:right;"><%=dto.getTeacher_name()%></td>
					<%
					int price = dto.getClass_price();
					DecimalFormat formatter = new DecimalFormat("\\#,###");
					String formattedprice = formatter.format(price);
					out.print("<td style='text-align:right;'>"+formattedprice+"</td>");
					%>
					<%-- <td><%=dto.getClass_price()%></td> --%>
				</tr>
				
				<%	
				}
				%>
			</table>
		</main>
				
		<%@ include file = "/layouts/Footer.jsp" %>
	
	</div>


</body>
</html>