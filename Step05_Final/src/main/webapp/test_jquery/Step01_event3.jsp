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
</head>
<body>

	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력..."/>
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul id="msgList">
	
	</ul>
	
	<script>
	
	$("#inputMsg").on("keyup", function(e){
		$("#current").text($("#inputMsg").val());
		if(e.keyCode == 13){
			const msg= $("#inputMsg").val();
			$("<li>").text(msg).appendTo("#msgList");
			//value에 빈 문자열을 넣어주면 입력한 내용이 삭제되는 효과
			$("#inputMsg").val("");
		}
	});
	
	$("#sendBtn").on("click", function(){
		const msg= $("#inputMsg").val();
		$("<li>").text(msg).appendTo("#msgList");
		$("#inputMsg").val("").focus();
	});
	
	
	
	</script>
	
</body>
</html>