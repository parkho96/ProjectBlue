<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core forEach</title>
</head>
<body>
	<h4>일반 for문</h4>
	<!-- 디폴트로는 step는 1로 설정함 -->
	<c:forEach var="i" begin="1" end="3" step="1">
		<p>반복 ${i}</p>
	</c:forEach>

	<h4>반복문 속성</h4>
	<table border="1">
	<c:forEach begin="3" end="7" var="i" varStatus="loop">
		<tr>
			<!-- 반복순서 -->
			<td>count: ${loop.count}</td> 
			
			<!-- 인덱스 값 -->
			<td>index: ${loop.index}</td> 
			
			<!-- 현재 위치 값 -->
			<td>current: ${loop.current}</td> 
			
			<!-- 처음인지 아닌지? -->
			<td>first: ${loop.first}</td> 
			
			<!-- 마지막인지 아닌지? -->
			<td>last: ${loop.last}</td> 
			
			<!-- 인덱스 값 -->
			<td>i:${i}</td>
		</tr>
	</c:forEach>
	</table>


	<h4>enhanced for문(향상된 포문방식)</h4>
	<%
		String[] rainbow={"빨","주","노","초","파","남","보"};
	%>
	<c:forEach items="<%=rainbow%>" var="color">
		<span>${color}</span>
	</c:forEach>
	<%
		String[] rainbow2={"red","orange","yellow","green","blue","navy","purple"};
	%>
	<h4>반복문 속성</h4>
	
	<table border="1">
	<c:forEach items="<%=rainbow2 %>" var="color" varStatus="loop">
		<tr>
			<td>count: ${loop.count}</td> 
			<td>index: ${loop.index}</td> 
			<td>current: ${loop.current}</td> 
			<td>first: ${loop.first}</td> 
			<td>last: ${loop.last}</td> 
			<td style="color:${color};">color:${color}</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>