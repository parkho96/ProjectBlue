<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼값 출력</h2>
	<ul>
		<li>${param.name}</li>
		<li>${param.gender}</li>
		<li>${param.grad}</li>
		<li>${paramValues.hobby[0]}</li>
		<li>${paramValues.hobby[1]}</li>
		<li>${paramValues.hobby[2]}</li>
		<li>${paramValues.hobby[3]}</li>
		<li>${paramValues.hobby[4]}</li>
	</ul>
</body>
</html>