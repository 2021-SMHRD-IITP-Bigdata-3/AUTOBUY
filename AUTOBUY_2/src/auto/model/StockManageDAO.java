package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sun.net.www.MeteredStream;

public class StockManageDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<Integer> total_necessary_qntty = null;

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
		
		// 메뉴별 판매량 리스트 메소드
		public ArrayList<Integer> showSoldQntty(){
			ArrayList<Integer> list = new ArrayList<Integer>();
			try {
				conn();
				for(int i=1; i<=6;i++) {
					int sum = 0;
					String sql = "select menu_num, sold_qntty from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd') and menu_num = ?";
				
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, i);
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						int sold_quntty = rs.getInt("sold_qntty");
						sum+=sold_quntty;
					}
					list.add(sum);
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				close();
			} return list;
		}
		
		// 원자재 정보 리스트 메소드
		public ArrayList<MaterialInfoDTO> showMaterialInfoList() {
			
			ArrayList<MaterialInfoDTO> list = new ArrayList<MaterialInfoDTO>();
			
			try {
				conn();		
				for(int i=1;i<=6;i++){
					String sql = "select * from material where menu_num = ? order by product_num";
			
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, i );
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						int menu_num = rs.getInt("menu_num");
						int product_num = rs.getInt("product_num");
						String product_name = rs.getString("product_name");
						double necessary_qntty = rs.getDouble("necessary_qntty");
						
						MaterialInfoDTO dto = new MaterialInfoDTO(menu_num, product_num, product_name, necessary_qntty);
						
						list.add(dto);					
					}
				}
				
			} catch (Exception e) {	
				e.printStackTrace();
			} finally {
				close();
			} return list;
			
		}
		
		public ArrayList<StockDTO> showOutgoing() {
			
			ArrayList<Integer> sold_qntty = showSoldQntty();
			ArrayList<MaterialInfoDTO> material_info = showMaterialInfoList();
			ArrayList<StockDTO> list = null;
			
			for(int i=0; i<material_info.size(); i++) {
				int k=1;
				for(int j=0;j<6;j++) {
					if(k==material_info.get(i).getMenu_num()) {
						double outgoing_qntty = material_info.get(i).getNecessary_qntty()*sold_qntty.get(j);
						int product_num = material_info.get(i).getProduct_num();
						String product_name = material_info.get(i).getProduct_name();
						StockDTO dto = new StockDTO(product_num, product_name, outgoing_qntty);
						list.add(dto);
					}else {
						k++;
					}
				}
				
			}
			
			return list;
			
			
		}
		
		// 재고량 조절하는 메소드
		public int updateStock(String customer_id) {
			
			ArrayList<Integer> sold_qntty = showSoldQntty();
			ArrayList<MaterialInfoDTO> material_info = showMaterialInfoList();
			
			try {
				conn();
				
				for(int i=0; i<material_info.size(); i++) {
					int k=1;
					String sql = "update stock set stock_qntty=(stock_qntty-?) where customer_id = ? and product_num = ?";
					psmt = conn.prepareStatement(sql);
					for(int j=0;j<6;j++) {
						if(k==material_info.get(i).getMenu_num()) {
							psmt.setDouble(1, material_info.get(i).getNecessary_qntty()*sold_qntty.get(j));
							psmt.setString(2, customer_id);
							psmt.setInt(3, material_info.get(i).getProduct_num());
							cnt = psmt.executeUpdate();
							cnt++;
							}else {
								k++;
							}
						}
				
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			} return cnt;
			
			
		}
		
		
		

}
