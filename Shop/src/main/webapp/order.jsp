<%@page import="kr.co.Shop.Bean.ShopBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.Shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	List<ShopBean> sbs = new ArrayList<>();
	
	try{
		Connection conn	 = DBCP.getConnection();
		String sql = "SELECT `orderno`, `name`, `prodname`, `ordercount`, `orderdate` FROM "
				   + "`order` as a join `customer` as b "
				   + "on a.orderid = b.custid join `product` as c "
				   + "on a.orderproduct = c.prodno";
				
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			
			ShopBean sb = new ShopBean();
			
			sb.setOrderNo(rs.getInt(1));
			sb.setCustId(rs.getString(2));
			sb.setProdName(rs.getString(3));
			sb.setOrderCount(rs.getInt(4));
			sb.setOrderdate(rs.getString(5));
			
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
		<title>Shop :: order</title>
	</head>
	<body>
		<h3>주문목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>	
			</tr>
			
			<% for (ShopBean sb : sbs ) { %>
			<tr>
				<td><%= sb.getOrderNo() %></td>
				<td><%= sb.getCustId() %></td>
				<td><%= sb.getProdName() %></td>
				<td><%= sb.getOrderCount() %></td>
				<td><%= sb.getOrderdate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>