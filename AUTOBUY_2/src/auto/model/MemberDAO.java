package auto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import auto.model.MemberDTO;

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
				String sql = "insert into member(customer_id, customer_pw, store_name, nickName, tel, address, customer_type) values(?,?,?,?,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getCustomer_id());
				psmt.setString(2, dto.getCustomer_pw());
				psmt.setString(3, dto.getNickName());
				psmt.setString(4, dto.getStore_name());
				psmt.setString(5, dto.getTel());
				psmt.setString(6, dto.getAddress());
				psmt.setString(7, dto.getCustomer_type());
				
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
				String sql = "select * from member where customer_id = ? and customer_pw = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					String customer_id = rs.getString(1);
					String customer_pw = rs.getString(2);
					String nickName = rs.getString(3);
					String customer_type = rs.getString(4);
					String store_name = rs.getString(5);
					String customer_regist_number = rs.getString(6);
					String address = rs.getString(7);
					String ceo = rs.getString(8);
					String tel = rs.getString(9);
					String email = rs.getString(10);
					String payment = rs.getString(11);
					
					info = new MemberDTO(customer_id, customer_pw, nickName, customer_type, store_name, customer_regist_number, address, ceo, tel, email, payment);
				}
		
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}return info;
		}
		
		// 개인정보수정
		public int update(MemberDTO dto) {
			
			try {
				conn();
				String sql = "update member set customer_pw=?, nickName=?, store_name=?"
						+ ", client_resgist_number=?, address=?, ceo=?, tel=?, email=?, payment=? where customer_id=?";
				
				psmt =  conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getCustomer_pw());
				psmt.setString(2, dto.getNickName());
				psmt.setString(3, dto.getStore_name());
				psmt.setString(4, dto.getCustomer_regist_number());
				psmt.setString(5, dto.getAddress());
				psmt.setString(6, dto.getCeo());
				psmt.setString(7, dto.getTel());
				psmt.setString(8, dto.getEmail());
				psmt.setString(9, dto.getPayment());
				psmt.setString(10, dto.getCustomer_id());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
	
		
}

