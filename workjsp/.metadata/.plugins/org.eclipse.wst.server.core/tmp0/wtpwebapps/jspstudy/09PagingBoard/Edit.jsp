<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="utils.AlertFunc" %>
<%
   String num=request.getParameter("num");

   BoardDAO dao=new BoardDAO(application);
   BoardDTO dto = dao.getView(num);
   String sessionId=session.getAttribute("UserId").toString();
   if(!sessionId.equals(dto.getId())){
      AlertFunc.alertLocation("삭제완료", "List.jsp", out);
      return;
   }
   dao.close();
   
   //제목과 내용에 대한 유효성 체크 , 비어있는지 안비어있는지 확인 리퀘스트 금지 자바스크립트로
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>


<script type="text/javascript">
function validateForm(form)
{
    if(form.title.value=="")
    {
       alert("제목을 입력하지 않았습니다.");
       form.title.focus();
       return false;
    }
    else if(form.content.value=="")
    {
       alert("내용을 입력하지 않았습니다.");
       form.content.focus();
       return false;
    }
    return true;
 }
</script>


</head>
<body>
   <jsp:include page="../common/Top.jsp"/>
   <h2>수정하기</h2>
   <form action="EditProc.jsp" name="editForm" method="post" onsubmit="return validateForm(this);">
      <input type="hidden" name="num" value="<%=dto.getNum()%>"/>
      <table border="1" width="90%">
         <tr>
            <td>제목</td>
            <td>
               <input type="text" name="title" step="width:90%;" value="<%=dto.getTitle()%>">
            </td>
         
         </tr>
         
         <tr>
            <td>내용</td>
            <td>
               <textarea name="content" style="width: 90%;height: 100px;"><%=dto.getContent() %></textarea>
            </td>
         
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit">작성완료</button>
               <button type="reset">초기화</button>
               <button type="button" onclick="location.href='List.jsp';">목록보기</button>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>