<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	//데이터베이스 작업
	try{
		String host = "jdbc:mysql://127.0.0.1:3306/java2db";
		String user = "root";
		String pass = "1234";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		String sql = "DELETE FROM `member` WHERE `uid`='"+uid+"'";
		
		stmt.executeUpdate(sql);
		conn.close();
		stmt.close();
				//delete from `` where `uid`='uid';
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");

%>    
