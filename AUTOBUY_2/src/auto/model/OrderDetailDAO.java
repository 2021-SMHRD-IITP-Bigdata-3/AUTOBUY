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
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_f2";
			String dbpw = "smhrd2";
			
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
		public ArrayList<OrderDetailDTO> showOrderDetail(String order_num) {	
			
			ArrayList<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
			
			try {
				conn();
				String sql = "select * from detail_order where order_num = ?";
				psmt = conn.prepareStatement(sql);	
				psmt.setString(1, order_num);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					order_num = rs.getString("order_num");
					int product_num = rs.getInt("product_num");
					String product_name = rs.getString("product_name");
					int order_qntty = rs.getInt("order_qntty");
					String supplier_name = rs.getString("supplier_name");
					String receipt_date = rs.getString("receipt_date");
					String forwarding_date = rs.getString("forwarding_date");
					String product_pic = rs.getString("product_pic");
					
					OrderDetailDTO dto = new OrderDetailDTO(order_num, product_num, product_name, order_qntty, supplier_name, receipt_date, forwarding_date, product_pic);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
	
		
		// 개별 제품 출고완료시 -> 출고일 업데이트 메소드
		public int updateOneForward(String order_num, int product_num) {
			
			try {
				conn();				
				String sql = "update detail_order set forwarding_date = to_date(sysdate) where order_num = ? and product_num = ?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, order_num);
				psmt.setInt(2, product_num);
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;			
		}
		
		
		// 개별 제품 수령확인시 -> 입고일 업데이트 메소드
		public int updateOneRecepit(String order_num, int product_num) {
			
			try {
				conn();				
				String sql = "update detail_order set receipt_date = to_date(sysdate) where order_num = ? and product_num = ?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, order_num);
				psmt.setInt(2, product_num);
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;			
		}
		
		
		
		
}
