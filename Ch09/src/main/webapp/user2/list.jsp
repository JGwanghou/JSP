<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
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
			<tr>
				<td>a101</td>
				<td>내이름!</td>
				<td>010-1111-1111 </td>
				<td>14</td>
				<td>
					<a href="/Ch09/user2/modify.do?uid=">수정</a>
					<a href="/Ch09/user2/delete.do?uid=">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>