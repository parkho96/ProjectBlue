<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<% 
	BoardDAO dao = new BoardDAO(application);
	
	String findCol= request.getParameter("findCol");
	String findWord= request.getParameter("findWord");

	Map<String, Object> param = new HashMap<String, Object>();
	if(findWord!=null)
	{
		param.put("findCol",findCol);
		param.put("findWord",findWord);
		
	}
	
	int totalCount = dao.getTotalCount(param);
	List<BoardDTO> boardLists = dao.getList(param);
	dao.close();
	
	/*List<BoardDTO> boardLists =dao.getList(findCol,findWord);*/  

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<h2>목록 보기</h2>
	<!-- 검색(자기 자신에서 검색창이 뜨기에 ACTION이 따로 구현할 필요없다) -->
		<form  method="get">
			<table border= "1" width="90%">
				<tr>
					<td align="center">
						<select name="findCol">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="findWord"/>
						<input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
		<!-- 목록 -->
		<table border= "1" width="90%">
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
			</tr>
		<%
			//게시물에 내용물이 없으면
			if(boardLists.isEmpty())
			{
		%>
			<tr>
				<td colspan = "5" align="center">등록된 게시물이 없습니다.</td>
			</tr>
		<%
			//게시물에 내용물이 있으면 클릭시 뷰를 나오게 할려는 목적
			}else{
				for(BoardDTO dto:boardLists)
				{
		%>
			<tr align="center">
				<td align="center"><%=dto.getNum() %></td>
				<td align="Left">
					<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle()%></a>
				</td>
				<td align="center"><%=dto.getId() %></td>
				<td align="center"><%=dto.getVisitcount() %></td>
				<td align="center"><%=dto.getPostdate() %></td>
			</tr>
		
		<%
				}
				
			}
		%>
		</table>
		<br>
		<div align="center">
         <button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
     	 </div>
		
</body>
</html>

















