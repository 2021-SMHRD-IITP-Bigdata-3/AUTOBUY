package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
		
		// 재고 하나씩 등록하는 메소드
		public int registOneProduct(String customer_id, int product_num, String product_name, String supplier_name, int price){		
			try {
				conn();
				String sql = "insert into stock values(?, ?, ?, ?, ?, 0, 0, 0)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				psmt.setInt(2, product_num);
				psmt.setString(3, product_name);
				psmt.setString(4, supplier_name);
				psmt.setInt(5, price);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return cnt;
		}
					
	
		
		// 카페 전체 제품 보여주기
		public ArrayList<StockDTO> showStock(String customer_id) {	
		
			ArrayList<StockDTO> list = new ArrayList<StockDTO>();
			
			try {
				conn();
				String sql = "select * from stock where customer_id = ?  order by product_num";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					customer_id = rs.getString("customer_id");
					int product_num = rs.getInt("product_num");
					String product_name = rs.getString("product_name");
					String supplier_name = rs.getString("supplier_name");
					int stock_qntty = rs.getInt("stock_qntty");
					int minimum_qntty = rs.getInt("minimum_qntty");	
					int standard_qntty = rs.getInt("standard_qntty");	
					StockDTO dto = new StockDTO(customer_id, product_num, product_name, supplier_name, stock_qntty, minimum_qntty, standard_qntty);
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
		public int deleteOneStock(String customer_id, int stock_num){		
			
			try {
				conn();
				String sql = "delete from stock where customer_id = ? and product_num = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				psmt.setInt(2, stock_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return cnt;
		}
	
		// 재고 수량 등록하는 메소드
		public int registQntty(String customer_id, int product_num, int stock_qntty) {
			
			try {
				conn();
				String sql = "update stock set stock_qntty = ? where customer_id = ? and product_num=? ";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1,stock_qntty);
				psmt.setString(2, customer_id);
				psmt.setInt(3,product_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
				
		}
		
		// 기준/최소 재고 수량 등록하는 메소드
		public int modifyQntty(int product_num, int standard_qntty, int minimum_qntty) {
			
			try {
				conn();
				String sql = "update stock set standard_qntty = ?, minimum_qntty = ? where product_num = ? ";
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1,standard_qntty);
				psmt.setInt(2,minimum_qntty);
				psmt.setInt(3,product_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
				
		}
	

}
