
<%@page import="java.sql.Statement"%>
<%@page import="Config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  
<%
  

  	request.setCharacterEncoding("UTF-8");
  	String name = request.getParameter("name");
  	String birth = request.getParameter("birth");
  	String age = request.getParameter("age");
  	String address = request.getParameter("address");
  	String hp = request.getParameter("hp");
  	
  	try{
  		Connection conn = DBCP.getConnection();
  		Statement stmt = conn.createStatement();
  		String sql = "UPDATE `user5` SET ";
  	   sql += "`birth`='"+birth+"',";
  	   sql += "`age`='"+age+"',";
  	   sql += "`address`='"+address+"',";
  	   sql += "`hp`='"+hp+"'";
  	   sql += "WHERE `name`='"+name+"'";
  		
  		stmt.executeUpdate(sql);	   
  	   
  		conn.close();
  		stmt.close();
  		
  	}catch(Exception e){
  		e.printStackTrace();
  	}
  	
  	response.sendRedirect("./list.jsp");
  %>