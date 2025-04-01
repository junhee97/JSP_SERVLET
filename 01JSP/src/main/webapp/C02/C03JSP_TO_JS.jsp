<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- BankEnd 처리 코드 -->
<%
String msg1 = "HELLO 1";
String msg2 = "HELLO 2";
String msg3 = "HELLO 3";
String msg4 = "HELLO 4";
request.setAttribute("message", "TEST!!");
request.setAttribute("message2", "TEST!!_@");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		<%--
		const message1 = '<%=msg1%>';
		const message2 = '<%=msg2%>';
		const message3 = '<%=msg3%>';
		const message4 = '<%=msg4%>';
		--%>
		
		const message1 = '${message}'; // EL
		const message2 = '${message2}'; // EL
		const message3 = `${message}`; // 보간법(JSP 의 message값을 리터럴 형태로 변환)

		
		console.log(message1);
		console.log(message2);
		console.log(message3);
//		console.log(message4);

	</script>

</body>
</html>