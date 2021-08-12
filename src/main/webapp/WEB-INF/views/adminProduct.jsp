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
	width: 450px;
	height: 580px; 
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
  padding: 150px 0 150px;
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
<div class="container_wrap">
  <!--HEADER-->
  <header>
   <jsp:include page="header.jsp"/>
  </header>
  
<div class="section">
<h1>상품 목록 수정</h1>
	<table border="2">
		<tr><th>상품번호</th><th>상품명</th><th>가격</th><th>재고수량</th><th>이미지url</th></tr>
		<c:forEach var="all" items="${allproduct}">
			<tr><th>${all.p_no}</th>
				<th><a href="getinfo?name=${all.p_name}">${all.p_name}</a></th>
				<th>${all.p_price}</th>
				<th>${all.p_amount}</th>
				<th>${all.p_imguri}</th></tr>
				<!-- <th><button type="button" onclick="location.href='updateForm'">수정</button></th>
				<th><input type="button" id="delete_Btn" class="btn btn-warning">삭제</th> -->
		</c:forEach>
	</table><br><br>
	
	</section>
	
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>




