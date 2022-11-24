package kr.co.jboard2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;

public enum ArticleService {

	INSTANCE;
	private ArticleDAO article;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleService() {
		article = new ArticleDAO();
	}
	
	public void insertArticle() {}
	
	public void selectArticle() {}
	
	public List<ArticleVO> selectArticles(int limitStart) {
		return article.selectArticles(limitStart);
	}
	
	public void updateArticle() {}
	
	public void deleteArticle() {}
}
