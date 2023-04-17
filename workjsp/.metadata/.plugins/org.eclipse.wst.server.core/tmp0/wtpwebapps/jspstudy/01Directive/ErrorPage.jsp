<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 속성 errorPage</title>
</head>
<body>
<%--
	int myAge=Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 당신의 나이: "+ myAge);
--%>

<%
try
{
	// 입력값이 null값을 넣을 경우 parseInt를 하지 못하기에 오류가 나옴
	int myAge=Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 당신의 나이: "+ myAge);
}
catch(Exception e)
{
	out.println("예외처리:매개변수 age가 null");

//catch가 안에 있지 않는 경우에도 이에 맞춰서 실행해줌//
%>
	<h1>예외</h1>
<%
}
%>

</body>
</html>