package Controller.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.SubController;
import Domain.Dto.UserDto;
import Domain.Service.UserServiceImpl;

public class UserLogoutController implements SubController {
	// FrontController -> UserLogoutController 등록 (URI : /user/logout)
	// UserLogoutController
	// - 1 파라미터 받기 생략
	// - 2 session 안 속성 정보(isAuth, role, username) 꺼내오고 유효성 체크
	// - isAuth == false 라면 포워딩 /WEB-INF/login.jsp session 에 message 속성 추가 "로그인 상태가
	// 아닙니다"
	// UserService
	// - logout 함수 내 처리
	// - session invalid 처리 하기
	// - Map<String, Object> 로 return "isLogout", true, "message", "로그아웃 성공"

	// UserLogoutController
	// - isLogout 정보를 확인하여 로그아웃 성공/실패 둘다 /login.do
	// - message 는 session 에 저장

	private HttpServletRequest req;
	private HttpServletResponse resp;

	private UserServiceImpl userService;

	public UserLogoutController() throws Exception {
		userService = UserServiceImpl.getInstance();

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
		System.out.println("[SC] UserLogoutController execute..");

		//
		try {

			HttpSession session = req.getSession();

			Boolean isAuth = (Boolean) session.getAttribute("isAuth");
			String role = (String) session.getAttribute("role");
			String username = (String) session.getAttribute("username");

			if (isAuth == null || isAuth == false) {
				req.setAttribute("message", "로그인된 상태가 아닙니다.");
				req.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(req, resp);
				return;
			}

			boolean isOk = isValid(isAuth, username, role);

			// 서비스
			Map<String, Object> serviceResponse = userService.logout(req.getSession());
			Boolean isLogout = (Boolean) serviceResponse.get("isLogout");
			
			HttpSession reSession = req.getSession();
			if (isLogout != null && isLogout == true) {
				reSession.setAttribute("message", "로그아웃 성공");
			} else {
				reSession.setAttribute("message", "로그아웃 실패");
			}
			
			resp.sendRedirect(req.getContextPath() + "/user/login");
		} catch (Exception e) {
			exceptionHandler(e);
			try {
				req.getRequestDispatcher("/WEB-INF/view/user/error.jsp").forward(req, resp);
			} catch (Exception e2) {
			}
		}

	}

	private boolean isValid(Boolean isAuth, String role, String username) {
		return true;
	}

	// 예외처리함수
	public void exceptionHandler(Exception e) {
		req.setAttribute("status", false);
		req.setAttribute("message", e.getMessage());
		req.setAttribute("exception", e);
	}

}
