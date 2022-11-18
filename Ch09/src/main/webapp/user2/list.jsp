<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 :: list</title>
	</head>
	<body>
		<h3>user 목록</h3>
		<a href="#">처음으로</a>
		<a href="/Ch09/user2/register.do">user 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			
			<c:forEach var="user2" items="${ requestScope.user2 }">
			<tr>
				<td>${ user2.uid }</td>
				<td>${ user2.name }</td>
				<td>${ user2.hp }</td>
				<td>${ user2.age }</td>
				<td>
					<a href="/Ch09/user2/modify.do?uid=${ user2.uid }">수정</a>
					<a href="/Ch09/user2/delete.do?uid=${ user2.uid }">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>