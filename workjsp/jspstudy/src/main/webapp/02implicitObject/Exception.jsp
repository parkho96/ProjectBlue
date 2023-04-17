<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exception 내장객체</title>
</head>
<body>

<%
	int status = response.getStatus();


	
	if(status==404)		 // not found 오류일 때
	{
		out.print("404에러 발생");
		out.print("<br>파일 경로를 확인하세요.");
	}
	else if(status==405) // method not allowed 메서드가 허락을 못받았을 때
	{
		out.print("405에러 발생");
		out.print("<br>요청 방식(method)을 확인하세요.");	
	}
	else if(status==500) // Internal server error 내부 서버에서 에러가 났을 때
	{
		out.print("500에러 발생");
		out.print("<br>소스 코드의 에러를 확인하세요.");
	}

%>

</body>
</html>