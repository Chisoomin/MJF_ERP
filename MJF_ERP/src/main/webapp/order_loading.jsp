<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int columnCount = 0;
int rowCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

/* try {
	String sql = "SELECT order_num, order_date, account_name, product_code, product_name, product_measure, product_quantity, product_price, supply_price from MJFdb.order_table";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount();
	int i = 0;
	while(rs.next()){
		team_rs[i] = rs.getString(1);
		i++;
	}
	out.println("<script>alert('"+team_rs[2]+"');</script>");
	

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
}*/
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="./image/logo_rmbg.png">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />
<title>수주 불러오기</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="./css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

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
</style>
</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h1>수주 리스트</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form action="process_or.jsp" method="get" id = "good"
					class="validation-form" novalidate>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>ORDERS LIST
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>No.</th>
										<th>수주번호</th>
										<th>수주날짜</th>
										<th>거래처명</th>
										<th>품목갯수</th>
										<th>총수주금액</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>No.</th>
										<th>수주번호</th>
										<th>수주날짜</th>
										<th>거래처명</th>
										<th>품목갯수</th>
										<th>총수주금액</th>
									</tr>
								</tfoot>
								<tbody>
									<%
									try {
										String pro = "진행중";
										String sql = "SELECT order_num, order_date, account_name, product_name, count(order_num), sum(supply_price) from MJFdb.order_table where order_progress=\'진행중\' group  by order_num";
										stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

										rs = stmt.executeQuery(sql);
										ResultSetMetaData rsmd = rs.getMetaData();
										columnCount = rsmd.getColumnCount();
										rs.last(); //커서의 위치를 제일 뒤로 이동
										rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
										String order_rs[][] = new String[rowCount][columnCount];
										int i = 0;
										int j = 0;
										rs.first();
										for (i = 0; i < rowCount; i++) {
											for (j = 0; j < columnCount; j++) {
										order_rs[i][j] = rs.getString((j + 1));
											}
											rs.next();
										}
										/* out.println("<script>alert('"+team_rs[2]+"');</script>"); */
								
										for (int k = 0; k < rowCount; k++) {						
											
											
											out.println("<tr>");
											out.println("<td  nowrap class='ct'><input type='radio' id='" + order_rs[k][0] + "' name='radiocheck' value='" + order_rs[k][0] + "'/>" + (k+1)
											+ "</td>");
											out.println("<th nowrap>" + order_rs[k][0] + "</th>");
											out.println("<th nowrap>" + order_rs[k][1] + "</th>");
											out.println("<th nowrap>" + order_rs[k][2] + "</th>");
											/*out.println("<th>" + order_rs[k][3] + "</th>");
											out.println("<th>" + order_rs[k][4] + "</th>");
											out.println("<th>" + order_rs[k][5] + "</th>");
											out.println("<th>" + order_rs[k][6] + "</th>");
											out.println("<th>" + order_rs[k][7] + "</th>");*/
											out.println("<th nowrap>" + order_rs[k][3]+" 외 "+(Integer.parseInt(order_rs[k][4])-1)+"개" + "</th>");
											out.println("<th nowrap>" + order_rs[k][5] + "</th>");
											out.println("</tr>");
										}

									} catch (SQLException ex) {
										out.println("SQLException " + ex.getMessage());
									} finally {
										if (rs != null)
											rs.close();
										if (stmt != null)
											stmt.close();
										if (conn != null)
											conn.close();
									}
									%>
									<!-- <tr>
									<td class="ct"><input type="checkbox" id="checkbox"/> 1</td>
									<th>No.</th>
									<th>수주번호</th>
									<th>수주날짜</th>
									<th>거래처명</th>
									<th>품목코드</th>
									<th>품목명</th>
									<th>단위</th>
									<th>수량</th>
									<th>단가</th>
									<th>수주금액</th>
									<th>전표번호</th>
								</tr> -->
								</tbody>
							</table>
						</div>
					</div>

					<button class="btn btn-set btn-lg btn-block" type="submit"
						onclick="">불러오기</button>
				</form>
			</div>
		</div>
	</div>
	<!--<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-table col-md-12 mx-auto">
				 <div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 매출 내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th rowspan="2">No.</th>
									<th colspan="2">담당사원정보</th>
									<th rowspan="2">거래처코드</th>
									<th rowspan="2">거래처명</th>
									<th rowspan="2">품목코드</th>
									<th rowspan="2">품목명</th>
									<th rowspan="2">단위</th>
									<th rowspan="2">수량</th>
									<th rowspan="2">단가</th>
									<th rowspan="2">수주금액</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주일</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">전표번호</th>
									<th rowspan="2">세금계산서번호</th>
									<th rowspan="2">비고</th>
								</tr>
								<tr>
									<th>사원번호</th>
									<th>사원명</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th rowspan="2">No.</th>
									<th colspan="2">담당사원정보</th>
									<th rowspan="2">거래처코드</th>
									<th rowspan="2">거래처명</th>
									<th rowspan="2">품목코드</th>
									<th rowspan="2">품목명</th>
									<th rowspan="2">단위</th>
									<th rowspan="2">수량</th>
									<th rowspan="2">단가</th>
									<th rowspan="2">수주금액</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주일</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">전표번호</th>
									<th rowspan="2">세금계산서번호</th>
									<th rowspan="2">비고</th>
								</tr>
								<tr>
									<th>사원번호</th>
									<th>사원명</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td class="ct"><input type="checkbox" id="checkbox"/> 1</td>
									<td>Tiger</td>
									<td>System</td>
									<td>Edinburgh</td>
									<td>61</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
									<td>Tiger</td>
									<td>System</td>
									<td>Edinburgh</td>
									<td>61090000</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>-->
	<script type="text/javascript">
	 
		function getParentText() {
			var listVar = document.forms.good;
			window.close();
		}
	</script> 

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="./js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="./assets/demo/chart-area-demo.js"></script>
	<script src="./assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="./js/datatables-simple-demo.js"></script>

</body>
</html>