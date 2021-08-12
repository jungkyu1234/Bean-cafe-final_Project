<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
 <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta charset="UTF-8">
 <title>CaffeMicks Coffee Korea</title>

  <!--브라우저 스타일 초기화-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="resources/css/common(m).css" />
 <section class="container_wrap">
<style type="text/css">
.container {
	width: 380px;
	height: 600px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	background-image: url("/./images2/strawberry.jpg"); 

 	margin: 0 auto;
 	border-radius: 6px;
 	background-color: #F6F5F0;
 	box-shadow: 2px 2px 20px rgba(0,0,0,.3);
  	color: #555;
}
.form_container{
	width:300px;
	margin:auto;
}
.login_title{
	margin:auto;
	text-align: center;
}
.login_title_p{
	font-weight: bold;
	font-size: 22px;
	display:inline-block;
	padding-top: 8px;
}
.form_input{
	width:65%;
	height: 30px;
	border:1px solid;
	border-radius :3px;
	border-color:gray;
	margin-top:5px;  
}
.form_item_name{
	color:gray;
}
.form_item{
  margin-top:30px;  
}  
.form_submit_button{
    width: 80%; 
    height: 44px; 
    background-color: rgb(83, 154, 236); 
    border: 1px; 
    border-radius: 3px; 
    color: white; 
    font-size: 17px; 
    font-weight: 500;
	margin-top:50px;  
  	margin-left:10%;
}
  .form_bot{
    margin-top:50px; 
  }
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
/*
$(document).ready(function () {
	$("#login").click(function () {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";

		
		//var header = ${_csrf.headerName};
		//var token = ${_csrf.token};
		$.ajax({
			type:'POST',
			url:"/logina",
			//dataType:"json",
			data:{
				user_id:$('#user_id').val(),
				user_pw:$('#user_pw').val()
			},
			beforeSend:function(xhr)
			{
				//이거 안하면 403 error
				//데이터를 전송하기 전에 헤더에 csrf값을 설정한다
				xhr.setRequestHeader(header, token);
			},
			success:function(data){
				alert("성공");
			
			},
			error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	
		})
		
	})
});
*/
</script>

</head>
 <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<body>
<header>
  <jsp:include page="header.jsp"/>
  </header>
	<BR><Br><Br><Br>
	<div class="container">
		<div class="form_container">
		<form action="/logina" method="post">
				<sec:authorize access="isAnonymous()">
				
				<div class="login_title">
					<p class="login_title_p">로그인</p>
				</div>
				<div>
					<a class="form_item_name">아이디</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_id" id="user_id"
						placeholder="아이디입력">
				</div>
				<div class="form_item">
					<a class="form_item_name">비밀번호</a>
					
				</div>
				<div>
					<input type="password" class="form_input" name="user_pw"
						id="user_pw" placeholder="비밀번호입력">
				</div>
				<div>
					<p>${msg}</p>
				</div>
				<div>
					 <input type="submit" class="form_submit_button" value="login"> 
					<!--<input type="button" id="login" class="form_submit_button"
						value="login">-->
				</div>
					<div class="form_bot">
					<p>로그인에 문제가 있나요?</p>
				</div>
				<div>
					<a href="/findID">아이디가 기억이 안나요</a>
				</div>
				<div>
					<a href="/rePW">비밀번호를 잊어버리셨나요?</a>
				</div>
				</sec:authorize>
			
			  <div>
			 </form>
			</div>
		  </div>
	   </div>
     </div>
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
