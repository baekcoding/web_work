<%@page import="java.io.BufferedOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	FileDto dto = FileDao.getInstance().getData(num);
	
	String orgFileName = dto.getOrgFileName();
	String saveFileName = dto.getSaveFileName();
	
	String path = application.getRealPath("/upload")+File.separator + saveFileName;
	
	FileInputStream fis = new FileInputStream(path);
	
	String encodedName = URLEncoder.encode(orgFileName, "utf-8");
	
	encodedName = encodedName.replaceAll("\\+", " ");
	
	response.setHeader("Content-Disposition", "attachment;filename=" + encodedName);
	response.setHeader("Content-Transfer-Encoding", "binary");
	
	response.setContentLengthLong(dto.getFileSize());
	
	out.clear();
	out = pageContext.pushBody();
	
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	byte[] buffer = new byte[1024*1024];
	int readedByte = 0;
	
	while(true){
		readedByte = fis.read(buffer);
		if(readedByte == -1) break;
		
		bos.write(buffer, 0, readedByte);
		bos.flush();
	}
	
	fis.close();
%>