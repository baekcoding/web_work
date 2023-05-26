<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 목록</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0; i<list.size(); i++) {%>
				<tr>
					<td><%=list.get(i).getNum()%></td>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getAddr()%></td>
				</tr>
			<%}%>
			</tbody>
		</table>
</body>
</html>