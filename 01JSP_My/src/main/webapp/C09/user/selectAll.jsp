<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="C09.*,C04.*,java.util.*" %>

<%
	DBUtils dbutils = DBUtils.getInstance();
	List<UserDto> userlist = dbutils.selectAllUser();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--
		1 selectAllUser 를 이용해서 table 의 해당 user 정보 표시
		2 만들어진 테이블에 컬럼을 추가해서 해당 컬럼의 수정 버튼 만들기
		3 만들어진 테이블에 컬럼을 추가해서 해당 컬럼의 삭제 버튼 만들기
		4 수정 버튼을 클릭하면 수정 페이지로 이동(update.jsp + 해당 사용자 파라미터 전달)
		5 삭제 버튼을 클릭하면 삭제 페이지로 이동(delete.jsp + 해당 사용자 파라미터 전달)
	-->
	
	총인원 : <%=userlist.size() %> <br />
	<table border="1">
			<tr>
				<th>USER_ID</th>
				<th>PASSWORD</th>
				<th>ROLE</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				for (UserDto dto : userlist) {
			%>
				<tr>
					<td><%=dto.getUserid()%></td>
					<td><%=dto.getPassword()%></td>
					<td><%=dto.getRole()%></td>
					<td><a href="./update_form.jsp?userid=<%=dto.getUserid()%>">수정</a></td>
					<td><a href="./delete.jsp?userid=<%=dto.getUserid()%>">삭제</a></td>
				</tr>
			
			<%
				}
			%>
			
	</table>

</body>
</html>