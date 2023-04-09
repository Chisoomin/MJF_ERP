<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*, jxl.*" %>
<%! static int panum =0;
	static String sujucode="";
	static int columnCount=0;
	static int rowCount=0;
	//제이쿼리로 텍스트 변하는거 감지해서 처음 테이블에 삽입한 뒤 버튼 누르면 변환되게 수정
%>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;



//String allgab= request.getParameter("sujunum");
if(request.getParameter("sujunum")==null||request.getParameter("sujunum").equals("")){
	
}else{
	if(!request.getParameter("sujunum").equals(sujucode)){
		panum=0;
	}
	if(request.getParameter("sujunum")==null){
		panum=0;
		sujucode="";
	}
	panum=0;
	sujucode="";
	sujucode = request.getParameter("sujunum");
	columnCount = Integer.parseInt(request.getParameter("col"));
	rowCount = Integer.parseInt(request.getParameter("row"));

}
String order_rs[][]=new String[rowCount][columnCount];

//out.println("<script>alert('"+name+"');</script>");
System.out.println(sujucode+panum+","+columnCount+","+rowCount);
//String sujunum = "12";

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

if(sujucode!=null){
	try {
		String sql = "SELECT * from MJFdb.order_table where order_num='"+sujucode+"'";
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
        background-color:#fff;
        border: none;
        width: 40px;
        height: 40px;
        cursor: pointer;
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

				<!-- <button class="btn btn-set2 btn-lg btn-block mar"
					onclick="window.open('order_loading.jsp', 'window_name', 'width=window.screen.width /2, height=window.screen.height /2, left=window.screen.width/4, status=no, scrollbars=yes');">수주
					불러오기</button> -->
					<button class="btn btn-set2 btn-lg btn-block mar"
					onclick="popup('order_loading.jsp',window.screen.width /2,window.screen.height)">수주
					불러오기</button>
					<!--<button class="btn btn-set2 btn-lg btn-block mar"
					onclick="popup('bill.jsp',window.screen.width /2,window.screen.height)">수주
					불러오기</button>-->
					

				<form class="validation-form" action="process_sales.jsp" novalidate>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">수주번호</label> <% 
							if(request.getParameter("sujunum")==null){
								out.println("<input type='text' class='form-control' name='ordernumber' id='ordernumber' placeholder='' value=''  required readonly/>");
							}else{
								out.println("<input type='text' class='form-control' name='ordernumber' id='ordernumber' placeholder='' value='"+order_rs[0][1]+"'  required readonly/>");
							}
							%>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">수주날짜</label> <% 
							if(request.getParameter("sujunum")==null){
								out.println("<input type='text' class='form-control' name='orderda' id='orderda' placeholder='' value=''  required readonly/>");
							}else{
								out.println("<input type='text' class='form-control' name='orderda' id='orderda' placeholder='' value='"+order_rs[0][2]+"'  required readonly/>");
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
							<label for="name">거래처명</label><% 
							if(request.getParameter("sujunum")==null){
								out.println("<input type='text' class='form-control' name='orderacc' id='orderacc' placeholder='' value=''  required readonly/>");
							}else{
								out.println("<input type='text' class='form-control' name='orderacc' id='orderacc' placeholder='' value='"+order_rs[0][5]+"'  required readonly/>");
							}
							%> 
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">사업자등록번호</label><% 
							if(request.getParameter("sujunum")==null){
								out.println("<input type='text' class='form-control' name='orderaccnum' id='orderaccnum' placeholder='' value=''  required readonly/>");
							}else{
								out.println("<input type='text' class='form-control' name='orderaccnum' id='orderaccnum' placeholder='' value='"+order_rs[0][4]+"'  required readonly/>");
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
							<label for="orderProduct">수주품목</label><button onclick="imgbtn()" id="img" class="img-button"><img src="./image/re2.png"></button>&nbsp;&nbsp;&nbsp;<button onclick="details()" id="detail">더보기▾</button>
							
							<table class="table.txc-table tg orderTable" id="orderlist">
								 <thead>
									<tr>
										<th class="tg-baqh" rowspan=2>전체선택 <input type="checkbox"
											name="ch" value="전체 선택" id ="ch" class="table-input-style"></th>
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
									<% 
																				
										if(order_rs.length!=0&&panum%2==0){
											panum++;
											out.println("<tr>");
											out.println("<td class='tg-baqh'><input type='checkbox' name='ch' value='"+order_rs[0][1]+"#"+order_rs[0][6]+"' id ='ch-1' class='table-input-style' readonly>");
											out.println("</td>");
											//out.println("<td class='tg-baqh'><input type='text' name='orderNum-1' value='"+order_rs[0][4]+"' id ='ordernum-1' class='table-input-style' readonly>");
											//out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='emname-1' value='"+order_rs[0][17]+"' id ='emname-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='emnumber-1' value='"+order_rs[0][16]+"' id ='emnumber-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='procode-1' value='"+order_rs[0][6]+"' id ='procode-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='proname-1' value='"+order_rs[0][7]+"' id ='proname-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='procolor-1' value='"+order_rs[0][8]+"' id ='procolor-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='prodan-1' value='"+order_rs[0][9]+"' id ='prodan-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='prosu-1' value='"+order_rs[0][10]+"' id ='prosu-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='number' onchange='chgprice(this.id)' name='proprice-1' value='"+order_rs[0][11]+"' id ='proprice-1' class='table-input-style' >");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orsup-1' value='"+order_rs[0][12]+"' id ='orsup-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orvat-1' value='"+order_rs[0][13]+"' id ='orvat-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orall-1' value='"+order_rs[0][14]+"' id ='orall-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='onote-1' value='' id ='onote-1' class='table-input-style' >");
											out.println("</td>");
											out.println("</tr>");
										}/*else if(sujucode.equals("")&&panum%2==1){
											panum++;
											out.println("<tr>");
											out.println("<td class='tg-baqh'><input type='checkbox' name='ch' value='' id ='ch-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='ordernum-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='emname-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='emnumber-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='procode-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='proname-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='procolor-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='prodan-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='prosu-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='proprice-1' class='table-input-style' >");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='orsup-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='orvat-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='orall-1' class='table-input-style' readonly>");
											out.println("</td>");
											out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='onote-1' class='table-input-style' >");
											out.println("</td>");
											out.println("</tr>");
										}*/else if(panum%2==1){
											panum++;
											for(int i=0;i<rowCount;i++){
												out.println("<tr>");
												out.println("<td class='tg-baqh'><input type='checkbox' name='ch' value='"+order_rs[i][1]+"#"+order_rs[i][6]+"' id ='ch"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												//out.println("<td class='tg-baqh'><input type='text' name='orderNum' value='' id ='ordernum+'"+i+"'' class='table-input-style' readonly>");
												//out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='emname"+i+"' value='"+order_rs[i][17]+"' id ='emname"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='emnumber"+i+"' value='"+order_rs[i][16]+"' id ='emnumber"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='procode"+i+"' value='"+order_rs[i][6]+"' id ='procode"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='proname"+i+"' value='"+order_rs[i][7]+"' id ='proname"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='procolor"+i+"' value='"+order_rs[i][8]+"' id ='procolor"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='prodan"+i+"' value='"+order_rs[i][9]+"' id ='prodan"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='prosu"+i+"' value='"+order_rs[i][10]+"' id ='prosu"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='number' onchange='chgprice(this.id)' name='proprice"+i+"' value='"+order_rs[i][11]+"' id ='proprice"+i+"' class='table-input-style' >");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='orsup"+i+"' value='"+order_rs[i][12]+"' id ='orsup"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='orvat"+i+"' value='"+order_rs[i][13]+"' id ='orvat"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='or"+i+"' value='"+order_rs[i][14]+"' id ='or"+i+"' class='table-input-style' readonly>");
												out.println("</td>");
												out.println("<td class='tg-baqh'><input type='text' name='onote"+i+"' value='' id ='onote"+i+"' class='table-input-style' >");
												out.println("</td>");
												out.println("</tr>");
											}
										}
										
									%>
									
									<!--  <tr>
										<td class="tg-baqh"><input type="text"
											name=orderNum value="" id ="orderNum" class="table-input-style" readonly></td>

										<td class="tg-baqh productCode"><input type="text"
											name="dkdk" value="" id ="dkdk" class="table-input-style" readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productName" placeholder=""
											value="" required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productColor" placeholder=""
											value="" required readonly></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productMeasure" placeholder=""
											value="" required readonly></td>

										<td class="tg-baqh"><input type="text" name="productQuan"
											class="table-input-style" id="productQuan"></td>

										<td class="tg-baqh"><input type="text"
											class="table-input-style" id="productPrice" placeholder=""
											value="" readonly></td>

										<td class="tg-baqh supplyPrice">${ productPrice * productQuan }</td>

										<td class="tg-baqh vat"></td>

										<td class="tg-baqh"><input type="text" name="orderNote"
											class="table-input-style" id=" orderNote"></td>
									</tr>-->
									
									<!-- 
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
									 -->
								<!--  </tbody>-->
							</table>
						</div>
					</div>



					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">매출
						등록</button>
				</form>
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
		function changefunc(){ 
			document.getElementById('ordersp').value = document.getElementById('orderpp').value*document.getElementById('orderqu').value;               
	    }
		function changefunc_put(){ 
			var sujunum = document.getElementById('ordernumber').value;
			document.getElementById('orderNum').value = document.getElementById('ordernumber').value;               
	    }
		function fun(val){
			document.getElementById('asd').value = val;
		}
		
		
		
		let static_value  = (function static_func(value) {
			   let i = value;
			   return function() {
			      return ++i; 
			   }
			})(0);
		
		function details(){
			let val = static_value();
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
			
			
			//location.href = "test.jsp";


			if(tnt%2==0){
				//document.getElementById('detail').innerText = "자세히▾";
			}else{
				//document.getElementById('detail').innerText ="접기▴";
				//document.getElementById('orderlist').style.display = 'none';
			}
			
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
			alert(id);
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
</body>
</html>