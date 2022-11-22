<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Connection conn = DriverManager.getConnection(url, user, password);

String accountCode = request.getParameter("accountCode");

String sql = "SELECT * FROM account_table WHERE account_code = '" + accountCode + "';";

// String sql = "SELECT * FROM account_table WHERE account_code = '110-82-00415';";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles2.css" />
<link rel="stylesheet" href="./css/styles.css" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

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

.order_title {
	margin-bottom: 0px;
}

.inputTitle {
	font-weight: bold;
	font-size: large;
}

.inputMargin {
	margin-bottom: 20px;
}
</style>

<script>
	function isEmpty(value) {
		if (value == null || value.length === 0) {
			return "";
		} else {
			return value;
		}
	}
</script>

</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>거래처정보</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<%
					while (rs.next()) {
				%>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 코드</label> <input type="text"
							value="<%=rs.getString("account_code")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 회사이름</label> <input type="text"
							value="<%=rs.getString("account_name")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 CEO</label> <input type="text"
							value="<%=rs.getString("account_ceo")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">전화번호</label> <input type="text"
							value="<%=rs.getString("account_tel")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">팩스번호</label> <input type="text"
							value="<%=rs.getString("account_fax")%>"
							class="inputMargin form-control" onload="isEmpty()" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">이메일</label> <input type="text"
							value="<%=rs.getString("account_email")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">우편번호</label> <input type="text"
							value="<%=rs.getString("account_postcode")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 주소</label> <input type="text"
							value="<%=rs.getString("account_address")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 주소_2</label> <input type="text"
							value="<%=rs.getString("account_address2")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">웹사이트</label> <input type="text"
							value="<%=rs.getString("account_website")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">비고</label> <input type="text"
							value="<%=rs.getString("account_remark")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 타입</label> <input type="text"
							value="<%=rs.getString("account_type")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래 시작일</label> <input type="text"
							value="<%=rs.getString("account_begin_date")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 현황</label> <input type="text"
							value="<%=rs.getString("account_vailable")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 사업종류</label> <input type="text"
							value="<%=rs.getString("type_of_business")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 사업품목</label> <input type="text"
							value="<%=rs.getString("items_of_business")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 영업사원 이름</label> <input type="text"
							value="<%=rs.getString("sales_mgr_name")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 영업사원 전화번호</label> <input type="text"
							value="<%=rs.getString("sales_mgr_mobile")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래처 영업사원 이메일</label> <input type="text"
							value="<%=rs.getString("sales_mgr_email")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래 은행이름</label> <input type="text"
							value="<%=rs.getString("bank_name")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래 계좌번호</label> <input type="text"
							value="<%=rs.getString("bank_account_number")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="inputTitle">거래 은행 계좌이름</label> <input type="text"
							value="<%=rs.getString("bank_account_holder")%>"
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<div class="mb-4"></div>
		</div>
	</div>
</body>
</html>