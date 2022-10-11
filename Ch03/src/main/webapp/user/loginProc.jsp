<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(pw.equals("1234")){
		//회원맞음
		
		// 클라이언트 세션 정보
		session.setAttribute("sessid", id); // key - value 구조로 테이블 저장하기때문
		response.sendRedirect("./loginSuccess.jsp"); // 로그인 성공 페이지로 보냄
	}else{
		//회원아님
		response.sendRedirect("../6_session.jsp");
	}



%>