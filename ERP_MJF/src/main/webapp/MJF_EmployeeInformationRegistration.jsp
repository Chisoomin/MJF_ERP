<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	//		String sql = "SELECT word, ppl from tablename where id='"+id+"'";
	stmt = conn.createStatement();
	out.println("<script>alert('db 연결 성공');</script>");

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
				<h1>사원정보등록</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form action="process.jsp" method="post" class="validation-form"
					novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="Lname">이름</label> <input type="text"
								class="form-control" name="memname" id="memname" placeholder=""
								value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<!-- <label for="team">팀</label> <input type="text"
								class="form-control" name="memteam" id="memteam" placeholder=""
								value="" required> -->
							<label for="team">팀</label> <select
								class="custom-select d-block w-100" name="memteam" id="memteam" required>
								<option value="">-팀 선택-</option>
								<option value="영업 1팀">영업 1팀</option>
								<option value="영업 2팀">영업 2팀</option>
								<option value="영업 3팀">영업 3팀</option>
							</select>
							<div class="invalid-feedback">팀을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="department">직급</label> <input type="text"
								class="form-control" name="memposition" id="memposition"
								placeholder="" value="" required>
							<div class="invalid-feedback">직급을 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-13 mb-3">
							<label for="email">이메일주소</label> <input type="text"
								class="form-control" name="mememail_id" id="mememail_id"
								placeholder="" value="" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
						<div class="col-md-auto">
							<label for="email" class="white">@</label>
							<div>@</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="email">도메인 입력</label> <input type="text"
								class="form-control" name="memdomain" id="memdomain"
								placeholder="" value="" required>
							<div class="invalid-feedback">도메인을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="email">도메인 선택</label> <select
								class="custom-select d-block w-100" id="emailselect"
								onchange="chageValue()">
								<option value="">-선택-</option>
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
						</div>

					</div>
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="entry">입사일</label> <input type="date"
								class="form-control" name="mementry" id="mementry"
								placeholder="" value="" required>
							<div class="invalid-feedback">입사일을 입력해주세요.</div>
						</div>

					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">등록</button>
				</form>
			</div>
		</div>
	</div>
	<script>
		function chageValue(){
			var value_str = document.getElementById('emailselect');
			//alert(value_str.options[value_str.selectedIndex].value);
			
			document.getElementById('memdomain').value = value_str.options[value_str.selectedIndex].value;
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
  </script>

</body>
</html>