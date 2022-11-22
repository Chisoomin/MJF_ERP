<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Connection conn = DriverManager.getConnection(url, user, password);

String sql = "select * from product_table;";
String sql2 = "select FORMAT(product_price, 0) from product_table;";

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
</style>

<script>
	function sendProductValue(productCode, productName, productColor, productMeasure, productPrice) {
		opener.setProductValue(productCode, productName, productColor, productMeasure, productPrice);
		window.close();
	}
</script>

<script>
	$(document).ready(function() {
		$("#registBtn").click(function(){
			var rowData = new Array();
			var tdArr = new Array();
	
			var checkbox = $("input[name=product_row]:checked");
	
			checkbox.each(function(i) {
				var tr = checkobx.parent().parent().eq(i);
				var td = tr.children();
		
				rowData.push(tr.text());
		
				var productCode = td.eq(1).text()+", ";
				var productName = td.eq(2).text()+", ";
				var productColor = td.eq(3).text()+", ";
				var productMeasure = td.eq(4).text()+", ";
				var productPrice = td.eq(5).text();
		
				tdArr.push(productCode);
				tdArr.push(productName);
				tdArr.push(productColor);
				tdArr.push(productMeasure);
				tdArr.push(productPrice);
			}
		});

		alert(rowData);
		alert(tdArr);
	});
</script>
</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>품목찾기</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<!-- 				<form action="" method="post" class="validation-form" -->
				<!-- 					name="orderResgistraion" novalidate> -->

				<div id="layoutSidenav_content">
					<main>
						<div class="container-fluid px-4">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 품목찾기
								</div>
								<div class="card-body">
									<table id="datatablesSimple" class="productTable">
										<thead>
											<tr>
												<th>선택</th>
												<th>품목코드</th>
												<th>품목이름</th>
												<th>색상</th>
												<th>단위</th>
												<th>단가</th>
											</tr>
										</thead>
										<tbody>
											<%
												while (rs.next()) {
													int count = 1;
											%>
											<tr>
												<td id="productCheck"><input type="checkbox"
													name="product_row" value="<%=count%>"></td>
												<td id="productCode"><%=rs.getString("product_code") + String.format("%03d", rs.getInt("product_num"))%></td>
												<td id="productName"><a
													href="javascript:sendProductValue('<%=rs.getString("product_code") + String.format("%03d", rs.getInt("product_num"))%>', '<%=rs.getString("product_name")%>', '<%=rs.getString("product_color")%>', '<%=rs.getString("product_measure")%>', '<%=rs.getString("product_price")%>')"><%=rs.getString("product_name")%></a></td>
												<td id="productColor"><%=rs.getString("product_color")%></td>
												<td id="productMeasure"><%=rs.getString("product_measure")%></td>
												<td id="productPrice"><%=rs.getString("product_price")%></td>
											</tr>
											<%
												count++;
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						 
						<div class="col-lg-12" id="ex3_Result1"></div>
						<button class="btn btn-set btn-lg btn-block" id="registBtn">등록</button>
					</main>
				</div>
				<!-- 				</form> -->
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