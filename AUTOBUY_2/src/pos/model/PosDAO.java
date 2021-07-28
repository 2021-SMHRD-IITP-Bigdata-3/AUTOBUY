package pos.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
public class PosDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;
	static PosDTO info  = null;
	static int cnt = 0;	
	static boolean ok = false;
	
		public static void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		public static void close() {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(psmt != null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		public static int insertSale(int menu_seq, String menu_name, String qntty, String sysdate) {
			
				try {
					conn();
					String sql = "insert into sale values(?,?,?,?)";
					psmt = conn.prepareStatement(sql);
					psmt.setLong(1, menu_seq);
					psmt.setString(2, menu_name);
					psmt.setString(3, qntty);
					psmt.setString(4, sysdate);
					cnt = psmt.executeUpdate(); 
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				if(cnt>0){
	                System.out.println("가입 성공");   
	                ok=true;
	            }else{
	                System.out.println("가입 실패");
	            }
			close();
				
				return cnt;
			}
		}



