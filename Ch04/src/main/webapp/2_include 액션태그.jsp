<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_include 액션태그</title>
		<!-- 
			날짜 : 2022/10/11
			이름 : 조광호
			내용 : JSP include 액션태그 실습하기
			
			include 액션태그
			 - 일반적으로 UI 모듈을 삽입할 때 사용하는 태그
			 - 동적타임에 삽입(include 지시자는 정적타임에 삽입이 이루어진다.)
		 -->
	</head>
	<body>
		<h3>include 액션태그</h3>
		
		<h4>include 지시자</h4> <!-- 정적타임 -->
		<%@ include file="/inc/_header.jsp" %>
		<%@ include file="/inc/_footer.jsp" %>
		<%@ include file="/inc/_config1.jsp" %> <!-- 위아래 바뀌면 참조못함  -->
		<% 
			out.print("num1 : " + num1 + "<br>");
			out.print("num2 : " + num2 + "<br>");
			out.print("num3 : " + num3 + "<br>");
		%>
		<h4>include 태그</h4> <!--  동적타임 -->
		<jsp:include page="/inc/_header.jsp"></jsp:include>
		<jsp:include page="/inc/_footer.jsp"></jsp:include>
		<jsp:include page="/inc/_config2.jsp"></jsp:include>
		<%
			// _config2.jsp가 동적타임(실행상태)에 include 되기 때문에 정적타임에 참조가 불가
			//out.print("var 1 : " + var1 + "<br>");
			//out.print("var 2 : " + var2 + "<br>");
			//out.print("var 3 : " + var3 + "<br>");
		%>
		<h4>include 메서드</h4>
		<%
			// 이 메서드도 실행할 때 삽입 : 동적타임
			pageContext.include("/inc/_header.jsp");
			pageContext.include("/inc/_footer.jsp");
		%>
	</body>
</html>