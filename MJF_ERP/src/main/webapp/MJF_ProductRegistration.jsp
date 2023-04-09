<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String color_rs[] = new String[20]; //색깔 이름
String color_ini_rs[] = new String[20]; // 색깔 코드

String type_rs[] = new String[20];// 품목 타입 이름  
String type_ini_rs[] = new String[20]; // 품목 코드(소분류) 

String storage_rs[] = new String[20]; // 창고용 rs

Connection conn = null;
Statement stmt = null;
//Statement stmt_storage = null; // 창고용 stmt

ResultSet crs = null; // color_result_set
ResultSet trs = null; //type_result_set
ResultSet srs = null; // storage_result_set

int columnCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
stmt = conn.createStatement();
PreparedStatement c_pstmt = null;
PreparedStatement t_pstmt = null;
PreparedStatement s_pstmt = null;

try {
	// 기준정보 받는 단계
	String sql_color = "SELECT color_data, color_ini from MJFdb.masterdata_color";
	stmt = conn.createStatement();
	crs = stmt.executeQuery(sql_color);
	c_pstmt = conn.prepareStatement(sql_color);

	String sql_type = "SELECT type_data, type_ini from MJFdb.masterdata_type";
	stmt = conn.createStatement();
	trs = stmt.executeQuery(sql_type);
	t_pstmt = conn.prepareStatement(sql_type);

	String sql_storage = "SELECT storage_data from MJFdb.masterdata_storage";
	stmt = conn.createStatement();
	srs = stmt.executeQuery(sql_storage);
	s_pstmt = conn.prepareStatement(sql_storage);

	int i = 0, j = 0, k = 0;
	while (crs.next()) {
		color_rs[i] = crs.getString("color_data");
		color_ini_rs[i] = crs.getString("color_ini");
		i++;
	}
	while (trs.next()) {
		type_rs[j] = trs.getString("type_data");
		type_ini_rs[j] = trs.getString("type_ini");
		j++;
	}
	while (srs.next()) {
		storage_rs[k] = srs.getString("storage_data");
		//System.out.println(storage_rs[k]);
		k++;
	}

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	//if (crs != null)
	crs.close();
	//if (trs != null)
	trs.close();
	srs.close();
	//if (stmt != null)
	stmt.close();
	//stmt_storage.close();
	//if (conn != null)
	conn.close();
	c_pstmt.close();
	t_pstmt.close();
	s_pstmt.close();
}
%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신규 품목 등록</title>

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
				<h1>품목 등록</h1>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<form action="MJF_Product_Process.jsp" class="validation-form"
					novalidate>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="productType">품목 분류</label> <select
								class="custom-select d-block w-100" id="productType"
								name="productType" onchange="productTypeChange(this)">
								<option>선택해주세요</option>
								<!-- <option value="원재료">원재료</option>
								<option value="반제품">반제품</option>
								<option value="완제품">완제품</option>-->

								<%
								int x = 0;

								for (x = 0; x < type_rs.length; x++) {
									if (type_rs[x] == null)
										continue;
									out.println("<option value='" + type_rs[x] + "'>" + type_rs[x] + "</option>");
									//System.out.print(ini_rs[x]);
								}
								%>

							</select>
						</div>



						<div class="col-md-4 mb-3">
							<label for="productCode">물품코드 (소분류)</label> <select
								class="form-control" id="productCode" name="productCode">
								<!-- input type="text" class="form-control" id="productCode" placeholder="물품코드 정의표에 따라 물품코드를 입력해주세요" value="" required>-->
								<option>선택해주세요</option>

							</select>
						</div>
					</div>



					<div class="mb-3">
						<label for="productName">품목명</label> <input type="text"
							class="form-control" id="productName" name="productName"
							placeholder="품목명을 입력하세요" value="" required>
					</div>


					<div class="mb-3">
						<label for="productColor">색상</label>
						<!-- <input type="color" class="form-control" id="productColor" placeholder="품목 색상을 입력하세요" value="" required>-->
						<select class="custom-select d-block w-100" id="productColor"
							name="productColor">
							<option>물품 색상을 선택해주세요</option>
							<!-- <option value="하얀색">하얀색</option>
							<!-- DB 키워드 : WH--
							<option value="검은색">검은색</option>
							<!-- DB 키워드 : BK--
							<option value="갈색">갈색</option>
							<!-- DB 키워드 : BR--
							<option value="빨간색">빨간색</option>
							<!-- DB 키워드 : RD--
							<option value="주황색">주황색</option>
							<!-- DB 키워드 : OG--
							<option value="노란색">노란색</option>
							<!-- DB 키워드 : YW--
							<option value="초록색">초록색</option>
							<!-- DB 키워드 : GR--
							<option value="파란색">파란색</option>
							<!-- DB 키워드 : BL--
							<option value="보라색">보라색</option>
							<!-- DB 키워드 : PU-- -->

							<%
							int y = 0;
							for (y = 0; y < color_rs.length; y++) {
								if (color_rs[y] == null)
									continue;
								out.println("<option value='" + color_rs[y] + "'>" + color_rs[y] + "</option>");
								//System.out.print(ini_rs[x]);
							}
							%>

						</select>
					</div>


					<div class="mb-3">
						<label for="productMeasure">품목 단위</label> <br>
						<!--<input type="text" class="form-control" id="productName" placeholder="품목 단위를 입력하세요" value="" required>-->
						<input id="productMSingle" name="productMeasure" type="radio"
							value="낱개"> <label for="productSingle">낱개</label> <input
							id="productMBox" name="productMeasure" type="radio" value="박스">
						<label for="productMBox">박스</label>
					</div>

					<div class="row">

						<label for="productSize">품목 규격</label>

						<div class="col-md-3 mb-3">

							<input type="text" class="form-control" id="productSize1"
								name="productSize1" placeholder="가로 (mm)" value="" required>
						</div>
						x
						<div class="col-md-3 mb-3">

							<input type="text" class="form-control" id="productSize2"
								name="productSize2" placeholder="세로 (mm)" value="" required>
						</div>
						x
						<div class="col-md-3 mb-3">
							<input type="text" class="form-control" id="productSize3"
								name="productSize3" placeholder="높이 (mm)" value="" required>
						</div>

					</div>

					<div class="mb-3">
						<label for="productAmount">품목 수량</label> <input type="number"
							class="form-control" id="productAmount" name="productAmount"
							placeholder="품목 수량을 입력하세요" value="" required>
					</div>


					<div class="mb-3">
						<label for="productPrice">입고 단가</label> <input type="number"
							class="form-control" id="productPrice" name="productPrice"
							placeholder="입고 단가를 입력하세요" value="" required>
					</div>


					<div class="mb-3">


						<label for="productStorage">보관 창고</label> <select
							class="custom-select d-block w-100" id="productStorage"
							name="productStorage">
							<option>창고를 선택해주세요</option>
							<%
							int z = 0;

							for (z = 0; z < storage_rs.length; z++) {
								if (storage_rs[z] == null)
									continue;
								out.println("<option value='" + storage_rs[z] + "'>" + storage_rs[z] + "</option>");
								//System.out.print(storage_rs.length);
							}
							%>

						</select>
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
	// 물품코드 자동분류

	function productTypeChange(e) {
		var typeR = ["01 원목", "02 가죽", "03 유리", "04 천", "05 솜", "06 조립부품"];
		var typeH = ["11 선반", "12 트레이", "13 수납함", "14 책꽂이", "15 동물가구", "16 조명"];
		var typeF = ["21 쇼파",  "22 책상", "23 의자", "24 책장", "25 서랍", "26 침대"];
		var target = document.getElementById("productCode");
		
		if(e.value == "원재료") var d = typeR;
		else if(e.value == "반제품") var d = typeH;
		else if(e.value == "완제품") var d = typeF;

		target.options.length = 0;
		
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}   
	}
                            
	</script>

	<script>
	function productTypeCode(e){
		if(e.value == "typeF") 
			var typeCode = "F-";
		else if(e.value == "typeH")
			var typeCode = "H-";
		else if(e.value == "typeR")
			var typeCode = "R-";
		
		return typeCode;
	}
</script>

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