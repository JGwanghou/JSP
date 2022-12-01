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
import kr.co.farmstory22.vo.UserVO;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid	 = req.getParameter("uid");
		String pass	 = req.getParameter("pass");
		
		UserVO vo = service.selectUser(uid, pass);
		if(vo != null) {
			HttpSession sess = req.getSession();
			sess.setAttribute("sessUser", vo);
			resp.sendRedirect("/Farmstory22/index.do");
		}else {
			resp.sendRedirect("/Farmstory22/user/login.do?success=100");
		}
	}
}
