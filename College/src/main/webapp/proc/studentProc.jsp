<%@page import="com.google.gson.JsonObject"%>
<%@page import="College.co.kr.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="College.co.kr.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String stdNo	 = request.getParameter("stdNo");
	String stdName	 = request.getParameter("stdName");
	String stdHp	 = request.getParameter("stdHp");
	String stdYear	 = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	int result = 0;
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_STUDENT);
		psmt.setString(1, stdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, stdHp);
		psmt.setString(4, stdYear);
		psmt.setString(5, stdAddress);
		
		result = psmt.executeUpdate();
		
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("stdNo", stdNo);
	json.addProperty("stdName", stdName);
	json.addProperty("stdHp", stdHp);
	json.addProperty("stdYear", stdYear);
	json.addProperty("stdAddress", stdAddress);
	
	String jsonData = json.toString();
	out.print(jsonData);

%>