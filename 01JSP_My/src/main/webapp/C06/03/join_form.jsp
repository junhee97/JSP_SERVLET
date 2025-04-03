<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		font-size : .8rem;
	}
	
	span {
		font-size : .5rem;
		color : red;
	}
</style>
</head>
<body>

	<h1>JOIN FORM</h1>	
	<form action="./join.jsp" method="post">
		<div>
			<label>아이디 : </label> <span>${userid_msg}</span> <br />
			<input type="text" name="userid" />
		</div>
		<div>
			<label>비밀번호 : </label> <span>${password_msg}</span> <br />
			<input type="text" name="password" />
		</div>
		<div>
			<button>회원가입</button>
		</div>
	</form>

</body>
</html>