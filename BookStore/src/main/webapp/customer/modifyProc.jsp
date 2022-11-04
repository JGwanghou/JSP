<%@page import="Config.DBCP2"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	try{
		Connection conn = DBCP2.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "UPDATE `customer` SET";
			   sql += "`custId`='"+custId+"',";
			   sql += "`name`='"+name+"',";
			   sql += "`address`='"+address+"',";
			   sql += "`phone`='"+phone+"'";
			   sql += "Where `custId`='"+custId+"'";
			   
		stmt.executeUpdate(sql);
		
		conn.close();
		stmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>