<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	nav {
		background-color : #9b97fb;
	}

	nav>ul {
		display : flex;
		justify-content : left;
	}
	
	nav>ul>li {
		padding : 5px 20px;
	}
	
	nav>ul>li > a {
		color : white;
	}
</style>

<nav>
	<ul>
		<li><a href="${pageContext.request.contextPath}/01/index.jsp">백신예약</a></li>
		<li><a href="${pageContext.request.contextPath}/02/index.jsp">백신예약조회</a></li>
		<li><a href="${pageContext.request.contextPath}/03/index.jsp">백신예약현황</a></li>
		<li><a href="${pageContext.request.contextPath}">홈으로</a></li>
	</ul>
</nav>