<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core import</title>
</head>
<body>
	<!-- 오류 찾아보기 -->
	<c:set var="reqVar" value="park"/>
	<!-- var="~~"로 변수를 선언하면 나오지 않고 ${~~}로 표현해야 나온다! -->
	<c:import url="./include/OtherPage.jsp" var="contents">
		<c:param name="param1" value="JSP"/>		
		<c:param name="param2" value="JAVA"/>
	</c:import>	

	<h4>다른 문서 삽입하기</h4>	
	${contents}
	<c:import url="./include/OtherPage.jsp">
		<c:param name="param1" value="ultra"/>		
		<c:param name="param2" value="super"/>
	</c:import>	
	<iframe src="./include/OuterPage.jsp" style="width:100%;height:600px;"></iframe>
	
</body>
</html>