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
	width: 350px;
    height: 300px;
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
<jsp:include page="header.jsp"/>
<title>상품 등록</title>
</head>
<body>
<div class="section">
<h1>상품 등록</h1>
	<form action="insertProduct" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr><td>상품번호</td><td><input type="text" name="p_no" required/></td></tr>
			<tr><td>상품명</td><td><input type="text" name="p_name" required/></td></tr>
			<tr><td>가격</td><td><input type="text" name="p_price" required/></td></tr>
			<tr><td>재고수량</td><td><input type="text" name="p_amount" required/></td></tr>
			<tr><td>이미지</td><td><input type="file" name="file" required/></td></tr>
			<!-- 여기서 uri 넘겨주는 폼이 없어도 되는지???? -->
			<tr><td colspan="4" style="text-align: center;"><input type="submit" value="저장" />
			<input type="reset" value="취소" /></td></tr>
		</table><br><br>
	</form>
	
 </div><Br><Br><Br><Br><Br><Br>
	</section>
	</div>
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>




