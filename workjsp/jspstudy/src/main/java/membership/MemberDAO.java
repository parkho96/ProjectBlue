package membership;

import board.BoardDTO;
import common.JDBConnect;

public class MemberDAO extends JDBConnect{
   public MemberDAO(String driver,String url, String id, String pw) {
      super(driver,url,id,pw);
   }
   
   public MemberDTO getMember(String uid,String upw){
      String query= "SELECT * FROM MEMBER WHERE ID=? AND PW=?";
      MemberDTO dto= new MemberDTO();
      try {
      psmt=con.prepareStatement(query);
      psmt.setString(1,uid);
      psmt.setString(2,upw);
      rs=psmt.executeQuery();
      
      if(rs.next()) {
         dto.setId(rs.getString("id"));
         dto.setPw(rs.getString("pw"));
         dto.setName(rs.getString("name"));
         dto.setRegdate(rs.getString("regdate"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dto;
   }
   
   //게시물 중 하나 읽어 보기 
   public BoardDTO getView(String num)
   {
	   BoardDTO dto = new BoardDTO();
	   String sql="select b.*, m.name "
	   		+ "from board b inner join member m on b.id=m.id"
	   		+ "where num=?";
	   
	  try 
	  {
		  psmt=con.prepareStatement(sql);
		  psmt.setString(1, num);
	  } 
	  catch (Exception e) 
	  {
		  System.out.println("게시물 상세보기 중 에러");
		  e.printStackTrace();
	  }
	   
	   
	   return dto;
   }

   
   
}
