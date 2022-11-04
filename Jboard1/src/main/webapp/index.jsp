<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자바 기본 로거
	/*
	Logger logger = Logger.getGlobal();
	
	logger.info("info log...");
	logger.warning("warning log...");
	logger.severe("severe log...");
	*/
	
	// logback 로거
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	logger.debug("log debug...");

	UserBean sessUser = (UserBean)session.getAttribute("sessUser");

	if(sessUser == null){
		pageContext.forward("./user/login.jsp");
	}else{
		pageContext.forward("./list.jsp");
	}

%>