<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="IsErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 지시어 속성 errorPage</title>
</head>
<body>
<%
	int myAge = Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 당신의 나이:"+myAge);
%>
<%-- 	
try{
	int myAge = Integer.parseInt(request.getParameter("age"));
	out.println("10년 후 당신의 나이:"+myAge);
}catch(Exception e){
	out.println("예외처리:매개변수 ager가 null");

--%>
<!-- <h1>예외</h1>  -->
<%--
}
--%>
</body>
</html>