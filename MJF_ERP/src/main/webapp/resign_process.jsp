<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<%
String memid = request.getParameter("rddel");
String resign = request.getParameter("memresign");
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	pstmt = conn.prepareStatement("update member_table set resigndate=? and working_status=? where member_id=?");
	pstmt.setString(1, resign);
	pstmt.setString(2, "퇴사");
	pstmt.setString(3, memid);
	
	pstmt.executeUpdate();
	out.println("<script>alert('"+"퇴직 처리되었습니다."+"'); window.location=document.referrer;</script>");

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	
}
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>