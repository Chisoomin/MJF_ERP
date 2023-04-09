<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String team_rs[] = new String[10];
String color_rs[] = new String[20];
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ResultSet c_rs = null;
int columnCount = 0;
String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
try {
	String sql = "SELECT team_data from MJFdb.masterdata_team";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	/* ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount(); */
	int i = 0;
	while (rs.next()) {
		team_rs[i] = rs.getString(1);
		i++;
	}
	//색깔 기준 정보
	String sql_color = "SELECT color_data from MJFdb.masterdata_color";
	stmt = conn.createStatement();
	c_rs = stmt.executeQuery(sql_color);
	/* ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount(); */
	int o = 0;
	while (c_rs.next()) {
		color_rs[o] = c_rs.getString(1);
		i++;
	}
	/* out.println("<script>alert('"+team_rs[2]+"');</script>"); */
} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (c_rs != null)
		c_rs.close();
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
	padding: 0px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04)
		0px 10px 10px -5px;
	border-radius: 10px;
	/*background: #fff;
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
	background: #F0F0F0;
	color: #222;
}
.tab-content {
	display: none;
	background: #F0F0F0;
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
				<h1>기준정보관리</h1>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">팀정보수정</li>
					<li class="tab-link" data-tab="tab-2">품목분류수정</li>
					<li class="tab-link" data-tab="tab-3">품목색상수정</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<form action="process_masterdata.jsp" method="post"
						class="validation-form" novalidate>
						<div class="row">
							<div class="col-md-12 mb-3">
								<label for="name">팀 변경</label> <input type="text"
									class="form-control" name="teamupname" id="teamupname"
									placeholder="추가 및 삭제하려는 팀명을 입력해주세요." value="" required>
								<div class="invalid-feedback">추가 및 삭제하려는 팀명을 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<label for="name">팀 코드</label> <input type="text"
									class="form-control" name="teamupcode" id="teamupcode"
									placeholder="추가 및 삭제하려는 팀의 코드를 입력해주세요." value="" required>
								<div class="invalid-feedback">추가 및 삭제하려는 팀의 코드를 입력해주세요.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="추가" type="submit">추가</button>

							</div>

							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="삭제" type="submit">삭제</button>
							</div>
						</div>
					</form>
				</div>
				<div id="tab-2" class="tab-content">
					<!-- 유경 파트-->
					<form action="process_MasterType.jsp" method="post"
						class="validation-form" novalidate>
						<div class="row">
							<div class="col-md-12 mb-3">
								<label for="typeChange">품목 분류 변경</label> <input type="text"
									class="form-control" name="typeChange" id="typeChange"
									placeholder="추가 및 삭제하고 싶은 품목 분류를 입력해주세요" value="" required>
								<div class="invalid-feedback">품목 분류를 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<label for="typeIni">품목 타입 코드 입력</label> <input type="text"
									class="form-control" name="typeIni" id="typeIni"
									placeholder="품목 타입의 영어 이니셜(약어)을 작성해주세요" value="" required>
								<div class="invalid-feedback">품목 타입 코드를 입력해주세요.</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="추가" type="submit">추가</button>

							</div>

							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="삭제" type="submit">삭제</button>
							</div>
						</div>
					</form>
				</div>
				<div id="tab-3" class="tab-content">
					<form action="process_mastercolor.jsp" method="post"
						class="validation-form" novalidate>
						<div class="row">
							<div class="col-md-12 mb-3">
								<label for="colorChange">품목 색상 변경</label> <input type="text"
									class="form-control" name="colorChange" id="colorChange"
									placeholder="추가 및 삭제하고 싶은 색깔을 입력해주세요" value="" required>
								<div class="invalid-feedback">변경하려는 색상을 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<label for="colorIni">색상 코드 입력</label> <input type="text"
									class="form-control" name="colorIni" id="colorIni"
									placeholder="색깔의 영어 이니셜(약어)을 작성해주세요" value="" required>
								<div class="invalid-feedback">색상 코드를 입력해주세요.</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="추가" type="submit">추가</button>

							</div>

							<div class="col-md-6 mb-3">
								<button class="btn btn-set btn-lg btn-block" name="val_ind"
									id="val_ind" value="삭제" type="submit">삭제</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
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
		var newValue;
        // 모든 텍스트의 변경에 반응합니다.
        $("#teamupname").on("propertychange change keyup paste input", function() {
           
           // 현재 변경된 데이터 셋팅
           newValue = $(this).val();
           let found = newValue.match(/\d+/g);
           
		   if(found==null){
			   document.getElementById("teamupcode").value=parseInt((Math.random()+1)*10);
		   }else{
			   if(found<10){
		           document.getElementById("teamupcode").value="0"+found;
			   } else{
		           document.getElementById("teamupcode").value=found;
			   }
		   }
        });
  </script>

</body>
</html>