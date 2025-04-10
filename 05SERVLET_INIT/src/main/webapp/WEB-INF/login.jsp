<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>LOGIN PAGE</h1>
	<form action="${pageContext.request.contextPath}/login.do" method="post">
	아이디 : <input type="text" name="username" /> <br />
	비밀번호 : <input type="password" name="password" /> <br />
	<button>로그인</button>
	</form>
	<div>
		${username_msg}
	</div>
	<div>
		${password_msg}
	</div>

</body>
</html>