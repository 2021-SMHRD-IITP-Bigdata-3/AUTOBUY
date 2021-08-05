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
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 전체 제품 보여주기
	public ArrayList<ProductDTO> showProduct() {

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			conn();
			String sql = "select * from product order by product_num";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int product_num = rs.getInt("product_num");
				String product_name = rs.getString("product_name");
				String supplier_name = rs.getString("supplier_name");
				int product_price = rs.getInt("product_price");
				int product_qntty = rs.getInt("product_qntty");
				String product_pic = rs.getString("product_pic");
				ProductDTO dto = new ProductDTO(product_num, product_name, supplier_name, product_price, product_qntty,
						product_pic);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 제품별 가격 가져오기
	public int getPrice(int product_num) {
			int price = 0;
			conn();
			
			String sql = "select product_price from product where product_num = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, product_num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					price = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			return price;
			
	}
	// (거래처)새로운 제품 등록하기
	public int upload(ProductDTO dto) {

		try {
			conn();
			
			
			String sql = "insert into product values(product_num.nextval, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getProduct_name());
			psmt.setString(2, dto.getSupplier_name());
			psmt.setInt(3, dto.getProduct_price());
			psmt.setDouble(4, dto.getProduct_qntty());
			psmt.setString(5, dto.getProduct_pic());
			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

}
