<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = MemberDao.getInstance();
	List<MemberDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>list2.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<h1>회원 목록입니다.</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>삭제</th>
		</tr>
		
		<%for(int i=0; i<list.size(); i++){ %>
		<tr>
			<td><%=list.get(i).getNum() %></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getAddr() %></td>
			<td><a href="">삭제</a></td>
		</tr>
		<%}%>
	</table>
</body>
</html>