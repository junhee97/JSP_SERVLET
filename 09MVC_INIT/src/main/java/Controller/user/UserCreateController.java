package Controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.SubController;
import Domain.Dto.UserDto;
import Domain.Service.UserServiceImpl;

public class UserCreateController implements SubController {

	private HttpServletRequest req;
	private HttpServletResponse resp;

	private UserServiceImpl userService;

	public UserCreateController() throws Exception {
		userService = UserServiceImpl.getInstance();
		// throw new Exception("TESTTESTTEST");
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		this.req = req;
		this.resp = resp;

		System.out.println("[SC] UserCreateController execute...");

		try {
			String uri = req.getMethod();
			if (uri.equals("GET")) {
				req.getRequestDispatcher("/WEB-INF/view/user/create.jsp").forward(req, resp);
				return;
			}

			// 파라미터(username, password)
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String role = "ROLE_USER";

			// 입력값검증
			UserDto userDto = new UserDto(username, password, role);
			boolean isOk = isValid(userDto);
			if (!isOk) {
				req.getRequestDispatcher("/WEB-INF/view/user/create.jsp").forward(req, resp);
				return;
			}

			// 서비스
			boolean isJoin = userService.userJoin(userDto);

			// 뷰
			if(isJoin) {
				resp.sendRedirect(req.getContextPath() + "/index.do");
			} else {
				// req.setAttribute("join_error", "존재하는 username 입니다.");
				req.getRequestDispatcher("/WEB-INF/view/user/create.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			exceptionHandler(e);
		}

	}

	// 유효성 검사 함수
	private boolean isValid(UserDto userDto) {
		if (userDto.getUsername() == null || userDto.getUsername().length() <= 4) {
			req.setAttribute("usernanme_err", "username의 길이는 최소 5자이상이어야합니다");
			System.out.println("[INVALID] username의 길이는 최소 5자이상이어야합니다");
			return false;
		}
		if (userDto.getUsername().matches("^[0-9].*")) {
			System.out.println("[INVALID] username의 첫문자로 숫자가 들어올수 없습니다");
			req.setAttribute("usernanme_err", "username의 username의 첫문자로 숫자가 들어올수 없습니다");
			return false;
		}

		return true;
	}

	// 예외처리 함수
	public void exceptionHandler(Exception e) {
		req.setAttribute("status", false);
		req.setAttribute("message", e.getMessage());
		req.setAttribute("exception", e);
	}

}
