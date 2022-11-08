<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String[] bd_no = request.getParameterValues("chk");
int[] cnt = null;
int res = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

try {
	conn = DriverManager.getConnection(url, user, password);
	String sql = "delete from account_table where account_code=?";
	pstmt = conn.prepareStatement(sql);

	for(int i=0; i<bd_no.length; i++){
		pstmt.setString(1, bd_no[i]);
		pstmt.addBatch();
	}
	
	cnt = pstmt.executeBatch();
	
	for(int i=0; i<bd_no.length; i++){
		if(cnt[i]==-2){
			res++;
		}
	}
	
	if(bd_no.length==res){
		conn.commit();
	}
	
} catch (SQLException ex) {
	out.println("SQLException" + ex.getMessage());
} finally {
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
}
%>
<script>
alert("삭제 되었습니다");
location.href='MJF_AccountList.jsp'
</script>
</body>
</html>