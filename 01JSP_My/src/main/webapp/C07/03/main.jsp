<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("isAuth") == null) {
		response.sendRedirect("./login_form.jsp?message=Session_Invalidation");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="./logout.jsp">로그아웃</a>
	<hr />
	<h1>MAIN PAGE</h1>
	
	ISAUTH : ${isAuth} <br />
	ROLE : ${role} <br />

</body>
</html>