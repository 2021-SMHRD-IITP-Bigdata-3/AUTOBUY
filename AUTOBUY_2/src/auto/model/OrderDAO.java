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
		
	// 주문번호 테이블
		public ArrayList<Integer> makeOrderNum(){
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			try {
				conn();
				String sql = "select * from makeordernum order by num";
				psmt = conn.prepareStatement(sql);				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int order_num = rs.getInt("num");
					list.add(order_num);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
		// 주문번호를 makeordernum 테이블에 추가하는 메소드
		public int addOrderNum(int num) {
			try {
				conn();
				String sql = "insert into makeordernum values(?)";
				psmt = conn.prepareStatement(sql);				
				psmt.setInt(1,num);
				cnt = psmt.executeUpdate();								
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return cnt;
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
					String supplier_id = rs.getString("supplier_id");
					String customer_store_name = rs.getString("customer_store_name");
					String customer_tel = rs.getString("customer_tel");
					String customer_add = rs.getString("customer_add");
					int order_amount = rs.getInt("order_amount");					
					String order_date = rs.getString("order_date");
					String receipt_date = rs.getString("receipt_date");
					String forwarding_date = rs.getString("forwarding_date");
					
					dto = new OrderDTO(order_num, customer_id, supplier_id, customer_store_name, customer_tel, customer_add, order_amount, order_date, receipt_date, forwarding_date);
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
				psmt.setString(5, dto.getReceipt_date());
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
		
		// 발주제안한 제품 발주 신청시 오더테이블로 이동
		public int insertSuggestOrder(int order_num, String customer_id, String customer_store_name, String customer_tel, String customer_add ) {
			try {
				conn();
				String sql = "insert into customer_order(order_num, customer_id, customer_store_name, order_date, customer_tel, customer_add) values(concat(to_char(sysdate, 'yyyymmdd'),?),?,?,sysdate,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, order_num);
				psmt.setString(2, customer_id);
				psmt.setString(3, customer_store_name);
				psmt.setString(4, customer_tel);
				psmt.setString(5, customer_add);
			
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;						
		}
		
		// 발주제안한 제품 발주 신청시 디테일오더테이블로 이동
		public int insertSuggestDetailOrder(int order_num,ArrayList<AutomaticSuggestDTO> order_list, String[] qntty) {
			try {
				conn();
				for(int i=0; i<order_list.size(); i++) {			
					String sql = "insert into detail_order values(concat(to_char(sysdate, 'yyyymmdd'),?),?,?,?,?)";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, order_num);
					psmt.setInt(2, order_list.get(i).getProduct_num());
					psmt.setString(3, order_list.get(i).getProduct_name());
					psmt.setString(4, order_list.get(i).getSupplier_name());
					psmt.setInt(5, Integer.parseInt(qntty[i]));
					
					
					cnt = psmt.executeUpdate();
				}
				
			
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;						
		}
			
		
		
		
		

		
		
	
	

	
		
}
