package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
			String dbID = "MJFdbRoot";
			String dbPassword = "mjfrootpw";
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			//
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int login(String member_name, String member_id) {
		String SQL = "SELECT member_id FROM member_table WHERE member_name = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member_name);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals(member_id))
					return 1; // 로그인성공
				else
					return 0; // 비밀번호 불일치

			}
			return -1;// 아이디가 없음

		} catch (Exception e) {
			e.printStackTrace();

		}
		return -2; // 데이터베이스 오류
	}


}
