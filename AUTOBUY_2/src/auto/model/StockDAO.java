package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StockDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;	

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
	
		
		// 카페 전체 제품 보여주기
		public ArrayList<StockDTO> showStock() {	
		
			ArrayList<StockDTO> list = new ArrayList<StockDTO>();
			
			try {
				conn();
				String sql = "select * from stock order by product_num";
				psmt = conn.prepareStatement(sql);				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int product_num = rs.getInt("product_num");
					String product_name = rs.getString("product_name");
					String supplier_name = rs.getString("supplier_name");
					int stock_qntty = rs.getInt("stock_qntty");
					int minimum_qntty = rs.getInt("minimum_qntty");	
					int standard_qntty = rs.getInt("standard_qntty");	
					StockDTO dto = new StockDTO(product_num, product_name, supplier_name, stock_qntty, minimum_qntty, standard_qntty);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
		
		// 재고 하나씩 삭제하는 메소드
		public int deleteOneStock(int stock_num){		
			
			try {
				conn();
				String sql = "delete from stock where product_num = ?";
				psmt = conn.prepareStatement(sql);			
				psmt.setInt(1, stock_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return cnt;
		}
	
		// 재고 수량 등록하는 메소드
		public int registQntty(int product_num, int stock_qntty) {
			
			try {
				conn();
				String sql = "update stock set stock_qntty = ? where product_num=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1,stock_qntty);
				psmt.setInt(2,product_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
				
		}
	

}
