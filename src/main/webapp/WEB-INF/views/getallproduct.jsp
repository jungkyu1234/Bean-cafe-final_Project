<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
<title>Bean cafe Coffee Korea</title>

<!--브라우저 스타일 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />

<link rel="stylesheet" href="./css/common(product).css" />
 <link rel="stylesheet" href="./css/common.css" />
  <link rel="stylesheet" href="./css/FinalProjectmain.css" />
  
</head>

<section class="container_wrap">
	<style type="text/css">
.section {
	width: 750px;
	height: 800px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	text-align: center;
	background-image: url("./images2/board.jpg"); background-size : cover;
	margin : 0 auto;
	border-radius: 6px;
	background-color: #F6F5F0;
	box-shadow: 2px 2px 20px rgba(0, 0, 0, .3);
	color: #555;
	margin: 0 auto;
	border-radious:10px;
	background-size: cover
}

.container_wrap {
	padding: 110px 0 150px;
	background-image: url("./images/image2.jpg");
	background-repeat: no-repeat; background-position : center;
	background-attachment: fixed;
	background-size: cover;
	background-position: center;
}

h1 {
	font-size: 30px;
}

.sub-text {
	color: #ddd;
	font-size: 50px;
	text-align: center;
}

.tb_h {
	height: 10%;
	color:#ddd;
	padding-bottom: 90px;
}

.p_name {
	padding-left:80px;
}

.price {
	width: 40%;
	color: black;
	float: right;
	padding-right: 100px;
}

.bottom {
	
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function () {
	
		$(".p_name2").on("click", function() {
			location.href="productinfo?p_name="+this.innerHTML;
		
		})
	})
</script>
	<title>상품 등록</title>
	</head>
	<body>
		<div class="container_wrap">
			<!--HEADER-->
			<header>
				<jsp:include page="header.jsp" />
			</header>
			<div class="sub-text"></div>
			<div class="section">

				<div class="tb_h">
					<h1>DAILY 메뉴 리스트</h1>
				</div>
				<c:forEach var="all" items="${allproduct}">
					<div class="p_name">
						<span class="p_name2" value="${all.p_name}">${all.p_name}</span>
						<!-- <a href="productinfo?p_name=${all.p_name}">${all.p_name}</a> -->
						 <span class="price"> ${all.p_price} 원 </span>
					</div>

				</c:forEach>
</section>

<!-- <footer> -->
  <footer>
  <!--AWARDS-->
  <section class="awards">
  
   <div class="inner">
      <ul class="menu">
        <li><a href="javascript:void(0)" class="green">개인정보처리방침</a></li>
        <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
        <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
        <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
        <li><a href="javascript:void(0)">Bean cafe 카드 이용약관</a></li>
        <li><a href="javascript:void(0)">윤리경영 핫라인</a></li>
      </ul>
    
      <div class="info">
        <span>사업자등록번호 201-81-21515</span>
        <span>(주)Bean cafe 코리아 대표이사 이석구</span>
        <span>TEL : 02) 3015-1100 / FAX : 02) 3015-1106</span>
        <span>개인정보 책임자 : 강기원</span>
      </div>
      <p class="copyright">
        &copy; <span class="this-year"></span> Bean cafe Coffee Company. All Rights Reserved.
      </p>
      </div>
    
      </section> 
   </footer>
</body>
</html>
<!--이미지출처:https://ac-illust.com/ko/clip-art/2662255-->



