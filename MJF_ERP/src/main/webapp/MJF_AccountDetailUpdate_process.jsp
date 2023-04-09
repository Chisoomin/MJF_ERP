<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"%>

<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String num = request.getParameter("accountnum");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

try {
	conn = DriverManager.getConnection(url, user, password);
	String sql = "update account_table set account_code=?,account_name=?,account_ceo=?,account_tel=?,account_fax=?,account_email=?,account_postcode=?,account_address=?,account_address2=?,account_website=?,account_remark=?,account_type=?,account_begin_date=?,account_vailable=?,type_of_business=?,items_of_business=?,sales_mgr_name=?,sales_mgr_mobile=?,sales_mgr_email=?,bank_name=?,bank_account_number=?,bank_account_holder=? where account_num='"+num+"';";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, request.getParameter("code"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("ceo"));
	pstmt.setString(4, request.getParameter("tel"));
	pstmt.setString(5, request.getParameter("fax"));
	pstmt.setString(6, request.getParameter("email"));
	pstmt.setString(7, request.getParameter("postcode"));
	pstmt.setString(8, request.getParameter("addr1"));
	pstmt.setString(9, request.getParameter("addr2"));
	pstmt.setString(10, request.getParameter("website"));
	pstmt.setString(11, request.getParameter("remark"));
	pstmt.setString(12, request.getParameter("type"));
	pstmt.setString(13, request.getParameter("begin_date"));
	pstmt.setString(14, request.getParameter("vailable"));
	pstmt.setString(15, request.getParameter("type_of_business"));
	pstmt.setString(16, request.getParameter("items_of_business"));
	pstmt.setString(17, request.getParameter("sales_name"));
	pstmt.setString(18, request.getParameter("sales_tel"));
	pstmt.setString(19, request.getParameter("sales_email"));
	pstmt.setString(20, request.getParameter("bank_name"));
	pstmt.setString(21, request.getParameter("account_number"));
	pstmt.setString(22, request.getParameter("account_holder"));

	pstmt.executeUpdate();
} catch (SQLException ex) {
	out.println("SQLException" + ex.getMessage());
} finally {
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
}
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script>
alert("수정 되었습니다");
location.href='MJF_Layout.jsp?pageChange=MJF_AccountList.jsp';
</script>
</body>
</html>