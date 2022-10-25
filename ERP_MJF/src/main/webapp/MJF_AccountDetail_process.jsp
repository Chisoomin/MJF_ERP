<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"%>

<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String key = request.getParameter("key");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

try {
	conn = DriverManager.getConnection(url, user, password);
	String sql = "select * from MJFdb.account_table where code ='"+"110-82-00415"+"';";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	
	while(rs.next()){		
		request.setAttribute("code", rs.getString("account_code"));
		request.setAttribute("name", rs.getString("account_name"));
		request.setAttribute("ceo", rs.getString("account_ceo"));
		request.setAttribute("tel", rs.getString("account_tel"));
		request.setAttribute("fax", rs.getString("account_fax"));
		request.setAttribute("email", rs.getString("account_email"));
		request.setAttribute("postcode", rs.getString("account_postcode"));
		request.setAttribute("address", rs.getString("account_address"));
		request.setAttribute("website", rs.getString("account_website"));
		request.setAttribute("remark", rs.getString("account_remark"));
		request.setAttribute("type", rs.getString("account_type"));
		request.setAttribute("begin_date", rs.getString("account_begin_date"));
		request.setAttribute("vailable", rs.getString("account_vailable"));
		request.setAttribute("business_type", rs.getString("type_of_business"));
		request.setAttribute("business_items", rs.getString("items_of_business"));
		request.setAttribute("sales_name", rs.getString("sales_mgr_name"));
		request.setAttribute("sales_mobile", rs.getString("sales_mgr_mobile"));
		request.setAttribute("sales_email", rs.getString("sales_mgr_email"));
		request.setAttribute("bank_name", rs.getString("bank_name"));
		request.setAttribute("bank_number", rs.getString("bank_account_number"));
		request.setAttribute("bank_holder", rs.getString("bank_account_holder"));	
	}

} catch (SQLException ex) {
	out.println("SQLException" + ex.getMessage());
} finally {
	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (conn != null) conn.close();
}
	RequestDispatcher dis = request.getRequestDispatcher("MJF_AccountDetail.jsp");
	dis.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script>
</script>
</body>
</html>