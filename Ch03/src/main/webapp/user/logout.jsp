<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 종료
	session.invalidate();

	response.sendRedirect("../6_session.jsp");



%>