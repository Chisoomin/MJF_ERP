<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%! static int sun=1; %>
<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int columnCount = 0;
int rowCount = 0;
String sujunum = request.getParameter("ordernumber");
String all = request.getParameter("orall-1");
String saledate = request.getParameter("salesdate");
saledate = saledate.replaceAll("-", "");

String num=null,da=null, date=null, acc=null, code=null, name=null, me=null, qu=null, pp=null, sp=null, orderaccnum=null;


String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	String sql = "SELECT * from MJFdb.order_table where order_num='"+sujunum+"'and total_amount='"+all+"'";
	
	

	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount();
	rs.last(); //커서의 위치를 제일 뒤로 이동
	rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
	String order_rs[][] = new String[rowCount][columnCount];
	int i = 0;
	int j = 0;
	rs.first();
	for (i = 0; i < rowCount; i++) {
		for (j = 0; j < columnCount; j++) {
			order_rs[i][j] = rs.getString((j + 1));
		}
		rs.next();
	}
	String taxbillcode=saledate+"-42000000-0000000"+sun; //수정
	sun++;
	pstmt = conn.prepareStatement("insert into sales_table (order_num, order_date, delivery_date, sales_date, account_code, account_name,product_code,product_name,product_color,product_measure,product_quantity,product_price,supply_price,vat,total_price,total_amount,member_id,member_name,tading_code,taxbill_code) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, order_rs[0][1]);
	pstmt.setString(2, order_rs[0][2]);
	pstmt.setString(3, order_rs[0][3]);
	pstmt.setString(4, saledate);
	pstmt.setString(5, order_rs[0][4]);
	pstmt.setString(6, order_rs[0][5]);
	pstmt.setString(7, order_rs[0][6]);
	pstmt.setString(8, order_rs[0][7]);
	pstmt.setString(9, order_rs[0][8]);
	pstmt.setString(10, order_rs[0][9]);
	pstmt.setString(11, order_rs[0][10]);
	pstmt.setString(12, order_rs[0][11]);
	pstmt.setString(13, order_rs[0][12]);
	pstmt.setString(14, order_rs[0][13]);
	pstmt.setString(15, order_rs[0][14]);
	pstmt.setString(16, order_rs[0][15]);
	pstmt.setString(17, order_rs[0][16]);
	pstmt.setString(18, order_rs[0][17]);
	pstmt.setString(19, order_rs[0][1]);
	pstmt.setString(20, taxbillcode);

	pstmt.executeUpdate();
	response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration.jsp");

	

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
//String gab[] = request.getParameterValues("ch");
String ia = request.getParameter("ch");
//System.out.println(ia+" ");

out.println("<전체 request.getAttribute 출력>");
out.println("<br/>");
Enumeration attrs = request.getAttributeNames();

while (attrs.hasMoreElements()) {
	String attr = (String) attrs.nextElement();
	out.println(attr + "<br/>");
}

out.println("<br/>");

out.println("<br/>");
out.println("<전제 request.getParameter 출력>");
out.println("<br/>");
Enumeration params = request.getParameterNames();

while (params.hasMoreElements()) {
	String param = (String) params.nextElement();
	out.println("param:" + param + "<br/>");
	String st = request.getParameter(param);
	System.out.println(st);
}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>