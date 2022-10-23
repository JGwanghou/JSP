<%@page import="com.google.gson.JsonObject"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<UserBean> user = new ArrayList<>();

	request.setCharacterEncoding("UTF-8");
	String uid	 = request.getParameter("uid");
	String name	 = request.getParameter("name");
	String hp	 = request.getParameter("hp");
	String age	 = request.getParameter("age");
	 
	int result = 0;
	try{
		
		Connection conn = DBCP.getConnection();
		String sql = "UPDATE `user2` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);
		
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