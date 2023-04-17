<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<%	
	// 외부 파일 가져와서 today, tomorrow 변수값 불러오기
	// 위에꺼는 LocalDate이고 아래거는 LocalDateTime이라서 실행결과가 서로 다르다
	out.println("오늘 일자: " + today);
	out.println("<br>");
	out.println("내일 일자: " + tomorrow);
%>


</body>
</html>