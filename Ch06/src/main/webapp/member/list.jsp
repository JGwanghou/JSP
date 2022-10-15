<%@page import="bean.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java2db";
	String user = "root";
	String pass = "1234";
	
	List<MemberBean> members = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `member`");
		
		while(rs.next()){
			
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			
			members.add(mb);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>member::list</title>
	</head>
	<body>
		<h3>member 목록</h3>
		<a href="../1_JDBCTest.jsp">처음으로</a>
		<a href="./register.jsp">member 등록하기</a>		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>관리</th>
			</tr>
			<% for(MemberBean mb : members){ %>
				<tr>
					<td><%= mb.getUid() %></td>
					<td><%= mb.getName() %></td>
					<td><%= mb.getHp() %></td>
					<td><%= mb.getPos() %></td>
					<td><%  mb.getDep(); %></td>
					
					<td>
						<a href="./modify.jsp?uid=<%= mb.getUid() %>">수정</a>
						<a href="./delete.jsp?uid=<%= mb.getUid() %>">삭제</a>
					</td>			
				</tr>
			<% } %>
		</table>		
	</body>
</html>