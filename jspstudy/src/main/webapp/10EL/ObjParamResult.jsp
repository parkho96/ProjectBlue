<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- @ page import="common.Person" --%>
<%--
	Person p = (Person)request.getAttribute("personObj");

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체 값 읽기</title>
</head>
<body>
	<h2>객체 읽기</h2>
	<ul>
		
	<li>Person 이름:${personObj.name},나이:${personObj.age}</li>
	<li>String ${requestScope.stringObj}</li>
	<li>Integer ${integerObj}</li>
	</ul>
	<h2>pram 매개변수</h2>
	<ul>
		<li>${param.back+param['Leeback']}</li>
		<li>${param.back+3}+${param["Leeback"]}</li>
		<li>+</li>
	</ul>
</body>
</html>