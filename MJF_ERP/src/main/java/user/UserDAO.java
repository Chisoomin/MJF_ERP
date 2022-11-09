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
					return 1; // �α��μ���
				else
					return 0; // ��й�ȣ ����ġ

			}
			return -1;// ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();

		}
		return -2; // �����ͺ��̽� ����
	}


}
