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

String productType = "", productType2 = "", productCode = "", newproductCode = "", productName = "", checkCode = "";
String newCode = ""; // 재고 추가 sql에 쓰이는 비교용 코드
int productAmount = 0;
int newAmount = 0; // sql에 쓰이는 재고 추가 수량
String new_code[] = new String[50];
int new_amount[] = new int[50];

String newsql = "", sql = "";

try {

	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();

	productType = request.getParameter("productType");
	productType2 = request.getParameter("productType2");
	productCode = request.getParameter("productCode"); // 받아온거
	productName = request.getParameter("productName");
	productAmount = Integer.parseInt(request.getParameter("productAmount"));
	System.out.println("productAmount " + productAmount);
	
	sql = "select * from MJFdb.product_table";
	rs = stmt.executeQuery(sql);
	int i = 0;
	while (rs.next()) {
		new_code[i] = rs.getString("product_code"); // 품목 테이블꺼
		new_amount[i] = rs.getInt("product_amount");
		

		newproductCode = productCode.substring(0, 8);
		
		String codenum = "";
		String zero1 = "0";
		String zero2 = "00";
		String result = "";
		codenum = rs.getString("product_num");
		if (codenum.length() == 1) {
			result = zero2.concat(codenum);
			//System.out.print(codenum);
		} else if (codenum.length() == 2) {
			result = zero1.concat(codenum);
		}
		
		checkCode = new_code[i].concat(result);
		System.out.println(checkCode);
		
		if (productCode.equals(checkCode)) {
			newAmount = new_amount[i] + productAmount;
			
			System.out.println("new_amount if " + newAmount);	
			newsql = "UPDATE MJFdb.product_table SET product_amount = '" + newAmount + "' WHERE product_code = '"+ new_code[i] + "' AND product_num = '" + codenum  + "';";
			pstmt = conn.prepareStatement(newsql);
			pstmt.executeUpdate();
			break;
		}

		i++;
	}
	
	
	
	pstmt.close();

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
<title>추가 재고 등록 중...</title>
</head>
<body>
	<script type="text/javascript">
		alert("등록 되었습니다");
		location.href = 'MJF_Layout.jsp?pageChange=MJF_ProductSearch.jsp' //품목 등록 주소로 다시 이동
	</script>
</body>
</html>