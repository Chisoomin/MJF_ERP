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

String productType = "", productType2 = "", productCode = "", productName = "", productTrash = "";
String returnCode = "", returnTrash = ""; // 반품 sql에 쓰이는 비교용 코드 & 폐기여부
int productAmount = 0;
int returnAmount = 0; // 반품 sql에 쓰이는 반품 수량
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
		return_code[i] = rs.getString("return_code");
		return_trash[i] = rs.getString("return_trash");
		return_amount[i] = rs.getInt("return_amount");
		System.out.println("return_amount[i] " + return_amount[i]);

		if (productCode.equals(return_code[i]) && productTrash.equals(return_trash[i])) {
		returnAmount = return_amount[i] + productAmount;
		System.out.println("returnAmount " + returnAmount);
		badsql = "UPDATE MJFdb.return_product SET return_amount = " + returnAmount + " WHERE return_code = '"
				+ return_code[i] + "';";
		break;
		}

		i++;
	}

	if (productCode.equals(return_code[i]) && productTrash.equals(return_trash[i])) {
		//returnAmount = return_amount[i] + productAmount;
		//System.out.println(return_amount[i]);
		
		pstmt = conn.prepareStatement(badsql);
		pstmt.executeUpdate();
		pstmt.close();
		
	} else if (!productCode.equals(return_code[i])) {
		badsql = "insert into return_product (return_type, return_type2, return_code, return_name, return_amount, return_trash) values (?,?,?,?,?,?)"; // NULL : AUTO_INCREMENT로 자동 번호 생성!
		
		pstmt = conn.prepareStatement(badsql);

		pstmt.setString(1, productType); // 품목 분류 : 완제품, 반제품, 원재료
		pstmt.setString(2, productType2); // 품목 소분류 
		pstmt.setString(3, productCode); // 품목 코드
		pstmt.setString(4, productName); // 품목 이름
		pstmt.setInt(5, productAmount); // 불량 재고 수량
		pstmt.setString(6, productTrash); // 폐기여부

		pstmt.executeUpdate();
		pstmt.close();
	}

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	//rs.close();
	stmt.close();
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
		location.href = 'MJF_ProductSearch.jsp' //품목 등록 주소로 다시 이동
	</script>
</body>
</html>