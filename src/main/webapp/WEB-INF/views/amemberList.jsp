<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.center {
	width: 500px;
	height: 700px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	text-align:center;
	background-image: url("./images2/strawberry.jpg"); 

 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555;
}
.container_wrap {
  padding: 100px 0 150px;
  background-image: url("./images/image2.jpg"); 
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
h1 {
	font-size:30px;
}

</style>
<Br><Br><Br><Br><Br><Br>

<title>상품 등록</title>
</head>
<body>
  <!--HEADER-->
  <header>
   <jsp:include page="header.jsp"/>
  </header>
  
<div class="section">
 <div class="container_wrap">
 
 <div class="center">

 <h1>전체 회원 목록</h1>

		<c:forEach var="mem" items="${mlist}">
			${mem.user_name}<br>
				${mem.user_birth_year}년${mem.user_birth_month}월${mem.user_birth_day}일<br>		
				${mem.phoneNumber}<br>
				${mem.mail1}@${mem.mail2}<br>	
			>${mem.address} ${mem.detailAddress}<br>
		</c:forEach>
	
</div>
	</section>

	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
</body>
</html>




