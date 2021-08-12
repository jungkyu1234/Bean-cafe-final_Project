
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!--브라우저 스타일 초기화-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="./css/common(m).css" />
<style type="text/css">
.container {
	width: 500px;
	height: 100%;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
	padding-bottom: 30px;
	
	background-image: url("./images2/computer.jpg"); 
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    background-size: cover;
       
}
.container_wrap {
  padding: 120px 0 150px;
  background-image: url("./images/image2.jpg"); 
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
}
.form_container {
	width: 400px;
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

#email1, #email2 {
	width: 30%;
}

#user_birth_year, #user_birth_month, #user_birth_day {
	width: 25%;
}

#emailSelection {
	height: 30px;
	vertical-align: 2px;
}

.form_item_name {
	color: gray;
}

.form_item {
	margin-top: 10px;
}
.btn{
background-color: #8B5927;
	border: 1px;
	border-radius: 3px;
	color: white;
	font-size: 15px;
	font-weight: 500;
	
}

.form_button {
	width: 30%;
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
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <section class="container_wrap">
<script>
		function findAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.   
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
					addr1_chk=true;
				}
			}).open();
		}
	</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
		//회원가입 유효성 검사
		//1.아이디 유효성 검사
		var id_chk_ok=false;
		var id_jb_ok=false;
		$(document).ready(function() {
			$("#user_id").on("propertychange change keyup paste input", function() {
				var id_reg = /^[a-zA-Z0-9]{4,12}$/;
				var id = $("#user_id").val();
				
				if(id==''){
				
					id_chk_ok=false;
				}else{
					$('#id_chk_alert').text("");
					
				}
				
				if(!id_reg.test(id)){
					$('#id_chk_alert').text("아이디는 4~12자의 영문대소문자와 숫자로만 입력가능합니다.");
					id_chk_ok=false;
				}else{
					$('#id_chk_alert').text("");
					
					id_chk_ok=true;
				}
		
				console.log(id_chk_ok);	
			});
		});
		//1-2아이디 중복 체크
		$(document).ready(function () {
			var userid=$("#user_id").val();
			
			$("#idcheck").click(function () {
				if(id_chk_ok){
					$.ajax({
						type:'POST',
						data:{"user_id":$("#user_id").val()},
						url:"/idcheck",
						dataType:"json",
						success: function (data) {
					
							if(data.cnt>0){
								
								Swal.fire("아이디가 존재합니다.\n 다른아이디를 입력해주세요");
							}else{
								Swal.fire("사용가능한 아이디입니다.");
								id_jb_ok=true;
								
								
							}
						}    ,error:function(request,status,error){
						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	
						
					})
				}else{
					Swal.fire("아이디를 다시 입력해 주세요.");
					
				}
				
			})
			
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
		//4.이름 유효성 검사
		var name_chk=false;
			$(document).ready(function() {
			$("#user_name").on("propertychange change keyup paste input", function() {
				var n_reg = /^[가-힣]{2,15}$/;
				var name=$("#user_name").val();
				
				if(!n_reg.test(name)){
					 $('#name_chk_alert').text("잘못된 입력입니다.다시 입력해 주세요");
					 name_chk= false;
				}else{
					 $('#name_chk_alert').text("");
					 name_chk= true;
				}
				
			
			});
		});
		//5.생일 유효성 검사
		var byear_chk=false;
		var bmonth_chk=false;
		var bday_chk=false;
		var birth_chk=false;
			$(document).ready(function() {
				//5-1생년 검사
				$("#user_birth_year").on("propertychange change keyup paste input", function() {
				var today=new Date();
				var yearN=today.getFullYear();
				var byear_reg = /^[0-9]{4}$/;
				var byear_input=$("#user_birth_year").val();
				
				if((!byear_reg.test(byear_input))||(byear_input<1900)||(byear_input>yearN)){
					 $('#birth_chk_alert').text("잘못된 입력입니다.다시 입력해 주세요");
					
					 byear_chk= false;
				}else{
					 $('#birth_chk_alert').text("");
					 byear_chk= true;
				}
			
			
				});
				//5-2생월 검사
				$("#user_birth_month").on("propertychange change keyup paste input", function() {
			
				var bmonth_input=$("#user_birth_month").val();
				if(!byear_chk){
					$("#user_birth_year").focus();
					$("#user_birth_month").val("");
				}
			
				if(bmonth_input<1||bmonth_input>12){
					 $('#birth_chk_alert').text("잘못된 입력입니다.다시 입력해 주세요");
					 $("#user_birth_month").val("");
					 
					 bmonth_chk= false;
				
				}else{
					 $('#birth_chk_alert').text("");
					 bmonth_chk= true;
					
				}
				});
				//5-3생일 검사
				$("#user_birth_day").on("propertychange change keyup paste input", function() {
					
					var bday_input=$("#user_birth_day").val();
				
					if(bday_input<1||bday_input>31){
						 $('#birth_chk_alert').text("잘못된 입력입니다.다시 입력해 주세요");
						 $("#user_birth_day").val("");
						 bday_chk= false;
					
					}else{
						 $('#birth_chk_alert').text("");
						 bday_chk= true;
					
					}
					if(byear_chk==true&&bmonth_chk==true&&bday_chk==true){
						birth_chk=true;
					}
					
				});
			
		});
		//6.주소 빈칸 확인검사
		
		var addr1_chk=false;
		function find_chk() {
			
			var address=$('#address').val();
			if(address==''){
				Swal.fire("주소찾기를 먼저 해주세요.");
				$('#detailAddress').val("");
				
			}
		}
	
		
		//7.메일 셀렉트박스,메일 입력 확인 
		
		var mail_chk=false;
		$(document).ready(function() {
			
			
			$('select[name=emailSelection]').change(function() {
				var email1=$('#email1').val();
				if(email1==""){
					Swal.fire("메일아이디를 입력해주세요");
					$('#email1').focus();
				}
		
			if ($(this).val() == "1") {
				$('#email2').attr("readonly", false);
				mail_chk=false;
			
			} else {
				$('#email2').val($(this).val());
				$('#email2').attr("readonly", true);
				mail_chk=true;
			}
				
			});

			$('#email2').click(function () {
				var email1=$('#email1').val();
				if(email1==""){
					Swal.fire("메일아이디를 입력해주세요");
					$('#email1').focus();
				}
			
			
			})
			$("#email2").on("propertychange change keyup paste input", function() {
				var email2=$('#email2').val();
				
				if(email2==""){
					mail_chk=false;
					
				}else{
					mail_chk=true;
				}
				
			})
			
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
		
		//9.submit 전 전체확인
		
			function validation() {
			if(id_chk_ok==false){
					Swal.fire("아이디를 확인해 주세요.");
					return false;
				}else if(id_jb_ok===false){
					Swal.fire("아이디 중복 확인해 주세요.");
					return false;
				}else if(pw_chk===false){
					Swal.fire("비밀번호를 확인해 주세요.");
					return false;
				}else if(pw_chk_chk===false){
					Swal.fire("비밀번호를 확인해 주세요.");
					return false;
				}else if(name_chk===false){
					Swal.fire("이름을를 확인해 주세요.");
					return false;
				}else if(birth_chk===false){
					Swal.fire("생년월일을 확인해 주세요.");
					return false;
				}else if(addr1_chk===false){
					Swal.fire("주소를 확인해 주세요.");
					return false;
				}else if(mail_chk===false){
					Swal.fire("메일을 확인해 주세요.");
					return false;
				}else if(num_chk===false){
					Swal.fire("휴대폰 번호를 확인해 주세요.");
					return false;
				}else if(phone_chk===false){
					Swal.fire("휴대폰 인증을 해주세요.");
					return false;
				}else{
					return true;
				}
				
			}
		
	</script>
</head>
<body>
<header>
  <jsp:include page="header.jsp"/>
  </header>
	<form action="/join" method="post" onsubmit="return validation()" >
		<Br><Br><div class="container">
		
			<div class="form_container">
				<div class="login_title">
					<p class="login_title_p">회원가입</p>

				</div>
				<!-- 아이디입력 -->
				<div>
					<a class="form_item_name">ID</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_id" id="user_id"
						placeholder="ID입력"> <span style="margin-left: 10px;"><input
						type="button" id="idcheck" class="btn" value="ID체크"></span>
					<p id="id_chk_alert" class="alert"></p>
				</div>
				<!-- 비밀번호입력 -->
				<div class="form_item">
					<a class="form_item_name">비밀번호</a>
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
				<!-- 이름입력 -->
				<div class="form_item">
					<a class="form_item_name">이름</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_name"
						id="user_name" placeholder="홍길동">
					<p id="name_chk_alert" class="alert"></p>
				</div>
				<!-- 생일입력 -->
				<div class="form_item">
					<a class="form_item_name">생년월일</a>
				</div>
				<div>
					<input type="text" class="form_input" name="user_birth_year"
						id="user_birth_year" placeholder="생년" maxlength="4"> <input
						type="text" class="form_input" name="user_birth_month"
						id="user_birth_month" placeholder="월" maxlength="2"> <input
						type="text" class="form_input" name="user_birth_day"
						id="user_birth_day" placeholder="일" maxlength="2">
					<p id="birth_chk_alert" class="alert"></p>
				</div>
				<!-- 휴대전화입력 --> 
				<div class="form_item">
					<a class="form_item_name">휴대전화</a>
				</div>
				<div>
					<input type="text" class="form_input"  id="phoneNumber" name="phoneNumber" placeholder="01012345678(-는 입력 불가)"  maxlength="11"> <span style="margin-left: 10px;">
					<input type="button" id="sendPhoneNumber" class="btn" value="휴대폰인증"></span>
					
					<p id="pnum_chk_alert" class="alert"></p>
					<input type="text" class="form_input" id="inputCertifiedNumber"
						placeholder="인증번호"> <span style="margin-left: 10px;">
					<input type="button" id="checkBtn" class="btn" value="확인"></span>
				</div> 
				<!-- 주소입력 -->
				<div class="form_item">
					<a class="form_item_name">주소</a>
				</div>
				<div class="form_item">
					<input type="text" class="form_input" id="address" placeholder="주소" name="address"
						readonly="readonly"> <span style="margin-left: 10px;"><input
						type="button" onclick="findAddr()" class="btn" value="주소찾기"></span><br>
					<input type="text" class="form_input" id="detailAddress" name="detailAddress"
						placeholder="상세주소" onclick="find_chk()">

				</div>
				<!-- 이메일 입력 -->
				<div class="form_item">
					<a class="form_item_name">이메일입력</a>
				</div>
				<input id="email1" class="form_input" name="mail1"
					placeholder="메일 아이디" type="text" onfocus="this.value=''">@
				<input id="email2" class="form_input" name="mail2" placeholder="직접입력"
					type="text"> <select id="emailSelection"
					name="emailSelection">
					<option value="naver.com" >naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="1" selected="selected">직접입력</option>

				</select>
			</div>

			<div>
				<input type="submit" class="form_button" value="회원가입"> 
				<input type="reset" class="form_button" value="취소">
			</div>
		</div>
	</div>
  </form>
</section>

  <!--FOOTER-->
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
   </footer>

</body>
</html>