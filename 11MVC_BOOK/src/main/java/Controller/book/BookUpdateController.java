package Controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.SubController;
import Domain.Service.BookServiceImpl;

public class BookUpdateController implements SubController {
	private HttpServletRequest req;
	private HttpServletResponse resp;

	private BookServiceImpl bookService;

	public BookUpdateController() throws Exception {
		bookService = BookServiceImpl.getInstance();
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;

	}

}
