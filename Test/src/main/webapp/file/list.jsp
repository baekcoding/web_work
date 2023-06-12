<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT = 5;

	int pageNum = 1;
	String strPageNum = request.getParameter("pageNum");
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum = pageNum*PAGE_ROW_COUNT;
	
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	

	List<FileDto> list = FileDao.getInstance().getList();
	String id = (String)session.getAttribute("id");
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
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0; i<list.size(); i++){%>
					<tr>
						<td><%=list.get(i).getNum() %></td>
						<td><%=list.get(i).getWriter() %></td>
						<td><%=list.get(i).getTitle() %></td>
						<td>
							<a href="download.jsp?num=<%=list.get(i).getNum()%>"><%=list.get(i).getSaveFileName() %></a>
						</td>
						<td><%=list.get(i).getRegdate() %></td>
						<td>
							<%if(list.get(i).getWriter().equals(id)){ %>
								<a href="delete.jsp?num=<%=list.get(i).getNum()%>">삭제</a>
							<%} %>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<ul>
			<%for(int i=1; i<=10; i++){ %>
				<li>
					<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
		</ul>
	</div>
</body>
</html>