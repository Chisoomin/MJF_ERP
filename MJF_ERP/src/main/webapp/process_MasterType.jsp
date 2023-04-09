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
String typeChange = request.getParameter("typeChange");
String typeIni = request.getParameter("typeIni");
String val_ind = request.getParameter("val_ind");
int columnCount = 0, j = 0;
String type_rs[] = new String[20];

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

/* out.println("<script>alert('"+test+"');</script>");
 */

if (typeChange != "") {
	try {
		String sql = "SELECT type_data from MJFdb.masterdata_type";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		/* ResultSetMetaData rsmd = rs.getMetaData();
		columnCount = rsmd.getColumnCount(); */

		int i = 0;
		while (rs.next()) {
			type_rs[i] = rs.getString(1);
	i++;
		}
		if (val_ind.equals("추가")) {
	//out.println("<script>alert('"+"추가임"+"');</script>");
	for (j = 0; j < i; j++) {
		out.println(i + " " + j);
		if (typeChange.equals(type_rs[j])) {
			out.println("<script>alert('" + "이미 존재하는 품목 분류입니다."
					+ "'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
			break;
		}
	}
	if (j == i) {
		pstmt = conn.prepareStatement("insert into masterdata_type (type_data, type_ini) " + "values(?, ?)");
		pstmt.setString(1, typeChange);
		pstmt.setString(2, typeIni);

		pstmt.executeUpdate();
		out.println("<script>alert('" + "품목 분류 추가 완료되었습니다."
				+ "'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
	}
		} else if (val_ind.equals("삭제")) {
	for (j = 0; j < i; j++) {
		if (typeChange.equals(type_rs[j])) {
			pstmt = conn.prepareStatement("delete from masterdata_type where type_data=?");
			pstmt.setString(1, typeChange);

			pstmt.executeUpdate();
			out.println("<script>alert('" + "품목 분류 삭제 완료되었습니다."
					+ "'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
			break;
		}
	}
	if (j == i) {
		out.println("<script>alert('" + "존재하지 않는 품목 분류입니다."
				+ "'); location.href='MJF_Layout.jsp?pageChange=MJF_MasterdataRegister.jsp';</script>");
	}
		} else {
	
		}
	

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
}
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