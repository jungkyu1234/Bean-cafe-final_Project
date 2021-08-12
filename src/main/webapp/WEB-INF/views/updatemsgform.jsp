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
	width: 250px;
	/* height: 250px; */ 
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
	<h1>주문 상태 변경</h1>
	<h3>주문 번호 : ${order_num}</h3>
	<h3>현재 주문 상태 : ${ordermsg.or_msg}</h3>
	
	<form action="updatemsg" onsubmit="return confirm('수정하시겠습니까?');">
		<table>
		<tr><td><input type="radio" value="주문완료" name="or_msg"/> 주문완료</td></tr>
		<tr><td><input type="radio" value="배송준비" name="or_msg"/> 배송준비</td></tr>
		<tr><td><input type="radio" value="배송완료" name="or_msg"/> 배송완료</td></tr>

		<tr><td><input type="hidden" value="${order_num}" name="order_num"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="변경하기" />
							<input type="reset" value="취소" /></td></tr>
		</table><br>
	</form>
	
<a href="aordermlist">[주문목록조회]</a>
</body>
<!-- //////////////////////////////////////////////////////////////////////////// -->

 </div><Br><Br><Br><Br><Br><Br>
	</section>
	
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>











</html>