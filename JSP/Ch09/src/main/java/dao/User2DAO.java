package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import vo.User2VO;

public class User2DAO extends DBHelper{
	
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	private User2DAO () {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 기본 CRUD
	public void insertUser2(User2VO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `user2` VALUES (?, ?, ?, ?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public User2VO selectUser2(String uid) {
		User2VO vo = null;
		try {
			logger.debug("selectUser2uid...");
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user2` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new User2VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	public List<User2VO> selectUser2s() {
		List<User2VO> user2 = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user2`");
			
			while(rs.next()) {
				User2VO vo2 = new User2VO();
				vo2.setUid(rs.getString(1));
				vo2.setName(rs.getString(2));
				vo2.setHp(rs.getString(3));
				vo2.setAge(rs.getString(4));
				
				user2.add(vo2);
			}
			
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user2;
	}
	public void updateUser2(User2VO vo) {
		try {
			logger.debug("updateUser...");
			conn = getConnection();
			psmt = conn.prepareStatement("update `user2` set `name`=? , `hp`=?, `age`=? where `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void deleteUser2(String uid) {
		try {
			logger.debug("deleteUser2..");
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user2` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
}
