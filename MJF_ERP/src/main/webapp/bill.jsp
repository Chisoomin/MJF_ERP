<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="./image/logo_rmbg.png">
<%
String salenum = request.getParameter("val");
System.out.println(salenum);
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
String result2[] = new String[22];
int columnCount = 0;
int rowCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
%>
<title>세금계산서 인쇄</title>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
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

h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form,
	fieldset, legend, div, body {
	-webkit-print-color-adjust: exact;
}

.hi {
	-webkit-print-color-adjust: exact;
	width: 210mm;
	height: 297mm;
	background-repeat: no-repeat;
	background-size: 210mm 297mm;
	background-image: url('./image/taxbill.png');
}

.d {
	position: absolute;
	left: 270;
	top: 180;
}

.indent {
	padding-left: 41.8em;
}

.indent2 {
	padding-left: 43em;
}
</style>

</head>
<body>

	<div class="hi">
		<br> <br>
		<%
		try {
			String sql = "SELECT * from MJFdb.sales_table where order_num='" + salenum + "'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);

			ResultSetMetaData rsmd = rs.getMetaData();
			columnCount = rsmd.getColumnCount();
			rs.last(); //커서의 위치를 제일 뒤로 이동
			rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
			String sale_rs[][] = new String[rowCount][columnCount];
			int i = 0;
			int j = 0;
			rs.first();
			for (i = 0; i < rowCount; i++) {
				for (j = 0; j < columnCount; j++) {
					sale_rs[i][j] = rs.getString((j + 1));
				}
				rs.next();
			}
			out.println(
					"<div style=\"position: absolute; left: 675px; top: 52px;\">1</div><div style=\"position: absolute; left: 747px; top: 52px;\">"+sale_rs[0][20].substring(25)+"</div>");
			out.println("<div style=\"position: absolute; left: 675px; top: 80.5px;\">"+sale_rs[0][20].substring(18)+"</div>");
			//책번호, 일련번호

			out.println("<div style=\"font-size:23px; position: absolute; left: 128px; top: 108.5px;\">1</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 152px; top: 108.5px;\">1</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 175.5px; top: 108.5px;\">0</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 222.5px; top: 108.5px;\">8</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 246.5px; top: 108.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 292.5px; top: 108.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 316.5px; top: 108.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 340.2px; top: 108.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 363.5px; top: 108.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 387px; top: 108.5px;\">5</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 153.5px;\">명지 가구</div>");
			out.println("<div style=\"position: absolute; left: 292.5px; top: 153.5px;\">동인윤</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 194px;\">서울특별시 서대문구 가좌로 134</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 234.5px;\">도소매</div>");
			out.println("<div style=\"position: absolute; left: 292.5px; top: 234.5px;\">가구, 원자재</div>");
			//공급자 정보
			
			
			String sql2 = "SELECT * from MJFdb.account_table where account_name='"+sale_rs[0][6]+"'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs2 = stmt.executeQuery(sql2);
			ResultSetMetaData rsmd2 = rs2.getMetaData();
			int columnCount2 = rsmd2.getColumnCount();
			int k = 0;
			rs2.first();
			for (k = 0; k < columnCount2; k++) {
				result2[k] = rs2.getString(k+1);
			}	
			
			out.println("<div style=\"font-size:23px; position: absolute; left: 504px; top: 108.5px;\">"+sale_rs[0][5].substring(0,1)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 528px; top: 108.5px;\">"+sale_rs[0][5].substring(1,2)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 551px; top: 108.5px;\">"+sale_rs[0][5].substring(2,3)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 597px; top: 108.5px;\">"+sale_rs[0][5].substring(4,5)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 621px; top: 108.5px;\">"+sale_rs[0][5].substring(5,6)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 668px; top: 108.5px;\">"+sale_rs[0][5].substring(7,8)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 691.5px; top: 108.5px;\">"+sale_rs[0][5].substring(8,9)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 715px; top: 108.5px;\">"+sale_rs[0][5].substring(9,10)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 738px; top: 108.5px;\">"+sale_rs[0][5].substring(10,11)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 762px; top: 108.5px;\">"+sale_rs[0][5].substring(11,12)+"</div>");
			out.println("<div style=\"position: absolute; left: 504px; top: 153.5px;\">"+sale_rs[0][6]+"</div>");
			out.println("<div style=\"position: absolute; left: 668px; top: 153.5px;\">"+result2[2]+"</div>");
			out.println("<div style=\"word-break:break-all; width:270px; font-size:12px; position: absolute; left: 504px; top: 189px;\">"+result2[7]+"</div>");
			out.println("<div style=\"position: absolute; left: 504px; top: 234.5px;\">"+result2[13]+"</div>");
			out.println("<div style=\"position: absolute; left: 668px; top: 234.5px;\">"+result2[14]+"</div>");
			//공급받는자 정보
			
			out.println(
					"<div style=\"position: absolute; left: 36.2px; top: 308px;\">"+sale_rs[0][4].substring(0,4)+"</div> <div style=\"position: absolute; left: 79px; top: 308px;\">"+sale_rs[0][4].substring(5,7)+"</div> <div style=\"position: absolute; left: 103px; top: 308px;\">"+sale_rs[0][4].substring(8,10)+"</div>");
			switch(sale_rs[0][13].length()){
			case 1: 
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				break;
			case 2: 
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				break;
			case 3: 
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				break;
			case 4: 
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				break;
			case 5:
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				break;
			case 6: 
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				break;
			case 7: 
				out.println("<div style=\"position: absolute; left: 271.5px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				break;
			case 8: 
				out.println("<div style=\"position: absolute; left: 248px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				break;
			case 9: 
				out.println("<div style=\"position: absolute; left: 224.5px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				break;
			case 10: 
				out.println("<div style=\"position: absolute; left: 201px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 224.5px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(9,10)+"</div>");
				break;
			case 11: 
				out.println("<div style=\"position: absolute; left: 177px; top: 308px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 201px; top: 308px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 224.5px; top: 308px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 308px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 308px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 308px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 308px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 308px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 308px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 308px;\">"+sale_rs[0][13].substring(9,10)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 308px;\">"+sale_rs[0][13].substring(10,11)+"</div>");
				break;
			}
			switch(sale_rs[0][14].length()){
			case 1: 
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				break;
			case 2: 
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				break;
			case 3: 
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				break;
			case 4: 
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				break;
			case 5: 
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				break;
			case 6: 
				out.println("<div style=\"position: absolute; left: 530px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				break;
			case 7: 
				out.println("<div style=\"position: absolute; left: 506px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				break;
			case 8: 
				out.println("<div style=\"position: absolute; left: 483px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				break;
			case 9: 
				out.println("<div style=\"position: absolute; left: 459.5px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 483px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(8,9)+"</div>");
				break;
			case 10: 
				out.println("<div style=\"position: absolute; left: 436px; top: 308px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 459.5px; top: 308px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 483px; top: 308px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 308px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 308px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 308px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 308px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 308px;\">"+sale_rs[0][14].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(9,10)+"</div>");
				break;
			}
			
			//작성년월, 공급가액, 세액
			String sql3 = "SELECT product_size from MJFdb.product_table where product_name='"+sale_rs[0][8]+"'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs3 = stmt.executeQuery(sql3);
			ResultSetMetaData rsmd3 = rs3.getMetaData();
			int columnCount3 = rsmd3.getColumnCount();
			int l = 0;
			rs3.first();
			String result3="";
			for (l = 0; l < columnCount3; l++) {
				result3 = rs3.getString(l+1);
			}
			out.println(
					"<div style=\"position: absolute; left: 32px; top: 358px;\">"+sale_rs[0][4].substring(5,7)+"</div> <div style=\"position: absolute; left: 56.5px; top: 358px;\">"+sale_rs[0][4].substring(8,10)+"</div>");
			out.println("<div style=\"position: absolute; left: 81px; top: 358px;\">"+sale_rs[0][8]+"</div>");
			out.println("<div style=\"word-break:break-all; width:63px; font-size:12px; position: absolute; left: 221px; top: 352px;\">"+result3+"</div>");
			out.println("<div style=\"position: absolute; left: 291px; top: 358px;\">"+sale_rs[0][11]+"</div>");
			out.println("<div style=\"position: absolute; left: 361px; top: 358px;\">"+sale_rs[0][12]+"</div>");
			out.println("<div style=\"position: absolute; left: 479px; top: 358px;\">"+sale_rs[0][13]+"</div>");
			out.println("<div style=\"position: absolute; left: 618px; top: 358px;\">"+sale_rs[0][14]+"</div>");
			//월일, 품목, 규격, 수량, 단가, 공급가액, 세액
			
			out.println("<div style=\"position: absolute; left: 35px; top: 493px;\">"+sale_rs[0][15]+"</div>");
			//합계금액
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			out.println(
					"<div style=\"position: absolute; left: 675px; top: 620px;\">1</div><div style=\"position: absolute; left: 747px; top: 620px;\">"+sale_rs[0][20].substring(25)+"</div>");
			out.println("<div style=\"position: absolute; left: 675px; top: 647.5px;\">"+sale_rs[0][20].substring(18)+"</div>");
			//책번호, 일련번호

			out.println("<div style=\"font-size:23px; position: absolute; left: 128px; top: 675.5px;\">1</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 152px; top: 675.5px;\">1</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 175.5px; top: 675.5px;\">0</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 222.5px; top: 675.5px;\">8</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 246.5px; top: 675.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 292.5px; top: 675.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 316.5px; top: 675.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 340.2px; top: 675.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 363.5px; top: 675.5px;\">7</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 387px; top: 675.5px;\">5</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 720.5px;\">명지 가구</div>");
			out.println("<div style=\"position: absolute; left: 292.5px; top: 720.5px;\">동인윤</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 761px;\">서울특별시 서대문구 가좌로 134</div>");
			out.println("<div style=\"position: absolute; left: 128px; top: 801.5px;\">도소매</div>");
			out.println("<div style=\"position: absolute; left: 292.5px; top: 801.5px;\">가구, 원자재</div>");
			//공급자 정보

			
			out.println("<div style=\"font-size:23px; position: absolute; left: 504px; top: 675.5px;\">"+sale_rs[0][5].substring(0,1)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 528px; top: 675.5px;\">"+sale_rs[0][5].substring(1,2)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 551px; top: 675.5px;\">"+sale_rs[0][5].substring(2,3)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 597px; top: 675.5px;\">"+sale_rs[0][5].substring(4,5)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 621px; top: 675.5px;\">"+sale_rs[0][5].substring(5,6)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 668px; top: 675.5px;\">"+sale_rs[0][5].substring(7,8)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 691.5px; top: 675.5px;\">"+sale_rs[0][5].substring(8,9)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 715px; top: 675.5px;\">"+sale_rs[0][5].substring(9,10)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 738px; top: 675.5px;\">"+sale_rs[0][5].substring(10,11)+"</div>");
			out.println("<div style=\"font-size:23px; position: absolute; left: 762px; top: 675.5px;\">"+sale_rs[0][5].substring(11,12)+"</div>");
			out.println("<div style=\"position: absolute; left: 504px; top: 720.5px;\">"+sale_rs[0][6]+"</div>");
			out.println("<div style=\"position: absolute; left: 668px; top: 720.5px;\">"+result2[2]+"</div>");
			out.println("<div style=\"word-break:break-all; width:270px; font-size:12px; position: absolute; left: 504px; top: 758px;\">"+result2[7]+"</div>");
			out.println("<div style=\"position: absolute; left: 504px; top: 801.5px;\">"+result2[13]+"</div>");
			out.println("<div style=\"position: absolute; left: 668px; top: 801.5px;\">"+result2[14]+"</div>");
			//공급받는자 정보
			
			out.println(
					"<div style=\"position: absolute; left: 36.2px; top: 875px;\">"+sale_rs[0][4].substring(0,4)+"</div> <div style=\"position: absolute; left: 79px; top: 875px;\">"+sale_rs[0][4].substring(5,7)+"</div> <div style=\"position: absolute; left: 103px; top: 875px;\">"+sale_rs[0][4].substring(8,10)+"</div>");
			switch(sale_rs[0][13].length()){
			case 1: 
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				break;
			case 2: 
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				break;
			case 3: 
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				break;
			case 4: 
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				break;
			case 5:
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				break;
			case 6: 
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				break;
			case 7: 
				out.println("<div style=\"position: absolute; left: 271.5px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				break;
			case 8: 
				out.println("<div style=\"position: absolute; left: 248px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				break;
			case 9: 
				out.println("<div style=\"position: absolute; left: 224.5px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				break;
			case 10: 
				out.println("<div style=\"position: absolute; left: 201px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 224.5px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 875px;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(9,10)+"</div>");
				break;
			case 11: 
				out.println("<div style=\"position: absolute; left: 177px; top: 875px;\">"+sale_rs[0][13].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 201px; top: 875px;\">"+sale_rs[0][13].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 224.5px; top: 875;\">"+sale_rs[0][13].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 248px; top: 875px;\">"+sale_rs[0][13].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 271.5px; top: 875px;\">"+sale_rs[0][13].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 295px; top: 875px;\">"+sale_rs[0][13].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 319px; top: 875px;\">"+sale_rs[0][13].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 343px; top: 875px;\">"+sale_rs[0][13].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 366px; top: 875px;\">"+sale_rs[0][13].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 389px; top: 875px;\">"+sale_rs[0][13].substring(9,10)+"</div>");
				out.println("<div style=\"position: absolute; left: 412px; top: 875px;\">"+sale_rs[0][13].substring(10,11)+"</div>");
				break;
			}
			switch(sale_rs[0][14].length()){
			case 1: 
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				break;
			case 2: 
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				break;
			case 3: 
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				break;
			case 4: 
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 308px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				break;
			case 5: 
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				break;
			case 6: 
				out.println("<div style=\"position: absolute; left: 530px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				break;
			case 7: 
				out.println("<div style=\"position: absolute; left: 506px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				break;
			case 8: 
				out.println("<div style=\"position: absolute; left: 483px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				break;
			case 9: 
				out.println("<div style=\"position: absolute; left: 459.5px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 483px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(8,9)+"</div>");
				break;
			case 10: 
				out.println("<div style=\"position: absolute; left: 436px; top: 875px;\">"+sale_rs[0][14].substring(0,1)+"</div>");
				out.println("<div style=\"position: absolute; left: 459.5px; top: 875px;\">"+sale_rs[0][14].substring(1,2)+"</div>");
				out.println("<div style=\"position: absolute; left: 483px; top: 875px;\">"+sale_rs[0][14].substring(2,3)+"</div>");
				out.println("<div style=\"position: absolute; left: 506px; top: 875px;\">"+sale_rs[0][14].substring(3,4)+"</div>");
				out.println("<div style=\"position: absolute; left: 530px; top: 875px;\">"+sale_rs[0][14].substring(4,5)+"</div>");
				out.println("<div style=\"position: absolute; left: 553px; top: 875px;\">"+sale_rs[0][14].substring(5,6)+"</div>");
				out.println("<div style=\"position: absolute; left: 577px; top: 875px;\">"+sale_rs[0][14].substring(6,7)+"</div>");
				out.println("<div style=\"position: absolute; left: 600px; top: 875px;\">"+sale_rs[0][14].substring(7,8)+"</div>");
				out.println("<div style=\"position: absolute; left: 623.5px; top: 875px;\">"+sale_rs[0][14].substring(8,9)+"</div>");
				out.println("<div style=\"position: absolute; left: 647px; top: 875px;\">"+sale_rs[0][14].substring(9,10)+"</div>");
				break;
			}
			
			//작성년월, 공급가액, 세액
			
			out.println(
					"<div style=\"position: absolute; left: 32px; top: 925px;\">"+sale_rs[0][4].substring(5,7)+"</div> <div style=\"position: absolute; left: 56.5px; top: 925px;\">"+sale_rs[0][4].substring(8,10)+"</div>");
			out.println("<div style=\"position: absolute; left: 81px; top: 925px;\">"+sale_rs[0][8]+"</div>");
			out.println("<div style=\"word-break:break-all; width:63px; font-size:12px; position: absolute; left: 221px; top: 920px;\">"+result3+"</div>");
			out.println("<div style=\"position: absolute; left: 291px; top: 925px;\">"+sale_rs[0][11]+"</div>");
			out.println("<div style=\"position: absolute; left: 361px; top: 925px;\">"+sale_rs[0][12]+"</div>");
			out.println("<div style=\"position: absolute; left: 479px; top: 925px;\">"+sale_rs[0][13]+"</div>");
			out.println("<div style=\"position: absolute; left: 618px; top: 925px;\">"+sale_rs[0][14]+"</div>");
			//월일, 품목, 규격, 수량, 단가, 공급가액, 세액
			
			out.println("<div style=\"position: absolute; left: 35px; top: 1060px;\">"+sale_rs[0][15]+"</div>");
			//합계금액
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

	</div>
	<!--<table class="tg">
		<tbody>
			<tr>
				<td colspan="5">[별지 제11호 서식]</td>
				<td colspan="27"></td>
			</tr>

			<tr>
				<td rowspan="2" colspan="15">세 금 계 산 서</td>
				<td rowspan="2">(</td>
				<td colspan="5">공급받는자</td>
				<td rowspan="2">)</td>
				<td colspan="4">책 번 호</td>
				<td></td>
				<td></td>
				<td>권</td>
				<td></td>
				<td></td>
				<td>호</td>
			</tr>

			<tr>
				<td colspan="5">보 관 용</td>
				<td colspan="4">일 련 번 호</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<td rowspan="8">공 급 자</td>
				<td colspan="3" rowspan="2">등록번호</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="8">공급받는자</td>
				<td colspan="3" rowspan="2">등록번호</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
			</tr>

			<tr>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
			</tr>

			<tr>
				<td colspan="3">(법인명)</td>
				<td colspan="3">(법인명)</td>
			</tr>



			<tr>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
			</tr>
			<tr>
				<td colspan="3">(법인명)</td>
				<td colspan="3">(법인명)</td>
			</tr>

			<tr>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
				<td colspan="3">상 호</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">성명</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">인</td>
			</tr>
			<tr>
				<td colspan="3">(법인명)</td>
				<td colspan="3">(법인명)</td>
			</tr>
		</tbody>

		<tr>
			<td colspan="4">작 성</td>
			<td colspan="13">공 급 가 액</td>
			<td colspan="10">세 액</td>
			<td colspan="5">비 고</td>
		</tr>

	</table>  -->
	<input type="button" value="인쇄하기" id="print" onclick="toggleBtn1()" />

</body>
<script>
	function toggleBtn1() {

		// 토글 할 버튼 선택 (btn1)
		const btn1 = document.getElementById('print');

		// btn1 숨기기 (display: none)
		if (btn1.style.display !== 'none') {
			btn1.style.display = 'none';
		}
		window.print();
		window.close();

	}

	var prtContent; // 프린트 하고 싶은 영역
	var initBody; // body 내용 원본

	// 프린트하고 싶은 영역의 id 값을 통해 출력 시작
	function startPrint(div_id) {
		prtContent = document.getElementById(div_id);
		window.onbeforeprint = beforePrint;
		window.onafterprint = afterPrint;
		window.print();
	}

	// 웹페이지 body 내용을 프린트하고 싶은 내용으로 교체
	function beforePrint() {
		initBody = document.body.innerHTML;
		document.body.innerHTML = prtContent.innerHTML;
	}

	// 프린트 후, 웹페이지 body 복구
	function afterPrint() {
		document.body.innerHTML = initBody;
	}
</script>
</html>