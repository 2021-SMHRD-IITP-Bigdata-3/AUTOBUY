package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDetailDAO {
	
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
		
		
		// 점포점주 아이디별 주문 상세 보여주기		
		public ArrayList<OrderDetailDTO> showOrderDetail(int order_num) {	
			
			ArrayList<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
			
			try {
				conn();
				String sql = "select * from detail_order where order_num = ?";
				psmt = conn.prepareStatement(sql);	
				psmt.setInt(1, order_num);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					order_num = rs.getInt("order_num");
					int product_num = rs.getInt("product_num");
					String product_name = rs.getString("product_name");
					int order_qntty = rs.getInt("order_qntty");
					
					OrderDetailDTO dto = new OrderDetailDTO(order_num, product_num, product_name, order_qntty);
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
