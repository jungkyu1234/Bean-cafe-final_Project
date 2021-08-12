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
 .section {
	width: 300px;
	height:400px;
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
  padding: 170px 0 150px;
  margin-top:117px;
  background-image: url("./images/image2.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
p{
	text-align:center;
}
.a {
color:white;
text-align:center;
}
</style>
<jsp:include page="header.jsp"/>
<div class="sub-text">
        <strong>원두 구독 서비스</strong>
      </div>
     <link rel="stylesheet" href="./css/cardList copy_style(getmailing).css">
  </head>
  <body>
 <div class="section">
   <h1>구독 상품 보기</h1>
	<!-- <table border="2"> -->
		${mlist.p_name}</a> <!-- 1month, 50000 -->
		${mlist.p_price}
		<img src="./p_img/9.jpg">	

<c:forEach var="mlist" items="${mailing}"><Br><!-- 필수 -->
			<a href="productinfo?p_name=${mlist.p_name}"> <!-- <Br> -->${mlist.p_name}</a>
				${mlist.p_price}</tr><!-- <Br> -->
			</c:forEach>
			<Br><img src="./p_img/10.jpg">
		<c:forEach var="mlist" items="${mailing}"><!-- 필수 -->
		</c:forEach>
<!-- 	</table><br><br> -->
</div>
</section>
</body>
<!-- footer -->
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</html>

