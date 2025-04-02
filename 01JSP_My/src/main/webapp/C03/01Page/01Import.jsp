<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import = "java.util.*, C03.*" %>

<%
	Scanner sc = new Scanner(System.in);
	SimpleDto dto = new SimpleDto("홍길동", 28, "대구");
	System.out.println("DTO : " + dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	name : <%= dto.getName() %> <br>
	age : <%= dto.getAge() %> <br>
	addr : <%= dto.getAddr() %> <br>

</body>
</html>