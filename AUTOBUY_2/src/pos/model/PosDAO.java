package pos.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import auto.model.StockDTO;
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
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_f2";
			String dbpw = "smhrd2";			
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
		
		public static int insertSale(int menu_seq, String menu_name, int qntty) {
			
				try {
					conn();
					String sql = "insert into sale values(?,?,?,sysdate)";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, menu_seq);
					psmt.setString(2, menu_name);
					psmt.setInt(3, qntty);
					cnt = psmt.executeUpdate(); 
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					close();
				}	
				return cnt;
		}
		
		// 당일 판매메뉴, 판매량을 리스트에 담는 메소드
		public ArrayList<PosDTO> showSale() {
			
			ArrayList<PosDTO> list = new ArrayList<PosDTO>();
			
			try {
				conn();
				String sql = "select * from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd')";
				psmt = conn.prepareStatement(sql);				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int menu_num = rs.getInt("menu_num");
					String menu_name = rs.getString("menu_name");
					int sold_qntty = rs.getInt("sold_qntty");
					String sold_date = rs.getString("sold_date");	
					PosDTO dto = new PosDTO(menu_num, menu_name, sold_qntty, sold_date);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
			
		
		
}
				



