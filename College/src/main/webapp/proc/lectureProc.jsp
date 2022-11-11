<%@page import="College.co.kr.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="College.co.kr.db.DBCP"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="College.co.kr.college.CollegeBean"%>
<%@page import="College.co.kr.dao.CollegeDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int result = 0 ;
	String lecNo	 = request.getParameter("lecNo");
	String lecName	 = request.getParameter("lecName");
	String lecCredit = request.getParameter("lecCredit");
	String lecTime	 = request.getParameter("lecTime");
	String lecClass	 = request.getParameter("lecClass");

	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_LECTURE);
		psmt.setString(1, lecNo);
		psmt.setString(2, lecName);
		psmt.setString(3, lecCredit);
		psmt.setString(4, lecTime);
		psmt.setString(5, lecClass);
		result = psmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("lecNo", lecNo);
	json.addProperty("lecName", lecName);
	json.addProperty("lecCredit", lecCredit);
	json.addProperty("lecTime", lecTime);
	json.addProperty("lecClass", lecClass);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>