<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align: center;">파입 업로드 테스트</h1>
	<div style="text-align: center;">
		<form action="output" method="post" enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" value="저장" />
		</form>
	</div>
</body>
</html>