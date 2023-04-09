<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb?allowMultiQueries=true";
	String user = "MJFdbRoot";
	String password = "mjfrootpw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	PreparedStatement pstmt5 = null;
	PreparedStatement pstmt6 = null;
	ResultSet rs = null;

	conn = DriverManager.getConnection(url, user, password);

	Date nowTime = new Date();
	SimpleDateFormat simpleDateFormar = new SimpleDateFormat("yyMMdd-");
	String today = simpleDateFormar.format(nowTime);
	
	String maxSql = "SELECT order_num FROM order_table WHERE order_num LIKE '%"+ today +"%' ORDER BY num DESC LIMIT 1;";
	String insertSql = "INSERT INTO order_table (order_num, order_date, delivery_date, account_code, account_name, product_code, product_name, product_color, product_measure, product_quantity, product_price, supply_price, vat, total_price, total_amount, member_id, member_name, order_progress, order_note) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
// 	String insertSql1 = "INSERT INTO order_table (order_num, order_date, delivery_date, account_code, account_name, product_code, product_name, product_color, product_measure, product_quantity, product_price, supply_price, vat, total_price, total_amount, member_id, member_name, order_progress, order_note) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

	String orderNum = " ";
	String orderDate = request.getParameter("orderDate");
	String deliveryDate = request.getParameter("deliveryDate");
	String accountCode = request.getParameter("accountCode");
	String accountName = request.getParameter("accountName");
	String productCode = request.getParameter("productCode");
	String productName = request.getParameter("productName");
	String productColor = request.getParameter("productColor");
	String productMeasure = request.getParameter("productMeasure");
	int productQuan = Integer.parseInt(request.getParameter("productQuan"));
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	int supplyPrice = Integer.parseInt(request.getParameter("supplyPrice"));
	int vat = Integer.parseInt(request.getParameter("vat"));
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
	String memberId = request.getParameter("memberId");
	String memberName = request.getParameter("memberName");
	String orderProgress = "진행중";
	String orderNote = request.getParameter("orderNote");
	
	// 1
	String orderNum_1 = " ";
	String orderDate_1 = request.getParameter("orderDate");
	String deliveryDate_1 = request.getParameter("deliveryDate");
	String accountCode_1 = request.getParameter("accountCode");
	String accountName_1 = request.getParameter("accountName");
	String productCode_1 = request.getParameter("productCode_1");
	String productName_1 = request.getParameter("productName_1");
	String productColor_1 = request.getParameter("productColor_1");
	String productMeasure_1 = request.getParameter("productMeasure_1");
	int productQuan_1 = Integer.parseInt(request.getParameter("productQuan_1"));
	int productPrice_1 = Integer.parseInt(request.getParameter("productPrice_1"));
	int supplyPrice_1 = Integer.parseInt(request.getParameter("supplyPrice_1"));
	int vat_1 = Integer.parseInt(request.getParameter("vat_1"));
	int totalPrice_1 = Integer.parseInt(request.getParameter("totalPrice_1"));
	int totalAmount_1 = Integer.parseInt(request.getParameter("totalAmount"));
	String memberId_1 = request.getParameter("memberId");
	String memberName_1 = request.getParameter("memberName");
	String orderProgress_1 = "진행중";
	String orderNote_1 = request.getParameter("orderNote_1");
	
	// 2
	String orderNum_2 = " ";
	String orderDate_2 = request.getParameter("orderDate");
	String deliveryDate_2 = request.getParameter("deliveryDate");
	String accountCode_2 = request.getParameter("accountCode");
	String accountName_2 = request.getParameter("accountName");
	String productCode_2 = request.getParameter("productCode_2");
	String productName_2 = request.getParameter("productName_2");
	String productColor_2 = request.getParameter("productColor_2");
	String productMeasure_2 = request.getParameter("productMeasure_2");
	int productQuan_2 = Integer.parseInt(request.getParameter("productQuan_2"));
	int productPrice_2 = Integer.parseInt(request.getParameter("productPrice_2"));
	int supplyPrice_2 = Integer.parseInt(request.getParameter("supplyPrice_2"));
	int vat_2 = Integer.parseInt(request.getParameter("vat_2"));
	int totalPrice_2 = Integer.parseInt(request.getParameter("totalPrice_2"));
	int totalAmount_2 = Integer.parseInt(request.getParameter("totalAmount"));
	String memberId_2 = request.getParameter("memberId");
	String memberName_2 = request.getParameter("memberName");
	String orderProgress_2 = "진행중";
	String orderNote_2 = request.getParameter("orderNote_2");
	
	// 3
