<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />

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
	padding: 16px;
	padding-left: 32px;
	background: #7D766D;
	color: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	background: #7D766D;
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

.form-margin {
	margin-top: 5px;
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
</style>
<script language="javascript">
	function accountSearch() {window.open("productSearch.jsp", "a", "width=400, height=300, left=100, top=50"); }
	function productSearch() { window.open("productSearch.jsp", "a", "width=400, height=300, left=100, top=50"); }
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
				<form action="process.jsp" method="post" class="validation-form"
					novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="department">수주일자</label> <input type="text"
								class="form-margin form-control" id="orderDate" placeholder=""
								value="" required>
							<div class="invalid-feedback">수주일자를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="team">납기일자</label> <input type="text"
								class="form-margin form-control" id="deliveryDate"
								placeholder="" value="" required>
							<div class="invalid-feedback">납기일자를 입력해주세요.</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="department">거래처명</label> <input type="text"
								class="form-margin form-control" id="accountName" placeholder=""
								value="" required onclick="accountSearch();">
							<div class="invalid-feedback">거래처명을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="team">담당자</label> <input type="text"
								class="form-margin form-control" id="memberName" placeholder=""
								value="" required>
							<div class="invalid-feedback">담당자를 입력해주세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<label for="orderProduct">수주품목</label>
							<table class="form-margin table.txc-table tg">
								<thead>
									<tr>
										<th class="tg-baqh">수주번호</th>
										<th class="tg-baqh">품목코드</th>
										<th class="tg-baqh">품목이름</th>
										<th class="tg-baqh">색상</th>
										<th class="tg-baqh">단위</th>
										<th class="tg-baqh">수량</th>
										<th class="tg-baqh">단가</th>
										<th class="tg-baqh">공급가액</th>
										<th class="tg-baqh">부가세</th>
										<th class="tg-baqh">비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="tg-baqh">1</td>
										<td class="tg-baqh"><input type="button" name="orderNum"
											class="table-input-style" value="품목찾기"
											onclick="productSearch();"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"><input type="text" name="productQuan"
											class="table-input-style"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"><input type="text" name="orderNote"
											class="table-input-style"></td>
									</tr>
									<tr>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
										<td class="tg-baqh"></td>
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