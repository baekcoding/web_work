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
	<h1>요청 파라미터도 el로 추출할 수 있다.</h1>
	<form action="test05.jsp" method="post">
		<input type="text" name="msg" id="msg"/>
		<button type="submit">전송</button>
	</form>
</body>
</html>