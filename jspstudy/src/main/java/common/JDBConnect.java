package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {
		//jdbc driver 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id ="lee";
			String pw = "1234";
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결(기본)");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public JDBConnect(String driver, String url, String id, String pw) {
		//jdbc driver 
		try {
			Class.forName(driver);
			//db connect
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결(매개변수 인자)");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public JDBConnect(ServletContext application) {
		
		try {
			//jdbc driver load
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			String url = application.getInitParameter("OracleUrl");
			String id =application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결(초기화 매개변수)");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(psmt!=null) psmt.close();
				if(con!=null) con.close();
				System.out.println("DB 연결 해제");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
