<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
	INNER JOIN
	
	select addr, order_date, sum(price*quantity) from tbl_user u
	join tbl_order o
	on u.userid = o.userid
	group by addr, order_date
	order by addr asc, sum(price*quantity) desc;

	select * from tbl_user u
	left outer join tbl_order o
	on u.userid = o.userid
	where o.userid is null;
-->

<%@ page import="C09.*,C04.*,java.util.*,java.time.format.*"%>

<%
	List<JoinDto> list = DBUtils.getInstance().JoinOrder();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>지역 + 날짜별 구매 총액</h1>
	<table border="1">
		<tr>
			<th>지역</th>
			<th>날짜</th>
			<th>총액</th>
		</tr>
		<%
		for (JoinDto dto : list) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy*MM*dd");
		%>
		<tr>
			<td><%=dto.getAddr()%></td>
			<td><%=dto.getOrder_date().format(formatter)%></td>
			<td><%=dto.getSum()%></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>