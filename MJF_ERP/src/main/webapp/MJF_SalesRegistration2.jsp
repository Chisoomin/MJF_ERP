<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*, jxl.*"%>
<%!static int panum = 0;
	static String sujucode = "";
	static int columnCount = 0;
	static int rowCount = 0;
	//제이쿼리로 텍스트 변하는거 감지해서 처음 테이블에 삽입한 뒤 버튼 누르면 변환되게 수정%>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

//String allgab= request.getParameter("sujunum");
if (request.getParameter("sujunum") == null || request.getParameter("sujunum").equals("")) {

} else {
	if (!request.getParameter("sujunum").equals(sujucode)) {
		panum = 0;
	}
	if (request.getParameter("sujunum") == null) {
		panum = 0;
		sujucode = "";
	}
	panum = 0;
	sujucode = "";
	sujucode = request.getParameter("sujunum");
	columnCount = Integer.parseInt(request.getParameter("col"));
	rowCount = Integer.parseInt(request.getParameter("row"));

}
String order_rs[][] = new String[rowCount][columnCount];

//out.println("<script>alert('"+name+"');</script>");
System.out.println(sujucode + panum + "," + columnCount + "," + rowCount);
//String sujunum = "12";

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

if (sujucode != null) {
	try {
		String sql = "SELECT * from MJFdb.order_table where order_num='" + sujucode + "'";
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(sql);

		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		columnCount = rsmd.getColumnCount();
		rs.last(); //커서의 위치를 제일 뒤로 이동
		rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
		//order_rs = new String[rowCount][columnCount];
		int i = 0;
		int j = 0;
		rs.first();
		for (i = 0; i < rowCount; i++) {
	for (j = 0; j < columnCount; j++) {
		order_rs[i][j] = rs.getString((j + 1));
	}
	rs.next();
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
}
%>

<!DOCTYPE html>
<html>
<head>
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
	box-shadow: rgba(0, 0, 0, 0.15) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04)
		0px 10px 10px -5px;
	border-radius: 10px;

	/*background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
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
	margin-top: -40px;
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

.btn-set2 {
	color: #fff;
	background-color: #393229;
	border-color: #393229;
}

.white {
	color: #fff;
}

.ct {
	text-align: center;
	vertical-align: middle;
}

.mar {
	margin-bottom: 20px;
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
	vertical-align: middle;
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

.img-button {
	background-color: #fff;
	border: none;
	width: 40px;
	height: 40px;
	cursor: pointer;
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
	<!-- <h2 class="mb-3 white">매출등록 페이지</h2> -->
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h1>매출등록</h1>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<script type="text/javascript">
					//var popupX = (document.body.offsetWidth / 2) - (document.body.offsetWidth / 4);
					// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
					
					//var popupY= (window.screen.height / 2) - (window.screen.height / 4);
					// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
					function popup(url,width,height){
						
						var sst = window.open(url,'popwin','top='+((screen.availHeight - height)/2 - 40) +', left='+(screen.availWidth - width)/2+', width='+width+', height='+height+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
					  	if(sst){
					    	sst.focus();
					  	}
					  	
					}
					
					
				</script>
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">매출</li>
					<li class="tab-link" data-tab="tab-2">반품</li>
				</ul>

				<div style="padding: 32px;" id="tab-1" class="tab-content current">
					<!-- <button class="btn btn-set2 btn-lg btn-block mar"
					onclick="window.open('order_loading.jsp', 'window_name', 'width=window.screen.width /2, height=window.screen.height /2, left=window.screen.width/4, status=no, scrollbars=yes');">수주
					불러오기</button> -->
					<div style="white-space : nowrap;">
						<button class="btn btn-set2 btn-lg col-md-6 mar"
							onclick="popup('order_loading.jsp',window.screen.width /2,window.screen.height)">수주
							불러오기</button>
						<button class="btn btn-set2 btn-lg col-md-6 mar"
							onclick="popup('ban_loading.jsp',window.screen.width /2,window.screen.height)">반품
							목록 불러오기</button>
					</div>
					<!--<button class="btn btn-set2 btn-lg btn-block mar"
					onclick="popup('bill.jsp',window.screen.width /2,window.screen.height)">수주
					불러오기</button>-->


					<form class="validation-form" action="process_sales.jsp" novalidate>
						<div class="row">
							<div class="col-md-4 mb-3">
								<label for="name">수주번호</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='ordernumber' id='ordernumber' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='ordernumber' id='ordernumber' placeholder='' value='"
									+ order_rs[0][1] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label id="chdate" for="nickname">날짜</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderda' id='orderda' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderda' id='orderda' placeholder='' value='"
									+ order_rs[0][2] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="nickname">매출날짜</label> <input type="date"
									class="form-control" name="salesdate" id="salesdate"
									placeholder="" value="" required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 mb-3">
								<label for="name">거래처명</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderacc' id='orderacc' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderacc' id='orderacc' placeholder='' value='"
									+ order_rs[0][5] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="nickname">사업자등록번호</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderaccnum' id='orderaccnum' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderaccnum' id='orderaccnum' placeholder='' value='"
									+ order_rs[0][4] + "'  required readonly/>");
								}
								%>
							</div>
						</div>
						<!--  <div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">품목코드</label> <input type="text"
								class="form-control" name="procode" id="procode" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">품목명</label> <input type="text"
								class="form-control" name="proname" id="proname" placeholder=""
								value="" required readonly>
						</div>

					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="name">단위</label> <input type="text"
								class="form-control" name="orderme" id="orderme" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수량</label> <input type="text"
								class="form-control" name="orderqu" id="orderqu" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="name">단가</label> <input type="number"
								class="form-control" name="orderpp" id="orderpp" placeholder=""
								value="" onchange="changefunc()" required>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수주금액</label> <input type="text"
								class="form-control" name="ordersp" id="ordersp" placeholder=""
								value="" required readonly>
						</div>

					</div>-->

						<div class="row">
							<div class="col">
								<label for="orderProduct">품목</label>
								<!--  <button onclick="imgbtn()" id="img" class="img-button">
								<img src="./image/re2.png">
							</button>
							&nbsp;&nbsp;&nbsp;-->
								<button
									style="border: none; background-color: rgba(0, 0, 0, 0);"
									onclick="details()" id="detail"></button>

								<table class="table.txc-table tg orderTable" id="orderlist">
									<thead>
										<tr>
											<th class="tg-baqh" rowspan=2>전체선택 <input
												type="checkbox" name="ch" value="전체선택"
												onclick="selectAll(this)" id="ch_main"
												class="table-input-style"></th>
											<!--  <th class="tg-baqh" rowspan=2>수주번호</th>-->
											<th class="tg-baqh" colspan=2>담당자정보</th>
											<th class="tg-baqh" rowspan=2>품목코드</th>
											<th class="tg-baqh" rowspan=2>품목이름</th>
											<th class="tg-baqh" rowspan=2>색상</th>
											<th class="tg-baqh" rowspan=2>단위</th>
											<th class="tg-baqh" rowspan=2>수량</th>
											<th class="tg-baqh" rowspan=2>단가</th>
											<th class="tg-baqh" rowspan=2>공급가액</th>
											<th class="tg-baqh" rowspan=2>부가세</th>
											<th class="tg-baqh" rowspan=2>총액</th>
											<th class="tg-baqh" rowspan=2>비고</th>
										</tr>
										<tr>
											<th class="tg-baqh">담당자이름</th>
											<th class="tg-baqh">사원번호</th>

										</tr>

									</thead>

									<tbody>
									</tbody>

								</table>
							</div>
						</div>



						<div class="mb-4"></div>
						<button class="btn btn-set btn-lg btn-block" type="submit">매출
							등록</button>
					</form>
				</div>












				<div style="padding: 32px;" id="tab-2" class="tab-content">
					<button class="btn btn-set2 btn-lg btn-block mar"
						onclick="popup('sales_loading.jsp',window.screen.width /2,window.screen.height)">매출
						불러오기</button>
					<!--<button class="btn btn-set2 btn-lg btn-block mar"
					onclick="popup('bill.jsp',window.screen.width /2,window.screen.height)">수주
					불러오기</button>-->


					<form class="validation-form" action="process_sales.jsp" novalidate>
						<div class="row">
							<div class="col-md-4 mb-3">
								<label for="name">수주번호</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='ordernumber_ban' id='ordernumber_ban' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='ordernumber_ban' id='ordernumber_ban' placeholder='' value='"
									+ order_rs[0][1] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="nickname">매출날짜</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderda_ban' id='orderda_ban' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderda_ban' id='orderda_ban' placeholder='' value='"
									+ order_rs[0][2] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="nickname">반품날짜</label> <input type="date"
									class="form-control" name="salesdate_ban" id="salesdate_ban"
									placeholder="" value="" required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 mb-3">
								<label for="name">거래처명</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderacc_ban' id='orderacc_ban' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderacc_ban' id='orderacc_ban' placeholder='' value='"
									+ order_rs[0][5] + "'  required readonly/>");
								}
								%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="nickname">사업자등록번호</label>
								<%
								if (request.getParameter("sujunum") == null) {
									out.println(
									"<input type='text' class='form-control' name='orderaccnum_ban' id='orderaccnum_ban' placeholder='' value=''  required readonly/>");
								} else {
									out.println("<input type='text' class='form-control' name='orderaccnum_ban' id='orderaccnum_ban' placeholder='' value='"
									+ order_rs[0][4] + "'  required readonly/>");
								}
								%>
							</div>
						</div>

						<!--  <div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">품목코드</label> <input type="text"
								class="form-control" name="procode" id="procode" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">품목명</label> <input type="text"
								class="form-control" name="proname" id="proname" placeholder=""
								value="" required readonly>
						</div>

					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="name">단위</label> <input type="text"
								class="form-control" name="orderme" id="orderme" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수량</label> <input type="text"
								class="form-control" name="orderqu" id="orderqu" placeholder=""
								value="" required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="name">단가</label> <input type="number"
								class="form-control" name="orderpp" id="orderpp" placeholder=""
								value="" onchange="changefunc()" required>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수주금액</label> <input type="text"
								class="form-control" name="ordersp" id="ordersp" placeholder=""
								value="" required readonly>
						</div>

					</div>-->

						<div class="row">
							<div class="col">
								<label for="orderProduct">매출품목</label>
								<!--  <button onclick="imgbtn()" id="img" class="img-button">
								<img src="./image/re2.png">
							</button>
							&nbsp;&nbsp;&nbsp;-->
								<button
									style="border: none; background-color: rgba(0, 0, 0, 0);"
									onclick="details()" id="detail"></button>

								<table class="table.txc-table tg orderTable" id="orderlist_ban">
									<thead>
										<tr>
											<th class="tg-baqh" rowspan=2>전체선택 <input
												type="checkbox" name="ch_ban" value="전체선택"
												onclick="selectAll(this)" id="ch_main_ban"
												class="table-input-style"></th>
											<!--  <th class="tg-baqh" rowspan=2>수주번호</th>-->
											<th class="tg-baqh" colspan=2>담당자정보</th>
											<th class="tg-baqh" rowspan=2>품목코드</th>
											<th class="tg-baqh" rowspan=2>품목이름</th>
											<th class="tg-baqh" rowspan=2>색상</th>
											<th class="tg-baqh" rowspan=2>단위</th>
											<th class="tg-baqh" rowspan=2>수량</th>
											<th class="tg-baqh" rowspan=2>단가</th>
											<th class="tg-baqh" rowspan=2>공급가액</th>
											<th class="tg-baqh" rowspan=2>부가세</th>
											<th class="tg-baqh" rowspan=2>총액</th>
											<th class="tg-baqh" rowspan=2>비고</th>
										</tr>
										<tr>
											<th class="tg-baqh">담당자이름</th>
											<th class="tg-baqh">사원번호</th>

										</tr>

									</thead>

									<tbody>
									</tbody>

								</table>
							</div>
						</div>



						<div class="mb-4"></div>
						<button class="btn btn-set btn-lg btn-block" type="submit">반품
							등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="container">
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
									<th rowspan="2">수주일</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주금액</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">매출액</th>																		
									<th rowspan="2">거래명세서</th>
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
									<th rowspan="2">수주일</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주금액</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">매출액</th>																		
									<th rowspan="2">거래명세서</th>
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
									<td class="ct"><input type="checkbox" id="checkbox" /> 1</td>
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
	<%@ include file="./chart.jsp"%>
	<!-- <script
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
	<script src="./js/datatables-simple-demo.js"></script> -->
	<script>
	/*var newValue;
    // 모든 텍스트의 변경에 반응합니다.
    $("#proprice0").on("propertychange change keyup paste input", function() {
       
       // 현재 변경된 데이터 셋팅
       newValue = $(this).val();
       
       // 현재 실시간 데이터 표츌
       alert("텍스트 :: " + newValue);
    });*/
	
		let static_value  = (function static_func(value) {
			   let i = value;
			   return function() {
			      return ++i; 
			   }
			})(0);
		
		function details(){
			
			
		}
		
		function imgbtn(){
			var sujunum = document.getElementById('detail').value;
			var sc = '<%=sujucode%>';
			var tnt = <%=panum%>;
			if(sujunum==sc&&sc!=""){
				var form = document.createElement('form'); // 폼객체 생성
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'ordernumber'); // 객체이름
				objs.setAttribute('value',  sc); //객체값
				form.appendChild(objs);
				form.setAttribute('method', 'post'); //get,post 가능
				form.setAttribute('action', "detail_process.jsp"); //보내는 url
				document.body.appendChild(form);
				form.submit();
			}else if(sujunum!=sc){
				var form = document.createElement('form'); // 폼객체 생성
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'ordernumber'); // 객체이름
				objs.setAttribute('value',  sujunum); //객체값
				form.appendChild(objs);
				form.setAttribute('method', 'post'); //get,post 가능
				form.setAttribute('action', "detail_process.jsp"); //보내는 url
				document.body.appendChild(form);
				form.submit();
			}
			
			
		}
		
		function chgprice(obj){			
			var id = obj;
			//alert(id);
			
			let found = id.match(/\d+/g);
			document.getElementById("orsup"+found).value = document.getElementById("prosu"+found).value*document.getElementById("proprice"+found).value;
			document.getElementById("orvat"+found).value = parseInt((document.getElementById("prosu"+found).value*document.getElementById("proprice"+found).value)/10);
			document.getElementById("orall"+found).value = (document.getElementById("prosu"+found).value*document.getElementById("proprice"+found).value) + parseInt(((document.getElementById("prosu"+found).value*document.getElementById("proprice"+found).value)/10));

			
			//alert("갸아아아ㅏ앙");
		}
		
		function chgprice2(obj){			
			var id = obj;
			//alert(id);
			
			let found = id.match(/\d+/g);
			document.getElementById("orsup_ban"+found).value = document.getElementById("prosu_ban"+found).value*document.getElementById("proprice_ban"+found).value;
			document.getElementById("orvat_ban"+found).value = parseInt((document.getElementById("prosu_ban"+found).value*document.getElementById("proprice_ban"+found).value)/10);
			document.getElementById("orall_ban"+found).value = (document.getElementById("prosu_ban"+found).value*document.getElementById("proprice_ban"+found).value) + parseInt(((document.getElementById("prosu_ban"+found).value*document.getElementById("proprice_ban"+found).value)/10));

			
			//alert("갸아아아ㅏ앙");
		}
		
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName('ch');
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			}
		
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName('ch_ban');
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
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
		window.onload=function(){
			//location.reload();
		}
		
		
  </script>
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
</body>
</html>