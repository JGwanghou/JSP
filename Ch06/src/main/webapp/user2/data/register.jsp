<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Config.DBCP"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid	 = request.getParameter("uid");
	String name	 = request.getParameter("name");
	String hp	 = request.getParameter("hp");
	String age	 = request.getParameter("age");
	
	int result = 0;
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement("insert into `user2` values (?,?,?,?)");
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		
		result = psmt.executeUpdate();
		// 1이면 성공 0 이면 실패(아이디중복)
		
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