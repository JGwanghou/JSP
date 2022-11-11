<%@page import="College.co.kr.dao.CollegeDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="College.co.kr.db.DBCP"%>
<%@page import="College.co.kr.college.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	CollegeDAO dao = CollegeDAO.getInstance();
	
	List<CollegeBean> cbs = dao.selectStudent();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>College :: student</title>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(function(){
			$('.btnRegStd').click(function(){
				$('section').show();	
			});
			
			$('input[type=submit]').click(function(){
				let stdNo	 = $('input[name=stdNo]').val();
				let stdName	 = $('input[name=stdName]').val();
				let stdHp	 = $('input[name=stdHp]').val();
				let stdYear	 = $('select[name=stdYear]').val();
				let stdAddress = $('input[name=stdAddress]').val();
				
				let jsonData = {
						"stdNo":stdNo,
						"stdName":stdName,
						"stdHp":stdHp,
						"stdYear":stdYear,
						"stdAddress":stdAddress
				};
				
				$.post('/College/proc/studentProc.jsp', jsonData, function(data){
					
					if(data.result > 0){
						console.log(data);
						alert('등록이 완료되었습니다.');
					}else{
						alert('등록에 실패했습니다.');
					}
					
				})
				
			})
			
		})
	 </script>
	<body>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h3>학생목록</h3>
		<button class="btnRegStd">등록</button>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
			</tr>
			<% for (CollegeBean cb : cbs) { %>
			<tr>
				<td><%= cb.getStdNo() %></td>
				<td><%= cb.getStdName() %></td>
				<td><%= cb.getStdHp() %></td>
				<td><%= cb.getStdYear() %></td>
				<td><%= cb.getStdAddress() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h3>학생등록</h3>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp"></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<select name="stdYear">
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</section>
	</body>
</html>