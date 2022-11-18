package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import vo.BookVO;

public class BookDAO extends DBHelper {
	
	private static BookDAO instnace = new BookDAO();
	public static BookDAO getInstnace() {
		return instnace;
	}
	private BookDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertBook(BookVO bvo) {
		try {
			logger.debug("insertBook..");
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `book` values (?, ?, ?, ?)");
			psmt.setInt(1, bvo.getBookId());
			psmt.setString(2, bvo.getBookName());
			psmt.setString(3, bvo.getPublisher());
			psmt.setInt(4, bvo.getPrice());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void selectBook() {}
	
	public List<BookVO> selectBooks() {
		List<BookVO> books = new ArrayList<>();
		
		try {
			logger.debug("selectBooks...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `book`");
			
			while(rs.next()) {
				BookVO bvo = new BookVO();
				bvo.setBookId(rs.getInt(1));
				bvo.setBookName(rs.getString(2));
				bvo.setPublisher(rs.getString(3));
				bvo.setPrice(rs.getInt(4));
				
				books.add(bvo);
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return books;
	}
	
	public BookVO selectBook1(String bookId) {
		BookVO bvo = null;
		try {
			logger.debug("selectBook1....");
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				bvo = new BookVO();
				bvo.setBookId(rs.getInt(1));
				bvo.setBookName(rs.getString(2));
				bvo.setPublisher(rs.getString(3));
				bvo.setPrice(rs.getInt(4));
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return bvo;
	}
	
	public void updateBook(BookVO bvo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `book` set `bookName`=?, `publisher`=?, `price`=? where `bookId`=?");
			psmt.setString(1, bvo.getBookName());
			psmt.setString(2, bvo.getPublisher());
			psmt.setInt(3, bvo.getPrice());
			psmt.setInt(4, bvo.getBookId());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void deleteBook(String bookId) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
}