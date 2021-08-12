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
.section {
	width: 280px;
	/* height: 250px; */ 
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	text-align:center;
	background-image: url("./images2/admin.png"); 
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

<!-- 회원목록 , 결제내역 , 오더 1,2출력 , 상품목록수정  -->
<h1>ADMIN</h1>
<aside>
<ul>
	<li><a href="insertForm">상품등록</a></li>
	<li><a href="adminProduct">상품관리</a></li>
	<li><a href="aordermlist">주문목록</a></li>
	<li><a href="amemberList">회원목록</a></li>
</ul>
</aside>

 </div><Br><Br><Br><Br><Br><Br>
	</section>
	
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>




