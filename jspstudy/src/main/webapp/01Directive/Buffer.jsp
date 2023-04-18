<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buffer 지시어</title>
</head>
<body>
<%
	StringBuffer sb = new StringBuffer();
	sb.append("<ul>");
	for(int i=0; i<100;i++){
		sb.append("<li>"+"li 태그 :"+i);
	}
	sb.append("</ul>");
	out.println(sb.toString());
%>
</body>
</html>