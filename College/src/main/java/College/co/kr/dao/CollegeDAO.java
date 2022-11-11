package College.co.kr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import College.co.kr.college.CollegeBean;
import College.co.kr.db.DBCP;
import College.co.kr.db.Sql;

public class CollegeDAO {
	
	private static CollegeDAO instance = new CollegeDAO();
	public static CollegeDAO getInstance() {
		return instance;
	}
	private CollegeDAO() {}
	
	// CRUD
	public int insertLecture(CollegeBean college) {
		
		int result = 0;
		try {
			Connection conn = DBCP.getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_LECTURE);
			psmt.setInt(1, college.getLecNo());
			psmt.setString(2, college.getLecName());
			psmt.setInt(3, college.getLecCredit());
			psmt.setInt(4, college.getLecTime());
			psmt.setString(5, college.getLecClass());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	public List<CollegeBean> selectRegister() {
		List<CollegeBean> cbs = new ArrayList<>();
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_REGISTER);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				CollegeBean cb = new CollegeBean();
				cb.setStdNo(rs.getString(1));
				cb.setStdName(rs.getString(2));
				cb.setLecName(rs.getString(3));
				cb.setRegLecNo(rs.getInt(4));
				cb.setRegMidScore(rs.getInt(5));
				cb.setRegFinalScore(rs.getInt(6));
				cb.setRegTotalScore(rs.getInt(7));
				cb.setRegGrade(rs.getString(8));
				
				cbs.add(cb);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cbs;
	}
	
	
	public List<CollegeBean> selectLecture() {
		List<CollegeBean> cbs = new ArrayList<>();
		try{
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `LECTURE`");
			
			while(rs.next()){
				CollegeBean cb = new CollegeBean();
				cb.setLecNo(rs.getInt(1));
				cb.setLecName(rs.getString(2));
				cb.setLecCredit(rs.getInt(3));
				cb.setLecTime(rs.getInt(4));
				cb.setLecClass(rs.getString(5));
				
				cbs.add(cb);
			}
			
			conn.close();
			stmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cbs;
	}
	
	public List<CollegeBean> selectStudent() {
		
		List<CollegeBean> cbs = new ArrayList<>();
		
		try{
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
			
			while(rs.next()){
				CollegeBean cb = new CollegeBean();
				cb.setStdNo(rs.getString(1));
				cb.setStdName(rs.getString(2));
				cb.setStdHp(rs.getString(3));
				cb.setStdYear(rs.getInt(4));
				cb.setStdAddress(rs.getString(5));
				
				cbs.add(cb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cbs;
	}
	
}
