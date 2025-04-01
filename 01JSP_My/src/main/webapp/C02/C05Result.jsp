<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
/* 문자셋 설정 */
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav style="${param.style}">
		<div>${param.col1}</div>
		<div>${param.col2}</div>
		<div>${param.col3}</div>
		<div>${param.col4}</div>
	</nav>

</body>
</html>