package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect
{
	public BoardDAO(ServletContext application)
	{
		super(application);
	}

	public int getTotalCount(Map<String, Object> param)
	{
		int totalCount = 0;
		String sql = "select count(*) from board";
		// 어떻게 찾일지  sql문으로 찾아서 넣기 한거임 (게시물 갯수 세기)
		if(param.get("findWord")!= null)
		{
			sql += " where "+param.get("findCol")+" like '%" + param.get("findWord")+"%'";
		}
		try 
		{
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			//이걸 왜 해줘야하는지 찾아볼 것 
			rs.next();
			//count(*)의 값만 나옴
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) 
		{
			System.out.println("게시물 카운트 중 에러");
			e.printStackTrace();
		}
		
		
		
		return totalCount;
	}
	
	//게시물 내용 읽기
	public List<BoardDTO> getList(Map<String, Object> param)
	{
		List<BoardDTO> b1 = new Vector<BoardDTO>();
		String sql = "select * from board";
		if(param.get("findWord")!= null)
		{
			sql += " where "+param.get("findCol")+" like '%" 
					+ param.get("findWord")+"%'";
		}
		sql+=" order by num desc";
		try 
		{
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				b1.add(dto);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("게시물 목록 읽는 중 에러");
			e.printStackTrace();
		}
	
		return b1;
		
	}
	
	//페이지별 게시물 읽어오기
	public List<BoardDTO> getListPage(Map<String, Object> param)
	{
		List<BoardDTO> b1 = new Vector<BoardDTO>();
		String sql = "select * from ( "
				+ "            select rownum pnum, s.* from ("
				+ "						  select b.* from board b";
		if(param.get("findWord")!= null)
		{
			sql += " where "+param.get("findCol")+" like '%" 
					+ param.get("findWord")+"%'";
		}		
			sql	+= " 	       order by num desc"
					+ "		   )s"
					+ ")"
					+ "where pnum between ? and ?";
		
		try 
		{
			psmt=con.prepareStatement(sql);
			psmt.setString(1, param.get("start").toString());
			psmt.setString(2, param.get("end").toString());
			rs=psmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				b1.add(dto);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("게시물 목록 읽는 중 에러");
			e.printStackTrace();
		}
	
		return b1;
		
	}
	
	
	
	
	//게시물 작성 
	public int insertWrite(BoardDTO dto)
	{
		int res = 0;
		try 
		{
			String sql="insert into board(num, title, content, id, visitcount)"
					+ " values(seq_board_num.nextval,?,?,?,0)";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			res=psmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			System.out.println("게시물 입력 중 에러");
			e.printStackTrace();
		}
		return res;
	}
	
	
	   
	public BoardDTO getView(String num) {
	      BoardDTO dto = new BoardDTO();
	      String sql="select b.*, m.name from board b, member m where b.id=m.id and num=?";
	      try {
	         psmt=con.prepareStatement(sql);
	         psmt.setString(1, num);
	         rs=psmt.executeQuery();
	         if(rs.next()) {
	            dto.setNum(rs.getString("num"));
	              dto.setTitle(rs.getString("title"));
	              dto.setContent(rs.getString("content"));
	              dto.setPostdate(rs.getDate("postdate"));
	              dto.setId(rs.getString("id"));
	              dto.setVisitcount(rs.getString("visitcount"));
	              dto.setName(rs.getString("name"));
	         }
	      }catch(Exception e) {
	         System.err.println("게시물 상세보기 중 에러");
	         e.printStackTrace();
	      }
	      
	      return dto;
	   }
	
	   public void updateVisitCount(String num) {
		      String sql="update board set visitcount=visitcount+1 where num=?";
		      
		      try {
		         psmt=con.prepareStatement(sql);
		         psmt.setString(1, num);
		         psmt.executeUpdate();
		      }catch(Exception e) {
		         System.out.println("게시물 조회수 증가 중 에러");
		         e.printStackTrace();
		      }
	   	}
	   //게시물 삭제
	   public int deletePost(String num)
	   {
		   int res=0;
		   try 
		   {
			   String sql="delete from board where num=?";
			   psmt=con.prepareStatement(sql);
			   psmt.setString(1, num);
			   res=psmt.executeUpdate();
		   } 
		   catch(Exception e) 
		   {
			   System.out.println("게시물 삭제 중 에러");
			   e.printStackTrace();
		   }
		  
		   return res;
	   }
	   
	   //게시물 수정
	   public int updateEdit(BoardDTO dto)
	   {
		   int res=0;
		   
		   try 
		   {
			   String sql="update board set title=?, content=? where num=?";
			   psmt=con.prepareStatement(sql);
			   psmt.setString(1, dto.getTitle());
			   psmt.setString(2, dto.getContent());
			   psmt.setString(3, dto.getNum());
			   res = psmt.executeUpdate();
			   
		   } 
		   catch (Exception e) 
		   {
			   System.out.println("게시물 수정 중 에러");
			   e.printStackTrace();
		   }	
		   return res;
	   }
}












