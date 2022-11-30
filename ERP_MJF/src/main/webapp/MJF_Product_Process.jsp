<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
Statement stmt_snd = null;
PreparedStatement pstmt = null;
PreparedStatement master_pstmt = null;
<<<<<<< HEAD
PreparedStatement mastertype_pstmt = null;
PreparedStatement storage_pstmt = null;
=======
ResultSet rs = null;
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

String color_rs[] = new String[20];
<<<<<<< HEAD
String color_ini_rs[] = new String[20];

String mastertype_rs[] = new String[20];
String type_ini_rs[] = new String[20];

String storage_rs[] = new String[20];

ResultSet rss = null;
ResultSet master_rss = null;
ResultSet storage_rss = null;

StringBuffer memid = new StringBuffer();
request.setCharacterEncoding("utf-8");
=======
String ini_rs[] = new String[20];
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

<<<<<<< HEAD
=======
ResultSet rss = null;

StringBuffer memid = new StringBuffer();
request.setCharacterEncoding("utf-8");

>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git
String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

String type = "";
//String name = request.getParameter("productName");
//String color = request.getParameter("productColor");

String typeCode = String.valueOf(request.getParameter("productType"));
<<<<<<< HEAD
System.out.println(typeCode);
=======
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

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

<<<<<<< HEAD
String product_type = request.getParameter("productType");

=======
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git
try {
<<<<<<< HEAD
=======

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
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

<<<<<<< HEAD
	conn = DriverManager.getConnection(url, user, password);

	String dbsql = "SELECT color_data, color_ini from MJFdb.masterdata_color";
	stmt = conn.createStatement();
	stmt_snd = conn.createStatement();

	rss = stmt.executeQuery(dbsql);
	master_pstmt = conn.prepareStatement(dbsql);

	String mastersql = "SELECT type_data, type_ini from MJFdb.masterdata_type";
	master_rss = stmt_snd.executeQuery(mastersql);
	mastertype_pstmt = conn.prepareStatement(mastersql);

	String storagesql = "SELECT storage_data from MJFdb.masterdata_storage";
	storage_rss = stmt_snd.executeQuery(storagesql);
	storage_pstmt = conn.prepareStatement(storagesql);

	// product코드랑 master db 맞추기
	String typeIniCode = ""; // 품목 코드 큰 분류
	int i = 0;
	while (master_rss.next()) {
		mastertype_rs[i] = master_rss.getString("type_data");
		type_ini_rs[i] = master_rss.getString("type_ini");
		//ini_ss[i] = ss.getString(1);

		if (product_type.equals(mastertype_rs[i])) {
	typeIniCode = type_ini_rs[i];
		}

		i++;

	}

=======
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git
	String typeColor = "";
<<<<<<< HEAD
	i = 0;
	while (rss.next()) {
		color_rs[i] = rss.getString("color_data");
		color_ini_rs[i] = rss.getString("color_ini");
		//ini_ss[i] = ss.getString(1);

		if (color.equals(color_rs[i])) {
	typeColor = color_ini_rs[i];
		}

		i++;

	}

// 	i = 0;
// 	while (storage_rss.next()) {
// 		storage_rs[i] = storage_rss.getString("storage_data");

// 		i++;

// 	}

	String sql = "insert into product_table (product_type, product_type2, product_name, product_color, product_code, product_measure, product_size, product_amount, product_price, product_storage) values (?,?,?,?,?,?,?,?,?,?)"; // NULL : AUTO_INCREMENT로 자동 번호 생성!
	pstmt = conn.prepareStatement(sql);
=======
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
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

	pstmt.setString(1, typeCode); // 품목 분류 : 완제품, 반제품, 원재료
	pstmt.setString(2, smallProduct); // 품목 소분류 
	pstmt.setString(3, name); // 상품명
	pstmt.setString(4, color); // 색깔
<<<<<<< HEAD
	pstmt.setString(5, typeIniCode + "-" + typeColor + "-" + code + "-"); // 상품 코드 숫자 제외
=======
	pstmt.setString(5, type + typeColor + "-" + code + "-"); // 상품 코드 숫자 제외
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git
	pstmt.setString(6, measure); // 단위
	pstmt.setString(7, size1 + "x" + size2 + "x" + size3); // 사이즈
	pstmt.setString(8, amount); // 수량
	pstmt.setString(9, price); // 단가
	pstmt.setString(10, storage); // 창고

	pstmt.executeUpdate();
<<<<<<< HEAD
	pstmt.close();
=======
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
<<<<<<< HEAD
	//if (stmt != null)
	stmt.close();

	//if (mastertype_pstmt != null)
	master_pstmt.close();
	storage_pstmt.close();
	//if (mastertype_pstmt != null)
	//mastertype_pstmt.close();
	//master_rss.close();
	//if (rss != null)
	rss.close();
	//pstmt.close();
	//	if (conn != null)
	conn.close();
=======
	if (rs != null && rss != null)
		rs.close();
	rss.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git

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
<<<<<<< HEAD
		location.href = 'MJF_ProductSearch.jsp' //품목 등록 주소로 다시 이동
=======
		location.href = 'MJF_ProductRegistration.jsp' //품목 등록 주소로 다시 이동
>>>>>>> branch 'MJF_ERP_ver3' of https://github.com/Chisoomin/MJF_ERP.git
	</script>
</body>
</html>