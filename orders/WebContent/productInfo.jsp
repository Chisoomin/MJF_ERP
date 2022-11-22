<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Connection conn = DriverManager.getConnection(url, user, password);

String productCode = request.getParameter("productCode");

String sql = "SELECT product_code, product_name, product_color, product_measure, product_quantity, product_price, order_note FROM order_table WHERE order_num = '"
		+ productCode + "';";
		
// String sql = "SELECT product_code, product_name, product_color, product_measure, product_quantity, product_price, order_note FROM order_table WHERE order_num = '220901-001'";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#efe8db),
		to(#efe8db));
	background: -webkit-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: -moz-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: -o-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: linear-gradient(to top right, #efe8db 0%, #efe8db 100%);
}

.input-form {
	max-width: 100%;
	margin-top: 80px;
	margin-bottom: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-title {
	max-width: 100%;
	margin-top: 40px;
	margin-bottom: -60px;
	padding: 32px;
	background: #7D766D;
	color: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-table {
	max-width: 100%;
	margin-top: -60px;
	margin-bottom: 40px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.btn-set {
	color: #fff;
	background-color: #7D766D;
	border-color: #7D766D;
}

.white {
	color: #fff;
}

.ct {
	text-align: center;
	vertical-align: middle;
}

.product_check {
	vertical-align: middle;
}

.tableHead {
	text-align: center;
}
</style>

<script>
	
</script>

</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>품목정보</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div>
					<!-- <div id="layoutSidenav_content"> -->
					<main>
						<div class="container-fluid px-4">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 품목 상세 정보
								</div>
								<div class="card-body">
									<table id="datatablesSimple" class="productTable">
										<thead>
											<tr class="tableHead">
												<th nowrap width="100%">품목코드</th>
												<th nowrap width="100%">품목이름</th>
												<th nowrap width="100%">품목색상</th>
												<th nowrap width="100%">품목단위</th>
												<th nowrap width="100%">품목수량</th>
												<th nowrap width="100%">품목단가</th>
												<th nowrap width="100%">비고</th>
											</tr>
										</thead>
										<tbody>
											<%
												while (rs.next()) {
											%>
											<tr>
												<td id="productCode" nowrap width="100%"><%=rs.getString("product_code")%></td>
												<td id="productName" nowrap width="100%"><%=rs.getString("product_name")%></td>
												<td id="productColor" nowrap width="100%"><%=rs.getString("product_color")%></td>
												<td id="productMeasure" nowrap width="100%"><%=rs.getString("product_measure")%></td>
												<td id="productQuantity" nowrap width="100%"><%=rs.getString("product_quantity")%></td>
												<td id="productPrice" nowrap width="100%"><%=rs.getString("product_price")%></td>
												<td id="orderNote" nowrap width="100%"><%=rs.getString("order_note")%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						 
						<div class="col-lg-12" id="ex3_Result1"></div>
					</main>
				</div>
			</div>
		</div>
	</div>
</body>
</html>