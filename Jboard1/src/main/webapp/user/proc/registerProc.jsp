<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid	 = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name	 = request.getParameter("name");
	String nick	 = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp	 = request.getParameter("hp");
	String zip	 = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserBean ub = new UserBean();
	ub.setUid(uid);
	ub.setPass(pass1);
	ub.setName(name);
	ub.setNick(nick);
	ub.setEmail(email);
	ub.setHp(hp);
	ub.setZip(zip);
	ub.setAddr1(addr1);
	ub.setAddr2(addr2);
	
	UserDAO udao = UserDAO.getInstance();
	udao.insertUser(ub);
	
	response.sendRedirect("/Jboard1/user/login.jsp");
%>	