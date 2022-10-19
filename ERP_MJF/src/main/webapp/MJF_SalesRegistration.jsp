<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	//String name = request.getParameter("radiocheck");
	//out.println("<script>alert('"+name+"');</script>");

	String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
	String user = "MJFdbRoot";
	String password = "mjfrootpw";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	
	try{
		String sql = "SELECT team_data from MJFdb.masterdata_team";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
	
		
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
.btn-set2 {
	color: #fff;
	background-color: #393229;
	border-color: #393229;
}

.white {
	color: #fff;
}
.ct{
	text-align : center;
	vertical-align : middle;
}
.mar{
	margin-bottom:20px;
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
					var popupX = (document.body.offsetWidth / 2) - (document.body.offsetWidth / 4);
					// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
					
					var popupY= (window.screen.height / 2) - (window.screen.height / 4);
					// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
				</script>
				
				<button class="btn btn-set2 btn-lg btn-block mar" onclick="window.open('order_loading.jsp', 'window_name', 'width=window.screen.width /2, height=window.screen.height /2, left='+ popupX + ', top='+ popupY+', status=no, scrollbars=yes');">수주 불러오기</button>
				
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">수주번호</label> <input type="text"
								class="form-control" name="ordernum" id="ordernum" placeholder="" value="" required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">수주날짜</label> <input type="text"
								class="form-control" name="orderda" id="orderda" placeholder="" value=""
								required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">매출날짜</label> <input type="date"
								class="form-control" name="salesdate" id="salesdate" placeholder="" value=""
								required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">거래처명</label> <input type="text"
								class="form-control" name="orderacc" id="orderacc" placeholder="" value="" required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">사업자등록번호</label> <input type="text"
								class="form-control" name="orderaccnum" id="orderaccnum" placeholder="" value=""
								required readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">품목코드</label> <input type="text"
								class="form-control" name="procode" id="procode" placeholder="" value="" required readonly>
						</div>
						<div class="col-md-4 mb-3">
							<label for="nickname">품목명</label> <input type="text"
								class="form-control" name="proname" id="proname" placeholder="" value=""
								required readonly>
						</div>
					
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="name">단위</label> <input type="text"
								class="form-control" name="orderme" id="orderme" placeholder="" value="" required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수량</label> <input type="text"
								class="form-control" name="orderqu" id="orderqu" placeholder="" value=""
								required readonly>
						</div>
						<div class="col-md-3 mb-3">
							<label for="name">단가</label> <input type="number"
								class="form-control" name="orderpp" id="orderpp" placeholder="" value="" onchange="changefunc()" required>
						</div>
						<div class="col-md-3 mb-3">
							<label for="nickname">수주금액</label> <input type="text"
								class="form-control" name="ordersp" id="ordersp" placeholder="" value=""
								required readonly>
						</div>
					
					</div>


					
					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">매출 등록</button>
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