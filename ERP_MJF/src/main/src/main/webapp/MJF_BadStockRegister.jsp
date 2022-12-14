<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
String product_rs[] = new String[20];
Connection conn = null;
Statement stmt = null;
Statement stmt_t = null;
Statement stmt_t2 = null;
ResultSet rs = null;
ResultSet trs = null;
ResultSet trs2 = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt_t = null;
PreparedStatement pstmt_t2 = null;
int change_amt = 0;

int columnCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
stmt = conn.createStatement();

String sql = "SELECT * from MJFdb.return_product";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery(sql);

String sql_type = "SELECT type_data, type_ini from MJFdb.masterdata_type";
stmt_t = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
trs = stmt_t.executeQuery(sql_type);
pstmt_t = conn.prepareStatement(sql_type);

String sql_type2 = "SELECT type2_ini, type2_data, type2_code from MJFdb.masterdata_type2";
stmt_t2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
trs2 = stmt_t2.executeQuery(sql_type2);
pstmt_t2 = conn.prepareStatement(sql_type2);

// 품목 분류, 물품 코드(소분류), 품목명, 변경 수량, 보관창고

String productType = "", productType2 = "", productCode = "", productName = "";
String codenum = "", zero1 = "", zero2 = "", result = "";
int productAmount = 0;
String type = "", type2 = "";

int productSelect = Integer.parseInt(request.getParameter("returnSelect"));
// System.out.println("테스트 " + productSelect);

String type_rs[] = new String[20];// 품목 타입 이름  
String type_ini_rs[] = new String[20]; // 품목 코드

String type2_rs[] = new String[20];// 품목 타입 이름   (소분류)
String type2_ini_rs[] = new String[20]; // 품목 코드 (소분류)
String type2_code_rs[] = new String[20]; // 품목 코드 (소분류)

int j = 0;

while (rs.next()) {

	if (productSelect == rs.getInt("return_num")) {

		productCode = rs.getString("return_code");
		productName = rs.getString("return_name");
		productAmount = rs.getInt("return_amount");

		type = productCode.substring(0, 1);
		type2 = productCode.substring(5, 7);
		j = 0;
		while (trs.next()) {
	type_rs[j] = trs.getString("type_data");
	type_ini_rs[j] = trs.getString("type_ini");
	if (type.equals(type_ini_rs[j])) {
		productType = type_rs[j];
		while (trs2.next()) {
			type2_rs[j] = trs2.getString("type2_data");
			type2_code_rs[j] = trs2.getString("type2_code");
			// 	System.out.println("type2 : " + type2);
			// 	System.out.println("type2_code_rs[j] : " + type2_code_rs[j]);

			if (type2.equals(type2_code_rs[j])) {
				productType2 = type2_rs[j];
			}
		}

		break;
	}

	j++;
		}

		trs.beforeFirst();
		trs2.beforeFirst();

		// 		productType = rs.getString("return_type");
		// 		productType2 = rs.getString("return_type2");
	}
}
%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>불량 재고 등록</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: #EFE7DB
}

.input-form {
	max-width: device-width;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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

.btn-set {
	color: #fff;
	background-color: #7D766D;
	border-color: #7D766D;
}

.white {
	color: #fff;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h1>불량 재고 등록</h1>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<form action="MJF_BadStockProcess.jsp" class="validation-form"
					novalidate>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="productType">품목 분류</label> <input type='text'
								name="productType" value=<%=productType%> id="productType"
								class='table-input-style' readonly>

						</div>

						<input type='hidden' name="productSelect" value=<%=productSelect%>
							id="productSelect">


						<div class="col-md-4 mb-3">
							<label for="productType2">품목 소분류</label> <input type="text"
								id="productType2" class="productType2" name="productType2"
								value=<%=productType2%> readonly>
						</div>

						<div class="col-md-4 mb-3">
							<label for="productCode">품목 코드</label> <input type="text"
								id="productCode" class="productCode" name="productCode"
								value=<%=productCode + result%> readonly>
						</div>

					</div>



					<div class="mb-3">
						<label for="productName">품목명</label> <input type="text"
							id="productName" class="productName" name="productName"
							value="<%=productName%>" readonly>
					</div>





					<!-- 					<div class="mb-3"> -->
					<!-- 						<label for="productAmount">불량 재고 수량</label> <input type="number" -->
					<!-- 							class="form-control" id="productAmount" name="productAmount" -->
					<%-- 							value=<%=productAmount%> readonly> --%>
					<!-- 					</div> -->

					<div class="mb-3">
						<label for="productAmount">불량 재고 수량</label> <input type="number"
							class="form-control" id="productAmount" name="productAmount"
							placeholder="불량 재고의 수량을 입력하세요" value=<%=productAmount%> required>
					</div>


					<div class="mb-3">
						<label for="productStorage">보관 창고</label> <input type="text"
							id="productStorage" class="productStorage" name="productStorage"
							value="불량 창고" readonly>

					</div>




					<div class="mb-3">
						<label for="productLife">처분 여부</label> <br> <input
							id="productTrash" name="productLife" type="radio" value="폐기">
						<label for="productTrash">폐기</label> <input id="productRecycle"
							name="productLife" type="radio" value="재활용"> <label
							for="productRecycle">재활용</label>
					</div>


					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block btn-set"
						type="submit">등록</button>

				</form>

			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 MJF</p>
		</footer>
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