<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	
	String[] hobby = request.getParameterValues("hobby");
	String hobbyResult = "";
	if(hobby != null){
		for(int i=0; i<hobby.length; i++){
			String tmp = hobby[i];
			hobbyResult += tmp;
			if (i != hobby.length-1){
				hobbyResult += "/";
			}
		}
		
		String[] result = hobbyResult.split("/");
		
		boolean isContain = hobbyResult.contains("xxx");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>회원가입 결과</h1>
		<p>성공적으로 가입되었습니다.</p>
		<form action="signup.jsp" method="post">
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" value="<%=id%>"/>
			</div>
			<div>
				<label for="pwd">아이디</label>
				<input type="password" name="pwd" id="pwd" value="<%=pwd%>"/>
			</div>
			<select name="job" id="job">
				<option value="">직업선택</option>
				<option value="programmer" <%= job.equals("programmer")?"selected":""%>>프로그래머</option>
				<option value="doctor" <%= job.equals("doctor")?"selected":""%>>의사</option>
			</select>
			<fieldset>
				<legend>성별 체크</legend>
				<div>
					<label for="one">남자</label>
					<input name="gender" id="one"
						type="radio" value="man" <%=gender.equals("man")?"checked":"" %>/>
				</div>
				<div>
					<label for="two">여자</label>
					<input name="gender" , id="two"
						, value="woman" type="radio" <%=gender.equals("man")?"checked":"" %>/>
				</div>
			</fieldset>
			<fieldset>
				<legend>취미 체크</legend>
				<div>
					<label for="piano">피아노</label>
					<input type="checkbox" name="hobby"
						id="piano" value="piano"
					<%=hobbyResult.contains("piano")?"checked":""%> />
				</div>
				<div>
					<label for="game">게임</label> <input type="checkbox" name="hobby"
						id="game" value="game" />
				</div>
				<div>
					<label for="etc">기타</label> <input type="checkbox" name="hobby"
						id="etc" value="etc" />
				</div>
			</fieldset>
			<div>
				<label for="comment"></label>
				<textarea name="comment" id="comment" rows="10"></textarea>
			</div>
			<fieldset>
				<legend>개인정보 활용 동의</legend>
				<div>
					<label for="checkAll"></label> <input type="checkbox" name=checkAll
						id="checkAll" value="checkAll" />
				</div>
				<div>
					<label for="checkEmail"></label> <input type="checkbox"
						name="checkEmail" id="checkEmail" value="checkEmail" />
				</div>
				<div>
					<label for="checkMessage"></label> <input type="checkbox"
						name="checkMessage" id="checkMessage" value="message" />
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>