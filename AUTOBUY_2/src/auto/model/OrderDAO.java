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
					String order_num_s = rs.getString("order_num");
					String customer_id = rs.getString("customer_id");
					String customer_store_name = rs.getString("customer_store_name");
					String customer_tel = rs.getString("customer_tel");
					String customer_add = rs.getString("customer_add");
					int order_amount = rs.getInt("order_amount");					
					String order_date = rs.getString("order_date");
					
					dto = new OrderDTO(order_num_s, customer_id, customer_store_name, customer_tel, customer_add, order_amount, order_date);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
		// 점포점주 아이디별 발주 전체 내역 보여주기	 	
		public ArrayList<OrderDTO> showOrderCus(String customerId) {	
			
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			
			try {
				conn();
				String sql = "select * from customer_order where customer_id = ? order by order_date desc";
				psmt = conn.prepareStatement(sql);		
				
				psmt.setString(1, customerId);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					String order_num_s = rs.getString("order_num");
					String customer_id = rs.getString("customer_id");
					String customer_store_name = rs.getString("customer_store_name");
					String customer_tel = rs.getString("customer_tel");
					String customer_add = rs.getString("customer_add");
					int order_amount = rs.getInt("order_amount");					
					String order_date = rs.getString("order_date");
					
					dto = new OrderDTO(order_num_s, customer_id, customer_store_name, customer_tel, customer_add, order_amount, order_date);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
			
		
		// 거래처 아이디별 발주 들어온 전체 내역 보여주기 
		public ArrayList<OrderDTO> showOrderSup(String supStoreName) {	
			
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			
			try {
				conn();
				String sql = "select * from customer_order where order_num = "
							+ "any(select order_num from detail_order where supplier_name = ? ) order by order_date desc";
				psmt = conn.prepareStatement(sql);		
				
				psmt.setString(1, supStoreName);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					String order_num_s = rs.getString("order_num");
					String customer_id = rs.getString("customer_id");
					String customer_store_name = rs.getString("customer_store_name");
					String customer_tel = rs.getString("customer_tel");
					String customer_add = rs.getString("customer_add");
					int order_amount = rs.getInt("order_amount");					
					String order_date = rs.getString("order_date");
					
					dto = new OrderDTO(order_num_s, customer_id, customer_store_name, customer_tel, customer_add, order_amount, order_date);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}		

		
		// 발주제안한 제품 발주 신청시 오더테이블로 이동
		public int insertSuggestOrder(int order_num, String customer_id, String customer_store_name, String customer_tel, String customer_add, int amount) {
			try {
				conn();
				String sql = "insert into customer_order(order_num, customer_id, customer_store_name, order_date, customer_tel, customer_add, order_amount) "
						+ "values(concat(to_char(sysdate, 'yyyymmdd'),?),?,?,sysdate,?,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, order_num);
				psmt.setString(2, customer_id);
				psmt.setString(3, customer_store_name);
				psmt.setString(4, customer_tel);
				psmt.setString(5, customer_add);
				psmt.setInt(6, amount);
			
				
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
					String sql = "insert into detail_order values(concat(to_char(sysdate, 'yyyymmdd'),?),?,?,?,?,null)";
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
			
		
		// 수동발주에서 제품 선택시 cart 테이블에 값 삽입
		public int insertCart(String customer_id, int product_num, String product_name, String supplier_name, int product_price) {
			try {
				conn();
					
					String sql = "insert into cart values(?,?,?,?,?)";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, customer_id);
					psmt.setInt(2, product_num);
					psmt.setString(3, product_name);
					psmt.setString(4, supplier_name);
					psmt.setInt(5, product_price);
					
					
					cnt = psmt.executeUpdate();
						
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;						
		}
		
		// 카트에 담긴 제품을 삭제하는 메소드
		public int deleteCart(String customer_id, int product_num){		
			
			try {
				conn();
				String sql = "delete from cart where customer_id = ? and product_num = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				psmt.setInt(2, product_num);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return cnt;
		}
		
		
		public ArrayList<CartDTO> showCart(String customer_id) {	
			
			ArrayList<CartDTO> list = new ArrayList<CartDTO>();
			
			try {
				conn();
				String sql = "select * from cart where customer_id = ?  order by product_num";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int product_num = rs.getInt("product_num");
					String product_name = rs.getString("product_name");
					String supplier_name = rs.getString("supplier_name");
					int product_price = rs.getInt("product_price");
					CartDTO dto = new CartDTO(customer_id, product_num, product_name, supplier_name, product_price);
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {	
				close();
			}
			return list;
		}
		
	
		public int insertCartDetailOrder(int order_num,ArrayList<CartDTO> cartlist, String[] qntty) {
			try {
				conn();
				for(int i=0; i<cartlist.size(); i++) {			
					String sql = "insert into detail_order(order_num,product_num,product_name,supplier_name,order_qntty) values(concat(to_char(sysdate, 'yyyymmdd'),?),?,?,?,?)";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, order_num);
					psmt.setInt(2, cartlist.get(i).getProduct_num());
					psmt.setString(3, cartlist.get(i).getProduct_name());
					psmt.setString(4, cartlist.get(i).getSupplier_name());
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
		
		public int deleteCartTable(String customer_id){			
			try {
				conn();
				String sql = "delete from cart where customer_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return cnt;
		}
		
		
		public OrderDTO showReceipt(String customer_id) {
			OrderDTO Dto=null;
			try {
				conn();
				String sql = "select * from (select * from customer_order where customer_id = ? order by order_num desc) where rownum=1";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, customer_id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					String order_num = rs.getString("order_num");
					int amount = rs.getInt("order_amount");
					
					 Dto = new OrderDTO(order_num, amount);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}			
			return Dto;
		}

	
	
		
	
}
