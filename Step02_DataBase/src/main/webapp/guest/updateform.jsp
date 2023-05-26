<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	
	GuestDao dao = GuestDao.getInstance();
	dao.update(dto);
	
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
	<h1>내용 수정</h1>
	<form action="${pageContext.request.contextPath}/guest/update.jsp" method="post">
		<div>
			<label for="writer">작성자</label>
			<input type="text" id="writer" name="writer"/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd"/>
		</div>
		<button type="submit">제출</button>
		<button type="reset">취소</button>
	</form>
</div>
<!-- 이 주석은 웹브라우저에게 출력되지만 웹브라우저가 무시하는 주석-->
<%-- 이 주석은 jsp 페이지가 무시하는 주석(웹브라우저에 출력되지 않는다.)--%>

</body>
</html>