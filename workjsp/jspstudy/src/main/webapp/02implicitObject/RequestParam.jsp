<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 내장객체</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8");%>
<%

	String id=request.getParameter("id");
	// 1개만 넘어오니까 일반 String
	String gender=request.getParameter("gender");
	// 여러개가 넘어올 수 있기에 String 배열
	String[] inter=request.getParameterValues("inter");
	String interStr="";
	if(inter!=null)
	{
		for(String str:inter)
		{
			interStr+=str+" ";
		}
	}
	String intro=request.getParameter("intro").replace("\r\n" , "<br>");

%>
	<ul>
		<li>아이디: <%=id %></li>
		<li>성별: <%=gender %></li>
		<li>관심사: <%=interStr %></li>
		<li>자기소개: <%=intro %></li>
		
	</ul>
	
	

</body>
</html>