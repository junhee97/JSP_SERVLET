<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.time.format.DateTimeFormatter"%>
<!--
	품목 별 총합 (총합 별 내림차순)
	select category, sum(price*quantity) as 총합 from tbl_order
	group by category
	having sum(price*quantity) >= 50000
	order by sum(price*quantity) desc;
	
	날짜 별 구매 총평균
	select order_date, round(avg(price * quantity), 2) from tbl_order
	group by order_date;
-->

<%@ page import="C09.*,C04.*,java.util.*,java.time.*"%>

<%
	List<OrderDto> list = DBUtils.getInstance().selectAllOrder();
	List<DateDto> list2 = DBUtils.getInstance().selectDate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>품목별 총액 (50000만원 이상)</h1>
	<table border="1">
		<tr>
			<th>카테고리</th>
			<th>총합</th>
		</tr>
		<%
		for (OrderDto orderDto : list) {
		%>
		<tr>
			<td><%=orderDto.getCategory()%></td>
			<td><%=orderDto.getSum()%></td>
		</tr>

		<%
		}
		%>
	</table>

	<h1>날짜별 구매 총평균</h1>
	<table border="1">
		<tr>
			<th>날짜</th>
			<th>총평균</th>
		</tr>
		<%
		for (DateDto dateDto : list2) {
			// yyyy.mm.dd
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		%>
		<tr>
			<td><%=dateDto.getOrder_date().format(formatter)%></td>
			<td><%=dateDto.getRound()%></td>
		</tr>

		<%
		}
		%>
	</table>

</body>
</html>