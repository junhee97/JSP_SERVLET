<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		System.out.println("PageContext : " + pageContext);
		System.out.println("PageContext's get request : " + pageContext.getRequest());
		System.out.println("PageContext's get response : " + pageContext.getResponse());
		System.out.println("PageContext's get session : " + pageContext.getSession());
		System.out.println("PageContext's get application : " + pageContext.getServletContext());
		
		// 프로젝트 경로 확인
		System.out.println("project path : " + pageContext.getServletContext().getContextPath());
	%>
	
	<!-- 표현식 -->
	PROJECTPATH : <%= pageContext.getServletContext().getContextPath() %>
	<hr />
	
	<!-- EL -->
	PROJECTPATH : ${ pageContext.request.contextPath }

</body>
</html>