<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

String time = sf.format(nowTime);

request.setAttribute("minDate", time);
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

.delete_line_button {
	float: right;
	margin-left: 10px;
	margin-bottom: 10px;
	margin-top: -3px;
	vertical-align: middle;
}

.buttonOps {
	margin-top: 10px;
	margin-bottom: 36px;
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
	
	// 1
	function productSearch_1() { window.open("productSearch_1.jsp", "productSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setProductValue1(productCode_1, productName_1, productColor_1, productMeasure_1, productPrice_1) {
		document.getElementById("productCode_1").value = productCode_1;
		document.getElementById("productName_1").value = productName_1;
		document.getElementById("productColor_1").value = productColor_1;
		document.getElementById("productMeasure_1").value = productMeasure_1;
		document.getElementById("productPrice_1").value = productPrice_1;
	}
	
	// 2
	function productSearch_2() { window.open("productSearch_2.jsp", "productSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setProductValue2(productCode_2, productName_2, productColor_2, productMeasure_2, productPrice_2) {
		document.getElementById("productCode_2").value = productCode_2;
		document.getElementById("productName_2").value = productName_2;
		document.getElementById("productColor_2").value = productColor_2;
		document.getElementById("productMeasure_2").value = productMeasure_2;
		document.getElementById("productPrice_2").value = productPrice_2;
	}
	
	// 3
	function productSearch_3() { window.open("productSearch_3.jsp", "productSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setProductValue3(productCode_3, productName_3, productColor_3, productMeasure_3, productPrice_3) {
		document.getElementById("productCode_3").value = productCode_3;
		document.getElementById("productName_3").value = productName_3;
		document.getElementById("productColor_3").value = productColor_3;
		document.getElementById("productMeasure_3").value = productMeasure_3;
		document.getElementById("productPrice_3").value = productPrice_3;
	}
	
	// 4
	function productSearch_4() { window.open("productSearch_4.jsp", "productSearch", "width=auto, height=auto, left=auto, top=auto"); }
	function setProductValue4(productCode_4, productName_4, productColor_4, productMeasure_4, productPrice_4) {
		document.getElementById("productCode_4").value = productCode_4;
		document.getElementById("productName_4").value = productName_4;
		document.getElementById("productColor_4").value = productColor_4;
		document.getElementById("productMeasure_4").value = productMeasure_4;
		document.getElementById("productPrice_4").value = productPrice_4;
	}
	
	function priceCalc() {
		document.getElementById("supplyPrice").value = document.getElementById("productPrice").value * document.getElementById("productQuan").value;
		document.getElementById("vat").value = document.getElementById("supplyPrice").value / 10;
		document.getElementById("totalPrice").value = parseInt(document.getElementById("supplyPrice").value) + parseInt(document.getElementById("vat").value);
		document.getElementById("totalAmount").value = parseInt(document.getElementById("totalPrice").value);
	}
	
	// 1
	function priceCalc_1() {
		document.getElementById("supplyPrice_1").value = document.getElementById("productPrice_1").value * document.getElementById("productQuan_1").value;
		document.getElementById("vat_1").value = document.getElementById("supplyPrice_1").value / 10;
		document.getElementById("totalPrice_1").value = parseInt(document.getElementById("supplyPrice_1").value) + parseInt(document.getElementById("vat_1").value);
		document.getElementById("totalAmount").value = parseInt(document.getElementById("totalPrice").value) + parseInt(document.getElementById("totalPrice_1").value);
	}
	
	// 2
	function priceCalc_2() {
		document.getElementById("supplyPrice_2").value = document.getElementById("productPrice_2").value * document.getElementById("productQuan_2").value;
		document.getElementById("vat_2").value = document.getElementById("supplyPrice_2").value / 10;
		document.getElementById("totalPrice_2").value = parseInt(document.getElementById("supplyPrice_2").value) + parseInt(document.getElementById("vat_2").value);
		document.getElementById("totalAmount").value = parseInt(document.getElementById("totalPrice").value) + parseInt(document.getElementById("totalPrice_1").value) + parseInt(document.getElementById("totalPrice_2").value);
	}
	
	// 3
	function priceCalc_3() {
		document.getElementById("supplyPrice_3").value = document.getElementById("productPrice_3").value * document.getElementById("productQuan_3").value;
		document.getElementById("vat_3").value = document.getElementById("supplyPrice_3").value / 10;
		document.getElementById("totalPrice_3").value = parseInt(document.getElementById("supplyPrice_3").value) + parseInt(document.getElementById("vat_3").value);
		document.getElementById("totalAmount").value = parseInt(document.getElementById("totalPrice").value) + parseInt(document.getElementById("totalPrice_1").value) + parseInt(document.getElementById("totalPrice_2").value) + parseInt(document.getElementById("totalPrice_3").value);
	}
	
	// 4
	function priceCalc_4() {
		document.getElementById("supplyPrice_4").value = document.getElementById("productPrice_4").value * document.getElementById("productQuan_4").value;
		document.getElementById("vat_4").value = document.getElementById("supplyPrice_4").value / 10;
		document.getElementById("totalPrice_4").value = parseInt(document.getElementById("supplyPrice_4").value) + parseInt(document.getElementById("vat_4").value);
		document.getElementById("totalAmount").value = parseInt(document.getElementById("totalPrice").value) + parseInt(document.getElementById("totalPrice_1").value) + parseInt(document.getElementById("totalPrice_2").value) + parseInt(document.getElementById("totalPrice_3").value) + parseInt(document.getElementById("totalPrice_4").value);
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
	
	// 1
	$(document).on("keyup","#productQuan_1",function(){ 
		var productQuan_1 = $('#productQuan_1').val();
		var productPrice_1 = $('#productPrice_1').val();
		var supplyPrice_1 = productQuan_1 * productPrice_1;
		$('#supplyPrice_1').text(supplyPrice_1);
	});
	
	//
	$(document).on("keyup","#productPrice_1",function(){  
		var productQuan_1 = $('#productQuan_1').val();
		var productPrice_1 = $('#productPrice_1').val();
		var supplyPrice_1 = productQuan_1 * productPrice_1;
		$('#supplyPrice_1').text(supplyPrice_1);
	});
	
	//
	$(document).on("keyup","#totalAmount_1",function(){
		var productQuan_1 = $('#productQuan_1').val();
		var productPrice_1 = $('#productPrice_1').val();
		var supplyPrice_1 = productQuan_1 * productPrice_1;
		$('#supplyPrice_1').text(supplyPrice_1);
	});
	
	// 2
	$(document).on("keyup","#productQuan_2",function(){ 
		var productQuan_2 = $('#productQuan_2').val();
		var productPrice_2 = $('#productPrice_2').val();
		var supplyPrice_2 = productQuan_2 * productPrice_2;
		$('#supplyPrice_2').text(supplyPrice_2);
	});
	
	//
	$(document).on("keyup","#productPrice_2",function(){  
		var productQuan_2 = $('#productQuan_2').val();
		var productPrice_2 = $('#productPrice_2').val();
		var supplyPrice_2 = productQuan_2 * productPrice_2;
		$('#supplyPrice_2').text(supplyPrice_2);
	});
	
	//
	$(document).on("keyup","#totalAmount_2",function(){
		var productQuan_2 = $('#productQuan_2').val();
		var productPrice_2 = $('#productPrice_2').val();
		var supplyPrice_2 = productQuan_2 * productPrice_2;
		$('#supplyPrice_2').text(supplyPrice_2);
	});
	
	// 3
	$(document).on("keyup","#productQuan_3",function(){ 
		var productQuan_3 = $('#productQuan_3').val();
		var productPrice_3 = $('#productPrice_3').val();
		var supplyPrice_3 = productQuan_3 * productPrice_3;
		$('#supplyPrice_3').text(supplyPrice_3);
	});
	
	//
	$(document).on("keyup","#productPrice_3",function(){  
		var productQuan_3 = $('#productQuan_3').val();
		var productPrice_3 = $('#productPrice_3').val();
		var supplyPrice_3 = productQuan_3 * productPrice_3;
		$('#supplyPrice_3').text(supplyPrice_3);
	});
	
	//
	$(document).on("keyup","#totalAmount_3",function(){
		var productQuan_3 = $('#productQuan_3').val();
		var productPrice_3 = $('#productPrice_3').val();
		var supplyPrice_3 = productQuan_3 * productPrice_3;
		$('#supplyPrice_3').text(supplyPrice_3);
	});
	
	// 4
	$(document).on("keyup","#productQuan_4",function(){ 
		var productQuan_4 = $('#productQuan_4').val();
		var productPrice_4 = $('#productPrice_4').val();
		var supplyPrice_4 = productQuan_4 * productPrice_4;
		$('#supplyPrice_4').text(supplyPrice_4);
	});
	
	//
	$(document).on("keyup","#productPrice_4",function(){  
		var productQuan_4 = $('#productQuan_4').val();
		var productPrice_4 = $('#productPrice_4').val();
		var supplyPrice_4 = productQuan_4 * productPrice_4;
		$('#supplyPrice_4').text(supplyPrice_4);
	});
	
	//
	$(document).on("keyup","#totalAmount_4",function(){
		var productQuan_4 = $('#productQuan_4').val();
		var productPrice_4 = $('#productPrice_4').val();
		var supplyPrice_4 = productQuan_4 * productPrice_4;
		$('#supplyPrice_4').text(supplyPrice_4);
	});
	
	$(function() {
		$( ".datepicker" ).datepicker({ minDate: 0});
	});
	
	function addRow() {		
		var mytable = document.getElementById('tableBody');
		var row = mytable.insertRow();
		
		cell0 = row.insertCell(0);
		cell1 = row.insertCell(1);
		cell2 = row.insertCell(2);
		cell3 = row.insertCell(3);
		cell4 = row.insertCell(4);
		cell5 = row.insertCell(5);
		cell6 = row.insertCell(6);
		cell7 = row.insertCell(7);
		cell8 = row.insertCell(8);
		cell9 = row.insertCell(9);
		cell10 = row.insertCell(10);
		
		cell0.innerHTML = '<td class="tg-baqh"><div align="center"><input type="checkbox" name="deleteRowChk"></div></td>';
		cell1.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="productCode_' + (mytable.rows.length-1) + '" name="productCode_' + (mytable.rows.length-1) + '" onclick="productSearch_' + (mytable.rows.length-1) + '();" required readonly></td>';
		cell2.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="productName_' + (mytable.rows.length-1) + '" name="productName_' + (mytable.rows.length-1) + '" onclick="productSearch_' + (mytable.rows.length-1) + '();" required readonly></td>';
		cell3.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="productColor_' + (mytable.rows.length-1) + '" name="productColor_' + (mytable.rows.length-1) + '" required readonly></td>';
		cell4.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="productMeasure_' + (mytable.rows.length-1) + '" name="productMeasure_' + (mytable.rows.length-1) + '" required readonly></td>';
		cell5.innerHTML = '<td class="tg-baqh"><input type="text" name="productQuan_' + (mytable.rows.length-1) + '" class="table-input-style" id="productQuan_' + (mytable.rows.length-1) + '" onkeyup="priceCalc_' + (mytable.rows.length-1) + '()"></td>';
		cell6.innerHTML = '<td class="tg-baqh"><input type="text" name="productPrice_' + (mytable.rows.length-1) + '" class="table-input-style" id="productPrice_' + (mytable.rows.length-1) + '" onkeyup="priceCalc_' + (mytable.rows.length-1) + '()" required></td>';
		cell7.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="supplyPrice_' + (mytable.rows.length-1) + '" name="supplyPrice_' + (mytable.rows.length-1) + '" required readonly></td>';
		cell8.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="vat_' + (mytable.rows.length-1) + '" name="vat_' + (mytable.rows.length-1) + '" required readonly></td>';
		cell9.innerHTML = '<td class="tg-baqh"><input type="text" class="table-input-style" id="totalPrice_' + (mytable.rows.length-1) + '" name="totalPrice_' + (mytable.rows.length-1) + '" onkeyup="priceCalc_' + (mytable.rows.length-1) + '()" required readonly></td>';
		cell10.innerHTML = '<td class="tg-baqh"><input type="text" name="orderNote_' + (mytable.rows.length-1) + '" class="table-input-style" id="orderNote_' + (mytable.rows.length-1) + '"></td>';
		
// 		alert(cell1.innerHTML);
	}
	
	function deleteRow() {
		var mytable = document.getElementById('tableBody');
		
		for(var i=1; i<mytable.rows.length; i++) {
			var chkbox = mytable.rows[i].cells[0].childNodes[0].childNodes[0].checked;
			
			if(chkbox) {
				mytable.deleteRow(i);
				i--;
			}
		}
	}
	
</script language="javascript">

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
								class="form-control orderDate" id="orderDate" name="orderDate"
								min="${minDate}" required>
							<div class="invalid-feedback">수주일자를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="team">납기일자</label> <input type="date"
								class="form-control" id="deliveryDate" name="deliveryDate"
								min="${minDate}" required>
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
									type="button" name="productSearchBtn"
									class="product_search_button" value="품목찾기"
									onclick="productSearch();">

							</div>
							<table class="table.txc-table tg orderTable">
								<thead>
									<tr>
										<th class="tg-baqh"></th>
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
								<tbody id="tableBody">
									<tr>
										<td class="tg-baqh"></td>

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
											class="table-input-style" id="totalPrice" name="totalPrice"
											onkeyup="priceCalc()" required readonly></td>

										<td class="tg-baqh"><input type="text" name="orderNote"
											class="table-input-style" id="orderNote"></td>
									</tr>

								</tbody>
								<tbody>
									<tr>
										<th colspan='5' class="tg-baqh">총액</th>
										<td colspan='6'><input type="text"
											class="table-input-style" id="totalAmount" name="totalAmount"
											onkeyup="priceCalc_1()" required readonly></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="buttonOps">
						<input type="button" name="addRowBtn" class="add_row_button"
							value="행추가" onclick="addRow();"> <input type="button"
							name="deleteRowBtn" class="delete_row_button" value="행삭제"
							onclick="deleteRow();">
					</div>
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