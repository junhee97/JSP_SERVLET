<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Utils.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String regist_month = request.getParameter("regist_month");
	String c_no = request.getParameter("c_no");
	String class_area = request.getParameter("class_area");
	String Partuition = request.getParameter("tuition");
	int tuition = Integer.parseInt(Partuition);
	String teacher_code = request.getParameter("teacher_code");
	
	ClassDto classDto = new ClassDto(regist_month, c_no, class_area, tuition, teacher_code);

	int result = DBUtils.getInstance().insertClass(classDto);
	if (result > 0) {
		out.print("<script>alert('수강신청이 정상적으로 완료되었습니다!'); location.href='./index.jsp'</script>");
	} else {
		out.print("<script>alert('수강신청 실패..'); location.href='./index.jsp'</script>");
	}
%>

