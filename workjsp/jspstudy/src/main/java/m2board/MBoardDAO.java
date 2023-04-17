package m2board;


import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.BoardDTO;
import common.JDBConnPool;

public class MBoardDAO extends JDBConnPool
{
	public MBoardDAO(){super();}
	
	//fileboard table 검색 조건 고려 결과 전체 개수
	public int countAll(Map<String, Object> map)
	{
		int totalCount=0;
		
		String query= "select count(*) from fileboard";
		if(map.get("searchStr")!=null)
		{	
			query +=" where "+ map.get("searchType") +" like '%"+ map.get("searchStr")+"%'";		
		}
		
		try 
		{
			stmt = con.createStatement();
			rs   = stmt.executeQuery(query);
			// 처음꺼는 속성이기에 다음꺼로 넘기고 읽어가야 한다/
			rs.next();
			totalCount = rs.getInt(1);
		} 
		catch(Exception e) 
		{
			System.out.println("게시물 카운트 중 에러");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<MBoardDTO> getListPage(Map<String,Object> map)
	{
		List<MBoardDTO> bl = new Vector<>();
		String query = "select * from("
	            + " select rownum as pnum,s.* from( "
	            + " select b.* from fileboard b ";
	if(map.get("searchStr")!=null)
	{   
	    query += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";      
	}
	query += " order by idx desc"
	        + ") s"
	        + ") where pnum between ? and ? ";

		try
		{
			psmt=con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next())
			{
				MBoardDTO dto = new MBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPass(rs.getString("pass"));
				bl.add(dto);
			}
		}
		catch(Exception e)
		{
			System.out.println("게시물 목록 읽기 중 에러");
			e.printStackTrace();
		}
		return bl;
	}
	
	public int insertWrite(MBoardDTO dto) 
	{
		int result = 0;
		String query  = "insert into fileboard(idx,name,title,content,ofile,nfile,pass)"
				+ " values(seq_board_num.nextval,?,?,?,?,?,?)";
		try 
		{
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getPass());
			result= psmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public void updateVisitCount(String idx)
	{
		String query="update fileboard set visitcount = visitcount+1"
				+"where idx=?";
		try
		{
			psmt=con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("다운로드 수 증가 중 예외");
			e.printStackTrace();
		}
	}
	
	public MBoardDTO getView(String idx)
	{
		MBoardDTO dto =new MBoardDTO();
		String query = "select * from fileboard where idx=?";
		try 
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next())
			{
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPass(rs.getString("pass"));
			}
		} 
		catch (Exception e) 
		{
			System.out.println("상세보기 중 예외");
			e.printStackTrace();
		}
		
		return dto;
	}

	public void updateDownCount(String idx) {
		String query="update fileboard set downcount = downcount+1"
				+"where idx=?";
		try
		{
			psmt=con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("다운로드 수 증가 중 예외");
			e.printStackTrace();
		}
		
	}
	
}












