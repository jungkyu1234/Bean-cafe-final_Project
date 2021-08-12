<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>Bean cafe Coffee Korea</title>

  <!--Open Graph-->

  <!--파비콘-->
   <link rel="shortcut icon" href="#" />
    <!-- 왼쪽 상단 파비콘 이미지 임시 가려둠 -->
    
  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <link rel="stylesheet" href="./css/common.css" />
  <link rel="stylesheet" href="./css/FinalProjectmain.css" />
  
  <img th:src="@{/images2/coffee_12325.png}"/> 
  
  <script src="./js/common.js" defer></script>
  <script src="./js/main.js" defer></script>
  
  <!--GSAP & ScrollToPlugin-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous"></script>
  <!--Swiper-->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <!--ScrollMagic-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
  <!--Lodash-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js" integrity="sha512-90vH1Z83AJY9DmlWa8WkjkV79yfS2n2Oxhsi2dZbIv0nC4E6m5AbH8Nh156kkM7JePmqD6tcZsfad1ueoaovww==" crossorigin="anonymous"></script>

</head>
<body>

  <!--HEADER-->
  <header>
 <jsp:include page="header.jsp"/>

    <!--BADGES-->
    <div class="badges">
       <div class="badge">
        <img src="./images/badge1.jpg" alt="Badge" />
      </div> 
       <div class="badge">
        <img src="./images/badge2.jpg" alt="Badge" />
      </div>
    </div>
  </header>


  <!--VISUAL-->
  <visual>
  <jsp:include page="middle(main).jsp"/>
  </visual>
  
  <!--FOOTER-->
  <footer>
   <jsp:include page="footer.jsp"/>
  </footer>


  <!--TO TOP BUTTON-->
  <div id="to-top">
    <div class="material-icons">arrow_upward</div>
  </div>

</body>
</html>