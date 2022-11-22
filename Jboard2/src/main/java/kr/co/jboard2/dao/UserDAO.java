package kr.co.jboard2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.TermsVO;
import kr.co.jboard2.vo.UserVO;

public class UserDAO extends DBHelper{
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserVO vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNick());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegip());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public TermsVO selectTerms() {
		TermsVO tvo = null;
		try {
			logger.debug("selectTerms...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				tvo = new TermsVO();
				tvo.setTerms(rs.getString(1));
				tvo.setPrivacy(rs.getString(2));
			}
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return tvo;
	}
	
	public void selectUser() {}
	
	public void selectUsers() {}
	
	public int selectCountUid(String uid) {
		int result = 0;
		try {
			logger.debug("selectCheckUid...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result :" + result);
		
		return result;
	}
	
	public int selectCountNick(String nick) {
		int result = 0;
		try {
			logger.debug("selectCountNick...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		
		return result;
	}
	
	public void updateUser() {}
	
	public void deleteUser() {}
	
}
