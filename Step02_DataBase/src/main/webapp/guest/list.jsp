<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GuestDao dao = GuestDao.getInstance();
	List<GuestDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>방명록 리스트</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>등록일</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0; i<list.size(); i++){%>
				<tr>
					<td><%=list.get(i).getNum()%></td>
					<td><%=list.get(i).getWriter()%></td>
					<td>
						<textarea rows="5" readonly><%=list.get(i).getContent()%></textarea>
					</td>
					<td><%=list.get(i).getRegdate()%></td>
					<td>
						<form action="delete.jsp" method="post">
							<input type="hidden" name="num", value="<=" />
							<input type="text" name="pwd" placeholder="비밀번호" />
							<button type="submit">삭제</button>
						</form>
					</td>
					<td>
						<a href="update.jsp">수정</a>
					</td>
				</tr>
			<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>