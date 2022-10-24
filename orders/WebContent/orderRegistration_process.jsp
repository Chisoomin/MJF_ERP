<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
	String user = "MJFdbRoot";
	String password = "mjfrootpw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;

	conn = DriverManager.getConnection(url, user, password);

	Date nowTime = new Date();
	SimpleDateFormat simpleDateFormar = new SimpleDateFormat("yyMMdd-");
	String today = simpleDateFormar.format(nowTime);
	
	String maxSql = "SELECT order_num FROM order_table WHERE order_num LIKE '%"+ today +"%' ORDER BY num DESC LIMIT 1;";
	String insertSql = "INSERT INTO order_table (order_num, order_date, delivery_date, account_code, account_name, product_code, product_name, product_color, product_measure, product_quantity, product_price, supply_price, vat, total_price, total_amount, member_id, member_name, order_progress, order_note) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

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

	} catch (SQLException ex) {
		out.println("SQLException " + ex.getMessage());
	} finally {
		response.sendRedirect("orderRegistration.jsp");

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
</head>
<body>
</body>
</html>