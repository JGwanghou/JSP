<%@page import="dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no	 = request.getParameter("no");
	String pg	 = request.getParameter("pg");
	String group = request.getParameter("group");
	String cate	 = request.getParameter("cate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	ArticleDAO.getInstance().updateArticle(no, title, content);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+no+"&pg="+pg+"&result=333");
%>