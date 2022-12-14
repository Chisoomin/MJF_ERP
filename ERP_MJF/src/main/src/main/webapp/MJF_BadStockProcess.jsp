<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String product_rs[] = new String[20];
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt_select = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
stmt = conn.createStatement();
int productSelect = 0;
String productType = "", productType2 = "", productCode = "", productName = "", productTrash = "";
String returnCode = "", returnTrash = ""; // 반품 sql에 쓰이는 비교용 코드 & 폐기여부
int productAmount = 0;
int returnAmount = 0; // 반품 sql에 쓰이는 반품 수량
int return_num[] = new int[50];
String return_code[] = new String[50];
String return_trash[] = new String[50];
int return_amount[] = new int[50];

String badsql = "", sql = "";

try {

	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();

	productType = request.getParameter("productType");
	productType2 = request.getParameter("productType2");
	productCode = request.getParameter("productCode");
	productName = request.getParameter("productName");
	productAmount = Integer.parseInt(request.getParameter("productAmount"));
	productTrash = request.getParameter("productLife");

	sql = "select * from MJFdb.return_product";
	rs = stmt.executeQuery(sql);
	int i = 0;
	while (rs.next()) {
		return_num[i] = rs.getInt("return_num");
		return_code[i] = rs.getString("return_code");
		productSelect = Integer.parseInt(request.getParameter("productSelect"));

		returnAmount = rs.getInt("return_amount");
		System.out.println("productType " +productType);

		if (return_num[i] == productSelect) {

	badsql = "UPDATE MJFdb.return_product set return_type = '" + productType + "', return_type2 = '" + productType2
			+ "', return_amount ='" + (returnAmount-productAmount) + "', return_trash = '" + productTrash + "' WHERE return_num = '"
			+ return_num[i] + "';"; // NULL : AUTO_INCREMENT로 자동 번호 생성!

	pstmt = conn.prepareStatement(badsql);
		}

		

		returnAmount = rs.getInt("return_amount");
		productAmount = Integer.parseInt(request.getParameter("productAmount"));

	}
	i++;
	pstmt.executeUpdate();

	// 	}

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	rs.close();
	stmt.close();
	pstmt.close();
	conn.close();

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>불량 재고 등록 중...</title>
</head>
<body>
	<script type="text/javascript">
		alert("등록 되었습니다");
		location.href = 'MJF_BadProductList.jsp' //품목 등록 주소로 다시 이동
	</script>
</body>
</html>