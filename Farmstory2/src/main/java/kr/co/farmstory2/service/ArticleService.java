package kr.co.farmstory2.service;

import java.util.List;


import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.vo.ArticleVO;

public enum ArticleService {

	INSTANCE;
	private ArticleDAO dao;
	private ArticleService() {
		dao = new ArticleDAO();
	}
	
	public void insertArticle() {}
	
	public void selectArticle() {}
	
	public List<ArticleVO> selectArticles(int limitStart) {
		return dao.selectArticles(limitStart);
	}
	
	public void updateArticle() {}
	
	public void deleteArticle() {}
	
}
