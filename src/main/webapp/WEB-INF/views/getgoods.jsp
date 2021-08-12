<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 전체 보기</title>

<!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="./css/common(product).css" />

</head>

<section class="container_wrap">
    <style type="text/css">
    
.container_wrap {
  padding: 170px 0 150px;
  margin-top:117px;
   background-image: url("./images/image2.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
.center {
	width: 350px;
	height: 360px;
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
p{
	text-align:center;
}
.a {
color:white;
text-align:center;
}
h1 { 
	font-size: 25px;
}
</style>

<jsp:include page="header.jsp"/>

<div class="sub-text">
        <strong>굿즈 상품 리스트</strong>
      </div>
     <link rel="stylesheet" href="./css/cardList copy_style(getgoods).css">
  </head>
  <body>
 <div class="center">
   <h1>굿즈 상품 보기</h1>
	<!-- <table border="2"> -->
	
		<!-- <tr> -->
		<th>상품명</th>
		<!-- <tr> --><th><br><a href="productinfo?p_name=${glist.p_name}">${glist.p_name}</a></th>
		
		<th>가격</th>
		</tr>
		<c:forEach var="glist" items="${goods}">
			<tr><th><br><a href="productinfo?p_name=${glist.p_name}">${glist.p_name}</a></th>
				<br><th>${glist.p_price}</th></tr>
				
		</c:forEach>
	</table><br>
<a href="getallproduct">[전체상품목록]</a>
<a href="getcoffee">[커피상품목록]</a>
<a href="getmailing">[구독상품목록]</a><br><br>
</section>
</div>
</body>
<!-- footer -->
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</html>