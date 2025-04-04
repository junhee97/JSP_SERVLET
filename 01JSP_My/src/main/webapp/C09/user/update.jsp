<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="C09.*,C04.*" %>

<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String role = request.getParameter("role");

	DBUtils dbutils = DBUtils.getInstance();
	int result = dbutils.updateUser(new UserDto(userid, password, role));
	
	if (result > 0)
		out.println("<script>alert('update 성공!'); location.href='./selectAll.jsp'</script>");
	else
		out.println("<script>alert('update 실패..'); location.href='histrory.go(-1)'</script>");
%>