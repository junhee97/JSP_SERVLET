<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="C09.*,C04.*"%>

<%
	String userid = request.getParameter("userid");
	
	DBUtils dbutils = DBUtils.getInstance();
	int result = dbutils.deleteUser(userid);
	
	/* if (result > 0)
		out.println("<script>alert('delete 성공!'); location.href='./selectAll.jsp'</script>"); */
		
	response.sendRedirect("./selectAll.jsp");
%>