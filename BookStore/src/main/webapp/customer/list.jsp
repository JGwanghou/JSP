<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.DBCP2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<CustomerBean> cbs = new ArrayList<>();

	try{
		Connection conn = DBCP2.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select * from `customer`");
		
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
			cb.setCustId(rs.getInt(1));
			cb.setName(rs.getString(2));
			cb.setAddress(rs.getString(3));
			cb.setPhone(rs.getString(4));
			
			cbs.add(cb);
			
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BookStore</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		
		<table border="1">
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(CustomerBean cb : cbs) { %>
			<tr>
				<td><%= cb.getCustId()%></td>
				<td><%= cb.getName() %></td>
				<td><%= cb.getAddress() %></td>
				<td><%= cb.getPhone() %></td>
				<td>
					<a href="./modify.jsp?custId=<%= cb.getCustId()%>">수정</a>
					<a href="./delete.jsp?custId=<%= cb.getCustId()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>