package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberDTO info  = null;
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
		
	// 회원가입
		public int join(MemberDTO dto) {
			try {
				conn();
				String sql = "insert into member values(?,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getCustomer_id());
				psmt.setString(2, dto.getCustomer_pw());
				psmt.setString(3, dto.getNickName());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();			
			}
			return cnt;
			
		}
		
	// 로그인
		public MemberDTO login(String id, String pw) {
			try {
				conn();
				String sql = "select * from web_member where customer_id = ? and customer_pw = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					String customer_id = rs.getString(1);
					String customer_pw = rs.getString(2);
					String nickName = rs.getString(3);
					String store_name = rs.getString(4);
					String customer_regist_number = rs.getString(5);
					String address = rs.getString(6);
					String ceo = rs.getString(7);
					String tel = rs.getString(8);
					String email = rs.getString(9);
					String payment = rs.getString(10);
					
					info = new MemberDTO(customer_id, customer_pw, nickName, store_name, customer_regist_number, address, ceo, tel, email, payment);
				}
		
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}return info;
		}
		
}

