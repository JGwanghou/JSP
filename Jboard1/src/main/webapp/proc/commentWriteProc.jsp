<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.annotations.JsonAdapter"%>
<%@page import="kr.co.jboard1.bean.BoardBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no 	   = request.getParameter("no");
	String content = request.getParameter("content");
	String uid     = request.getParameter("uid");
	String regip   = request.getRemoteAddr();

	BoardBean comment = new BoardBean();
	comment.setParent(no);
	comment.setContent(content);
	comment.setUid(uid);
	comment.setRegip(regip);
	
	BoardBean board = ArticleDAO.getInstance().insertComment(comment);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", 1);
	json.addProperty("no", board.getNo());
	json.addProperty("parent", board.getParent());
	json.addProperty("nick", board.getNick());
	json.addProperty("date", board.getRdate());
	json.addProperty("content", board.getContent());
	
	String jsonData = json.toString();
	out.print(jsonData);
	
	
%>