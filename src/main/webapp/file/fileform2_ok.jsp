<%@ page import="org.example.ws242.file.FileUpload" %>
<%@ page import="org.example.ws242.vo.FileVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FileUpload fileUpload = new FileUpload();
    FileVO vo = fileUpload.uploadFile(request);
%>

파일명 : <a href="./upload/<%=vo.getFilename()%>"><%=vo.getFilename()%></a><br>
다운로드 : <a href="download.jsp?filename=<%=vo.getFilename()%>"><%=vo.getFilename()%></a>