<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Other page</title>
</head>
<body>
   <ul>
      <li>지정된 값:${reqVar}</li>
      <li>매개변수1:${param.param1}</li>
      <li>매개변수2:${param.param2}</li>
   </ul>
</body>
</html>