<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String team_rs[] = new String[10];
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ResultSet rs2 = null;

int columnCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	String sql = "SELECT team_data from MJFdb.masterdata_team order by team_data asc";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	/* ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount(); */
	int i = 0;
	while (rs.next()) {
		team_rs[i] = rs.getString(1);
		i++;
	}
	/* out.println("<script>alert('"+team_rs[2]+"');</script>"); */

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	/*if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();*/
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
	cursor: pointer;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #e0e0e0;
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
				<h1>영업사원</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">영업사원등록</li>
					<li class="tab-link" data-tab="tab-2">영업사원목록</li>
				</ul>
				<div id="tab-1" class="tab-content current">

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
									class="custom-select d-block w-100" name="memteam" id="memteam"
									required>
									<option value="">-팀 선택-</option>
									<%
									int x = 0;

									for (x = 0; x < team_rs.length; x++) {
										if (team_rs[x] == null)
											continue;
										out.println("<option value='" + team_rs[x] + "'>" + team_rs[x] + "</option>");
									}
									%>
									<!-- <option value="영업 1팀">영업 1팀</option>
								<option value="영업 2팀">영업 2팀</option>
								<option value="영업 3팀">영업 3팀</option> -->
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
							<input type="checkbox" class="custom-control-input"
								id="aggrement" required> <label
								class="custom-control-label" for="aggrement">개인정보 수집 및
								이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<button class="btn btn-set btn-lg btn-block" type="submit">등록</button>
					</form>
				</div>

				<div id="tab-2" class="tab-content">
					<form action="resign_process.jsp" method="get"
						class="validation-form" novalidate>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 매출 내역
							</div>
							<div class="card-body">
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th nowrap>선택</th>
											<th nowrap>영업사원ID</th>
											<th nowrap>영업사원이름</th>
											<th nowrap>이메일주소</th>
											<th nowrap>팀</th>
											<th nowrap>직급</th>
											<th nowrap>입사일</th>
											<th nowrap>퇴사일</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th nowrap>선택</th>
											<th nowrap>영업사원ID</th>
											<th nowrap>영업사원이름</th>
											<th nowrap>이메일주소</th>
											<th nowrap>팀</th>
											<th nowrap>직급</th>
											<th nowrap>입사일</th>
											<th nowrap>퇴사일</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										try {
											String sql2 = "SELECT * from MJFdb.member_table";
											stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rs2 = stmt.executeQuery(sql2);
											rs2.last();
											int rowCount = rs2.getRow(); //현재 커서의 Row Index 값을 저장
											String memrs[][] = new String[rowCount][8];
											rs2.first();
											for (int k = 0; k < rowCount; k++) {
												for (int l = 0; l < 8; l++) {
											memrs[k][l] = rs2.getString((l + 1));
												}
												rs2.next();
											}
											String resign = "근무중";
											for (int b = 0; b < rowCount; b++) {
												
												out.println("<tr>");
												if(memrs[b][7] == null){
													out.println(
															"<td nowrap align=\"center\"><input type=\"radio\" name=\"rddel\" value='" + memrs[b][1] + "'></td>");
												}else{
													out.println(
															"<td nowrap align=\"center\"><input type=\"radio\" onclick=\"return(false);\"  name=\"rddel\" value='" + memrs[b][1] + "'></td>");
												}
												
												out.println("<td nowrap>" + memrs[b][1] + "</td>");
												out.println("<td nowrap>" + memrs[b][2] + "</td>");
												out.println("<td nowrap>" + memrs[b][3] + "</td>");
												out.println("<td nowrap>" + memrs[b][4] + "</td>");
												out.println("<td nowrap>" + memrs[b][5] + "</td>");
												out.println("<td nowrap>" + memrs[b][6] + "</td>");
												if(memrs[b][7] == null){
													out.println("<td nowrap>" + resign + "</td>");
												}else{
													out.println("<td nowrap>" + memrs[b][7] + "</td>");
												}
												
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
									</tbody>
								</table>
								<%
								out.println(
										"<button style= \"margin-left:20px; float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"퇴사\" type=\"submit\" class=\"btn btn-set\">");

								out.println("퇴사처리하기</button>");
								out.println("<div style= \"float: right;\">");
								out.println("<label for=\"resign\">퇴사일 :</label>");
								out.println("<input type=\"date\" name=\"memresign\" id=\"memresign\" required>");
								out.println("<div style= \"width:150px;\" class=\"invalid-feedback\">퇴사일을 입력해주세요.</div>");
								out.println("</div>");
								
								
								%>
							</div>
						</div>
					</form>
				</div>
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
		
$(document).ready(function(){
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			})

		});
  </script>
</body>
</html>