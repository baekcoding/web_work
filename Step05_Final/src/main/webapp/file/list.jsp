<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<title>/file/list.jsp</title>
</head>
<%   
   //한 페이지에 몇 개씩 표시할 것인지
   final int PAGE_ROW_COUNT = 5;
   //하단 페이지를 몇 개씩 표시할 것인지
   final int PAGE_DISPLAY_COUNT = 3;
   
   int pageNum = 1;
   String strPageNum = request.getParameter("pageNum");
   if(strPageNum != null){
      pageNum = Integer.parseInt(strPageNum);
   }
   
   //보여줄 페이지 시작 ROWNUM
   int startRowNum = 1+(pageNum-1) * PAGE_ROW_COUNT;
   //보여줄 페이지 끝 ROWNUM
   int endRowNum = pageNum * PAGE_ROW_COUNT;
   
   //하단 시작 페이지 번호
   int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   //하단 끝 페이지 번호
   int endPageNum = startPageNum + PAGE_DISPLAY_COUNT-1;
   //전체 글의 개수
   int totalRow = FileDao.getInstance().getCount();
   //전체 페이지의 개수
   int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
   //끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값
   if(endPageNum > totalPageCount){
      endPageNum = totalPageCount;
   }
   
   FileDto dto = new FileDto();
   dto.setStartRowNum(startRowNum);
   dto.setEndRowNum(endRowNum);
   
   List<FileDto> list = FileDao.getInstance().getList(dto);
   //로그인된 아이디(로그인이 되어있지 않으면 null)
   String id = (String)session.getAttribute("id");
%>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="current"/>
	</jsp:include>
   <div class="container">
      <a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
      <br />
      <a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드 하기</a>
      <h1>자료실 목록</h1>
      <table class="table table-striped">
         <thead class="table-light">
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th>파일명</th>
               <th>파일크기</th>
               <th>등록일</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody>
         <%for(FileDto f: list){%>
            <tr>
               <td><%=f.getNum() %></td>
               <td><%=f.getWriter() %></td>
               <td><%=f.getTitle() %></td>
               <td>
                  <a href="download.jsp?num=<%=f.getNum()%>"><%=f.getOrgFileName() %></a>
               </td>
               <td><%=f.getFileSize() %> byte</td>
               <td><%=f.getRegdate() %></td>
               <td>
               <%if(f.getWriter().equals(id)){%>
                  <a href="delete.jsp?num=<%=f.getNum()%>">삭제</a>
               <%} %>
               </td>
            </tr>
         <%} %>
         </tbody>
      </table>
      <ul class="pagination">
      	<!-- startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다. -->
      	 <%if(startPageNum != 1){ %>
      	 	<li class="page-item">
      	 		<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
      	 	</li>
      	 <%} %>
         <%for(int i = startPageNum; i <= endPageNum; i++) {%>
            <li class="page-item <%= (i == pageNum) ? "active" : "" %>">
               <a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
            </li>
         <%} %>
         <%if(endPageNum < totalPageCount){ %>
            <li class="page-item">
               <a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
            </li>
         <%} %>
      </ul>
   </div>
</body>
</html>