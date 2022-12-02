package kr.co.farmstory22.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory22.service.ArticleService;
import kr.co.farmstory22.vo.ArticleVO;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String no	 = req.getParameter("no");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("no", no);
		
		ArticleVO avo = service.selectArticle(no);
		req.setAttribute("avo", avo);

		String parent = req.getParameter("no");
		List<ArticleVO> comments = service.selectComments(parent);
		req.setAttribute("comments", comments);
		req.setAttribute("parent", parent);
		
		req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String uid = req.getParameter("uid");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		ArticleVO comment = new ArticleVO();
		comment.setParent(no);
		comment.setContent(content);
		comment.setUid(uid);
		comment.setRegip(regip);
		
		ArticleVO comment1 = service.insertComment(comment);
		req.setAttribute("comment1", comment1);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", 1);
		json.addProperty("no", comment.getNo());
		json.addProperty("parent", comment.getParent());
		json.addProperty("nick", comment.getNick());
		json.addProperty("date", comment.getRdate());
		json.addProperty("content", comment.getContent());
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}

}
