package kr.co.farmstory22.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory22.service.UserService;

@WebServlet("/user/userModify.do")
public class UserModify extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userModify.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid	 = req.getParameter("uid");
		String pass	 = req.getParameter("pass1");
		String nick	 = req.getParameter("name");
		String email = req.getParameter("email");
		String hp	 = req.getParameter("hp");
		String zip	 = req.getParameter("zip");
		String addr1	 = req.getParameter("addr1");
		String addr2	 = req.getParameter("addr2");
		
		service.up
	}
}
