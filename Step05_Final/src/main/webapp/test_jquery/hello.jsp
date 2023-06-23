<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container" id="app">
		<input type="text" id="inputMsg" placeholder="문자열 입력..."/>
		<button id="sendBtn">전송</button>
		<p id="result"></p>
	</div>
	
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<script>
		//위의 input 요소에 문자열을 입력하고 전송버튼을 누르면 입력한 문자열을 p 요소의 innerText에
		//출력되도록 프로그래밍 하기
		
		/*
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			document.querySelector("#result").innerText = document.querySelector("#inputMsg").value;
		}); 
		*/
		
		$("#sendBtn").on("click", ()=>{
			$("#result").text($("#inputMsg").val());
		});
		/* 
			$() 가 return 하는 타입은 (jquery 기능이 추가된)array 이다.
			$() 안에는 css 처럼 선택자를 바로 넣을 수 있다.(p, div 등)
			해당되는 선택자가 여러개고, 타입이 제각각 달라도 한꺼번에 배열로 적용할수 있다.
			반복문을 돌릴 필요가 없다.
			ex) $("div") => div[0]: 1, div[1]: "김구라", div[2]: true
			
			$() 뒤에 붙는 .on() 이벤트 등록, .val() 벨류에 관련된 동작,
			.text() 이너텍스트 관련 동작, .action() 안에 있는 모든 객체의 동작 등
			20개 정도의 동작 매뉴얼만 익히면 jquery를 쉽게 사용할 수 있다!
		*/
	</script>
</body>
</html>