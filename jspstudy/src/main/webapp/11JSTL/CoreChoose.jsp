<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTLocore/when/otherwise</title>
</head>
<body>
	<c:set var="num" value="99"/>
	
	<h4>choose</h4>
	<c:choose>
		<c:when test="${num mod 2 eq 0}">
			${num}는 짝수입니다.
		</c:when>
		<c:otherwise>
			${num}는 홀수입니다.
		</c:otherwise>
	</c:choose>
	<h4>영어,수학,과학 점수 입력받아서 평균을 구하고 학점 출력</h4>
	
	<form>
		영어: <input type="number" name="eng" min="0" max="100" value="${param.eng }}"/><br>
		수학: <input type="number" name="math" min="0" max="100"/><br>
		과학: <input type="number" name="sci" min="0" max="100"/><br>
		<input type="submit" value="학점 구하기"/>
	</form>
	
	<!--  90이상 수, 80이상 우, 70이상이면 미, 60이상 양, 나머지 가 -->
	<!--  평균 점수 : ?? / 학점 : ?? -->
	<c:set var="eng" value="${param.eng}"></c:set>
	<c:set var="math" value="${param.math}"></c:set>
	<c:set var="sci" value="${param.sci}"></c:set>
	<c:set var="sum" value="${eng+math+sci}"/>
	<c:set var="avg" value="${sum/3}"/>
	<c:if test="${not(empty eng or empty math or empty sci)}">
	 평균점수 : ${avg}
	 <!-- 
	<c:if test="${avg ge 90}">학점 : 수</c:if>
	<c:if test="${avg ge 80}">학점 : 우</c:if>
	<c:if test="${avg ge 70}">학점 : 미</c:if>
	<c:if test="${avg ge 60}">학점 : 양</c:if>
	<c:if test ="${59 ge avg}">학점 : 가</c:if>
	--> 
	학점:
	<c:choose>
		<c:when test="${avg >= 90}">수</c:when>
		<c:when test="${avg >=80}">우</c:when>
		<c:when test="${avg >= 70}">미</c:when>
		<c:when test="${avg >= 60}">양</c:when>
		<c:otherwise>가</c:otherwise>
	</c:choose>
	</c:if>
</body>
</html>