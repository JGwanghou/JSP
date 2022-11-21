package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import vo.User3VO;

public class User3DAO extends DBHelper {
	private static User3DAO instance = new User3DAO();
	public static User3DAO getInstance() {
		return instance;
	}
	private User3DAO () {}
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public void insertUser3(User3VO vo3) {
		try {
			logger.debug("insertUser3...");
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user3` values (?, ?, ?, ?)");
			psmt.setString(1, vo3.getUid());
			psmt.setString(2, vo3.getName());
			psmt.setString(3, vo3.getHp());
			psmt.setInt(4, vo3.getAge());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public List<User3VO> selectUser3() {
		List<User3VO> users3 = new ArrayList<>();
		try {
			logger.debug("selectUser3...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs  = stmt.executeQuery("select * from `user3`");
			
			while(rs.next()) {
				User3VO vo3 = new User3VO();
				vo3.setUid(rs.getString(1));
				vo3.setName(rs.getString(2));
				vo3.setHp(rs.getString(3));
				vo3.setAge(rs.getInt(4));
				
				users3.add(vo3);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return users3;
	}
	public void selectUser3s() {}
	public void updateUser3() {}
	public void deleteUser3() {}
}
