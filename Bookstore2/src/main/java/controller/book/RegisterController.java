package controller.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.BookVO;

@WebServlet("/book/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/book/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터수신
		String bookId	 = req.getParameter("bookId");
		String bookName	 = req.getParameter("bookName");
		String publisher = req.getParameter("publisher");
		String price	 = req.getParameter("price");
		
		BookVO bvo = new BookVO();
		bvo.setBookId(bookId);
		bvo.setBookName(bookName);
		bvo.setPublisher(publisher);
		bvo.setPrice(price);
		
		// 데이터베이스 처리
		BookDAO.getInstnace().insertBook(bvo);
		
		// 리다이렉트
		resp.sendRedirect("/Bookstore2/book/list.do");
	}
}
