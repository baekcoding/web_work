<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>회원가입 폼입니다.</h1>
		<form action="login.jsp">
			<div>
				<label for="id"></label>
				<input type="text" name="id" id="id"/>
				<label for="pwd"></label>
				<input type="password" name="pwd" id="pwd"/>
				<label for="pwd2"></label>
				<input type="password" name="pwd2" id="pwd2"/>
				<label for="email"></label>
				<input type="email" name="email" id="email"/>
			</div>
		</form>
	</div>
</body>
</html>