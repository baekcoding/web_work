<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath = application.getRealPath("/upload");
	File f = new File(realPath);
	if(!f.exists()){
		f.mkdir();
	}
	
	MultipartRequest mr = new MultipartRequest(request,
			realPath,
			1024*1024*100,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	String title = mr.getParameter("title");
	String writer = (String)session.getAttribute("id");
	
			
	boolean isSuccess = FileDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<%=writer %>님이 업로드한 <%=orgFileName %> 파일을 저장했습니다.
			<a href="${pageContext.request.contextPath}/file/private/list.jsp">목록보기</a>
		</p>
	<%} else{ %>
		<p>
			업로드 실패
			<a href="upload_form.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>