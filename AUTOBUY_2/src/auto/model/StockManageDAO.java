package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StockManageDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<Integer> total_necessary_qntty = null;

	// 연결
		public void conn() {
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
		
	// 종료
		public void close() {
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
		
		
		
		public ArrayList<Integer> showSaleInfo(){
			ArrayList<Integer> list = new ArrayList<Integer>();
			try {
				conn();
				for(int i=1; i<=6;i++) {
					int sum = 0;
					String sql = "select * from sale where menu_num = ?";
				
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, i);
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						int sold_quntty = rs.getInt("sold_qntty");
						sum+=sold_quntty;
					}
					list.add(sum);
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				close();
			} return list;
		}
		
		public ArrayList<Integer> usingMaterial(int menu_num) {
			try {
				conn();
				ArrayList<Integer> list = showSaleInfo();
				list.get(0);
			
				
					int total = 0;
					String sql = "select * from material where menu_num = ? order by product_num";
			
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, menu_num );
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						int necessary_qntty = rs.getInt("necessary_qntty");
						total = list.get(menu_num-1) * necessary_qntty;
						total_necessary_qntty.add(total);
						
						
					}
				
			} catch (Exception e) {	
				e.printStackTrace();
			} finally {
				close();
			} return total_necessary_qntty;
			
		}

}
