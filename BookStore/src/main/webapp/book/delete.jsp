<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP2"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookId = request.getParameter("bookId");
	
	try{
		Connection conn = DBCP2.getConnection();
		String sql = "delete from `book` where `bookId`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookId);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>   