<%@page import="Config.DBCP2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Bean.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<BookBean> bbs = new ArrayList<>();
	
	try{
		Connection conn = DBCP2.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select * from `book`");
		
		while(rs.next()){
			BookBean bb = new BookBean();
			bb.setBookId(rs.getInt(1));
			bb.setBookName(rs.getString(2));
			bb.setPublisher(rs.getString(3));
			bb.setPrice(rs.getInt(4));
			
			bbs.add(bb);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book :: list</title>
	</head>
	<body>
		<h3>도서목록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">도서등록</a>
		
		<table border="1">
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>출판사</th>
				<th>가격</th>
				<th>관리</th>
			</tr>
			<% for(BookBean bb : bbs) {%>
			<tr>
				 <td><%= bb.getBookId() %></td>
				 <td><%= bb.getBookName() %></td>
				 <td><%= bb.getPublisher() %></td>
				 <td><%= bb.getPrice() %></td>
				 <td>
				 	<a href="./modify.jsp?bookId=<%= bb.getBookId()%>">수정</a>
				 	<a href="./delete.jsp?bookId=<%= bb.getBookId()%>">삭제</a>
				 </td>
			</tr>
			<% } %>
		</table>
	</body>
</html>