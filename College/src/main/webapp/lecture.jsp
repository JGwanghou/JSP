<%@page import="College.co.kr.dao.CollegeDAO"%>
<%@page import="College.co.kr.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="College.co.kr.college.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="College.co.kr.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	CollegeDAO dao = CollegeDAO.getInstance();
	
	List<CollegeBean> cbs = dao.selectLecture();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>College :: lecture</title>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(function(){
			
			$('.lecRegister').click(function(){
				$('section').show();
			});
			
			$('input[type=submit]').click(function(){
				let lecNo	 = $('input[name=lecNo]').val();
				let lecName	 = $('input[name=lecName]').val();
				let lecCredit = $('input[name=lecCredit]').val();
				let lecTime	 = $('input[name=lecTime]').val();
				let lecClass = $('input[name=lecClass]').val();
				
				let jsonData = {
						"lecNo":lecNo,
						"lecName":lecName,
						"lecCredit":lecCredit,
						"lecTime":lecTime,
						"lecClass":lecClass
				};
				
				$.ajax({
					url:'/College/proc/lectureProc.jsp',
					method:'get',
					data: jsonData,
					dataType:'json',
					success: function(data){
						if(data.result == 1){
							console.log(data);
							alert('강좌 등록이 완료되었습니다.');
						}else{
							alert('강좌 등록에 실패했습니다.');
						}
					}
				})
			})
			
			
			
		})
	</script>
	<body>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h3>강좌현황</h3>
		
		<button class="lecRegister">등록</button>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
			</tr>
			<% for(CollegeBean cb : cbs) { %>
			<tr>
				<td><%= cb.getLecNo() %></td>
				<td><%= cb.getLecName() %></td>
				<td><%= cb.getLecCredit() %></td>
				<td><%= cb.getLecTime() %></td>
				<td><%= cb.getLecClass() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h3>강좌등록</h3>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="lecNo"></td>
				</tr>
				
				<tr>
					<td>강좌명</td>
					<td><input type="text" name="lecName"></td>
				</tr>
				
				<tr>
					<td>학점</td>
					<td><input type="text" name="lecCredit"></td>
				</tr>
				
				<tr>
					<td>시간</td>
					<td><input type="text" name="lecTime"></td>
				</tr>
				
				<tr>
					<td>강의장</td>
					<td><input type="text" name="lecClass"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="추가"></td>
				</tr>
			</table>
		</section>
	</body>
</html>