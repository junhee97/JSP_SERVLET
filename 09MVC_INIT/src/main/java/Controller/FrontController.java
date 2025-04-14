package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.user.UserCreateController;

@WebServlet("/")

public class FrontController extends HttpServlet {

	private Map<String, SubController> map = new HashMap();

	@Override
	public void init(ServletConfig config) throws ServletException {

		try {
			// 기본
			map.put("/", new HomeController());
			map.put("/index.do", new HomeController());
			
			// 인증(/user/*) - 회원CRUD, 로그인, 로그아웃
			map.put("/user/create", new UserCreateController());
			
			// 도서(/book/*) - 도서CRUD
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("서브컨트롤러 등록오류");
		}

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			System.out.println("[FC] Service...");
			String endPoint = req.getServletPath();
			System.out.println("[FC] endPoint : " + endPoint);
			SubController controller = map.get(endPoint);
			controller.execute(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			exceptionHandler(e,req);
			req.getRequestDispatcher("/WEB-INF/view/Error.jsp").forward(req, resp);
		}

	}

	// 예외처리 함수
	public void exceptionHandler(Exception e, HttpServletRequest req) {
		req.setAttribute("status", false);
		req.setAttribute("message", e.getMessage());
		req.setAttribute("exception", e);
	}

}
