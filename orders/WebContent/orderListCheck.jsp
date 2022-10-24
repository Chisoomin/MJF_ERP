<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Connection conn = DriverManager.getConnection(url, user, password);

String sql = "select * from order_table;";

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

.marginZero {

}
</style>

<script>

</script>

<script>

</script>
</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>수주목록</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-">
				<div>
					<!-- <div id="layoutSidenav_content"> -->
					<main>
						<div class="container-fluid px-4">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 품목찾기
								</div>
								<div class="card-body">
									<table id="datatablesSimple" class="productTable">
										<thead>
											<tr class="tableHead">
												<th colspan='3'>수주정보</th>
												<th colspan='2'>담당자정보</th>
												<th colspan='2'>거래처정보</th>
												<th colspan='6'>품목정보</th>
												<th colspan='3'>금액정보</th>
												<th rowspan='2'>진행상황</th>
												<th rowspan='2'>비고</th>
											</tr>
											<tr>
												<th>수주<br>번호
												</th>
												<th>수주<br>일자
												</th>
												<th>납기<br>일자
												</th>
												<th>담당자<br>코드</th>
												<th>담당자<br>이름</th>
												<th>거래처<br>코드
												</th>
												<th>거래처<br>이름
												</th>
												<th>품목<br>코드
												</th>
												<th>품목이름</th>
												<th>품목<br>색상
												</th>
												<th>품목<br>단위
												</th>
												<th>품목<br>수량
												</th>
												<th>품목<br>단가
												</th>
												<th>공급가액</th>
												<th>부가세</th>
												<th>총액</th>
											</tr>
										</thead>
										<tbody>
											<%
												while (rs.next()) {
											%>
											<tr>
												<td id="orderNum"><%=rs.getString("order_num")%></td>
												<td id="orderDate"><%=rs.getString("order_date")%></td>
												<td id="deliveryDate"><%=rs.getString("delivery_date")%></td>
												<td id="memberId"><%=rs.getString("member_id")%></td>
												<td id="memberName"><%=rs.getString("member_name")%></td>
												<td id="accountCode"><%=rs.getString("account_code")%></td>
												<td id="accountName"><%=rs.getString("account_name")%></td>
												<td id="productCode"><%=rs.getString("product_code")%></td>
												<td id="productName"><%=rs.getString("product_name")%></td>
												<td id="productColor"><%=rs.getString("product_color")%></td>
												<td id="productMeasure"><%=rs.getString("product_measure")%></td>
												<td id="productQuan"><%=rs.getString("product_quantity")%></td>
												<td id="productPrice"><%=rs.getString("product_price")%></td>
												<td id="supplyPrice"><%=rs.getString("supply_price")%></td>
												<td id="vat"><%=rs.getString("vat")%></td>
												<td id="totalAmount"><%=rs.getString("total_amount")%></td>
												<td id="orderProgress"><%=rs.getString("order_progress")%></td>
												<td id="orderNote"><%=rs.getString("order_note")%></td>
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

	<script>
		window.addEventListener('load', () => {
      	const forms = document.getElementsByClassName('validation-form');
		Array.prototype.filter.call(forms, (form) => {
			form.addEventListener('submit', function (event) {
				if (form.checkValidity() === false) {
					event.preventDefault();
            		event.stopPropagation();
          		}	
          	form.classList.add('was-validated');
        	}, false);
      	});
    	}, false);
	</script>

</body>
</html>