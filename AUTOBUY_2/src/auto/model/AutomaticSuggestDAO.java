package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AutomaticSuggestDAO {
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
	
	// 자동발주 제안시 필요한 정보를 담는 메소드
	public ArrayList<AutomaticSuggestDTO> showAutoOrderInfo(String customer_id){
		ArrayList<AutomaticSuggestDTO> list = new ArrayList<AutomaticSuggestDTO>();
		try {
			conn();
			String sql = "select * from stock where customer_id = ? order by product_num";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("product_num");
				String name= rs.getString("product_name");
				String supplier = rs.getString("supplier_name");
				int price = rs.getInt("product_price");
				int now = rs.getInt("stock_qntty");
				int min = rs.getInt("minimum_qntty");
				int max = rs.getInt("standard_qntty");
				
				AutomaticSuggestDTO dto = new AutomaticSuggestDTO(num, name, supplier, now, min, max, price);
				list.add(dto);
				
			}
		
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		} return list;
	}

	
	// 자동발주 테이블에 제안할 정보를 담는 메소드
	public int registOrder(String customer_id, int product_num, String product_name, String supplier_name,int product_price, int suggest_qntty){		
		try {
			conn();
			String sql = "insert into order_suggest values(?, ?, ?, ?, ?, ?, null)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id);
			psmt.setInt(2, product_num);
			psmt.setString(3, product_name);
			psmt.setString(4,supplier_name);
			psmt.setInt(5,product_price);
			psmt.setInt(6,suggest_qntty);
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}			
		return cnt;
	}
	
	// 재고부족 제품을 보여주는 메소드
	public ArrayList<AutomaticSuggestDTO> showSuggest(String customer_id){
		ArrayList<AutomaticSuggestDTO> list = new ArrayList<AutomaticSuggestDTO>();
		try {
			conn();
			String sql = "select * from order_suggest where customer_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				int product_num = rs.getInt("product_num");
				String product_name = rs.getString("product_name");
				String supplier_name = rs.getString("supplier_name");
				int price = rs.getInt("product_price");
				int order_qntty = rs.getInt("suggest_qntty");
				
				AutomaticSuggestDTO dto = new AutomaticSuggestDTO(product_num, product_name, supplier_name, price, order_qntty);
				list.add(dto);		
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		} return list;
		
		}
		
	// 제안한 제품을 삭제하는 메소드
	public int deleteSuggest(String customer_id, int stock_num) {
		try {
			conn();
			String sql = "delete from order_suggest where customer_id = ? and product_num = ?";
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
	
	// 제안되지 않은 제품을 등록하는 메소드
	public int registSuggest(String customer_id, int product_num, String product_name, String supplier_name, int price){		
		try {
			conn();
			String sql = "insert into order_suggest values(?, ?, ?, ?, ?, 0)";
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
	
	// 제안 제품 발주 혹은 발주 취소시 order_suggest 정보 테이블에서 삭제하는 메소드 (데이터 중복 방지)
	public int deleteSuggestTable(String customer_id) {
		try {
			conn();
			String sql = "delete order_suggest where customer_id=?";
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
	
}
