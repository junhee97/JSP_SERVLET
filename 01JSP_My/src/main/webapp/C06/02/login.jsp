<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	// 파라미터 유효성 체크
	if (username.isEmpty()) {
		out.println("<script>alert('username을 입력하세요..'); location.href='./login_form.jsp'</script>");
	}
	if (password.isEmpty()) {
		
	}
	
	// 01 ID 확인(DB 조회 - 생략)
	// 02 PW 확인(일치여부 확인)
	// 03 사용자 상태정보(인증됨)를 Session에 저장
	// 04 로그인 처리후 MAIN PAGE REDIRECT
	// response.sendRedirect("./main.jsp");
%>