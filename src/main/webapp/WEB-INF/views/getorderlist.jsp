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
	height: 170px;
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
  padding: 100px 0 150px;
  margin-top:120px;
  background-image: url("./images/image2.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}

h1 {
	text-align:center;
	font-size:20px;
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


	<h1>비회원 주문자 정보</h1>
	<table border="2" width="500px">
		<tr><th>이름</th><th>전화번호</th><th>주소</th><th>주문번호</th></tr>
		<c:forEach var="olist" items="${orderlist}">
			<tr><th>${olist.or_name}</th>
				<th>${olist.or_tel}</th>			
				<th>${olist.or_addr}</th>
				<th><a href="getorderplist?order_num=${olist.order_num}">${olist.order_num}</a></th></tr>
		</c:forEach>
	</table>

	
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