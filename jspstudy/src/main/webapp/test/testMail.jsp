<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 전송 화면</title>
<style>
.container {
  width: 600px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #e5e5e5;
  background-color: #ffffff;
  font-family: Arial, sans-serif;
}

h1 {
  text-align: center;
  font-size: 24px;
  color: #007bff;
  margin-bottom: 30px;
}

form {
  margin-top: 20px;
}

label {
  display: block;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #333333;
}

input[type="email"],
input[type="text"],
textarea {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 16px;
}

input[type="submit"] {
  display: block;
  width: 100%;
  padding: 15px;
  margin-top: 20px;
  background-color: #007bff;
  color: #ffffff;
  border: none;
  border-radius: 3px;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>
<div class="container">
  <h1>메일 전송</h1>
  <form action="sendMail.jsp" method="post">
    <label for="to">받는 사람:</label>
    <input type="email" id="to" name="to" required><br>
    <label for="subject">제목:</label>
    <input type="text" id="subject" name="subject" required><br>
    <label for="content">내용:</label><br>
    <textarea id="content" name="content" rows="5" cols="30" required></textarea><br>
    <input type="submit" value="전송">
  </form>
</div>
</body>
</html>