package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/file");
		MultipartRequest mr = service.uploadFile(req, path);
		
		String title	 = mr.getParameter("title");
		String content	 = mr.getParameter("content");
		String uid 		 = mr.getParameter("uid");
		String fname	 = mr.getFilesystemName("fname");
		String regip	 = req.getRemoteAddr();
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		
		ArticleVO article = new ArticleVO();
		article.setTitle(title);
		article.setContent(content);
		article.setUid(uid);
		article.setFname(fname);
		article.setRegip(regip);
		
		// 글 등록
		int parent = service.insertArticle(article);
		
		if(fname != null) {
			String newName = service.renameFile(fname, uid, path);
			
			service.insertFile(parent, newName, fname);
		}
		
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate+"");
	}
	

}
