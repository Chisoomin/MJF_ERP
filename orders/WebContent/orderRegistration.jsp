<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	//
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

.tg {
	border-collapse: collapse;
	border-color: #ccc;
	border-spacing: 0;
	width: 100%;
	table-layout: fixed;
}

.tg td {
	background-color: #fff;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	background-color: #f0f0f0;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: top
}

.tg .tg-5frq {
	font-style: italic;
	text-align: center;
	vertical-align: top
}

.tg .tg-nrix {
	text-align: center;
	vertical-align: middle
}

.table-input-style {
	width: 100%;
	border: 0;
	outline: none;
	text-align: center;
}

.order_title {
	margin-bottom: 0px;
}

.product_search_button {
	float: right;
	margin-bottom: 10px;
	margin-top: -3px;
	vertical-align: middle;
}
</style>

<script language="javascript">
	function accountSearch() { window.open("accountSearch.jsp", "accountSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setAccountValue(accountCode, accountName) {
		document.getElementById("accountName").value = accountName;
		document.getElementById("accountCode").value = accountCode;
	}
	
	function employeeSearch() { window.open("employeeSearch.jsp", "employeeSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setEmployeeValue(memberId, memberName) {
		document.getElementById("memberName").value = memberName;
		document.getElementById("memberId").value = memberId;
	}
	
	function productSearch() { window.open("productSearch.jsp", "productSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setProductValue(productCode, productName, productColor, productMeasure, productPrice) {
		document.getElementById("productCode").value = productCode;
		document.getElementById("productName").value = productName;
		document.getElementById("productColor").value = productColor;
		document.getElementById("productMeasure").value = productMeasure;
		document.getElementById("productPrice").value = productPrice;
	}
	
	function priceCalc() {
		document.getElementById("supplyPrice").value = document.getElementById("productPrice").value * document.getElementById("productQuan").value;
		document.getElementById("vat").value = document.getElementById("supplyPrice").value / 10;
		document.getElementById("totalAmount").value = parseInt(document.getElementById("supplyPrice").value) + parseInt(document.getElementById("vat").value);
		document.getElementById("totalPrice").value = parseInt(document.getElementById("supplyPrice").value) + parseInt(document.getElementById("vat").value);
	}
	
	$(document).ready(function() {
		$('#productQuan').keyup(function() {
			var productQuan = $('#productQuan').val();
			var productPrice = $('#productPrice').val();
			var supplyPrice = productQuan * productPrice;
			$('#supplyPrice').text(supplyPrice);
		});
	});
	
	$(document).ready(function() {
		$('#productPrice').keyup(function() {
			var productQuan = $('#productQuan').val();
			var productPrice = $('#productPrice').val();
			var supplyPrice = productQuan * productPrice;
			$('#supplyPrice').text(supplyPrice);
		});
	});
	
	$(document).ready(function() {
		$('#totalAmount').keyup(function() {
			var productQuan = $('#productQuan').val();
			var productPrice = $('#productPrice').val();
			var supplyPrice = productQuan * productPrice;
			$('#supplyPrice').text(supplyPrice);
		});
	});
</script>

</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>수주등록</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form
					action="<%=request.getContextPath()%>/orderRegistration_process.jsp"
					method="post" class="validation-form" name="orderResgistraion"
					novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="department">수주일자</label> <input type="date"
								class="form-control" id="orderDate" name="orderDate" required>
							<div class="invalid-feedback">수주일자를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="team">납기일자</label> <input type="date"
								class="form-control" id="deliveryDate" name="deliveryDate"
								required>
							<div class="invalid-feedback">납기일자를 입력해주세요.</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="department">거래처명</label> <input type="text"
								class="form-control" id="accountName" name="accountName"
								required onclick="accountSearch();">
							<div class="invalid-feedback">거래처명을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="department">거래처 코드</label> <input type="text"
								class="form-control" id="accountCode" name="accountCode"
								required onclick="accountSearch();">
							<div class="invalid-feedback">거래처 코드를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="team">담당자명</label> <input type="text"
								class="form-control" id="memberName" name="memberName" required
								onclick="employeeSearch();">
							<div class="invalid-feedback">담당자 이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="department">담당자 사원번호</label> <input type="text"
								class="form-control" id="memberId" name="memberId" required
								onclick="employeeSearch();">
							<div class="invalid-feedback">담당자 사원번호를 입력해주세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<div class="table_top">
								<label for="orderProduct" class="order_title">수주품목</label> <input
									type="button" name="orderNum" class="product_search_button"
									value="품목찾기" onclick="productSearch();">
							</div>
							<table class="table.txc-table tg orderTable">
								<thead>
									<tr>
										<th class="tg-baqh">번호</th>
										<th class="tg-baqh">품목코드</th>
										<th class="tg-baqh">품목이름</th>
										<th class="tg-baqh">색상</th>
										<th class="tg-baqh">단위</th>
										<th class="tg-baqh">수량</th>
										<th class="tg-baqh">단가</th>
										<th class="tg-baqh">공급가액</th>
										<th class="tg-baqh">부가세</th>
										<th class="tg-baqh">품목총액</th>
										<th class="tg-baqh">비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="tg-baqh">1</td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productCode" name="productCode"
											onclick="productSearch();" required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productName" name="productName"
											onclick="productSearch();" required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productColor"
											name="productColor" required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productMeasure"
											name="productMeasure" required readonly></td>

										<td class="tg-baqh"><input type="text" name="productQuan"
											class="table-input-style" id="productQuan"
											onkeyup="priceCalc()"></td>

										<td class="tg-baqh"><input type="text"
											name="productPrice" class="table-input-style"
											id="productPrice" onkeyup="priceCalc()" required></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="supplyPrice" name="supplyPrice"
											required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="vat" name="vat" required
											readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="totalPrice"
											name="totalPrice" onkeyup="priceCalc()" required
											readonly></td>

										<td class="tg-baqh"><input type="text" name="orderNote"
											class="table-input-style" id="orderNote"></td>
									</tr>
									<tr>
										<th colspan='5' class="tg-baqh">총액</th>
										<td colspan='6'><input type="text"
											class="table-input-style" id="totalAmount" name="totalAmount"
											onkeyup="priceCalc()" required readonly></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">등록</button>
				</form>
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