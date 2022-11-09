<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;

ResultSet rs = null;

request.setCharacterEncoding("utf-8");
String teamname = request.getParameter("teamupname");
String teamcode = request.getParameter("teamupcode");
String val_ind = request.getParameter("val_ind");
int columnCount=0,j=0;
String team_rs[]=new String[10];

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

/* out.println("<script>alert('"+test+"');</script>");
 */
try {
	String sql = "SELECT team_data from MJFdb.masterdata_team";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	/* ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount(); */
	
	int i = 0;
	while(rs.next()){
		team_rs[i] = rs.getString(1);
		i++;
	}
	if(val_ind.equals("추가")){
		//out.println("<script>alert('"+"추가임"+"');</script>");
		for(j=0;j<i;j++){
			out.println(i+" "+j);
			if(teamname.equals(team_rs[j])){
				out.println("<script>alert('"+"이미 존재하는 팀입니다."+"'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
				break;
			}
		}
		if(j==i){
			pstmt = conn.prepareStatement("insert into masterdata_team (team_data, team_code) " + "values(?, ?)");
			pstmt.setString(1, teamname);
			pstmt.setString(2, teamcode);
			
			pstmt.executeUpdate();
			out.println("<script>alert('"+"팀 추가 완료되었습니다."+"'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
		}
	}else if(val_ind.equals("삭제")){
		for(j=0;j<i;j++){
			if(teamname.equals(team_rs[j])){
				pstmt = conn.prepareStatement("delete from masterdata_team where team_data=?");
				pstmt.setString(1, teamname);
				
				pstmt.executeUpdate();
				out.println("<script>alert('"+"팀 삭제 완료되었습니다."+"'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
				break;
			}
		}
		if(j==i){
			out.println("<script>alert('"+"존재하지 않은 팀입니다."+"'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
		}
	}else{
		//response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp");
	}
	/* if(rs.next()){
			
	}
	
	pstmt = conn.prepareStatement("insert into member_table (member_id, member_name, email_address, team, memposition, entrydate) " + "values(?,?,?,?,?,?)");
	pstmt.setString(1, memid.toString());
	

	pstmt.executeUpdate();
	
	pstmt2 = conn.prepareStatement("insert into member_webidpw (member_webid, member_webpw) " + "values(?,?)");
	pstmt2.setString(1, memid.toString());
	pstmt2.setString(2, memid.toString());
	
	pstmt2.executeUpdate(); */

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	
/* 	response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp");
 */}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>