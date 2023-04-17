<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grade</title>
</head>
<body>

	
	<h4>영어,수학,과학 점수 입력받아서 평균을 구하고 학점 출력</h4>
	<form>
		영어:<input type="number" name="eng" 	 min="0" max="100" value="${param.eng }"/><br>
		수학:<input type="number" name="math" min="0" max="100" value="${param.math}"/><br>
		과학:<input type="number" name="esc"  min="0" max="100" value="${param.esc }"/><br>
		<input type="submit" value="학점 구하기"/>
	</form>
	<!-- 90이상 수, 80이상 우, 70이상 미, 60이상 양, 나머지 가 -->
	<!-- 평균점수 : ??? / 학점 : ?? -->
	
	
	<c:if test ="${not empty param.eng 
				|| not empty param.math
				|| not empty param.esc}">
		영어 학점: 
		<c:choose>
			<c:when test="${param.eng >= 90}">수</c:when>
			<c:when test="${param.eng >= 80}">우</c:when>
			<c:when test="${param.eng >= 70}">미</c:when>
			<c:when test="${param.eng >= 60}">양</c:when>
			<c:otherwise>가</c:otherwise>
		</c:choose>
		<br>
		수학 학점:
		<c:choose>
			<c:when test="${param.math >= 90}">수</c:when>
			<c:when test="${param.math >= 80}">우</c:when>
			<c:when test="${param.math >= 70}">미</c:when>
			<c:when test="${param.math >= 60}">양</c:when>
			<c:otherwise>가</c:otherwise>
		</c:choose>
		<br>
		과학 학점:
		<c:choose>
			<c:when test="${param.esc >= 90}">수</c:when>
			<c:when test="${param.esc >= 80}">우</c:when>
			<c:when test="${param.esc >= 70}">미</c:when>
			<c:when test="${param.esc >= 60}">양</c:when>
			<c:otherwise>가</c:otherwise>
		</c:choose>
		
		<br>
		
		평균점수 : ${(param.eng+param.math+param.esc)/3}<br>
		<c:set var="avg" value="${(param.eng+param.math+param.esc)/3}"/>
		평균점수2: ${avg}<br>
		
		전체학점:
		<c:choose>
			<c:when test="${avg >= 90}">수</c:when>
			<c:when test="${avg >= 80}">우</c:when>
			<c:when test="${avg >= 70}">미</c:when>
			<c:when test="${avg >= 60}">양</c:when>
			<c:otherwise>가</c:otherwise>
		</c:choose>
	</c:if>


</body>
</html>