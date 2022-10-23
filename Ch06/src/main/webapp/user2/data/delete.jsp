<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	int result = 0 ;
	try{
		Connection conn = DBCP.getConnection();
		String sql = "delete from `user2` where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
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