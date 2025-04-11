package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.OracleDBUtils;
import Utils.UserDto;

// @WebServlet("/login.do")

public class Login extends HttpServlet {
	// GET - /login.do - /WEB-INF/user/login.jsp 연결
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET /login.do...");
		req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);
	}

	// POST - /login.do - 로그인처리(username,password 받아 DBUtils를 이용한 DB SELECT)
	// 테이블 : tbl_user
	// 성공시 : /main.do 로 리다이렉트
	// 실패시 : /login.do로 포워딩
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("POST /login.do...");
		// 파라미터 받기
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		// 유효성(생략)

		// 처리작업

		boolean isAuth = false;
		try {
			UserDto dbUser = OracleDBUtils.getInstance().selectOne(username);
			if (dbUser != null && dbUser.getPassword().equals(password)) {
				// 세션작업
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("role", dbUser.getRole());
				isAuth = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 뷰
		if (!isAuth) {
			req.setAttribute("loginError_msg", "ID 또는 PW가 일치하지 않습니다.");
			req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);
			return;
		}

	}

}
