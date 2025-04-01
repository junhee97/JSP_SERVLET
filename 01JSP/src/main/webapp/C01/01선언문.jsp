<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
	선언문(서블릿으로 변환되는 자바파일의 속성/기능을 추가)
	 -->

	<%!// 서블릿파일의 멤버변수(속성)
	String name = "HONG GIL DONG";

	// 서블릿파일의 멤버함수(기능)
	public String testFunc() {
		System.out.println("선언문 TEST");
		return "name : " + name;
	}%>

	<!-- 
		표현식(SERVLET 파일(JAVA파일) 안의 값을 FRONTEND로 전달 표현할때 사용)
	 -->

	NAME :
	<%=name%>
	<br /> testFunc() :
	<%=testFunc()%>
	<br />
	
</body>
</html>