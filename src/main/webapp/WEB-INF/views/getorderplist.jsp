<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean cafe Coffee Korea</title>
  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="resources/css/common(order).css" />

  <script src="/resources/js/common.js" defer></script>
  <script src="/resources/js/main.js" defer></script>
</head>
<body>
  <!--HEADER-->
  <header>
    <jsp:include page="header.jsp"/>
  </header>
 <section class="container_wrap">

 <style type="text/css">
.container {
	width: 500px;
	height: 450px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;

 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555;
}
.container_wrap {
  padding: 400px 0 150px;
  margin-top:120px;
  background-image: url("/resources/images/image2.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}

h1 {
	text-align:center;
	font-size:20px;
	padding-top:15px;
}

th {
	text-align:center;
	padding:5px;
}
</style>
<Br><Br><Br><Br><Br><Br>

  <div class="container">
		<div class="form_container">
		
<!-- /////////////////////////////////////////////// jsp 본문 -->		
	<h1>비회원 주문 상세 내역<br>
		주문 번호 : ${order_num}</h1>
	
	<table border="2" width="500px">
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
	<h1>결제금액 : <c:out value="${total}" />원</h1>
	
<!-- ////////////////////////////////////////////// jsp end -->

</div>
</div><Br><Br><Br><Br><Br><Br>
</section>
 <!--FOOTER-->
  <footer>
    <jsp:include page="footer.jsp"/>
   </footer>	
</body>
</html>