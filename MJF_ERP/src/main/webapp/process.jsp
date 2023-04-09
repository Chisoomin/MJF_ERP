<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;

ResultSet rs = null;
ResultSet rs2 = null;

StringBuffer memid=new StringBuffer();
request.setCharacterEncoding("utf-8");
String name = request.getParameter("memname");
String team = request.getParameter("memteam");
String memposition = request.getParameter("memposition");
String email = request.getParameter("mememail_id") + "@" + request.getParameter("memdomain");
String entrydate = request.getParameter("mementry");
String entryear = entrydate.substring(0, 4);


String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

memid.append(entryear);
/*if(team.equals("영업 1팀")){
	memid.append("0101");
}else if(team.equals("영업 2팀")){
	memid.append("0102");
}else if(team.equals("영업 3팀")){
	memid.append("0103");
}*/

try {
	String sql2 = "SELECT team_code from MJFdb.masterdata_team where team_data='"+team+"'";
	stmt = conn.createStatement();
	rs2 = stmt.executeQuery(sql2);
	if(rs2.next()){
		memid.append("01"+rs2.getString(1));		
	}
	
	String sql = "SELECT num from member_table ORDER BY num DESC LIMIT 1";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(rs.next()){
		if(rs.getInt(1)+1<10){
			memid.append("00"+(rs.getInt(1)+1));
		}else{
			memid.append("0"+(rs.getInt(1)+1));
		}		
	}else{
		memid.append("001");
	}
	pstmt = conn.prepareStatement("insert into member_table (member_id, member_name, email_address, team, memposition, entrydate, working_status) " + "values(?,?,?,?,?,?,?)");
	pstmt.setString(1, memid.toString());
	pstmt.setString(2, name);
	pstmt.setString(3, email);
	pstmt.setString(4, team);
	pstmt.setString(5, memposition);
	pstmt.setString(6, entrydate);
	pstmt.setString(7, "근무중");

	pstmt.executeUpdate();
	
	pstmt2 = conn.prepareStatement("insert into member_webidpw (member_webid, member_webpw) " + "values(?,?)");
	pstmt2.setString(1, memid.toString());
	pstmt2.setString(2, memid.toString());
	
	pstmt2.executeUpdate();

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_EmployeeInformationRegistration.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <script>alert(name);</script>
 --></body>
</html>