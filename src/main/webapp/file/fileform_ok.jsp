<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
    String filename = "";
    int sizeLimit = 15* 1024*1024; //사이즈 리밋

    //파일 업로드 위치 받아오기
    String realPath = request.getServletContext().getRealPath("upload");
    System.out.println(realPath);

    //파일 얿로드 위치로 파일 만들기
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdir();

    //multipartrequest 만들어주기
    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    //지정
    filename = multipartRequest.getFilesystemName("photo");
    String imagePath = "";
    if(filename != ""){
        System.out.print("<img src= ./upload/" + filename + "height=400>");
    }


%>