<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String idSave = request.getParameter("idSave");
	String pwSave = request.getParameter("pwSave");
	System.out.println("idSave : " + idSave);
	System.out.println("pwSave : " + pwSave);
	
	// 파라미터 유효성 체크
	if (username.isEmpty()) {
		// out.println("<script>alert('username을 입력하세요..'); location.href='./login_form.jsp'</script>");
		request.setAttribute("username_msg", "username을 입력하세요");
	}
	
	if (password.isEmpty()) {
		// out.println("<script>alert('password를 입력하세요..'); location.href='./login_form.jsp'</script>");
		request.setAttribute("password_msg", "password를 입력하세요");
		
	}
	
	if (username.isEmpty() || password.isEmpty()) {
		request.getRequestDispatcher("./login_form.jsp").forward(request, response);
		return ;
	}
	// 01 ID 확인(DB 조회 - 생략)
	if (! username.equals("admin")) {
		
		request.setAttribute("username_msg", "해당 username은 존재하지 않습니다.");
		request.getRequestDispatcher("./login_form.jsp").forward(request, response);
		return ;
	}
	// 02 PW 확인(일치여부 확인)
	if (! password.equals("1234")) {
		request.setAttribute("password_msg", "password 불일치");
		request.getRequestDispatcher("./login_form.jsp").forward(request, response);
		return ;
	}
	// 03 사용자 상태정보(인증됨)를 Session에 저장
	session.setAttribute("isAuth", true);
	session.setAttribute("role", "ROLE_ADMIN");
	session.setMaxInactiveInterval(30); // 30초
	
	// 쿠키 설정
	if (idSave != null) {
		Cookie cookie = new Cookie("username", username);
		cookie.setMaxAge(60*5);
		cookie.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(cookie);
		
		Cookie idchk = new Cookie("idchk", "on");
		idchk.setMaxAge(60*5);
		idchk.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(idchk);
	} else {
		Cookie cookie = new Cookie("username", null);
		cookie.setMaxAge(0);
		cookie.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(cookie);
		
		Cookie idchk = new Cookie("idchk", null);
		idchk.setMaxAge(0);
		idchk.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(idchk);
	}
	
	if (pwSave != null) {
		Cookie cookie2 = new Cookie("password", password);
		cookie2.setMaxAge(60*5);
		cookie2.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(cookie2);
		
		Cookie pwchk = new Cookie("pwchk", "checked");
		pwchk.setMaxAge(60*5);
		pwchk.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(pwchk);
	} else {
		Cookie cookie2 = new Cookie("password", null);
		cookie2.setMaxAge(0);
		cookie2.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(cookie2);
		
		Cookie pwchk = new Cookie("pwchk", null);
		pwchk.setMaxAge(0);
		pwchk.setPath("/01JSP_My/C07/03/login_form.jsp");
		response.addCookie(pwchk);
	}
	
	// 04 로그인 처리후 MAIN PAGE REDIRECT
	out.println("<script> alert('로그인 성공 ! main page로 이동합니다.'); location.href='main.jsp'</script>");
%>