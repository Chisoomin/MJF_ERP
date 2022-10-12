<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="java.text.SimpleDateFormat"%>

<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

try {
	conn = DriverManager.getConnection(url, user, password);
	String sql = "insert into account_table (account_code,account_name,account_ceo,account_tel,account_fax,account_email,account_postcode,account_address,account_website,account_begin_date,account_end_date,account_type,account_remark,sales_mgr_name,sales_mgr_mobile,sales_mgr_email,bank_name,bank_account_number,bank_account_holder) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, request.getParameter("code"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("ceo"));
	pstmt.setString(4, request.getParameter("tel"));
	pstmt.setString(5, request.getParameter("fax"));
	pstmt.setString(6, request.getParameter("email"));
	pstmt.setString(7, request.getParameter("postcode"));
	pstmt.setString(8, request.getParameter("addr1") + request.getParameter("addr2"));
	pstmt.setString(9, request.getParameter("website"));
	pstmt.setString(10, request.getParameter("begin_date"));
	pstmt.setString(11, request.getParameter("end_date"));
	pstmt.setString(12, request.getParameter("type"));
	pstmt.setString(13, request.getParameter("remark"));
	pstmt.setString(14, request.getParameter("sales_name"));
	pstmt.setString(15, request.getParameter("sales_tel"));
	pstmt.setString(16, request.getParameter("sales_email"));
	pstmt.setString(17, request.getParameter("bank_name"));
	pstmt.setString(18, request.getParameter("account_number"));
	pstmt.setString(19, request.getParameter("account_holder"));

	pstmt.executeUpdate();

} catch (SQLException ex) {
	out.println("SQLException" + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script>
		alert("등록 되었습니다");
		location.href = 'MJF_AccountRegistration.jsp'
	</script>
</body>
</html>