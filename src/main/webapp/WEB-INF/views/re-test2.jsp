<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">



<!-- 웹 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/2384619783.js"
	crossorigin="anonymous"></script>

</head>
<body>


	<div id="main">
		<div id="content">
			<div class="section_login">
				<h3 class="tit_login">로그인</h3>
				<div class="write_form">
					<div class="write_view login_view">
						<form action="login_ok" method="post" name="form" id="form"
							onsubmit="return formCheck()">
							<!--<security:csrfInput/>-->
							<input type="text" name="user_id" id="user_id" size="20"
								tabindex="1" placeholder="아이디를 입력해주세요"> <input
								type="password" name="user_pw" id="user_pw" size="20"
								tabindex="2" placeholder="비밀번호를 입력해주세요">
							<c:if test="${!empty loginFailMsg}">
								<p style="color: red; padding-top: 5px;">${loginFailMsg}</p>
							</c:if>
							<div class="checkbox_save">
								<label class="label_checkbox checked"> <input
									type="checkbox" name="remember_me" value="true"
									id="chk_security" checked="checked"
									onchange="if(this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')}">
									자동 로그인
								</label>
								<div class="login_search">
									<a href="/login/findIDform" class="link">아이디 찾기</a> <span
										class="bar"></span> <a href="/login/findPWform" class="link">비밀번호
										찾기</a>
								</div>
							</div>
							<div class="filed_captcha" data-validator="false">
								<p class="tit">아래 인증번호를 입력해주세요</p>
								<div class="inner_captcha">

									<img id="cap_img" alt="숫자이미지" src="">
									<!-- ./img/1627473259412.jpg -->
									<input name="captcha" type="number" maxlength="4"
										placeholder="인증번호 입력">
								</div>
							</div>
							<button type="submit" class="btn_type1" id="button">
								<span class="txt_type">로그인</span>
							</button>
						</form>
						<a href="/join/joinForm" class="btn_type2 btn_member"> <span
							class="txt_type">회원가입</span>
						</a>
						${member.user_name}
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 자바스크립트 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
    	
    	window.onload = function() {document.form.user_id.focus()}
    	
    	function popup(str, target) {
			console.log(str, target);
			var popup = $(".ask-layer-wrapper");
			var errorMessage = $(".ask-alert-message");
			popup.css("display", "block");
			errorMessage.html(str);
			$(".ask-alert-close-button, .styled-button").click(function() {
				popup.css("display", "none");
				$(target).focus();
			});
		}
    	
    	function formCheck() {
			var target1 = $("#user_id").val();
			var target2 = $("#user_pw").val();
			if(target1 == ""){
				popup("아이디를 입력해 주세요", "#user_id");
				return false;
			}else if(target2 == ""){
				popup("비밀번호를 입력해 주세요", "#user_pw");
				return false;
			}
			return true;
		}
    	var key=null;
    	$(document).ready(function() {
    	function promise_function() {
			return new Promise(function (resolve,reject) {
				$.ajax({
    				type : "GET",
    				url : "/dd",
    				contentType: 'application/json; charset=UTF-8',
    				/*headers : {
    					"X-Naver-Client-Id" : "d4rUydDQqJ9i2dtjOvVd",
    					"X-Naver-Client-Secret" : "35DF9I3Ib7"
    				},*/
    				//dataType : "json",
    				
    				success : function (data) {
						var data= data.substring(8,24);
						key=data;
						resolve(data);
						
					}
				})
			})
    	}					//key
		function firstAjax(data){
			return new Promise(function (resolve,reject) {
				//alert(data);
				 $.ajax({
					 type:"GET",
					 //contentType: 'application/json; charset=UTF-8',
					 url:"/dd2",
					 data: data,
					 success: 
							function (data) {
						 		
							setTimeout(function() {
								var img_name="./img/"+data+".jpg";
						 		 $("#cap_img").attr("src",img_name);
								
								resolve(data);
							},3000);
						
						 //document.getElementById("cap_img").innerHTML="<img src='./img/"+img_name+"'>";
							//src="./img/1627386264427.jpg">
						}
						 
					 
				 })
				
			})
		}
							//이미지파일이름		
		
		function secondAjax(data) {
			return new Promise(function (resolve,reject) {
				data=key;
				
				$.ajax({
					type:"GET",
					url:"/dd3",
					data: {"key":"MxyuGNzIgaFwwFds",
							"input":"26SYRF"},
					success:
						function (data) {
							alert(data);
						}
				})
			})
		}
		function successFunction(){
			  alert('성공');
			  return false;
			}
			function errorFunction(){
			    alert('에러');
			    return false;
			  }
			   
			promise_function()
			.then(firstAjax)
			.then(secondAjax)
			//.then(successFunction)
			.catch(errorFunction);

    	})
			
		
    	/*
	    	$(function() {
				
	    
	    			
	    			$(".filed_captcha").css("display", "block");
	    			
	    			$.ajax({
	    				type : "GET",
	    				url : "/dd",
	    				headers : {
	    					"X-Naver-Client-Id" : "d4rUydDQqJ9i2dtjOvVd",
	    					"X-Naver-Client-Secret" : "35DF9I3Ib7"
	    				},
	    				//dataType : "json",
	    				
	    				success : 				
	    					function(data) {
								 $.ajax({
									 type:"GET",
									 url:"/dd2",
									 data: data,
									 success:
										 function (data) {
										 alert(data)	
										}
										 
									 
								 })
	    					
							}
	    			});
	    			
	    		
	    	
			});
    	*/
    </script>

</body>
</html>



















