<%@page import="College.co.kr.dao.CollegeDAO"%>
<%@page import="College.co.kr.db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="College.co.kr.college.CollegeBean"%>
<%@page import="College.co.kr.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	CollegeDAO dao = CollegeDAO.getInstance();
	
	List<CollegeBean> cbs = dao.selectRegister();
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>College :: register</title>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(function(){
			
			$('.btnRegister').click(function(){
				$('section').show();
			})
			
		})
	</script>
	<body>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h3>수강현황</h3>
		<input type="text" name="regSearch">
		<button class="btnSearch">검색</button>
		<button class="btnRegister">수강신청</button>
		
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
			<% for(CollegeBean cb : cbs) { %>
			<tr>
				<td><%= cb.getStdNo() %></td>
				<td><%= cb.getStdName() %></td>
				<td><%= cb.getLecName() %></td>
				<td><%= cb.getRegLecNo() %></td>
				<td><%= cb.getRegMidScore() %></td>
				<td><%= cb.getRegFinalScore() %></td>
				<td><%= cb.getRegTotalScore() %></td>
				<td><%= cb.getRegGrade() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h3>수강신청</h3>
			
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="regStdNo"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="regStdName"></td>
				</tr>
				
				<tr>
					<td>신청강좌</td>
					<td>
						<select name="regLecNo">
							<option>강좌선택</option>
							<option value="167">운영체제론</option>
							<option value="234">중급영문법</option>
							<option value="239">세법개론</option>
							<option value="248">빅데이터 개론</option>
							<option value="253">컴퓨팅사고와 코딩</option>
							<option value="349">사회복지 마케팅</option>
							<option value="159">인지행동심리학</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"></td>
				</tr>
			</table>
		</section>
	</body>
</html>