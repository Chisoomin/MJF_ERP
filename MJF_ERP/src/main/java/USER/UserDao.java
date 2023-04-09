package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.cj.xdevapi.JsonArray;
import java.util.*;
import java.sql.*;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;



public class UserDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public String role;
	
	public UserDao() {
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
		String SQL = "SELECT member_id, role FROM member_table WHERE member_name = ?";
		

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member_name);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				this.role = rs.getString(2);
				if (rs.getString(1).equals(member_id))
					
					return 1; 
				
				 
					
				else
					return 0; 

			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return -2; 
	}

	public void getCount() throws ClassNotFoundException {
	//Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	String dataPoints = null;
	 
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection connection = DriverManager.getConnection("jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb", "MJFdbRoot", "mjfrootpw");
		Statement statement = connection.createStatement();
		String xVal, yVal;
		
		ResultSet resultSet = statement.executeQuery("select product_quantity, product_name from order_table");
		
		while(resultSet.next()){
			xVal = resultSet.getString("product_quantity");
			yVal = resultSet.getString("product_name");
			map = new HashMap<Object,Object>(); map.put("product_quantity", Double.parseDouble(xVal)); map.put("product_name", Double.parseDouble(yVal)); list.add(map);
			//dataPoints = gsonObj.toJson(list);
		}
		connection.close();
	}
	catch(SQLException e){
		System.out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
		dataPoints = null;
	}
	}
}
	
	

	
	
	
	 
	
	

