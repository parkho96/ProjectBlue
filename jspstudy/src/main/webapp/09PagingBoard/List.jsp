<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import ="utils.PagingUtill"%>
<%
	BoardDAO dao = new BoardDAO(application);
	
	String findCol  = request.getParameter("findCol");
	String findWord =  request.getParameter("findWord");
	Map<String,Object> param = new HashMap<String,Object>();
	if(findWord!=null){
		param.put("findCol",findCol);
		param.put("findWord",findWord);
	}
	
	int totalCount = dao.getTotalCount(param);
	
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int blockSize = Integer.parseInt(application.getInitParameter("PAGING_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount/pageSize);	
	
	int pageNum = 1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp!=null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	// 표시할 게시물의 시작과 끝 번호 값 계산
	int start = (pageNum-1)*pageSize+1;
	int end = pageNum*pageSize;
	param.put("start",start);
	param.put("end",end);
	
	List<BoardDTO> boardLists = dao.getListPage(param);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<jsp:include page="../common/Top.jsp"></jsp:include>
	<h2>목록 보기</h2>
	<!-- 검색 -->
	<form method="get">
		<table border ="1" width="90%">
			<tr>
				<td align ="center">
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
	<table border ="1" width="90%">
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
		</tr>
	<% 
		if(boardLists.isEmpty()){ //사실이면 게시물이 없음
	%>
		<tr>
			<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
	<%  
		}else{ //게시물이 있는 경우
			for(BoardDTO dto : boardLists){
	%>
		<tr align="center">
			<td align="center"><%=dto.getNum()%></td>
			<td align="left">
				<a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
		</td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getVisitcount()%></td>
			<td align="center"><%=dto.getPostdate()%></td>
		</tr>
	<%  	
			}
		}
	%>
	</table>
	<table border="1" width="90%">
		<tr align="center">
			<td>
				<%=PagingUtill.pagingCenter(totalCount,pageSize,blockSize,pageNum,request.getRequestURI())%>
			</td>
		</tr>
	</table>
	<div align="center">
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
	</div>
</body>
</html>