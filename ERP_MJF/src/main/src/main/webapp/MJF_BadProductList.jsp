<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String return_rs[] = new String[20];
Connection conn = null;
Statement stmt = null;
Statement stmt_t = null;
Statement stmt_t2 = null;
ResultSet rs = null;
ResultSet trs = null;
ResultSet trs2 = null;
ResultSet ss = null;
int columnCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
PreparedStatement pstmt = null;
PreparedStatement pstmt_t = null;
PreparedStatement pstmt_t2 = null;

String sql = "SELECT * from MJFdb.return_product";
stmt = conn.createStatement();
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

String type_rs[] = new String[20];// 품목 타입 이름  
String type_ini_rs[] = new String[20]; // 품목 코드

String type2_rs[] = new String[20];// 품목 타입 이름   (소분류)
String type2_ini_rs[] = new String[20]; // 품목 코드 (소분류)
String type2_code_rs[] = new String[20]; // 품목 코드 (소분류)

String code = "", type = "", type2 = "";
String return_type = "", return_type2 = "";
int j = 0;
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

.returnRadio {
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

					<div id="layoutSidenav_content">
						<main>
							<div class="container">



								<div class="card mb-4">
									<div class="card-header">
										<i class="fas fa-table me-1"></i> 불량 재고 조회
									</div>

									<div class="card-body">
										<table id="datatablesSimple">

											<thead>
												<tr>
													<th nowrap>품목 선택</th>
													<th nowrap>품목 분류</th>
													<th nowrap>품목 소분류</th>
													<th nowrap>품목 코드</th>
													<th nowrap>품목명</th>
													<th nowrap>수량</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>품목 선택</th>
													<th>품목 분류</th>
													<th>품목 소분류</th>
													<th>품목 코드</th>
													<th>품목명</th>
													<th>수량</th>
												</tr>

											</tfoot>
											<tbody>
												<%
												while (rs.next()) {
													// 품목 sql 연결 완료 소분류 기준 정보도 완료
													code = rs.getString("return_code");
													type = code.substring(0, 1);
													type2 = code.substring(5, 7);
													if (rs.getString("return_trash") != null) { // 불량재고등록 완료한 항목 표에서 안보이게 하는 코드!!
														continue;
													}

													j = 0;
													while (trs.next()) {
														type_rs[j] = trs.getString("type_data");
														type_ini_rs[j] = trs.getString("type_ini");
														if (type.equals(type_ini_rs[j])) {
															return_type = type_rs[j];
													while (trs2.next()) {
														type2_rs[j] = trs2.getString("type2_data");
														type2_code_rs[j] = trs2.getString("type2_code");
// 														System.out.println("type2 : " + type2);
// 														System.out.println("type2_code_rs[j] : " + type2_code_rs[j]);

														if (type2.equals(type2_code_rs[j])) {
															return_type2 = type2_rs[j];
														}
													}

													break;
														}

														j++;
													}


													trs.beforeFirst();
													trs2.beforeFirst();
												%>
												<tr>
													<th><label for="returnSelect"></label><input
														id="returnSelect" class="returnRadio" name="returnSelect"
														type="radio" value=<%=rs.getString("return_num")%>>
													</th>
													<th id="returnType" name="returnType"><%=return_type%></th>
													<th id="returnType2" name="returnType2"><%=return_type2%></th>
													<th id="returnName" name="returnName"><%=rs.getString("return_name")%></th>
													<th id="returnCode" name="returnCode"><%=rs.getString("return_code")%></th>
													<th id="returnAmount" name="returnAmount"><%=rs.getInt("return_amount")%></th>
												</tr>
												<%
												}
												%>

											</tbody>

										</table>

									</div>
						</main>

					</div>
					<button type="submit"
						class="btn btn-set2 btn-lg btn-right mar btn-set"
						formaction='MJF_BadStockRegister.jsp'>불량 재고 등록</button>

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