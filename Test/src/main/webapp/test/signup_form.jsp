<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>다양한 form 디자인</h1>
		<form action="signup.jsp" method="post">
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"/>
			</div>
			<div>
				<label for="pwd">아이디</label>
				<input type="password" name="pwd" id="pwd"/>
			</div>
			<select name="job" id="job">
				<option value="">직업선택</option>
				<option value="programmer">프로그래머</option>
				<option value="doctor">의사</option>
			</select>
			<fieldset>
				<legend>성별 체크</legend>
				<div>
					<label for="one">남자</label>
					<input name="gender" id="one" type="radio" value="man"/>
				</div>
				<div>
					<label for="two">여자</label>
					<input name="gender", id="two", value="woman" type="radio"/>
				</div>
			</fieldset>
			<fieldset>
				<legend>취미 체크</legend>
				<div>
					<label for="piano">피아노</label>
					<input type="checkbox" name="hobby" id="piano" value="piano"/>
				</div>
				<div>
					<label for="game">게임</label>
					<input type="checkbox" name="hobby" id="game" value="game"/>
				</div>
				<div>
					<label for="etc">기타</label>
					<input type="checkbox" name="hobby" id="etc" value="etc"/>
				</div>
			</fieldset>
			<div>
				<label for="comment"></label>
				<textarea name="comment" id="comment" rows="10"></textarea>
			</div>
			<fieldset>
				<legend>개인정보 활용 동의</legend>
				<div>
					<label for="checkAll"></label>
					<input type="checkbox" name=checkAll id="checkAll" value="checkAll"/>
				</div>
				<div>
					<label for="checkEmail"></label>
					<input type="checkbox" name="checkEmail" id="checkEmail" value="checkEmail"/>
				</div>
				<div>
					<label for="checkMessage"></label>
					<input type="checkbox" name="checkMessage" id="checkMessage" value="message"/>
				</div>
			</fieldset>
		</form>
	</div>
	<script>
		document.querySelector("#checkAll").addEventListener("click", (e)=>{
			document.querySelector("#checkEmail").checked = e.target.checked;
			document.querySelector("#checkMessage").checked = e.target.checked;
		});
	</script>
</body>
</html>