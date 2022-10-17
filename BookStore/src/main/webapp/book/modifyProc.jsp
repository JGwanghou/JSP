<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP2"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookId	 = request.getParameter("bookId");
	String bookName	 = request.getParameter("bookName");
	String publisher = request.getParameter("publisher");
	String price	 = request.getParameter("price");
	
	try{
		Connection conn = DBCP2.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "UPDATE `book` SET";
			   sql += "`bookId`='"+bookId+"',";
			   sql += "`bookName`='"+bookName+"',";
			   sql += "`publisher`='"+publisher+"',";
			   sql += "`price`='"+price+"'";
			   sql += "WHERE `bookId`='"+bookId+"'";
			   
		stmt.executeUpdate(sql);
		
		conn.close();
		stmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>