package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard1.bean.BoardBean;
import kr.co.jboard1.bean.FileBean;
import kr.co.jboard1.db.DBCP;
import kr.co.jboard1.db.Sql;

// DAO(Data Access Object) : 데이터베이스 처리 클래스
public class ArticleDAO {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	// 기본 CRUD
	public int insertArticle(BoardBean board) {
		
		int parent = 0;
		
		try{
			Connection conn = DBCP.getConnection();
			// 트랜젝션 시작
			conn.setAutoCommit(false);
			
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			Statement stmt = conn.createStatement();
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setInt(3, board.getFname() == null ? 0 : 1);
			psmt.setString(4, board.getUid());
			psmt.setString(5, board.getRegip());
			
			psmt.executeUpdate();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			// 작업확정
			conn.commit();
			
			if(rs.next()){
				parent = rs.getInt(1);
			}
			
			rs.close();
			stmt.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return parent;
	}
	
	public void insertFile(int parent, String newName, String fname) {
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newName);
			psmt.setString(3, fname);
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public BoardBean insertComment(BoardBean comment) {
		
		BoardBean board = null;
		int result = 0;
		
		try{
			Connection conn = DBCP.getConnection();
			
			conn.setAutoCommit(false);
			PreparedStatement psmt1 = conn.prepareStatement(Sql.INSERT_COMMENT);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_PLUS);
			Statement stmt = conn.createStatement();
			psmt1.setInt(1, comment.getParent());
			psmt1.setString(2, comment.getContent());
			psmt1.setString(3, comment.getUid());
			psmt1.setString(4, comment.getRegip());
			
			psmt2.setInt(1, comment.getParent());
			
			result = psmt1.executeUpdate();
			psmt2.executeUpdate();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_COMMENT_LATEST);
			
			
			conn.commit();
			
			if(rs.next()) {
				board = new BoardBean();
				board.setNo(rs.getInt(1));
				board.setParent(rs.getInt(2));
				board.setContent(rs.getString(6));
				board.setRdate(rs.getString(11).substring(2, 10));
				board.setNick(rs.getString(12));
			}
			
			rs.close();
			stmt.close();
			psmt1.close();
			psmt2.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return board;
	}
	
	public int selectCountTotal() {
		
		int total = 0;
		
		try {
			logger.info("selectcounttotal");
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return total;
	}
	
	public BoardBean selectArticle(String no) {
		
		BoardBean board = null;
		
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				board = new BoardBean();
				board.setNo(rs.getInt(1));
				board.setParent(rs.getInt(2));
				board.setComment(rs.getInt(3));
				board.setCate(rs.getString(4));
				board.setTitle(rs.getString(5));
				board.setContent(rs.getString(6));
				board.setFile(rs.getInt(7));
				board.setHit(rs.getInt(8));
				board.setUid(rs.getString(9));
				board.setRegip(rs.getString(10));
				board.setRdate(rs.getString(11));
				board.setFno(rs.getInt(12));
				board.setPno(rs.getInt(13));
				board.setNewName(rs.getString(14));
				board.setOriName(rs.getString(15));
				board.setDownload(rs.getInt(16));
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return board;
	}
	
	public List<BoardBean> selectArticles(int limitStart) {
		
		List<BoardBean> boards = new ArrayList<>();
		
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, limitStart);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setNo(rs.getInt(1));
				board.setParent(rs.getInt(2));
				board.setComment(rs.getInt(3));
				board.setCate(rs.getString(4));
				board.setTitle(rs.getString(5));
				board.setContent(rs.getString(6));
				board.setFile(rs.getInt(7));
				board.setHit(rs.getInt(8));
				board.setUid(rs.getString(9));
				board.setRegip(rs.getString(10));
				board.setRdate(rs.getString(11));
				board.setNick(rs.getString(12));
				
				boards.add(board);			
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return boards;
	}
	
	public FileBean selectFile(String parent) {
		FileBean fb = null;
		
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, parent);
		 	ResultSet rs = psmt.executeQuery();
		 	
		 	if(rs.next()){
		 		fb = new FileBean();
		 		fb.setFno(rs.getInt(1));
		 		fb.setParent(rs.getInt(2));
		 		fb.setNewName(rs.getString(3));
		 		fb.setOriName(rs.getString(4));
		 		fb.setDownload(rs.getInt(5));
		 	}
		 	rs.close();
		 	psmt.close();
		 	conn.close();
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return fb;
	}
	
	public List<BoardBean> selectComments(String parent) {
		
		List<BoardBean> comments = new ArrayList<>();
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardBean comment = new BoardBean();
				comment.setNo(rs.getInt(1));
				comment.setParent(rs.getInt(2));
				comment.setComment(rs.getInt(3));
				comment.setCate(rs.getString(4));
				comment.setTitle(rs.getString(5));
				comment.setContent(rs.getString(6));
				comment.setFile(rs.getInt(7));
				comment.setHit(rs.getInt(8));
				comment.setUid(rs.getString(9));
				comment.setRegip(rs.getString(10));
				comment.setRdate(rs.getString(11));
				comment.setNick(rs.getString(12));
				
				comments.add(comment);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return comments;
	}
	
	public void updateArticle(String no, String title, String content) {
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, title);
			psmt.setString(3, content);
			
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public void updateArticleHit(String no) {
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public void updateFileDownload(int fno) {

		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setInt(1, fno);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public int updateComment(String no, String content) {
		
		int result = 0;
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt =  conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, no);
			
			result = psmt.executeUpdate();
			psmt.close();
			conn.close();
				
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public void deleteArticle(String no, String parent) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, parent);
			
			psmt.executeUpdate();
			
			conn.close();
			psmt.close();
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	}
	
	public int deleteComment(String no, String parent) {
		int result = 0;
		try {
			logger.info("deleteComment");
			Connection conn = DBCP.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement psmt1 = conn.prepareStatement(Sql.DELETE_COMMENT);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_MINUS);
			psmt1.setString(1, no);
			psmt2.setString(1, parent);
			
			result = psmt1.executeUpdate();
			psmt2.executeUpdate();
			
			conn.commit();
			
			conn.close();
			psmt1.close();
			psmt2.close();
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public String deleteFile(String no) {
		
		String newName = null;
		
		try {
			logger.info("deleteFile");
			Connection conn = DBCP.getConnection();
			
			conn.setAutoCommit(false);
			PreparedStatement psmt1 = conn.prepareStatement(Sql.SELECT_FILE);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.DELETE_FILE);
			
			psmt1.setString(1, no);
			psmt2.setString(1, no);
			
			ResultSet rs = psmt1.executeQuery();
			psmt2.executeUpdate();
			
			conn.commit();
			
			if(rs.next()) {
				newName = rs.getString(3);
			}
			
			conn.close();
			psmt1.close();
			psmt2.close();
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return newName;
		
	}
	
}