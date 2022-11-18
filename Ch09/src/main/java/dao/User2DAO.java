package dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User2VO;

public class User2DAO extends DBHelper{
	
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	private User2DAO () {}
	
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
	public void selectUser2() {
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user2` where `uid`=?");
			
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
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
	public void updateUser2() {}
	public void deleteUser2() {}
	
}
