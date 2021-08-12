<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
 <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta charset="UTF-8">

<style type="text/css">
.container {
	width: 380px;
	height: 520px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	background-image: url("./images2/iphone.jpg"); 
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
.form_container {
	width: 300px;
	margin: auto;
}

.login_title {
	margin: auto;
	text-align: center;
}

.login_title_p {
	font-weight: bold;
	font-size: 22px;
	display: inline-block;
	padding-top: 8px;
}

.form_input {
	width: 65%;
	height: 30px;
	border: 1px solid;
	border-radius: 3px;
	border-color: gray;
	margin-top: 5px;
}

.form_item_name {
	color: gray;
}

.form_item {
	margin-top: 30px;
}

.form_submit_button {
	width: 80%;
	height: 44px;
	background-color: rgb(83, 154, 236);
	border: 1px;
	border-radius: 3px;
	color: white;
	font-size: 17px;
	font-weight: 500;
	margin-top: 50px;
	margin-left: 10%;
}

.form_bot {
	margin-top: 50px;
}
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="header.jsp"/>

<!--브라우저 스타일 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />

<link rel="stylesheet" href="./css/common(product).css" />

<div class="container_wrap">
<script>

$(document).ready(function () {
	$("#findID").click(function () {
	
		var user_name=$('#user_name').val();
		$.ajax({
			type:'GET',
			url:"/findIDa",
			//dataType:"json",
			data:{
				 user_name:$('#user_name').val(),
				 phoneNumber:$('#phoneNumber').val()
			},
			success:function(data){
				Swal.fire(data);
			
			},
			error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	
		})
		
	})
});

</script>

</head>
<body>
	<Br><Br>
	<div class="container">
		<div class="form_container">
		<!--<form action="/findIDa" method="GET">-->
				<sec:authorize access="isAnonymous()">
				
				<div class="login_title">
					<p class="login_title_p">아이디 찾기</p>
				</div>
				<div>
					<a class="form_item_name">이름</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_name" id="user_name"
						placeholder="이름입력">
				</div>
				<div class="form_item">
					<a class="form_item_name">휴대전화</a>
					
				</div>
				<div>
					<input type="text" class="form_input" name="phoneNumber"
						id="phoneNumber" placeholder="휴대전화 입력">
				</div>
				<div>
					<p>${msg}</p>
				</div>
				<div>
					<!-- <input type="submit" class="form_submit_button" value="아이디찾기">--> 
					<input type="button" id="findID" class="form_submit_button"
						value="아이디 찾기">
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
			
			</div>
		
		</div>
	</div>
	
</section><Br><br>
</div>
<!-- <footer> -->
	 <footer><br>
   <jsp:include page="footer.jsp"/>
   </footer>	

</body>
</html>