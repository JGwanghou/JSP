<%@page import="bean.UserBean"%>
<%@page import="dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserBean ub = UserDAO.getInstance().selectUser(uid, pass);
	
	if(ub != null){
		session.setAttribute("sessUser", ub);
		response.sendRedirect("/Farmstory1");
	}else{
		response.sendRedirect("/Farmstory1/user/login.jsp?success=100");
	}
%>