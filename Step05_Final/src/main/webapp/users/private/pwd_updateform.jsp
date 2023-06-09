<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
	String pwd = dto.getPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>비밀번호 수정하기</h1>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div class="mb-2">
				<label for="pwd">현재 비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>
			<div class="mb-2">
				<label for="newPwd">변경 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd"/>
			</div>
			<div class="mb-2">
				<label for="newPwd2">비밀번호 확인</label>
				<input type="password" id="newPwd2"/>
			</div>
			<button type="submit">수정하기</button>
			<button type="reset">리셋</button>
		</form>
	</div>
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//입력한 새 비밀번호 2개를 읽어와서
			let pwd1 = document.querySelector("#newPwd").value;
			let pwd2 = document.querySelector("#newPwd2").value;
			//만약 새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("비밀번호를 확인하세요!");
				e.preventDefault();
			}
		})
	</script>
</body>
</html>