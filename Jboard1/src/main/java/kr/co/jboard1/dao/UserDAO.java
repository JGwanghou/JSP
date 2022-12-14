package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard1.bean.TermsBean;
import kr.co.jboard1.bean.UserBean;
import kr.co.jboard1.db.DBCP;
import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.Sql;

public class UserDAO extends DBHelper{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	// 기본 CRUD
	
	public void insertUser(UserBean ub) {
		try{
			logger.info("insertUser");
			conn = getConnection();
			
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, ub.getUid());
			psmt.setString(2, ub.getPass());
			psmt.setString(3, ub.getName());
			psmt.setString(4, ub.getAddr1());
			psmt.setString(5, ub.getEmail());
			psmt.setString(6, ub.getHp());
			psmt.setString(7, ub.getZip());
			psmt.setString(8, ub.getAddr1());
			psmt.setString(9, ub.getAddr2());
			psmt.setString(10, ub.getRegip());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public UserBean selectUser(String uid, String pass) {
		UserBean ub = null;
		try{
			logger.info("selectUser");
			conn = DBCP.getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				// 회원 맞을경우
				ub = new UserBean();
				ub.setUid(rs.getString(1));
				ub.setPass(rs.getString(2));
				ub.setName(rs.getString(3));
				ub.setNick(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setHp(rs.getString(6));
				ub.setGrade(rs.getInt(7));
				ub.setZip(rs.getString(8));
				ub.setAddr1(rs.getString(9));
				ub.setAddr2(rs.getString(10));
				ub.setRegip(rs.getString(11));
				ub.setRdate(rs.getString(12));
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return ub;
	}
	
	public void selectUsers() {}
	
	public TermsBean selectTerms() {
		
		TermsBean tb = null;
		try{
			logger.info("selectUsers");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			if(rs.next()){
					tb = new TermsBean();
					tb.setTerms(rs.getString(1));
					tb.setPrivacy(rs.getString(2));
			}
			
			conn.close();
			stmt.close();
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return tb;
		
	}

	public int selectCountNick(String nick) {
		int result = 0;
		try{
			logger.info("selectCountNick");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			
			ResultSet rs = psmt.executeQuery();

			if(rs.next()){
				 result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public int selectCheckUid(String uid) {
		int result = 0;
		try{
			logger.info("selectCheckUid");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();

			if(rs.next()){
				 result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public void updateUser() {}
	
	public void deleteUser() {}
}
