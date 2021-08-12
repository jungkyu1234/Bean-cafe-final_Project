<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

 <!--브라우저 스타일 초기화-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />


<style>
.container {
    width:  1200px;
    height: auto;
    margin: auto;
    
    /* 	width: 30%;
	height: 70%;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	background-image: url("/resources/images2/strawberry.jpg"); 

 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555; */
    
    
}
 .head{
      font-size:40px;
  padding-bottom:80px;
   text-align:center;
  }
  span{
    padding-left:100px;
   
    
  }
  hr{
    margin-top:20px;
  }
  .item{
    width:1200px;
    padding-bottom:20px;
    
  }
  span.pname{
       
       width:300px;
       height: 130px;
       vertical-align:middle;
       margin-left:200px;
       font-size:23px;
  }
  span.img{
      
    width: 300px;
    margin-left:100px;
  }
  span.price{
  /* float:right; */
  width:100px;
  height: 130px;
  vertical-align:bottom;
  margin-left:300px;
  margin-bottom:100px;
  font-size:23px;
  }
  .tprice {
  	font-size:23px;
  }
  .buy_btn{
    margin-top:50px;
    margin-right:30px;
    float:right;
  }
 #image {
 	width:200px;
 	height: 130px;
 	vertical-align:middle;
 }
.item__name {
	margin-left:1000px;
	margin-top:10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>


    $(document).ready(function() {
        var plist=$("span[name=price]");
        var sum=0;
        for(var i=0; i<plist.length; i++){
            sum+=Number(plist[i].innerHTML);
        }
        $(".tprice").text(sum);
        console.log(sum);
    })

    function delete22() {
        var varArr = new Array();
        var list =$("input[name=cart_del]");
        for(var i=0; i< list.length; i++){
            if(list[i].checked){
                varArr.push(list[i].value);
            }
        }
        console.log(varArr);
        if(varArr.length==0){
            alert("선택된 물품이 없습니다.");
        }else{
            
            $.ajax({
                url:'/deleteCart',
                type:'POST',
                data:{
                    varArr: varArr
                },
                success: function(data) {
                    if(data==1){
                        alert("삭제되었습니다.");
                        location.href="/cart2";
                    }
                }
            })
        }
        
    }    
      
    function aa(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp12811275'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var tprice=Number($(".tprice").text());
        var pname=String($(".pname").text());
        
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : pname,
    amount : 1000, <%--<%=totalPrice%>--%>
   <%--  buyer_email : 'iamport@siot.do', <%=email%>
    buyer_name : '구매자이름', <%=name%>
    buyer_tel : '010-1234-5678', <%=phone%>
    buyer_addr : '서울특별시 강남구 삼성동', <%=address%> --%>
   // buyer_postcode : '123-456'
}, function(rsp) {
     if ( rsp.success ) {
         
         var msg =  '결제가 완료되었습니다.';
          msg += '\n고유ID : ' + rsp.imp_uid;
         /*msg += '\n상점 거래ID : ' + rsp.merchant_uid; */
         msg += '\n결제 금액 : ' + rsp.paid_amount;
         msg += '\n카드 승인번호 : ' + rsp.apply_num;
         location.href="/";
         
         } else {
         msg = '결제에 실패하였습니다.';
         msg += '에러내용 : ' + rsp.error_msg;
         location.href="";
         }
         alert(msg);
         });
         };
</script>
</head>
<jsp:include page="header.jsp"/>
<body>

    <div class="container">
    <Br><Br><Br>
        <div class="head">장바구니</div>
        <c:forEach var="cart" items="${cart}">
            <div class="item">
             <%--  <input type="checkbox" name="cart_del" value="${cart.order_num}"> --%>
                <span class="img">
                <img src="${cart.p_imguri}" id="image"></span> <span class="pname">${cart.p_name}</span> 
                <span name="price" class="price">${cart.p_price}</span>
              <hr>
            </div>
      </c:forEach>
          <div class="item">
         <span name="tprice" class="tprice" name="tprice" style="float:right">0 </span>
            </div>
      <Br><Br><Br><Br>
            
       <!--  <input type="button" value="삭제" onclick="delete22();" > -->
          <input type="button" id="buy_btn" class="buy_btn" onclick="aa();" value="결제하기">
    </div> 
 
 <Br><Br><Br><Br><Br></section><Br><Br><Br><Br>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>