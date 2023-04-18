<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="common.Person" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application 영역 속성 값</title>
</head>
<body>
	<h2>application 속성</h2>
<%
	Map<String,Person> maps = (Map<String,Person>)application.getAttribute("maps");
	//이름: ?? 나이 : ?? 줄바꿈 이름 : ??
	for(Map.Entry<String,Person> map : maps.entrySet()){
		out.println("이름 : "+map.getValue().getName() +" 나이 : "+map.getValue().getAge()+"<br>");
	}
%>
</body>
</html>