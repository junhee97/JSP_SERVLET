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
		EL(Expression Language) : 내장객체의 Scope 참조
		pageScope : 현재 JSP 페이지 내에서만 사용가능한 속성/기능 (관련 내장객체 : pageContext)
		requestScope : 하나의 요청 처리동안 (관련 내장객체 : request)
		sessionScope : 일정기간 동안(지정된 or 기본값) (관련 내장객체 : session)
		applicationScope : 서버 종료시 까지 (관련 내장객체 : application)
	-->

	<%@ page import="C04.*" %>
	
	<%
		pageContext.setAttribute("P_ATTR", "P_ATTR_VALUE");
		request.setAttribute("R_ATTR", "R_ATTR_VALUE");
		session.setAttribute("S_ATTR", "S_ATTR_VALUE");
		application.setAttribute("A_ATTR", "A_ATTR_VALUE");
		
		pageContext.setAttribute("DUP", "PAGECONTEXT VALUE");
		request.setAttribute("DUP", "REQUEST VALUE");
		session.setAttribute("DUP", "SESSTION VALUE");
		application.setAttribute("DUP", "APPLICATION VALUE");
	%>

	<!-- EL : PARAM -->
	USERNAME : ${param.username} <br />
	PASSWORD : ${param.password} <br />
	<hr />
	
	<!-- EL : ATTRIBUTE -->
	PAGECONTEXT's ATTR : ${P_ATTR} <br />
	PAGECONTEXT's ATTR : ${pageScope.P_ATTR} <br />
	REQUEST's ATTR : ${R_ATTR} <br />
	REQUEST's ATTR : ${requestScope.R_ATTR} <br />
	SESSION's ATTR : ${S_ATTR} <br />
	SESSION's ATTR : ${sessionScope.S_ATTR} <br />
	APPLICATION's ATTR : ${A_ATTR} <br />
	APPLICATION's ATTR : ${applicationScope.A_ATTR} <br />
	<hr />
	
	<!-- EL : ATTRIBUTE(중복값) - 가장 좁은 범위의 값만 출력 -->
	DUPLICATED VALUE : ${DUP} <br />
	<hr />
	
	<!-- EL : OBJECT -->
	<%
		UserDto userDto = new UserDto("user1", "1234", "ROLE_USER");
		request.setAttribute("userDto", userDto);
	%>
	표현식 : <%= userDto.getUserid() %> <br />
	EL : ${userDto.userid} <br />
	<hr />
	
	<!-- EL : 연산자 - 문자열도 int형으로 자동 파싱 -->
	표현식 : <%=1 + 1%> <br />
	EL : ${1+1} <br />
	표현식 : <%=1 + "1"%> <br />
	EL : ${1+"1"} <br />
	<hr />
	
	<!-- NULL CHECK -->
	NULL : ${null} <br />
	empty NULL : ${empty ""} <br />
	empty NULL : ${empty " "} <br />
	empty NULL : ${empty TEST} <br />
	empty not NULL : ${!empty TEST} <br />

</body>
</html>