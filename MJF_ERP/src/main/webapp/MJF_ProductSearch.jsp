<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String color_rs[] = new String[20];
String ini_rs[] = new String[20];
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ResultSet ss = null;
int columnCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
PreparedStatement pstmt = null;

String sql = "SELECT * from MJFdb.product_table";
stmt = conn.createStatement();
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>품목 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

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

.img-button {
	background-color: #fff;
	border: none;
	width: 40px;
	height: 40px;
	cursor: pointer;
}

.none-border {
	border: none;
	margin: 0px;
	padding: 0px;
}

.productRadio {
	margin: 2%;
	margin-left: 10px;
	margin-right: 10px;
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

.productRadio {
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
}

.btn-right {
	float: right;
	margin-right: 2%;
}
</style>


<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>재고 관리</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form method="get" id="good" class="validation-form" novalidate>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 품목 조회
							</div>

							<div class="card-body">
								<table id="datatablesSimple">

									<thead>
										<tr>
											<th nowrap>품목 선택</th>
											<th nowrap>품목 분류</th>
											<th nowrap>품목 소분류</th>
											<th nowrap>품목명</th>
											<th nowrap>색깔</th>
											<th nowrap>품목 코드</th>
											<th nowrap>단위</th>
											<th nowrap>규격</th>
											<th nowrap>수량</th>
											<th nowrap>입고 단가</th>
											<th nowrap>창고명</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th class="productRadio">품목 선택</th>
											<th>품목 분류</th>
											<th>품목 소분류</th>
											<th>품목명</th>
											<th>색깔</th>
											<th>품목 코드</th>
											<th>단위</th>
											<th>규격</th>
											<th>수량</th>
											<th>입고 단가</th>
											<th>창고명</th>
										</tr>

									</tfoot>
									<tbody>

										<%
										while (rs.next()) {
											String codenum = "";
											String zero1 = "0";
											String zero2 = "00";
											String result = "";
											codenum = rs.getString("product_num");
											if (codenum.length() == 1) {
												result = zero2.concat(codenum);
												//System.out.print(codenum);
											} else if (codenum.length() == 2) {
												result = zero1.concat(codenum);
											}

											String productSize = "";
											productSize = rs.getString("product_size");
											//System.out.println(productSize);
											if (productSize.equals("-x-x-")) {
												productSize = "-";
											}
										%>
										<tr>
											<th><label for="productSelect"></label><input
												id="productSelect" class="productRadio" name="productSelect"
												type="radio" value=<%=rs.getString("product_num")%>></th>
											<th id="productType" name="productType"><%=rs.getString("product_type")%></th>
											<th id="productType2" name="productType2"><%=rs.getString("product_type2")%></th>
											<th id="productName" name="productName"><%=rs.getString("product_name")%></th>
											<th id="productColor" name="productColor"><%=rs.getString("product_color")%></th>
											<th id="productCode" name="productCode"><%=rs.getString("product_code") + result%></th>
											<th id="productMeasure" name="productMeasure"><%=rs.getString("product_measure")%></th>
											<th id="productSize" name="productSize"><%=productSize%></th>
											<th id="productAmount" name="productAmount"><%=rs.getString("product_amount")%></th>
											<th id="productAmount" name="productPrice"><%=rs.getString("product_price")%></th>
											<th id="productStorage" name="productStorage"><%=rs.getString("product_storage")%></th>
										</tr>
										<%
										}
										%>
										<!-- 
											<tr>
												<th>완제품</th>
												<th>소파</th>
												<th>2인 쇼파</th>
												<th>F-WH-21-001</th>
												<th>하양</th>
												<th>1개</th>
												<th>500x500x600</th>
												<th>20</th>
												<th>300000</th>
												<th>제1창고</th>
											</tr>
											<tr>
												<th>반제품</th>
												<th>조립식 선반</th>
												<th>H-BR-11-002</th>
												<th>갈색</th>
												<th>1개</th>
												<th>-</th>
												<th>30개</th>
												<th>150000</th>
												<th>제2창고</th>
											</tr>-->

									</tbody>

								</table>

							</div>

							<script type="text/javascript">
					var popupX = (document.body.offsetWidth / 2) - (document.body.offsetWidth / 4);
					// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
					
					var popupY= (window.screen.height / 2) - (window.screen.height / 4);
					// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
					function popup(url,width,height){
  						var sst = window.open(url,'popwin','top='+((screen.availHeight - height)/2 - 40) +', left='+((screen.availWidth - width)/2 - 40)+', width='+width+', height='+height+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
					  if(sst){
					    sst.focus();
					  }
					}
				</script>

							<!-- <button class="btn btn-set2 btn-lg btn-block mar"
					onclick="window.open('order_loading.jsp', 'window_name', 'width=window.screen.width /2, height=window.screen.height /2, left=window.screen.width/4, status=no, scrollbars=yes');">수주
					불러오기</button> -->

						</div>

						<!-- 아직 변경 안함 -->
						<button type="submit" formaction="MJF_StockRegister.jsp"
							class="btn btn-set2 btn-lg btn-right mar btn-set btn-margin">생산
							수량 등록</button>

						<button type="submit"
							class="btn btn-set2 btn-lg btn-right mar btn-set"
							onclick="popup('MJF_ProductRegistration.jsp',window.screen.width,window.screen.height);">신규
							품목 등록</button>
				</form>

			</div>
		</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>