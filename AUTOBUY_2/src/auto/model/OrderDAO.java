package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	OrderDTO dto = null;
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
		
	
	// 주문 들어온 전체 제품 보여주기		
		public ArrayList<OrderDTO> showOrder() {	
			
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			
			try {
				conn();
				String sql = "select * from customer_order order by order_date desc";
				psmt = conn.prepareStatement(sql);				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int order_num = rs.getInt("order_num");
					String customer_id = rs.getString("customer_id");
					String customer_store_name = rs.getString("customer_store_name");
					String order_date = rs.getString("order_date");
					String customer_tel = rs.getString("customer_tel");
					String customer_add = rs.getString("customer_add");
					int order_amount = rs.getInt("order_amount");
					dto = new OrderDTO(order_num, customer_id, customer_store_name, order_date, customer_tel, customer_add, order_amount);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
		//주문 들어온 전체 제품 테이블에 담기
		public int insertCustomerOrder() {
			try {
				conn();
				String sql = "insert into customer_order(order_num, customer_id, customer_store_name, order_date, receipt_date, customer_tel, customer_add, order_amount) values(?,?,?,sysdate,?,?,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, dto.getOrder_num());
				psmt.setString(2, dto.getCustomer_id());
				psmt.setString(3, dto.getCustomer_store_name());
				psmt.setString(4, dto.getOrder_date());
				psmt.setInt(5, dto.getReceipt_date());
				psmt.setString(6, dto.getCustomer_tel());
				psmt.setString(7, dto.getCustomer_add());
				psmt.setInt(8, dto.getOrder_amount());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
			
			
			
		}
		
		
		

		
		
	
	

	
		
}
