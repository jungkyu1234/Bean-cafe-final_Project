<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean cafe Coffee Korea</title>
  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="./css/common(order).css" />

  <script src="/resources/js/common.js" defer></script>
  <script src="/resources/js/main.js" defer></script>
</head>
<body>
  <!--HEADER-->
  <header>
    <jsp:include page="header.jsp"/>
  </header>
 <section class="container_wrap">

 <style type="text/css">
.container {
	width: 380px;
	height: 230px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	background-image: url("./images2/box.png"); 
	background-size: cover;
	
 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555;
}
.container_wrap {
  padding: 200px 0 150px;
  margin-top:120px;
  background-image: url("./images/image2.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
h1 {
	text-align:center;
	font-size:20px;
	padding-top:10px;
}
td {
	padding:5px;
}
 footer .inner {
  padding: 4px 0 60px 0;
} 
</style>
<Br><Br><Br><Br><Br><Br>

  <div class="container">
		<div class="form_container" align="center">
		
<!-- /////////////////////////////////////////////// jsp 본문 -->		
	<h1>비회원 주문 조회</h1>
	<form action="getorderlist" method="post">
		<table border="1">
			<tr><td>주문자 이름</td><td><input type="text" name="or_name" required/></td></tr>
			<tr><td>주문자 전화번호</td><td><input type="text" name="or_tel" placeholder="000-000-0000" required/></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="조회" />
					<input type="reset" value="취소" /></td></tr>
		</table><br><br>
	</form>

	
<!-- ////////////////////////////////////////////// jsp end -->

</div>
</div><Br><Br><Br>
</section>
<!-- <footer> -->
	 <footer>
 
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