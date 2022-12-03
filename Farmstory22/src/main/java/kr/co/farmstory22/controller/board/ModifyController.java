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
		String no = req.getParameter("no");				
		String group = req.getParameter("group");		
		String cate = req.getParameter("cate");			
		req.setAttribute("group", group);
		req.setAttribute("no", no);
		req.setAttribute("cate", cate);
		
		ArticleVO article = service.selectArticle(no);
		req.setAttribute("article", article);
		
		req.getRequestDispatcher("/board/modify.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String no	 = req.getParameter("no");				// 게시글 번호
		String title = req.getParameter("title");			// 게시글 제목
		String content = req.getParameter("content");
		
		ArticleVO aVo = new ArticleVO();
		aVo.setTitle(title);
		aVo.setContent(content);
		aVo.setNo(no);
		
		service.updateArticle(title, content, no);
		
		resp.sendRedirect("/Farmstory22/board/view.do?group="+group+"&cate="+cate+"&no="+no);
	}

}
