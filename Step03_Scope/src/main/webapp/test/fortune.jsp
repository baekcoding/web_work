<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 영역에 fortuneToday라는 키값으로 담긴 String type 데이터를 읽어와서 castiong
	String fortune = (String)request.getAttribute("fortuneToday");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p>오늘의 운세 : <strong><%=fortune%></strong></p>
	</div>
</body>
</html>