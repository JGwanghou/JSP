<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DB"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String stdNo	 = request.getParameter("stdNo");
	String stdName	 = request.getParameter("stdName");
	String stdHp	 = request.getParameter("stdHp");
	String stdYear	 = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	//db
	try{
		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		String sql = "UPDATE `student` SET ";
			   sql += "`stdName`='"+stdName+"',";
			   sql += "`stdHp`='"+stdHp+"',";
			   sql += "`stdYear`='"+stdYear+"',";
			   sql += "`stdAddress`='"+stdAddress+"'";
			   sql += "WHERE `stdNo`='"+stdNo+"'";
		
		stmt.executeUpdate(sql);
		
		conn.close();
		stmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>    