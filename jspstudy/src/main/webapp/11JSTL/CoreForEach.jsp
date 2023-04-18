<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page import="common.Person" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장객체(forEach)</title>
</head>
<body>
	<h4>일반 for문</h4>
	<c:forEach var="i" begin="1" end="5" >
		<p>반복 ${i}</p>
	</c:forEach>
	
	<h4>반복문 속성</h4>
	<table border="1">
	<c:forEach begin="3" end="7" var="i" varStatus="loop">
		<tr>
			<td>count:${loop.count}</td> <!--  반복순서 -->
			<td>index:${loop.index}</td> <!--  ? -->
			<td>current:${loop.current}</td> <!--  인덱스의 실제 요소값 -->
			<td>first:${loop.first}</td> <!--  처음인지 여부 boolean으로 돌려줌 -->
			<td>last:${loop.last}</td> <!--  마지막인이 여부 확인후 boolean으로 돌려줌 -->
			<td>i=${i}</td>
		</tr>
	</c:forEach>
	</table>
	for(초기화;조건식;증감식)
	for(반환타입 변수:반복가능객체)
	<h4>enhanced for문</h4>
	<%
		String[] rainbow={"빨","주","노","초","파","남","보"};
	%>
	<c:forEach items="<%=rainbow%>" var="color">
		<span>${color}</span>
	</c:forEach> 
	<%
		String[] rainbow2 = {"red","orange","yellow","green","blue","navy","purple"};
	%>
	<h4>반복문 속성</h4>
	<table border="1">
	<c:forEach items="<%=rainbow2 %>" var="color" varStatus="loop">
		<tr>
			<td>count:${loop.count}</td>
			<td>index:${loop.index}</td>
			<td>current:${loop.current}</td>
			<td>first:${loop.first}</td>
			<td>last:${loop.last}</td>
			<td style="color:${color};">i=${color}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>