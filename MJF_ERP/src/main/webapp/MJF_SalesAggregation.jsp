<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<%
Connection conn0 = null;
Statement stmt0 = null;
PreparedStatement pstmt0 = null;
ResultSet rs0 = null;
int columnCount0 = 0;
int rowCount0 = 0;
DecimalFormat decFormat = new DecimalFormat("###,###");
String startdate = request.getParameter("startdate");
/*if(startdate!=null){
	startdate = startdate.replaceAll("-", "");
}*/
String enddate = request.getParameter("enddate");
/*if(enddate!=null){
	enddate = enddate.replaceAll("-", "");
}*/
String tab = request.getParameter("tab");
String search = request.getParameter("search");

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

button+button {
	margin-right: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h1>매출조회</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<ul class="tabs">
					<li id="li_tab-1" class="tab-link current" data-tab="tab-1">전체</li>
					<li id="li_tab-2" class="tab-link" data-tab="tab-2">거래처별</li>
					<li id="li_tab-3" class="tab-link" data-tab="tab-3">영업사원별</li>
					<li id="li_tab-4" class="tab-link" data-tab="tab-4">품목별</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>

						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 매출 내역
							</div>
							<div class="card-body">
								<div>
									<label>매출 기간</label>&nbsp;&nbsp;&nbsp;<input type="date"
										id="startdate" min="2022-10-25" />&nbsp;~&nbsp;<input
										type="date" id="enddate" min="2022-10-25" />
									<button class="btn-set" style="border:none;border-radius:3px;"type="button" onclick="chdate('tab-1');" value="조회">조회</button>
								</div>
								<hr />
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>

											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th nowrap>사원번호</th>
											<th nowrap>사원명</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>

											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th>사원번호</th>
											<th>사원명</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											String sql = "";
											if (startdate != null && enddate != null) {
												sql = "SELECT * from MJFdb.sales_table where sales_date between '" + startdate + "' and '" + enddate
												+ "' order by order_num ,sales_date;";

											} else {
												sql = "SELECT * from MJFdb.sales_table order by order_num ,sales_date;";
											}

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

												if (sales_rs[b][21] == null) {
											sales_rs[b][21] = "";
												}
												if ((b - 1 >= 0) && (sales_rs[b][20].equals(sales_rs[b - 1][20]))) {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"> </td>");
											out.println("<td nowrap class=\"ct\">" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
												} else {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][20]
													+ "'></td>");
											out.println("<td nowrap class=\"ct\">" + (num) + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][16] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");

											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											num++;
												}

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
								<%
								//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
								out.println(
										"<div style=\"margin-top:20px\"><button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

								out.println("세금계산서 인쇄</button>");
								out.println(
										"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
								out.println("거래명세서 인쇄</button></div>");
								%>
							</div>
						</div>
					</form>
				</div>

				<div id="tab-2" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 거래처별 매출 내역
							</div>
							<div class="card-body">
								<div>
								<div>
								</div>
									<label>매출 기간</label>&nbsp;&nbsp;&nbsp;<input type="date"
										id="startdate2" min="2022-10-25" />&nbsp;~&nbsp;<input
										type="date" id="enddate2" min="2022-10-25" />
									<button class="btn-set" style="border:none;border-radius:3px;" type="button" onclick="chdate('tab-2');" value="조회">조회</button>
									<%
									try {
										
										String sql5 = "select account_name from MJFdb.account_table";

										stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rs0 = stmt0.executeQuery(sql5);
										ResultSetMetaData rsmd0 = rs0.getMetaData();
										//columnCount0 = rsmd0.getColumnCount();
										rs0.last(); //커서의 위치를 제일 뒤로 이동
										rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
										String account_rs[] = new String[rowCount0];
										int i = 0;
										//int j = 0;
										rs0.first();
										for (i = 0; i < rowCount0; i++) {
											account_rs[i]=rs0.getString(1);										
											rs0.next();
										}
										//int num = 1;
										out.println("<label for=\"accountname\">&nbsp&nbsp&nbsp업체명</label>");
										out.println("<input type=\"text\" list=\"account_list\" id=\"account\" placeholder=\"전체\" onChange=\"search_ch('tab-2')\"/>");
										out.println("<datalist id =\"account_list\">");
										out.println("<option value=\"전체\" />");
										for (int b = 0; b < rowCount0; b++) {
											out.println("<option value=\""+account_rs[b]+"\" />");
										}
										out.println("</datalist>");

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
								</div>
								<hr />
								<table id="datatablesSimple2">
									<thead>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											
											
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th nowrap>사원번호</th>
											<th nowrap>사원명</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											
											
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th>사원번호</th>
											<th>사원명</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											
											String sql2 = "";
											if (startdate != null && enddate != null) {
												if(search!=null){
													sql2 = "SELECT * from MJFdb.sales_table where account_name='"+search+"'AND sales_date between '" + startdate + "' and '" + enddate
															+ "' order by account_name, order_num,sales_date;";
												}else{
													sql2 = "SELECT * from MJFdb.sales_table where sales_date between '" + startdate + "' and '" + enddate
															+ "' order by account_name,order_num ,sales_date;";
												}

											} else {
												if(search!=null){
													sql2 = "SELECT * from MJFdb.sales_table where account_name='"+search+"' order by account_name,order_num ,sales_date;";
												}else{
													sql2 = "SELECT * from MJFdb.sales_table order by account_name,order_num ,sales_date;";
												}
											}

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql2);
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
											int total_acc=0;
											for (int b = 0; b < rowCount0; b++) {
												total_acc=total_acc+Integer.parseInt(sales_rs[b][15]);

												if (sales_rs[b][21] == null) {
											sales_rs[b][21] = "";
												}
												if ((b - 1 >= 0) && (sales_rs[b][20].equals(sales_rs[b - 1][20]))) {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"> </td>");
											out.println("<td nowrap class=\"ct\">" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}											out.println("</tr>");
											
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][6].equals(sales_rs[b + 1][6]))){
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + decFormat.format(total_acc) + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
												} else {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][20]
													+ "'></td>");
											out.println("<td nowrap class=\"ct\">" + (num) + "</td>");
											
											
											out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][6].equals(sales_rs[b + 1][6]))){
												
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + total_acc + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
											num++;
												}

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
								<%
								//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
								out.println(
										"<div style=\"margin-top:20px\"><button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

								out.println("세금계산서 인쇄</button>");
								out.println(
										"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
								out.println("거래명세서 인쇄</button></div>");
								%>
							</div>
						</div>
					</form>
				</div>
				<div id="tab-3" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 영업사원별 매출 내역
							</div>
							<div class="card-body">
								<div>
									<label>매출 기간</label>&nbsp;&nbsp;&nbsp;<input type="date"
										id="startdate3" min="2022-10-25" />&nbsp;~&nbsp;<input
										type="date" id="enddate3" min="2022-10-25" />
									<button class="btn-set" style="border:none;border-radius:3px;" type="button" onclick="chdate('tab-3');" value="조회">조회</button>
									<%
									try {
										String sql6 = "select member_name from MJFdb.member_table where resigndate is null";

										stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rs0 = stmt0.executeQuery(sql6);
										ResultSetMetaData rsmd0 = rs0.getMetaData();
										//columnCount0 = rsmd0.getColumnCount();
										rs0.last(); //커서의 위치를 제일 뒤로 이동
										rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
										String member_rs[] = new String[rowCount0];
										int i = 0;
										//int j = 0;
										rs0.first();
										for (i = 0; i < rowCount0; i++) {
											member_rs[i]=rs0.getString(1);										
											rs0.next();
										}
										//int num = 1;
										out.println("<label for=\"accountname\">&nbsp&nbsp&nbsp사원명</label>");
										out.println("<input type=\"text\" list=\"member_list\" id=\"member\" placeholder=\"전체\" onChange=\"search_ch('tab-3')\"/>");
										out.println("<datalist id =\"member_list\">");
										out.println("<option value=\"전체\" />");
										for (int b = 0; b < rowCount0; b++) {
											out.println("<option value=\""+member_rs[b]+"\" />");
										}
										out.println("</datalist>");

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
								</div>
								<hr />
								<table id="datatablesSimple3">
									<thead>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th nowrap>사원번호</th>
											<th nowrap>사원명</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th>사원번호</th>
											<th>사원명</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											String sql3 = "";
											if (startdate != null && enddate != null) {
												if(search!=null){
													sql3 = "SELECT * from MJFdb.sales_table where member_name='"+search+"'AND sales_date between '" + startdate + "' and '" + enddate
															+ "' order by member_name,order_num ,sales_date;";
												}else{
													sql3 = "SELECT * from MJFdb.sales_table where sales_date between '" + startdate + "' and '" + enddate
															+ "' order by member_name,order_num ,sales_date;";
												}
												

											} else {
												if(search!=null){
													sql3 = "SELECT * from MJFdb.sales_table where member_name='"+search+"'AND order by member_name,order_num ,sales_date;";
												}else{
													sql3 = "SELECT * from MJFdb.sales_table order by member_name,order_num ,sales_date;";
												}
												
											}
											

											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql3);
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
											int total_acc=0;
											for (int b = 0; b < rowCount0; b++) {
												total_acc=total_acc+Integer.parseInt(sales_rs[b][15]);
												if (sales_rs[b][21] == null) {
											sales_rs[b][21] = "";
												}
												if ((b - 1 >= 0) && (sales_rs[b][20].equals(sales_rs[b - 1][20]))) {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"> </td>");
											out.println("<td nowrap class=\"ct\">" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + " " + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][17].equals(sales_rs[b + 1][17]))){
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + decFormat.format(total_acc) + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
												} else {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][20]
													+ "'></td>");
											out.println("<td nowrap class=\"ct\">" + (num) + "</td>");
											out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][17].equals(sales_rs[b + 1][17]))){
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + decFormat.format(total_acc) + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
											num++;
												}

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
								<%
								//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
								out.println(
										"<div style=\"margin-top:20px\"><button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

								out.println("세금계산서 인쇄</button>");
								out.println(
										"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
								out.println("거래명세서 인쇄</button></div>");
								%>
							</div>
						</div>
					</form>
				</div>
				<div id="tab-4" class="tab-content">
					<form action="bill_loadpage.jsp" method="get"
						class="validation-form" novalidate>
						<div
							style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
							class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 품목별 매출 내역
							</div>
							<div class="card-body">
								<div>
									<label>매출 기간</label>&nbsp;&nbsp;&nbsp;<input type="date"
										id="startdate4" min="2022-10-25" />&nbsp;~&nbsp;<input
										type="date" id="enddate4" min="2022-10-25" />
									<button class="btn-set" style="border:none;border-radius:3px;" type="button" onclick="chdate('tab-4');" value="조회">조회</button>
									<%
									try {
										String sql7 = "select product_name from MJFdb.product_table";

										stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rs0 = stmt0.executeQuery(sql7);
										ResultSetMetaData rsmd0 = rs0.getMetaData();
										//columnCount0 = rsmd0.getColumnCount();
										rs0.last(); //커서의 위치를 제일 뒤로 이동
										rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
										String product_rs[] = new String[rowCount0];
										int i = 0;
										//int j = 0;
										rs0.first();
										for (i = 0; i < rowCount0; i++) {
											product_rs[i]=rs0.getString(1);										
											rs0.next();
										}
										//int num = 1;
									
										out.println("<label for=\"accountname\">&nbsp&nbsp&nbsp품목명</label>");
										out.println("<input type=\"text\" list=\"product_list\" id=\"product\" placeholder=\"전체\" onChange=\"search_ch('tab-4')\"/>");
										out.println("<datalist id =\"product_list\">");
										out.println("<option value=\"전체\" />");
										for (int b = 0; b < rowCount0; b++) {
											out.println("<option value=\""+product_rs[b]+"\" />");
										}
										out.println("</datalist>");

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
								</div>
								<hr />
								<table id="datatablesSimple4">
									<thead>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th nowrap>사원번호</th>
											<th nowrap>사원명</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th nowrap rowspan="2">선택</th>
											<th nowrap rowspan="2">No.</th>
											<th nowrap rowspan="2">품목코드</th>
											<th nowrap rowspan="2">품목명</th>
											<th nowrap rowspan="2">단위</th>
											<th nowrap rowspan="2">수량</th>
											<th nowrap rowspan="2">단가</th>
											<th nowrap colspan="2">담당사원정보</th>
											<th nowrap rowspan="2">거래처코드</th>
											<th nowrap rowspan="2">거래처명</th>
											
											<th nowrap rowspan="2">수주일</th>
											<th nowrap rowspan="2">수주번호</th>
											<th nowrap rowspan="2">수주금액</th>
											<th nowrap rowspan="2">매출일</th>
											<th nowrap rowspan="2">매출액</th>
											<th nowrap rowspan="2">거래명세서</th>
											<th nowrap rowspan="2">세금계산서번호</th>
											<th nowrap rowspan="2">비고</th>
										</tr>
										<tr>
											<th>사원번호</th>
											<th>사원명</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											String sql4 = "";
											if (startdate != null && enddate != null) {
												if(search!=null){
													sql4 = "SELECT * from MJFdb.sales_table where product_name='"+search+"'AND sales_date between '" + startdate + "' and '" + enddate
															+ "' order by product_name ,sales_date,order_num;";
												}else{
													sql4 = "SELECT * from MJFdb.sales_table where sales_date between '" + startdate + "' and '" + enddate
															+ "' order by product_name ,sales_date,order_num;";
												}
												

											} else {
												if(search!=null){
													sql4 = "SELECT * from MJFdb.sales_table where product_name='"+search+"'AND order by product_name ,sales_date,order_num;";
												}else{
													sql4 = "SELECT * from MJFdb.sales_table order by product_name,sales_date,order_num;";
												}
												
											}

								
											stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs0 = stmt0.executeQuery(sql4);
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
											int total_acc=0;
											for (int b = 0; b < rowCount0; b++) {
												total_acc=total_acc+Integer.parseInt(sales_rs[b][15]);
												if (sales_rs[b][21] == null) {
											sales_rs[b][21] = "";
												}
												if ((b - 1 >= 0) && (sales_rs[b][7].equals(sales_rs[b - 1][7]))) {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][20]
													+ "'></td>");
											out.println("<td nowrap class=\"ct\">" + " " + "</td>");
											out.println("<td nowrap>" + "" + "</td>");
											out.println("<td nowrap>" + "" + "</td>");
											out.println("<td nowrap>" + "" + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
											
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][7].equals(sales_rs[b + 1][7]))){
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + decFormat.format(total_acc) + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
												} else {
											out.println("<tr>");
											out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][20]
													+ "'></td>");
											out.println("<td nowrap class=\"ct\">" + (num) + "</td>");
											out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
											
											out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
											out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
											//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("거래명세서 인쇄</button></td>");
											out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
											//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
											//out.println("세금계산서 인쇄</button></td>");
											if (sales_rs[b][22] == null) {
												out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
											} else {
												out.println("<td nowrap>" + sales_rs[b][21] + " / " + sales_rs[b][22] + "</td>");
											}
											out.println("</tr>");
											if(b==rowCount0-1 || (b+1 < rowCount0 && !sales_rs[b][7].equals(sales_rs[b + 1][7]))){
												out.println("<tr>");
												out.println("<td colspan=\"2\" nowrap align=\"center\">총액</td>");
												out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
												out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
												out.println("<td colspan=\"15\" nowrap>" + decFormat.format(total_acc) + "원</td>");
												out.println("</tr>");
												total_acc=0;
											}
											num++;
												}

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
								<%
								//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
								out.println(
										"<div style=\"margin-top:20px\"><button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

								out.println("세금계산서 인쇄</button>");
								out.println(
										"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
								out.println("거래명세서 인쇄</button></div>");
								%>
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
			//alert(tab_id);
			window.location.href = './MJF_Layout.jsp?pageChange=MJF_SalesAggregation.jsp?tab='+tab_id;			
			/*$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			$(this).addClass('current');
			$("#" + tab_id).addClass('current');*/
		})
	});
	var tab = "<%=tab%>";
	$(document).ready(function() {
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$("#li_"+tab).addClass('current');
		$("#" + tab).addClass('current');
	});

	
	var sd, ed;
	sd="<%=startdate%>";
	ed="<%=enddate%>";
	search="<%=search%>";
	if (sd !== "null" && ed !== "null") {
		//alert(sd);
		if (tab == 'tab-1') {
			document.getElementById("startdate").value = sd;
			document.getElementById("enddate").value = ed;
		} else if (tab == 'tab-2') {
			document.getElementById("startdate2").value = sd;
			document.getElementById("enddate2").value = ed;
			document.getElementById("account").value = search;
		} else if (tab == 'tab-3') {
			document.getElementById("startdate3").value = sd;
			document.getElementById("enddate3").value = ed;
			document.getElementById("member").value = search;
		} else if (tab == 'tab-4') {
			document.getElementById("startdate4").value = sd;
			document.getElementById("enddate4").value = ed;
			document.getElementById("product").value = search;
		}

	} else {
		document.getElementById("startdate").valueAsDate = new Date(
				"2022-10-17");
		document.getElementById("enddate").valueAsDate = new Date();
		document.getElementById("startdate2").valueAsDate = new Date(
				"2022-10-17");
		document.getElementById("enddate2").valueAsDate = new Date();
		document.getElementById("startdate3").valueAsDate = new Date(
				"2022-10-17");
		document.getElementById("enddate3").valueAsDate = new Date();
		document.getElementById("startdate4").valueAsDate = new Date(
				"2022-10-17");
		document.getElementById("enddate4").valueAsDate = new Date();
	}

	function chdate(tabC) {
		if (tabC == 'tab-1') {
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3;
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabC); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs
					.setAttribute('value',
							document.getElementById("enddate").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		} else if (tabC == 'tab-2') {
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3;
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabC); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate2").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value',
					document.getElementById("enddate2").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		} else if (tabC == 'tab-3') {
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3;
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabC); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate3").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value',
					document.getElementById("enddate3").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		} else if (tabC == 'tab-4') {
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3;
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabC); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate4").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value',
					document.getElementById("enddate4").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		}

	}
	
	function search_ch(tabch){
		//alert("hi");
		if(tabch=='tab-2'){
			//alert("hi");
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3, objs4;
			objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs4.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs4.setAttribute('name', 'search'); // 객체이름
			objs4.setAttribute('value', document.getElementById("account").value); //객체값
			form.appendChild(objs4);
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabch); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate2").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value', document.getElementById("enddate2").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		}else if(tabch=='tab-3'){
			//alert("hi");
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3, objs4;
			objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs4.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs4.setAttribute('name', 'search'); // 객체이름
			objs4.setAttribute('value', document.getElementById("member").value); //객체값
			form.appendChild(objs4);
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabch); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate3").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value', document.getElementById("enddate3").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		}else if(tabch=='tab-4'){
			//alert("hi");
			var form = document.createElement('form'); // 폼객체 생성
			var objs, objs2, objs3, objs4;
			objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs4.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs4.setAttribute('name', 'search'); // 객체이름
			objs4.setAttribute('value', document.getElementById("product").value); //객체값
			form.appendChild(objs4);
			objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs3.setAttribute('name', 'tab'); // 객체이름
			objs3.setAttribute('value', tabch); //객체값
			form.appendChild(objs3);
			objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs2.setAttribute('name', 'startdate'); // 객체이름
			objs2.setAttribute('value',
					document.getElementById("startdate4").value); //객체값
			form.appendChild(objs2);
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'enddate'); // 객체이름
			objs.setAttribute('value', document.getElementById("enddate4").value); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'get'); //get,post 가능
			form.setAttribute('action', "date_process.jsp"); //보내는 url
			document.body.appendChild(form);
			form.submit();
		}
		
	}
	
</script>
</html>