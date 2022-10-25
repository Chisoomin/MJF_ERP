<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
PreparedStatement master_pstmt = null;
ResultSet rs = null;

String color_rs[] = new String[20];
String ini_rs[] = new String[20];

ResultSet rss = null;

StringBuffer memid = new StringBuffer();
request.setCharacterEncoding("utf-8");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

String type = "";
//String name = request.getParameter("productName");
//String color = request.getParameter("productColor");

String typeCode = String.valueOf(request.getParameter("productType"));

String code = "";
String smallProduct = "";

String productCode = String.valueOf(request.getParameter("productCode"));
code = productCode.substring(0, 2);
smallProduct = productCode.substring(3);
System.out.print("품목코드는 " + code);
System.out.print("품목 소분류는 " + smallProduct);

//String code = request.getParameter("productType");
String name = request.getParameter("productName");
String color = String.valueOf(request.getParameter("productColor"));
String measure = String.valueOf(request.getParameter("productMeasure"));
String size1 = request.getParameter("productSize1");
String size2 = request.getParameter("productSize2");
String size3 = request.getParameter("productSize3");
String amount = request.getParameter("productAmount");
String price = request.getParameter("productPrice");
String storage = request.getParameter("productStorage");

try {

	conn = DriverManager.getConnection(url, user, password);
	String sql = "insert into product_table (product_type, product_type2, product_name, product_color, product_code, product_measure, product_size, product_amount, product_price, product_storage) values (?,?,?,?,?,?,?,?,?,?)"; // NULL : AUTO_INCREMENT로 자동 번호 생성!
	pstmt = conn.prepareStatement(sql);

	String dbsql = "SELECT color_data, color_ini from MJFdb.masterdata_color";
	stmt = conn.createStatement();

	rss = stmt.executeQuery(dbsql);
	master_pstmt = conn.prepareStatement(dbsql);

	if (typeCode.equals("완제품"))
		type = "F-";
	else if (typeCode.equals("반제품"))
		type = "H-";
	else if (typeCode.equals("원재료"))
		type = "R-";
	else
		System.out.println("타입 분류 오류 발생함");
	//System.out.println("Test" + type);

	String typeColor = "";
	int i = 0;
	while (rss.next()) {
		color_rs[i] = rss.getString("color_data");
		ini_rs[i] = rss.getString("color_ini");
		//ini_ss[i] = ss.getString(1);

		if (color.equals(color_rs[i])) {
	typeColor = ini_rs[i];
		}

		i++;

	}

	pstmt.setString(1, typeCode); // 품목 분류 : 완제품, 반제품, 원재료
	pstmt.setString(2, smallProduct); // 품목 소분류 
	pstmt.setString(3, name); // 상품명
	pstmt.setString(4, color); // 색깔
	pstmt.setString(5, type + typeColor + "-" + code + "-"); // 상품 코드 숫자 제외
	pstmt.setString(6, measure); // 단위
	pstmt.setString(7, size1 + "x" + size2 + "x" + size3); // 사이즈
	pstmt.setString(8, amount); // 수량
	pstmt.setString(9, price); // 단가
	pstmt.setString(10, storage); // 창고

	pstmt.executeUpdate();

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null && rss != null)
		rs.close();
	rss.close();
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
<title>제품 등록 중...</title>
</head>
<body>
	<script type="text/javascript">
		alert("등록 되었습니다");
		location.href = 'MJF_ProductRegistration.jsp' //품목 등록 주소로 다시 이동
	</script>
</body>
</html>