<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
 <title>Bean cafe Coffee Korea</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="./css/common(product).css" />

</head>

 <section class="container_wrap">
 <style type="text/css">
.section {
	width: 500px;
    height: 230px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	text-align:center;
	background-size: cover;
	

 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555;
}
.container_wrap {
  padding: 150px 0 150px;
  background-image: url("./images/image2.jpg"); 
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
h1 {
	color:black;
	font-size:30px;
}

</style>
<Br><Br><Br><Br><Br><Br>

<title>상품 등록</title>
</head>
<body>
<div class="container_wrap">
  <!--HEADER-->
  <header>
   <jsp:include page="header.jsp"/>
  </header>
  
<div class="section">


<!-- //////////////////////////////////////////////////////////////////////////// -->
<body>

<h1>전체 주문자 정보</h1>
	<table border="2">
		<tr><th>주문번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>주문날짜</th><th>주문현황</th>
		<c:forEach var="omlist" items="${ordermlist}">
		<tr><th><a href="aorderplist?order_num=${omlist.order_num}">${omlist.order_num}</a></th>
			<th>${omlist.or_name}</th>
			<th>${omlist.or_tel}</th>
			<th>${omlist.or_addr}</th>
			<th><fmt:formatDate value="${omlist.or_date}" type="date"/></th>
			<th><a href="getmsg?order_num=${omlist.order_num}"
				onclick="return confirm('배송을 시작하시겠습니까?');">${omlist.or_msg}</a></th></tr>
		</c:forEach>
	</table><br><br>
	</div>

<!-- //////////////////////////////////////////////////////////////////////////// -->
 </div><Br><Br><Br>
	</section>
	
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>