// 	String orderNum_3 = " ";
// 	String orderDate_3 = request.getParameter("orderDate");
// 	String deliveryDate_3 = request.getParameter("deliveryDate");
// 	String accountCode_3 = request.getParameter("accountCode");
// 	String accountName_3 = request.getParameter("accountName");
// 	String productCode_3 = request.getParameter("productCode_3");
// 	String productName_3 = request.getParameter("productName_3");
// 	String productColor_3 = request.getParameter("productColor_3");
// 	String productMeasure_3 = request.getParameter("productMeasure_3");
// 	int productQuan_3 = Integer.parseInt(request.getParameter("productQuan_3"));
// 	int productPrice_3 = Integer.parseInt(request.getParameter("productPrice_3"));
// 	int supplyPrice_3 = Integer.parseInt(request.getParameter("supplyPrice_3"));
// 	int vat_3 = Integer.parseInt(request.getParameter("vat_3"));
// 	int totalPrice_3 = Integer.parseInt(request.getParameter("totalPrice_3"));
// 	int totalAmount_3 = Integer.parseInt(request.getParameter("totalAmount"));
// 	String memberId_3 = request.getParameter("memberId");
// 	String memberName_3 = request.getParameter("memberName");
// 	String orderProgress_3 = "진행중";
// 	String orderNote_3 = request.getParameter("orderNote_3");
	
	// 4
