<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/friend.jsp</title>
</head>
<body>
	<h1>회원 이름 목록입니다.</h1>
		<ul>
		<% for(int i=0; i<list.size(); i++){%>
			<li><%=list.get(i)%></li>
		<%}%>
		</ul>
</body>
</html>