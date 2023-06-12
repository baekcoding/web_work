<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
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
		<h1>가입 정보</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<%if(dto.getProfile() == null){ %>
						등록된 이미지 없음
						<a href="profile_uploadform.jsp">등록하기</a>
					<%} else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile %>"/>
					<%}%>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<a href="pwd_updateform.jsp">수정하기</a>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail()%></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
	</div>
</body>
</html>