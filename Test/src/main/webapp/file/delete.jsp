<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	FileDto dto = FileDao.getInstance().getData(num);
	
	String id = (String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자 정보와 일치하지 않습니다.");
		return;
	}
	
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	File f = new File(path);
	f.delete();
	
	FileDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/private/list.jsp");
	
%>