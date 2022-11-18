<%@page import="dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no	 = request.getParameter("no");
	String cate	 = request.getParameter("cate");
	String pg	 = request.getParameter("pg");
	String group = request.getParameter("group");

	ArticleDAO.getInstance().deleteArticle(no);
	
	response.sendRedirect("./list.jsp?group="+group+"&cate="+cate+"");
%>