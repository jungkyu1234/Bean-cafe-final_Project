<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<link rel="stylesheet" href="./css/common(m).css">
</head>
<body>
 <!--HEADER-->
  <header>
    <div class="inner">
	
        <a href="/main" class="logo"> 
         <img src="./images2/logo2.png" width="200" height="100" alt="COFFEEMICKS" />
          </a> 

      <div class="sub-menu">
        <ul class="menu">
         <security:authorize access="hasRole('ADMIN')">
          <li>
            <a href="/admin">관리자</a>
            </li>
            <li>
            <a href="/logout">로그아웃</a>
          </li>
          </security:authorize>
          <li>
            <a href="/join">회원가입</a>
          </li>
          <security:authorize access="isAnonymous()">
          <li>
            <a href="/login">로그인</a>
          </li>
          </security:authorize>
          <security:authorize access="hasRole('ROLE_USER')">
          <li>
            <a href="/logout">로그아웃</a>
          </li>
          </security:authorize>
          <li>
            <a href="/getorderform">비회원주문조회</a>
          </li>
            <li>
            <a href="cart2">장바구니</a>
          </li>
        </ul>
      </div>
<ul class="main-menu">
        <li class="item">
          <div class="item__name">
          <a href="/getallproduct">Bean cafe 상품</a>
          </div>
          </ul>
  </header>
	
</body>
</html>

<!-- 무료 로고제작사이트:https://hatchful.shopify.com/ -->