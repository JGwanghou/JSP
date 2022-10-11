<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_out</title>
		<%--
			날짜 : 2022/10/05
			이름 : 조광호
			내용 : JSP out 내장객체 실습
			
			out 내장객체
			 - JSP 출력 객체
			 - HTML 태그 및 데이터 출력
			 
		 --%>
	</head>
	<body>
		<h3>out 객체</h3>
		<%
			out.println("<ul>"); // 단순 문자열 출력이 아닌 태그로 출력
			out.println("</li>서울</li>");
			out.println("</li>대전</li>");
			out.println("</li>대구</li>");
			out.println("</li>부산</li>");
			out.println("</li>광주</li>");
			out.println("</ul>");
		%>
	</body>
</html>