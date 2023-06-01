<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test01.jsp</title>
</head>
<body>
	<h1>fetch 함수 테스트</h1>
	<button id="myBtn">눌러보셈</button>
	<a href="${pageContext.request.contextPath}/index.jsp">눌러봐</a>
	<script>
		//fetch는 페이지 전환없이 서버에 요청가능, 함수로 받아옴
		//회원가입 폼 작성 중 아이디 중복 확인 시 사용
		document.querySelector("#myBtn").addEventListener("click", ()=>{
			
			const msg = prompt("메세지 입력...");
			
			console.log("입력완료!");
			
			console.log("-----");
			
			//response 객체 : fetch를 통해 요청했을때 웹서버가 응답한 결과를 담고 있는 객체
			//fetch는 return할때 Promise 타입으로 return한다.
			fetch("${pageContext.request.contextPath}/index.jsp")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			
			console.log("요청했습니다!")
		});
	</script>
</body>
</html>