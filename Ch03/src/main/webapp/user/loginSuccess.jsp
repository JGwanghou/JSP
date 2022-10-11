<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("sessid");

	// 해당 URL로 바로 들어오는 것을 방지
	if(id == null){
		response.sendRedirect("../6_session.jsp");
		return; // 처리종료 밑에 스크립트릿이 더 있을 수 있기떄문 
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= id %>님 반갑습니다.<br>
			<a href="./logout.jsp">로그아웃</a>
		</p>
		
		
		
	</body>
</html>