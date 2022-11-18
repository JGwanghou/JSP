package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import vo.CustomerVO;

public class CustomerDAO extends DBHelper {

	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CustomerDAO() {}
	
	
	public void insertCustomer(CustomerVO cvo) {
		try {
			logger.debug("insertCustomer....");
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `customer` values (?, ?, ?, ?)");
			psmt.setInt(1, cvo.getCustId());
			psmt.setString(2, cvo.getName());
			psmt.setString(3, cvo.getAddress());
			psmt.setString(4, cvo.getPhone());
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public List<CustomerVO> selectCustomer() {

		List<CustomerVO> customers = new ArrayList<>();
		try {
			logger.debug("selectCustomer...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `customer`");
			
			while(rs.next()) {
				CustomerVO cvo = new CustomerVO();
				cvo.setCustId(rs.getInt(1));
				cvo.setName(rs.getString(2));
				cvo.setAddress(rs.getString(3));
				cvo.setPhone(rs.getString(4));
				
				customers.add(cvo);
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return customers;
	}
	public CustomerVO selectCustomer1(String custId) {
		CustomerVO cvo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `customer` where `custId`=?");
			psmt.setString(1, custId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cvo = new CustomerVO();
				cvo.setCustId(rs.getInt(1));
				cvo.setName(rs.getString(2));
				cvo.setAddress(rs.getString(3));
				cvo.setPhone(rs.getString(4));
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cvo;
	}
	
	public void updateCustomer(CustomerVO cvo) {
		try {
			logger.debug("updateCustomer...");
			conn = getConnection();
			psmt = conn.prepareStatement("update `customer` set `name`=?, `address`=?, `phone`=? where `custId`=?");
			
			psmt.setString(1, cvo.getName());
			psmt.setString(2, cvo.getAddress());
			psmt.setString(3, cvo.getPhone());
			psmt.setInt(4, cvo.getCustId());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void deleteCustomer(String custId) {
		try {
			logger.debug("deleteCustomer..");
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `customer` where `custId`=?");
			psmt.setString(1, custId);
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
}
