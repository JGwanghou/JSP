
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터수신
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	// 데이터베이스 처리
	
	try{
		// 1단계
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("dbcp_java2db");
		Connection conn = ds.getConnection();
		// 3단계
		String sql = "INSERT INTO `user3` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		
		// 4단계
		psmt.executeUpdate();
		
		// 5단계
		
		// 6단계
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>	