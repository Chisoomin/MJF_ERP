<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
	String user = "MJFdbRoot";
	String password = "mjfrootpw";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	
	try{
//		String sql = "SELECT word, ppl from tablename where id='"+id+"'";
		stmt = conn.createStatement();
		out.println("<script>alert('db 연결 성공');</script>");
		
	
		
	}catch(SQLException ex){
		out.println("SQLException "+ex.getMessage());
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
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
.ct{
	text-align : center;
	vertical-align : middle;
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
				
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">일자</label> <input type="text"
								class="form-control" id="name" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nickname" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nicknam" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nickname" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nicknam" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nickname" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nicknam" placeholder="" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" placeholder="서울특별시 강남구"
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="address2"
							placeholder="상세주소를 입력해주세요.">
					</div>

					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">가입 경로</label> <select
								class="custom-select d-block w-100" id="root">
								<option value=""></option>
								<option>검색</option>
								<option>카페</option>
							</select>
							<div class="invalid-feedback">가입 경로를 선택해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="code">추천인 코드</label> <input type="text"
								class="form-control" id="code" placeholder="" required>
							<div class="invalid-feedback">추천인 코드를 입력해주세요.</div>
						</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
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
									<th rowspan="2">수주금액</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주일</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">전표번호</th>
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
									<th rowspan="2">수주금액</th>
									<th rowspan="2">수주번호</th>
									<th rowspan="2">수주일</th>
									<th rowspan="2">매출일</th>
									<th rowspan="2">전표번호</th>
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
									<td class="ct"><input type="checkbox" id="checkbox"/> 1</td>
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
	</div>
	<script
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
	<script src="./js/datatables-simple-demo.js"></script>
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