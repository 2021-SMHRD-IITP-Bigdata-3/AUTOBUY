package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {

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
	
		
		// 전체 제품 보여주기
		public ArrayList<ProductDTO> showProduct() {	
		
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			
			try {
				conn();
				String sql = "select * from product";
				
				psmt = conn.prepareStatement(sql);				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int product_num = rs.getInt(1);
					String product_name = rs.getString(2);
					String supplier_name = rs.getString(3);
					int product_price = rs.getInt(4);
					int product_qntty = rs.getInt(5);	
					ProductDTO dto = new ProductDTO(product_num, product_name, supplier_name, product_price, product_qntty);
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
