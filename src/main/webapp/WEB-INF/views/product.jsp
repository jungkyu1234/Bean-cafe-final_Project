<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
<title>CaffeMicks Coffee Korea</title>

<!--브라우저 스타일 초기화-->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
    href="https://fonts.googleapis.com/icon?family=Material+Icons" />

<link rel="stylesheet" href="./css/common(product).css" />

</head>

<section class="container_wrap">
    <style type="text/css">
.center {
    width: 950px;
    height: 630px;
    margin: auto;
    border-radius: 3px;
    box-shadow: 0px 0px 20px #000;
    text-align: center;
    margin: 0 auto;
    border-radius: 6px;
    background-color: #F6F5F0;
    box-shadow: 2px 2px 20px rgba(0, 0, 0, .3);
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
    font-size: 30px;
}

.sub-text {
    font-size: 50px;
    color: #ddd;
    text-align: Center;
}

.product {
    padding-top: 30px;
    align: center;
}
.pimg{
float: left;
width:50%;
padding-top:50px;
padding-left: 30px;
}
.pdis{
float: right;
width: 40%;
padding-right: 20px;
padding-top: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function tprice() {
    
    var tprice=0;
    var price=$('#rprice').val();
    var amount=$("#amount").val();

    
     tprice=parseInt(price)*parseInt(amount);
    
    $('#price').text(tprice+" 원");
}
</script>

    <title>상품 등록</title>
    </head>
    <body>
        <!--HEADER-->
        <header>
            <jsp:include page="header.jsp" />
        </header>

        <form action="/inputcart" method="post">
        <div class="section">
            <div class="container_wrap">

                <div class="center">

                    <div class="product">
                        <div class="pname">
                            <h1>${p_name}</h1>
                            <input type="hidden" name="p_name" value="${p_name}">
                        </div>
                        <div class="pimg">
                             <img src="${p_imguri}" width="380px">
                             <input type="hidden" name="p_imguri" value="${p_imguri}">
                        </div>     
                        <div class="pdis">
                            <div>${p_dis }</div>
                            <div><p id="price" name="tprice">${p_price}원</p> <input type="hidden" id="rprice" name="p_price" value="${p_price}"></div>
                                [수량] <input type="number" id="amount" name="p_amount" min="1" max="10" onchange="tprice()">
                                    
                                <h3><input type="submit"value="장바구니 추가하기"></h3>
                                <br>
                                <input type="hidden" name="p_no" value="${p_no}">
                        </div>        
                    </div>
</section>
</form>
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