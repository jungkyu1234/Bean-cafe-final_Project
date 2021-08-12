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
    height: auto; 
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

<body>
<h1>상품 수정</h1>
<form action="updateProduct" onsubmit="return confirm('수정하시겠습니까?');">
		<table>
		<tr><td>상품번호</td><td><input type="text" value="${p_no}" name="p_no"/></td></tr>
		<tr><td>상품명</td><td><input type="text" value="${p_name}" name="p_name"/></td></tr>
		<tr><td>가격</td><td><input type="text" value="${p_price}" name="p_price"/></td></tr>
		<tr><td>재고</td><td><input type="text" value="${p_amount}" name="p_amount"/></td></tr>
		<tr><td>이미지url</td><td><input type="text" value="${p_imguri}" name="p_imguri"/></td></tr>
		<tr><td>상세설명</td><td><input type="text" value="${description}" name="description"/></td></tr>
		<tr><td><input type="hidden" value="${p_no}" name="no1"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정하기" /></td></tr>
		</table>
	</form>
	<a href="deleteProduct?name=${p_name}" onclick="return confirm('삭제하시겠습니까?');">상품삭제</a>
	
<a href="admin">[관리자 메뉴]</a>	
</body>
</div><Br><Br><Br><Br><Br><Br>
	</section>
	
	<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	
   </div>
</body>
</html>

