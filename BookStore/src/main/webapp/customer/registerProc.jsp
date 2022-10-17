<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP2"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String custId	 = request.getParameter("custId");
	String name		 = request.getParameter("name");
	String address	 = request.getParameter("address");
	String phone	 = request.getParameter("phone");
	// 데이터베이스 처리
	try{
		Connection conn = DBCP2.getConnection();
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, custId);
		psmt.setString(2, name);
		psmt.setString(3, address);
		psmt.setString(4, phone);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	//리다이렉트
	response.sendRedirect("./list.jsp");
%>