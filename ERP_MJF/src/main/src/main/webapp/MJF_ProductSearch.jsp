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
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />


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
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	border-radius: 10px;
	
}

.btn-set {
	color: #fff;
	background-color: #7D766D;
	border-color: #7D766D;
}
</style>


<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>품목 조회</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div id="">
					<main>
						<div class="container">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 품목 조회 테이블
								</div>
								<div class="card-body">
									<table id="datatablesSimple">
										<thead>
											<tr>
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
										</thead>
										<tfoot>
											<tr>
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
													System.out.print(codenum);
												} else if (codenum.length() == 2) {
													result = zero1.concat(codenum);
												}
											%>
											<tr>
												<th><%=rs.getString("product_type")%></th>
												<th><%=rs.getString("product_type2")%></th>
												<th><%=rs.getString("product_name")%></th>
												<th><%=rs.getString("product_color")%></th>
												<th><%=rs.getString("product_code")%><%=result%></th>
												<th><%=rs.getString("product_measure")%></th>
												<th><%=rs.getString("product_size")%></th>
												<th><%=rs.getString("product_amount")%></th>
												<th><%=rs.getString("product_price")%></th>
												<th><%=rs.getString("product_storage")%></th>
											</tr>
											<%
											}
											%>


										</tbody>
									</table>

								</div>

								<button class="btn btn-set2 btn-lg btn-block mar btn-set"
									onclick="popup('MJF_ProductRegistration.jsp',window.screen.width,window.screen.height)">품목등록</button>
							</div>
						</div>
					</main>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
									
									function popup(url,width,height){
				  						var sst = window.open(url,'popwin','top='+((screen.availHeight - height)/2 - 40) +', left='+(screen.availWidth - width)/2+', width='+width+', height='+height+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
									  if(sst){
									    sst.focus();
									  }
									}
	</script>
</body>

</html>