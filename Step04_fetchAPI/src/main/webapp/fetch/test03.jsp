<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test02.jsp</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	<script>
		//문자열을 입력하고 전송 버튼을 눌렀을때 입력한 문자열을 읽어와서
		//send.jsp 페이지로 전소이 되도록 하기
		document.querySelector("#moreBtn").addEventListener("click", ()=>{
			fetch("get_msg.jsp")
			.then(res=>res.text())
			.then((data)=>{
				console.log(data);
				//ul 요소가 끝나기 직전에 HTML로 평가해서 추가하기
				document.querySelector("#msgList")
				.insertAdjacentHTML("beforeend", data);
			});
		});
	</script>
</body>
</html>