// 	String orderNum_4 = " ";
// 	String orderDate_4 = request.getParameter("orderDate");
// 	String deliveryDate_4 = request.getParameter("deliveryDate");
// 	String accountCode_4 = request.getParameter("accountCode");
// 	String accountName_4 = request.getParameter("accountName");
// 	String productCode_4 = request.getParameter("productCode_4");
// 	String productName_4 = request.getParameter("productName_4");
// 	String productColor_4 = request.getParameter("productColor_4");
// 	String productMeasure_4 = request.getParameter("productMeasure_4");
// 	int productQuan_4 = Integer.parseInt(request.getParameter("productQuan_4"));
// 	int productPrice_4 = Integer.parseInt(request.getParameter("productPrice_4"));
// 	int supplyPrice_4 = Integer.parseInt(request.getParameter("supplyPrice_4"));
// 	int vat_4 = Integer.parseInt(request.getParameter("vat_4"));
// 	int totalPrice_4 = Integer.parseInt(request.getParameter("totalPrice_4"));
// 	int totalAmount_4 = Integer.parseInt(request.getParameter("totalAmount"));
// 	String memberId_4 = request.getParameter("memberId");
// 	String memberName_4 = request.getParameter("memberName");
// 	String orderProgress_4 = "진행중";
// 	String orderNote_4 = request.getParameter("orderNote_4");

	try {
		pstmt = conn.prepareStatement(maxSql);
		rs = pstmt.executeQuery(maxSql);
	
		if(rs.next()) {
			orderNum = today.concat(String.format("%03d", (Integer.parseInt(rs.getString(1).substring(8, 10))) + 1));
		}
	
		else if(!rs.next()) {
			orderNum = today.concat("001");
		}

		pstmt2 = conn.prepareStatement(insertSql);

		pstmt2.setString(1, orderNum);
		pstmt2.setString(2, orderDate);
		pstmt2.setString(3, deliveryDate);
		pstmt2.setString(4, accountCode);
		pstmt2.setString(5, accountName);
		pstmt2.setString(6, productCode);
		pstmt2.setString(7, productName);
		pstmt2.setString(8, productColor);
		pstmt2.setString(9, productMeasure);
		pstmt2.setInt(10, productQuan);
		pstmt2.setInt(11, productPrice);
		pstmt2.setInt(12, supplyPrice);
		pstmt2.setInt(13, vat);
		pstmt2.setInt(14, totalPrice);
		pstmt2.setInt(15, totalAmount);
		pstmt2.setString(16, memberId);
		pstmt2.setString(17, memberName);
		pstmt2.setString(18, orderProgress);
		pstmt2.setString(19, orderNote);

		pstmt2.executeUpdate();
		
		// 1
		pstmt3 = conn.prepareStatement(insertSql);
		
		pstmt3.setString(1, orderNum);
		pstmt3.setString(2, orderDate_1);
		pstmt3.setString(3, deliveryDate_1);
		pstmt3.setString(4, accountCode_1);
		pstmt3.setString(5, accountName_1);
		pstmt3.setString(6, productCode_1);
		pstmt3.setString(7, productName_1);
		pstmt3.setString(8, productColor_1);
		pstmt3.setString(9, productMeasure_1);
		pstmt3.setInt(10, productQuan_1);
		pstmt3.setInt(11, productPrice_1);
		pstmt3.setInt(12, supplyPrice_1);
		pstmt3.setInt(13, vat_1);
		pstmt3.setInt(14, totalPrice_1);
		pstmt3.setInt(15, totalAmount_1);
		pstmt3.setString(16, memberId_1);
		pstmt3.setString(17, memberName_1);
		pstmt3.setString(18, orderProgress_1);
		pstmt3.setString(19, orderNote_1);

		pstmt3.executeUpdate();
		
		// 2
		pstmt4 = conn.prepareStatement(insertSql);
		
		pstmt4.setString(1, orderNum);
		pstmt4.setString(2, orderDate_2);
		pstmt4.setString(3, deliveryDate_2);
		pstmt4.setString(4, accountCode_2);
		pstmt4.setString(5, accountName_2);
		pstmt4.setString(6, productCode_2);
		pstmt4.setString(7, productName_2);
		pstmt4.setString(8, productColor_2);
		pstmt4.setString(9, productMeasure_2);
		pstmt4.setInt(10, productQuan_2);
		pstmt4.setInt(11, productPrice_2);
		pstmt4.setInt(12, supplyPrice_2);
		pstmt4.setInt(13, vat_2);
		pstmt4.setInt(14, totalPrice_2);
		pstmt4.setInt(15, totalAmount_2);
		pstmt4.setString(16, memberId_2);
		pstmt4.setString(17, memberName_2);
		pstmt4.setString(18, orderProgress_2);
		pstmt4.setString(19, orderNote_2);

		pstmt4.executeUpdate();
		
		// 3
// 		pstmt5 = conn.prepareStatement(insertSql);
		
// 		pstmt5.setString(1, orderNum);
// 		pstmt5.setString(2, orderDate_1);
// 		pstmt5.setString(3, deliveryDate_3);
// 		pstmt5.setString(4, accountCode_3);
// 		pstmt5.setString(5, accountName_3);
// 		pstmt5.setString(6, productCode_3);
// 		pstmt5.setString(7, productName_3);
// 		pstmt5.setString(8, productColor_3);
// 		pstmt5.setString(9, productMeasure_3);
// 		pstmt5.setInt(10, productQuan_3);
// 		pstmt5.setInt(11, productPrice_3);
// 		pstmt5.setInt(12, supplyPrice_3);
// 		pstmt5.setInt(13, vat_3);
// 		pstmt5.setInt(14, totalPrice_3);
// 		pstmt5.setInt(15, totalAmount_3);
// 		pstmt5.setString(16, memberId_3);
// 		pstmt5.setString(17, memberName_3);
// 		pstmt5.setString(18, orderProgress_3);
// 		pstmt5.setString(19, orderNote_3);

// 		pstmt5.executeUpdate();
		
		// 4
// 		pstmt6 = conn.prepareStatement(insertSql);
		
// 		pstmt6.setString(1, orderNum);
// 		pstmt6.setString(2, orderDate_4);
// 		pstmt6.setString(3, deliveryDate_4);
// 		pstmt6.setString(4, accountCode_4);
// 		pstmt6.setString(5, accountName_4);
// 		pstmt6.setString(6, productCode_4);
// 		pstmt6.setString(7, productName_4);
// 		pstmt6.setString(8, productColor_4);
// 		pstmt6.setString(9, productMeasure_4);
// 		pstmt6.setInt(10, productQuan_4);
// 		pstmt6.setInt(11, productPrice_4);
// 		pstmt6.setInt(12, supplyPrice_4);
// 		pstmt6.setInt(13, vat_4);
// 		pstmt6.setInt(14, totalPrice_4);
// 		pstmt6.setInt(15, totalAmount_4);
// 		pstmt6.setString(16, memberId_4);
// 		pstmt6.setString(17, memberName_4);
// 		pstmt6.setString(18, orderProgress_4);
// 		pstmt6.setString(19, orderNote_4);

// 		pstmt6.executeUpdate();

	} catch (SQLException ex) {
		out.println("SQLException " + ex.getMessage());
	} finally {
		response.sendRedirect("MJF_Layout.jsp?pageChange=orderRegistration.jsp");

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}
		
		if (pstmt2 != null) {
			try {
				pstmt2.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}
		
		if (pstmt3 != null) {
			try {
				pstmt3.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}
		
		if (pstmt4 != null) {
			try {
				pstmt3.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}
		
		if (pstmt5 != null) {
			try {
				pstmt3.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}
		
		if (pstmt6 != null) {
			try {
				pstmt3.close();
			} catch (SQLException ex) {
				out.println("SQLException " + ex.getMessage());
			}
		}

		if (conn != null) {
			conn.close();
		}
		
		if (rs != null) {
			rs.close();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
<body>

</body>
</html>