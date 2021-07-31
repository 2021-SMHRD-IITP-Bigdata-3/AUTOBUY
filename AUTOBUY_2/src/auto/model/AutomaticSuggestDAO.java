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
				int now = rs.getInt("stock_qntty");
				int min = rs.getInt("minimum_qntty");
				int max = rs.getInt("standard_qntty");
				
				AutomaticSuggestDTO dto = new AutomaticSuggestDTO(num, name, now, min, max);
				list.add(dto);
				
			}
		
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		} return list;
	}

	
	// 자동발주 테이블에 제안할 정보를 담는 메소드
	public int registOrder(String customer_id, int product_num, String product_name, int suggest_qntty){		
		try {
			conn();
			String sql = "insert into order_suggest values(?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id);
			psmt.setInt(2, product_num);
			psmt.setString(3, product_name);
			psmt.setInt(4, suggest_qntty);
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}			
		return cnt;
	}
	
	
	
	
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
				int order_qntty = rs.getInt("suggest_qntty");
				
				AutomaticSuggestDTO dto = new AutomaticSuggestDTO(product_num, product_name, order_qntty);
				list.add(dto);		
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		} return list;
		
		
		
		
	}
	
	
}
