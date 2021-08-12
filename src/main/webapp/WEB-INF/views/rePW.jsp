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
	height: 100%;
	padding-bottom:40px;
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
.btn{
background-color: #8B5927;
	border: 1px;
	border-radius: 3px;
	color: white;
	font-size: 15px;
	font-weight: 500;
	
}
.repw{
	display:none;
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

.alert {
	font-size: 10px;
	color: red;
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
	
	$("#rePW").click(function () {
		if(pw_chk&&pw_chk_chk){
			var user_id=$('#user_id').val();
			$.ajax({
				type:'GET',
				url:"/rePWa",
				//dataType:"json",
				data:{
					 user_pw:$('#user_pw').val(),
					 user_id:$('#user_id').val()
				},
				success:function(data){
					alert(data);
					//통신 후 메인 페이지
					window.location.href = "/";
	
	
				},
				error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		
			})
		}else{
			alert("비밀번호를 다시 확인해 주세요");
		}
	})
	
		//2.비밀번호 유효성 검사
		 var pw_chk=false;
		$(document).ready(function() {
			$("#user_pw").on("propertychange change keyup paste input", function() {
				 var pw = $("#user_pw").val();
				var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			 if(pw.length < 8 || pw.length > 20){
	
				 $('#pw_chk_alert').text("8~12자 이내로 입력해주세요");
				  pw_chk=false;
				 }else if(pw.search(/\s/) != -1){
					 $('#pw_chk_alert').text("비밀번호는 공백을 포함할수 없습니다.");
				  pw_chk=false;
				 }else if(num < 0 || eng < 0 || spe < 0 ){
					 $('#pw_chk_alert').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				  pw_chk= false;
				 }else {
					 $('#pw_chk_alert').text("");
				  pw_chk=true;
				 }
		
			});
		});
		//3.비밀번호 확인 검사
		 var pw_chk_chk=false;
			$(document).ready(function() {
			$("#user_pw_chk").on("propertychange change keyup paste input", function() {
		
			 var pw=$("#user_pw").val();
			 var pw_chk=$("#user_pw_chk").val();
			
			 if(!(pw==pw_chk)){
				 $('#pwchk_chk_alert').text("비밀번호가 일치하지 않습니다.");
				 pw_chk_chk= false;
			 }else{
				 $('#pwchk_chk_alert').text("");
				 pw_chk_chk= true;
			 }
		
			});
		});
	
	
		//8.번호 유효성 검사,휴대폰인증
		var num_chk=false;
		var phone_chk=false;
		
		$(document).ready(function() {
			$("#phoneNumber").on("propertychange change keyup paste input", function() {
				
				var pnum=$("#phoneNumber").val();
				var pnum_reg =  /[^0-9]/gi;
				if(pnum_reg.test(pnum)){
					Swal.fire("숫자만 입력 가능합니다 \n다시 입력 해주세요.");
					$("#phoneNumber").val("");
					num_chk=false;
				}else{
					 $('#pnum_chk_alert').text("");
					 num_chk=true;
				}
				
				});
		
			//8-2휴대폰 인증
			$('#sendPhoneNumber').click(function() {
				var obj=document.getElementsByName("phoneNumber");
				console.log(obj[0].value);
				if(($("#phoneNumber").val().length)!=11){
					Swal.fire('번호 자리 수가 \n유효하지 않습니다.');
				}else{
				let phoneNumber = $('#phoneNumber').val();
				Swal.fire('인증번호 발송 완료!')
				$.ajax({
					type : "GET",
					url : "check/sendSMS",
					data : {
						"phoneNumber" : phoneNumber
					},
					success : function(res) {
						$('#checkBtn').click(function() {
							if ($.trim(res) == $('#inputCertifiedNumber').val()) {
								Swal.fire('인증성공!', '휴대폰 인증이 정상적으로 완료되었습니다.', 'success')
								$(".repw").css({
									"display":"block"
								});
								
								phone_chk=true;
								$('#inputCertifiedNumber').val("인증 완료")
								$('#inputCertifiedNumber').attr("readonly",true);
								$('#checkBtn').css({
									"display":"none"
								});
								console.log(phone_chk);
								console.log(num_chk);
							
							} else {
								Swal.fire({
									icon : 'error',
									title : '인증오류',
									text : '인증번호가 올바르지 않습니다!',
									
									})
								}
							})
		
						}
					})
				}
			});
			
		});//8끝
});

</script>

</head>
<body>

	<Br><Br><Br>
	
	<div class="container">
		<div class="form_container">
		<!--<form action="/findIDa" method="GET">-->
				<sec:authorize access="isAnonymous()">
				
				<div class="login_title">
					<p class="login_title_p">비밀번호 재설정</p>
				</div>
				<div>
					<a class="form_item_name">아이디</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_id" id="user_id"
						placeholder="아이디입력">
				</div>
				<div class="form_item">
					<a class="form_item_name">휴대전화</a>
					
				</div>
				<div>
					<input type="text" class="form_input" name="phoneNumber"
						id="phoneNumber" placeholder="휴대전화 입력"> <span style="margin-left: 10px;">
					<input type="button" id="sendPhoneNumber" class="btn" value="인증"></span>
					<input type="text" class="form_input" id="inputCertifiedNumber"
						placeholder="인증번호"> <span style="margin-left: 10px;">
					<input type="button" id="checkBtn" class="btn" value="확인"></span>
				</div>
				<div class="repw">
					<!-- 비밀번호입력 -->
					<div class="form_item">
						<a class="form_item_name">비밀번호 재설정</a>
					</div>
					<div>
						<input type="password" class="form_input" name="user_pw"
							id="user_pw" placeholder="비밀번호 입력">
						<p id="pw_chk_alert" class="alert"></p>
					</div>
					<!-- 비밀번호 확인 입력 -->
					<div class="form_item">
						<a class="form_item_name">비밀번호 확인</a>
					</div>
					<div>
						<input type="password" class="form_input"
							id="user_pw_chk" placeholder="비밀번호 확인">
						<p id="pwchk_chk_alert" class="alert"></p>
					</div>
				</div>
				<div>
					<!-- <input type="submit" class="form_submit_button" value="아이디찾기">--> 
					<input type="button" id="rePW" class="form_submit_button"
						value="비밀번호 재설정">
				</div>
					<div class="form_bot">
					<p>로그인에 문제가 있나요?</p>
				</div>
				<div>
					<a href="/findID">아이디가 기억이 안나요</a>
				</div>
				<div>
					<a href="">비밀번호를 잊어버리셨나요?</a>
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