<%@page import="utils.AlertFunc"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/Storage");
	String saveFilename=request.getParameter("nName").trim();
	String originFilename=request.getParameter("oName").trim();
try{
   //파일을 찾아서 입력 스트림 생성
   File file = new File(saveDirectory,saveFilename);
   InputStream inStream = new FileInputStream(file);
   
   //한글 파일명 깨짐 방지
   String client=request.getHeader("User-Agent");
   if(client.indexOf("WOW64")==-1){
      originFilename=new String(originFilename.getBytes("UTF-8"),"ISO-8859-1");
   }else{
      originFilename=new String(originFilename.getBytes("KSC5601"),"ISO-8859-1");
   }
   
   //파일 다운로드 응답 헤더 설정
   response.reset();
   response.setContentType("application/octet-stream");
   response.setHeader("Content-Disposition","attachment; filename=\""+originFilename+"\"");
   
   //출력 스트림 초기화
   out.clear();
   out=pageContext.pushBody();
   
   //response 내장 객체로 새로운 출력 스트림 생성
   OutputStream outStream = response.getOutputStream();
   
   byte b[]=new byte[(int)file.length()];
   int readBuffer=0;
   while((readBuffer=inStream.read(b))>0){
      outStream.write(b,0,readBuffer);
   }
   //입출력 스트림 닫기
   inStream.close();
   outStream.close();
}catch(FileNotFoundException e){
   e.printStackTrace();
   AlertFunc.alertBack("파일을 찾을 수 없습니다.",out);
}catch(Exception e){
   e.printStackTrace();
   AlertFunc.alertBack("예외가 발생했습니다.",out);
}

%>

<%-- 잘못된 것 나중에 오류 찾기 
<%@page import="utils.AlertFunc"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Storage");
String saveFilename=request.getParameter("nName").trim();
String originFilename=request.getParameter("oName").trim();
try{
   //파일을 찾아서 입력 스트림 생성
   File file = new File(saveDirectory,saveFilename);
   InputStream inStream = new FileInputStream(file);
   
   //한글 파일명 깨짐 방지
   String client=request.getHeader("User-Agent");
   if(client.indexOf("WOW64")==-1){
      originFilename=new String(originFilename.getBytes("UTF-8"),"ISO-8859-1");
   }else{
      originFilename=new String(originFilename.getBytes("KSC5601"),"ISO-8859-1");
   }
   
   //파일 다운로드 응답 헤더 설정
   response.reset();
   response.setContentType("application/octet-stream");
   response.setHeader("Content-Disposition","attachment; filename=\""+originFilename+"\"");
   
   //출력 스트림 초기화
   out.clear();
   
   //response 내장 객체로 새로운 출력 스트림 생성
   OutputStream outStream = response.getOutputStream();
   
   byte b[]=new byte[(int)file.length()];
   int readBuffer=0;
   while((readBuffer=inStream.read(b))>0){
      outStream.write(b,0,readBuffer);
   }
   //입출력 스트림 닫기
   inStream.close();
   outStream.close();
}catch(FileNotFoundException e){
   e.printStackTrace();
   AlertFunc.alertBack("파일을 찾을 수 없습니다.",out);
}catch(Exception e){
   e.printStackTrace();
   AlertFunc.alertBack("예외가 발생했습니다.",out);
}




%>--%>