<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상품 내역</title>
</head>
<!-- //////////////////////////////////////////////////////////////////////////// -->
<body>
	<h1>주문 상품 내역</h1>
	<h3>주문 번호 : ${order_num}</h3>
	
	<table border="2">
		<tr><th>상품명</th><th>가격</th><th>주문수량</th><th>합계</th></tr>
		<c:set var="total" value="0" />
		<c:forEach var="plist" items="${orderplist}">
			<tr><th>${plist.p_name}</th>
				<th>${plist.p_price}</th>			
				<th>${plist.p_quantity}</th>
				<th>${plist.p_tprice}</th></tr>
		<c:set var="total" value="${total + plist.p_tprice}" />
		</c:forEach>
		
		</table>
	<h3>결제금액 : <c:out value="${total}" />원</h3>

<a href="aordermlist">[주문자 내역]</a>
</body>
<!-- //////////////////////////////////////////////////////////////////////////// -->
</html>