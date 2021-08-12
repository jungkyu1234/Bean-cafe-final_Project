<!-- 

���� ��ũ: https://won-percent.tistory.com/48

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
			
			// ��ü����
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

		// ���û���
		function deleteList(){
			var url = "delete";    // Controller�� �������� �ϴ� URL (.dh�κ��� �ڽ��� ������ ������ �����ؾߵ�)
			var valueArr = new Array();
		    var buylist = $("input[name='RowCheck']");
		    for(var i = 0; i < buylist.length; i++){
		        if(buylist[i].checked){ //���õǾ� ������ �迭�� ���� ������
		            valueArr.push(buylist[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("���õ� ���� �����ϴ�.");
		    } else{
				var chk = confirm("���� �����Ͻðڽ��ϱ�?");				 
				$.ajax({
				    url : url,                    // ���� URL
				    type : 'POST',                // GET or POST ���
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // �������� �ϴ� data ���� ����
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("���� ����");
	                        location.replace("buylist")
	                    }
	                    else{
	                        alert("���� ����");
	                    }
	                }
				});
			}
		}
	</script>
<meta charset="EUC-KR">
<title>��ٱ���</title>
</head>
<body>
	<!-- 
	1. ��ǰ ���� �� ��ǰ��, ����, ���� ���޹޾ƿ��� (�α��� �� ����� ��ǰ��� �����ͺ��̽�����)
	2. ��ǰ ���û���, ���ð���, ��ü���� ����
	3. ���ð��� / ��ü���� ���� ��� ���������� (pay.jsp)�� ����
	4. ������ ��ǰ�� ��ٱ��Ͽ��� ����� > �����ͺ��̽��� �����Ϸ� ���� ����� �Ϸ�Ǿ��ִ°Ŵ� ����Ʈ���� ����?
	
	
	? ���ð��� ?
	
	-->
	
	 <h1>��ٱ���</h1>
	 
	 <!-- ��ٱ��ϰ� ������� ��� ����â�� ���� ���� or ���õ� �׸��� ���� �� '������ ��ǰ�� �����ϴ�.' �޽��� -->
	 
	 <!--  -->
	 <table>
	 	<thread>
	 		<th scope="col"><input id="allcheck" type="checkbox" name="allcheck">��ü����</th>
	 		<th scope="col"><input type="button" value="���û���" onclick="deleteList"></th>
	 		<th scope="col"><input type="button" value="���� �����ϱ�" onCLick="location.href='pay.html'"></th>
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