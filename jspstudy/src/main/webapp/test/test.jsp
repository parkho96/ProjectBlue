<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import="blue_project.JDBConnPool" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table border="1">
 <tr>
 	<td>이름</td><td>직업</td>
 	
 	<%
 	String sql = "select * from person";
 	JDBConnPool jd = new JDBConnPool();
 	jd.psmt = jd.con.prepareStatement(sql);
 	jd.rs = jd.psmt.executeQuery();
 	while(jd.rs.next()){
 		out.println("<tr>");
 		out.println("<td>"+jd.rs.getString("name"));
 		out.println("<td>"+jd.rs.getString("age"));
 		out.println("</tr>");
 	}
 	%>
 </tr>
 </table>
</body>
</html>