<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core out</title>
</head>
<body>

	<!-- 테그 자체를 그대로 출력한다 -->
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	
	<!-- 테그를 실행해서 출력한다 -->
	<h4>기본 사용</h4>
	<c:out value="${iTag}"/>
	${iTag}
	
	<!-- 테그를 실행해서 출력한다 -->
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag}" escapeXml="false"/>

	<c:out value="${param.name}" default="이름 없음" />
	<!-- 비어있는 것를 value로 취급 default 실행 X -->
	<c:out value="" default="빈 문자열도 값으로 처리"/>
	

</body>
</html>