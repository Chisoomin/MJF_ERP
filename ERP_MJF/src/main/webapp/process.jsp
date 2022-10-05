<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String memid = null;
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String department = request.getParameter("department");
String team = request.getParameter("team");
String email = request.getParameter("email_id") + "@" + request.getParameter("email_domain");
String entrydate = request.getParameter("entry");
String entryear = "2022";


String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

memid=memid +entryear;
/* if(department.equals("영업팀")){
	memid.append("01");
	if(team.equals("1팀")){
		memid.append("01");
	}else if(team.equals("2팀")){
		memid.append("02");
	}else if(team.equals("3팀")){
		memid.append("03");
	}
}else if(department.equals("생산팀")){
	memid.append("02");
	if(team.equals("1팀")){
		memid.append("01");
	}else if(team.equals("2팀")){
		memid.append("02");
	}else if(team.equals("3팀")){
		memid.append("03");
	}
}else if(department.equals("물류팀")){
	memid.append("03");
	if(team.equals("1팀")){
		memid.append("01");
	}else if(team.equals("2팀")){
		memid.append("02");
	}else if(team.equals("3팀")){
		memid.append("03");
	}
} */
String memberid = memid.toString();

try {
	String sql = "SELECT num from member_table";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(rs.next()){
		memid="00"+rs.getInt(1);
	}else{
		memid=memid + "001";
	}
	pstmt = conn.prepareStatement("insert into member_table (member_id, member_name, email_address, department, team, entrydate) " + "values(?,?,?,?,?,?)");
	pstmt.setString(1, memberid);
	pstmt.setString(2, name);
	pstmt.setString(3, email);
	pstmt.setString(4, department);
	pstmt.setString(5, team);
	pstmt.setString(6, entrydate);

	pstmt.executeUpdate();
	//out.println("<script>alert('db 연결 성공');</script>");

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>alert(name);</script>
</body>
</html>