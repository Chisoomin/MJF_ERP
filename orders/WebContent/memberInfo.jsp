<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Connection conn = DriverManager.getConnection(url, user, password);

String memberId = request.getParameter("memberId");

String sql = "SELECT * FROM member_table WHERE member_id = '" + memberId + "';";

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

.btnMargin {
	margin-top: 50px;
}
</style>

<script>
// 	$("input").filter("[value=null]").val(" ");
</script>

</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title col-md-12 mx-auto">
				<h3>담당자정보</h3>
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
						<label for="department" class="inputTitle">사원번호</label> <input
							type="text" value=<%=rs.getString("member_id")%>
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="department" class="inputTitle">담당자이름</label> <input
							type="text" value=<%=rs.getString("member_name")%>
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="department" class="inputTitle">부서(팀)</label> <input
							type="text" value=<%=rs.getString("team")%>
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="department" class="inputTitle">직급</label> <input
							type="text" value=<%=rs.getString("memposition")%>
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="department" class="inputTitle">입사일</label> <input
							type="text" value=<%=rs.getString("entrydate")%>
							class="inputMargin form-control" readonly>
					</div>
				</div>
				<%
					}
				%>
<!-- 				<button class="btn btn-set btn-lg btn-block btnMargin" type="button">등록</button> -->
			</div>
		</div>
	</div>
</body>
</html>