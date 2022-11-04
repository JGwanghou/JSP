<%@page import="kr.co.Shop.Bean.ShopBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.Shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ShopBean> sbs = new ArrayList<>();
	
	request.setCharacterEncoding("UTF-8");
	
	try{
		Connection conn	 = DBCP.getConnection();
		Statement stmt	 = conn.createStatement();
		ResultSet rs	 = stmt.executeQuery("Select * from `customer`");
		
		while(rs.next()){
			ShopBean sb = new ShopBean();
			sb.setCustId(rs.getString(1));
			sb.setName(rs.getString(2));
			sb.setHp(rs.getString(3));
			sb.setAddr(rs.getString(4));
			sb.setRdate(rs.getString(5));
			
			sbs.add(sb);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop :: customer</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
			<% for (ShopBean sb : sbs){ %>
			<tr>
				<td><%= sb.getCustId() %></td>
				<td><%= sb.getName() %></td>
				<td><%= sb.getHp() %></td>
				<td><%= sb.getAddr() %></td>
				<td><%= sb.getRdate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>