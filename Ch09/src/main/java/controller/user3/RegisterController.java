package controller.user3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User2DAO;
import dao.User3DAO;
import vo.User2VO;
import vo.User3VO;

@WebServlet("/user3/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user3/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid	 = req.getParameter("uid");
		String name	 = req.getParameter("name");
		String hp	 = req.getParameter("hp");
		String age	 = req.getParameter("age");
		
		User3VO vo3 = new User3VO();
		vo3.setUid(uid);
		vo3.setName(name);
		vo3.setHp(hp);
		vo3.setAge(age);
		
		User3DAO.getInstance().insertUser3(vo3);
		
		resp.sendRedirect("/Ch09/user3/list.do");
	}
	
}
