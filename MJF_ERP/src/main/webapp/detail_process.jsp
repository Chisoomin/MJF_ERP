<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<%!int columnCount=0;
int rowCount=0;
int columnCountemp=0;
int rowCountemp=0;%>
<%
String name = request.getParameter("ordernumber");
//out.println("<script>histroy.go(-1);</script>");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
		String sql = "SELECT * from MJFdb.order_table where order_num='"+name+"'";
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsm = rs.getMetaData();
		columnCount = rsm.getColumnCount();
		rs.last(); //커서의 위치를 제일 뒤로 이동
		rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
		if(columnCount!=0&&rowCount!=0){
			response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration.jsp?sujunum="+name+"&row="+rowCount+"&col="+columnCount);
			columnCountemp=columnCount;
			rowCountemp=rowCount;
		}else{
			response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration.jsp?sujunum="+name+"&row="+rowCountemp+"&col="+columnCountemp);
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

%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
<script>
</script>
</html>