<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 변수 선언  scope의 디폴트 값은 page라서 굳이 입력 안해도 됨-->
<c:set var="scopeVar" value="Page value"/>
<c:set var="scopeVar" value="Request value" scope="request" />
<c:set var="scopeVar" value="Session value" scope="session" />
<c:set var="scopeVar" value="Application value" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core remove</title>
</head>
<body>

	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	
	<c:remove var="scopeVar" scope="request"/>
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	<!-- page는 상위 존재 값을 항상 상속 받음  -->
	<c:remove var="scopeVar" scope="page"/>
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	
	<!-- 값을 설정 안하면 다 지움 -->
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
	</ul>
	

</body>
</html>