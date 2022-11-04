<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String content	 = request.getParameter("content");
	String no		 = request.getParameter("no");
	
	int result = ArticleDAO.getInstance().updateComment(no, content);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);

	out.print(json.toString());
		
	
%>