<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
<head>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
        // Note: Because this chart requires geocoding, you'll need mapsApiKey.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
          ['Country',   'Latitude'],
          
          ['Zimbabwe', -18]
        ]);

        var options = {
          region: 'KR', // Africa
          colorAxis: {colors: ['#00853f', 'black', '#e31b23']},
          backgroundColor: '#81d4fa',
          datalessRegionColor: '#f8bbd0',
          defaultColor: '#f5f5f5',
        };

        var chart = new google.visualization.GeoChart(document.getElementById('geochart-colors'));
        chart.draw(data, options);
      };
    </script>
<%
Connection conn0 = null;
Statement stmt0 = null;
PreparedStatement pstmt0 = null;
ResultSet rs0 = null;
int columnCount0 = 0;
int rowCount0 = 0;

String url0 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user0 = "MJFdbRoot";
String password0 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn0 = DriverManager.getConnection(url0, user0, password0);
%>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />
<script type="text/javascript" src="./js/jsm.js"></script>
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
	margin-top: 100px;
	margin-bottom: 80px;
	padding: 0px;
	/*	background: #fff; 
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);*/
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

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: pointer;
	border-top-right-radius: 10px;
}

ul.tabs li.current {
	background: #fff;
	color: #222;
}

.tab-content {
	display: none;
	background: #fff;
	padding: 12px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.tab-content.current {
	display: inherit;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h1>매출현황</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div  class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">전체</li>
					<li class="tab-link" data-tab="tab-2">거래처별</li>
					<li class="tab-link" data-tab="tab-3">영업사원별</li>
					<li class="tab-link" data-tab="tab-4">품목별</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<div><%@ include file="./chart_all.jsp"%></div>
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i>월별 매출 내역
							</div>
							<div class="card-body">
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th nowrap>월</th>
											<th nowrap>매출총액</th>
											
										</tr>
										
									</thead>
									<tfoot>
										<tr>
											<th nowrap>월</th>
											<th nowrap>매출총액</th>
											
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											DecimalFormat decFormat = new DecimalFormat("###,###");
											String sql = "SELECT MONTH(sales_date) AS Month, sum(supply_price)+sum(vat) AS Total from MJFdb.sales_table group by Month LIMIT 5";

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql);
											ResultSetMetaData rsmd0 = rs0.getMetaData();
											columnCount0 = rsmd0.getColumnCount();
											rs0.last(); //커서의 위치를 제일 뒤로 이동
											rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
											String sales_rs[][] = new String[rowCount0][columnCount0];
											int i = 0;
											int j = 0;
											rs0.first();
											for (i = 0; i < rowCount0; i++) {
												for (j = 0; j < columnCount0; j++) {
											sales_rs[i][j] = rs0.getString((j + 1));
												}
												rs0.next();
											}
											for (int b = 0; b < rowCount0; b++) {
												out.println("<tr>");
												out.println("<td nowrap>" + sales_rs[b][0] + "월</td>");
												out.println("<td nowrap>" + decFormat.format(Integer.parseInt(sales_rs[b][1])) + "원</td>");
												out.println("</tr>");

											

											}

										} catch (SQLException ex) {
											out.println("SQLException " + ex.getMessage());
										} finally {
											/*if (rs0 != null)
												rs0.close();
											if (stmt0 != null)
												stmt0.close();
											if (conn0 != null)
												conn0.close();*/
										}
										%>

									</tbody>
								</table>

							</div>
						</div>
					</form>

				</div>

				<div id="tab-2" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div><%@ include file="./chart_acnt.jsp"%></div>
						
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							
							<div class="card-header">
								<i class="fas fa-table me-1"></i>거래처별 매출 내역
							</div>
							
							<div class="card-body">
								<table id="datatablesSimple2">
									<thead>
										<tr>
											<th nowrap>거래처명</th>
											<th nowrap>거래처코드</th>
											<th nowrap>매출총액</th>
										</tr>
										
									</thead>
									<tfoot>
										<tr>
											<th nowrap>거래처명</th>
											<th nowrap>거래처코드</th>
											<th nowrap>매출총액</th>
										</tr>
										
									</tfoot>
									<tbody>
										<%
										try {
											DecimalFormat decFormat = new DecimalFormat("###,###");
											String sql = "select account_name, account_code, sum(total_price) from MJFdb.sales_table group by account_name order by sum(total_price) desc;";

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql);
											ResultSetMetaData rsmd0 = rs0.getMetaData();
											columnCount0 = rsmd0.getColumnCount();
											rs0.last(); //커서의 위치를 제일 뒤로 이동
											rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
											String sales_rs[][] = new String[rowCount0][columnCount0];
											int i = 0;
											int j = 0;
											rs0.first();
											for (i = 0; i < rowCount0; i++) {
												for (j = 0; j < columnCount0; j++) {
											sales_rs[i][j] = rs0.getString((j + 1));
												}
												rs0.next();
											}
											int num = 1;
											for (int b = 0; b < rowCount0; b++) {
												out.println("<tr>");
												out.println("<td nowrap>" + sales_rs[b][0] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
												out.println("<td nowrap>" + decFormat.format(Integer.parseInt(sales_rs[b][2])) + "원</td>");
												out.println("</tr>");

												
											}

										} catch (SQLException ex) {
											out.println("SQLException " + ex.getMessage());
										} finally {
											/*if (rs0 != null)
												rs0.close();
											if (stmt0 != null)
												stmt0.close();
											if (conn0 != null)
												conn0.close();*/
										}
										%>

									</tbody>
								</table>
								
							</div>
						</div>
					</form>
				</div>
				<div id="tab-3" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div><%@ include file="./chart_mem.jsp"%></div>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 영업사원별 매출 내역
							</div>
							<div class="card-body">
								<table id="datatablesSimple3">
									<thead>
										<tr>
											
											<th nowrap>영업사원명</th>
											<th nowrap>영업사원번호</th>
											<th nowrap>매출총액</th>
										</tr>
										
									</thead>
									<tfoot>
										<tr>
											
											<th nowrap>영업사원명</th>
											<th nowrap>영업사원번호</th>
											<th nowrap>매출총액</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											DecimalFormat decFormat = new DecimalFormat("###,###");

											String sql = "select member_name, member_id, sum(total_price) from MJFdb.sales_table group by member_id order by sum(total_price) desc;";

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql);
											ResultSetMetaData rsmd0 = rs0.getMetaData();
											columnCount0 = rsmd0.getColumnCount();
											rs0.last(); //커서의 위치를 제일 뒤로 이동
											rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
											String sales_rs[][] = new String[rowCount0][columnCount0];
											int i = 0;
											int j = 0;
											rs0.first();
											for (i = 0; i < rowCount0; i++) {
												for (j = 0; j < columnCount0; j++) {
											sales_rs[i][j] = rs0.getString((j + 1));
												}
												rs0.next();
											}
											int num = 1;
											for (int b = 0; b < rowCount0; b++) {
												out.println("<tr>");
												out.println("<td nowrap>" + sales_rs[b][0] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
												out.println("<td nowrap>" + decFormat.format(Integer.parseInt(sales_rs[b][2])) + "원</td>");
												out.println("</tr>");
											}

												
											

										} catch (SQLException ex) {
											out.println("SQLException " + ex.getMessage());
										} finally {
											/*if (rs0 != null)
												rs0.close();
											if (stmt0 != null)
												stmt0.close();
											if (conn0 != null)
												conn0.close();*/
										}
										%>

									</tbody>
								</table>
								
							</div>
						</div>
					</form>
				</div>
				<div id="tab-4" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div><%@ include file="./chart_pro.jsp"%></div>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i>상품별 매출 내역
							</div>
							<div class="card-body">
								<table id="datatablesSimple4">
									<thead>
										<tr>
											<th nowrap>품목명</th>
											<th nowrap>품목코드</th>
											<th nowrap>매출총액</th>
										</tr>
										
									</thead>
									<tfoot>
										<tr>
											<th nowrap>품목명</th>
											<th nowrap>품목코드</th>
											<th nowrap>매출총액</th>
										</tr>
										
									</tfoot>
									<tbody>
										<%
										try {
											DecimalFormat decFormat = new DecimalFormat("###,###");
											String sql = "select product_name, product_code, sum(total_price) from MJFdb.sales_table group by product_name order by sum(total_price) desc;";

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql);
											ResultSetMetaData rsmd0 = rs0.getMetaData();
											columnCount0 = rsmd0.getColumnCount();
											rs0.last(); //커서의 위치를 제일 뒤로 이동
											rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
											String sales_rs[][] = new String[rowCount0][columnCount0];
											int i = 0;
											int j = 0;
											rs0.first();
											for (i = 0; i < rowCount0; i++) {
												for (j = 0; j < columnCount0; j++) {
											sales_rs[i][j] = rs0.getString((j + 1));
												}
												rs0.next();
											}
											int num = 1;
											for (int b = 0; b < rowCount0; b++) {
												out.println("<tr>");
												out.println("<td nowrap>" + sales_rs[b][0] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
												out.println("<td nowrap>" + decFormat.format(Integer.parseInt(sales_rs[b][2])) + "원</td>");
												out.println("</tr>");

												
											}

										} catch (SQLException ex) {
											out.println("SQLException " + ex.getMessage());
										} finally {
											if (rs0 != null)
												rs0.close();
											if (stmt0 != null)
												stmt0.close();
											if (conn0 != null)
												conn0.close();
										}
										%>

									</tbody>
								</table>
								
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})
	});
</script>
</html>