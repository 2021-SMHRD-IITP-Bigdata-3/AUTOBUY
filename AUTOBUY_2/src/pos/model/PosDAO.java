package pos.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class PosDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	PosDTO info  = null;
	int cnt = 0;	

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

}
