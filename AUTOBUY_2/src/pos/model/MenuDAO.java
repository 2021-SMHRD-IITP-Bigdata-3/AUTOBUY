package pos.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import auto.model.StockDTO;

public class MenuDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;
	static PosDTO info  = null;
	static int cnt = 0;	
	static boolean ok = false;
	MenuDTO dto = null;
	
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
	
	
	public MenuDTO menuInfo(String menu) {
		
		
		try {
			conn();
			String sql = "select * from menu where menu_name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, menu);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				int menu_num = rs.getInt("menu_num");
				String menu_name = rs.getString("menu_name");
				int price = rs.getInt("price");
				
				dto = new MenuDTO(menu_num, menu_name, price);	
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
		
		
	}

}
