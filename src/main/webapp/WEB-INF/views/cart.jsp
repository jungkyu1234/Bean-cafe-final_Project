<!-- 

참고 링크: https://won-percent.tistory.com/48

 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com//jsp/jstl/fmt" %> --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var checkObject = document.getElementsByName("RowCheck");
			var rowCount = checkObject.length;
			
			// 전체선택
			$("input[name='allCheck']").click(function(){
				var check_listArr = $("input[name='RowCheck']");
				for (var i=0; i<check_listArr.length; i++){
					check_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCount){
					$("input[name='allCheck']")[0].checked = true;
				} else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});

		// 선택삭제
		function deleteList(){
			var url = "delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var buylist = $("input[name='RowCheck']");
		    for(var i = 0; i < buylist.length; i++){
		        if(buylist[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(buylist[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    } else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("buylist")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
	</script>
<meta charset="EUC-KR">
<title>장바구니</title>
</head>
<body>
	<!-- 
	1. 상품 선택 후 상품명, 개수, 가격 전달받아오기 (로그인 한 멤버의 상품목록 데이터베이스에서)
	2. 상품 선택삭제, 선택결제, 전체선택 구현
	3. 선택결제 / 전체결제 누를 경우 결제페이지 (pay.jsp)로 전달
	4. 결제한 상품은 장바구니에서 사라짐 > 데이터베이스에 결제완료 란을 만들고 완료되어있는거는 셀렉트에서 제외?
	
	
	? 선택결제 ?
	
	-->
	
	 <h1>장바구니</h1>
	 
	 <!-- 장바구니가 비어있을 경우 결제창이 뜨지 않음 or 선택된 항목이 없을 시 '결제할 상품이 없습니다.' 메시지 -->
	 
	 <!--  -->
	 <table>
	 	<thread>
	 		<th scope="col"><input id="allcheck" type="checkbox" name="allcheck">전체선택</th>
	 		<th scope="col"><input type="button" value="선택삭제" onclick="deleteList"></th>
	 		<th scope="col"><input type="button" value="선택 결제하기" onCLick="location.href='pay.html'"></th>
	 		<th scope="col"></th>
	 	</thread>
	 	<tbody>
	 		<c:forEach items="${buylist} var="buylist">
	 			<tr>
	 				<td><input name="RowCheck" type="checkbox"></td>
	 				<td>${buylist.name}</td>
	 				<td>${buylist.quantity}</td>
	 				<td>${buylist.price}</td>
	 			</tr>
	 		</c:forEach>
	 	</tbody>
	 </table>
</body>
</html>