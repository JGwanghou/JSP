<%@page import="java.sql.PreparedStatement"%>
<%@page import="Config.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String stdNo	 = request.getParameter("stdNo");
	String stdName	 = request.getParameter("stdName");
	String stdHp	 = request.getParameter("stdHp");
	String stdYear	 = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	// 데이터베이스 작업
	try{
		//1단계
		Connection conn = DB.getInstance().getConnection();
		String sql = "INSERT INTO `student` VALUES (?,?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, stdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, stdHp);
		psmt.setString(4, stdYear);
		psmt.setString(5, stdAddress);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>