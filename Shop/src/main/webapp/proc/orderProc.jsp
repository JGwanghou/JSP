<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.Shop.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String prodNo = request.getParameter("prodNo"); // 제품번호 == 제품명
	String prodCount = request.getParameter("prodCount"); // 주문 수량
	String prodOrderer = request.getParameter("prodOrderer"); // 
	
	int result = 0;
	try{
		Connection conn = DBCP.getConnection();
		String sql = "INSERT INTO `order` (`orderId`, `orderProduct`, `orderCount`, `orderdate`)" 
				   + "VALUES(?, ?, ?, now())";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, prodOrderer);
		psmt.setString(2, prodNo);
		psmt.setString(3, prodCount);
		
		result = psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>