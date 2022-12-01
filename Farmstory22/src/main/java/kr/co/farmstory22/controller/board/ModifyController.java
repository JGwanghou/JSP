package kr.co.farmstory22.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.farmstory22.service.ArticleService;
import kr.co.farmstory22.vo.ArticleVO;

@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// view.jsp 수정 버튼에서 온 파라미터 받기
		String group	 = req.getParameter("group");
		String cate		 = req.getParameter("cate");
		String no		 = req.getParameter("no");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("no", no);
		
		ArticleVO aVo = service.selectArticle(no);
		req.setAttribute("aVo", aVo);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
