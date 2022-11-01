<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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

<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String Code = request.getParameter("Code");

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";
String name, ceo, tel, fax, account_email, account_postcode, account_address, account_website, account_remark, account_type, account_begin_date, account_vailable, type_of_business, items_of_business, sales_mgr_name, sales_mgr_mobile, sales_mgr_email, bank_name, bank_account_number, bank_account_holder;
String abc = "abc";

try {
	conn = DriverManager.getConnection(url, user, password);
	String sql = "select * from MJFdb.account_table where account_code='"+Code+"';";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){		
		String code = rs.getString("account_code");
		name = rs.getString("account_name");
		ceo = rs.getString("account_ceo");
		tel = rs.getString("account_tel");
		fax = rs.getString("account_fax");
		account_email = rs.getString("account_email");
		account_postcode = rs.getString("account_postcode");
		account_address = rs.getString("account_address");
		account_website = rs.getString("account_website");
		account_remark = rs.getString("account_remark");
		account_type = rs.getString("account_type");
		account_begin_date = rs.getString("account_begin_date");
		account_vailable = rs.getString("account_vailable");
		type_of_business = rs.getString("type_of_business");
		items_of_business = rs.getString("items_of_business");
		sales_mgr_name = rs.getString("sales_mgr_name");
		sales_mgr_mobile = rs.getString("sales_mgr_mobile");
		sales_mgr_email = rs.getString("sales_mgr_email");
		bank_name = rs.getString("bank_name");
		bank_account_number = rs.getString("bank_account_number");
		bank_account_holder = rs.getString("bank_account_holder");
	}

} catch (SQLException ex) {
	out.println("SQLException" + ex.getMessage());
} finally {
	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (conn != null) conn.close();
}
%>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title md-auto mx-auto">
				<h1>거래처정보</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form md-auto mx-auto">
				<form action="MJF_AccountDetailUpdate_process.jsp" method="post" class="validation-form" novalidate>		
					<div class="row">
						<div class="col-md-7 mb-3">
							<label>사업자등록번호</label> 
							<input type="text" class="form-control" name="code" id="code" maxlength="12" value="<%=code %>" required>
							<div class="invalid-feedback">사업자등록번호를 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label>업체구분</label>
							<select class="custom-select d-block w-100" name="type" id="type" required>
								<option>-선택-</option>
								<option value="매입처">매입처</option>
								<option value="매출처">매출처</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-7 mb-3">
							<label>거래처명</label> 
							<input type="text" class="form-control" name="name" id="name" value="" required>
							<div class="invalid-feedback">거래처명을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label>거래시작일</label> 
							<input type="date" class="form-control" id="begin_date" name="begin_date">
							<div class="invalid-feedback">거래시작일을 입력해주세요.</div>
						</div>
					</div>
					
						<div class="row">
						<div class="col-md-7 mb-3">
							<label>대표자</label> 
							<input type="text" class="form-control" name="ceo" id="ceo">
							<div class="invalid-feedback">대표자를 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label>거래현황</label> 
							<select class="custom-select d-block w-100" name="vailable" id="vailable">
								<option value="사용중">사용중</option>
								<option value="미사용">미사용</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label>업태</label> 
							<select class="custom-select d-block w-100" name="type_of_business" id="type_of_business">
								<option>-선택-</option>
								<option value="제조업">제조업</option>
								<option value="도매 및 소매업">도매 및 소매업</option>
								<option value="운수 및 창고업">운수 및 창고업</option>
								<option value="서비스업">서비스업</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="col-md-7 mb-3">
							<label>종목</label> 
							<input type="text" class="form-control" name="items_of_business" id="items_of_business" required>
							<div class="invalid-feedback">종목을 입력해주세요.</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>연락처</label> 
							<input type="tel" class="form-control" name="tel" id="tel" placeholder="000-0000-0000" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label>FAX</label> 
							<input type="tel" class="form-control" name="fax" id="fax">
							<div class="invalid-feedback">FAX를 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label>주소</label> 
							<input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호" required readonly>
						</div>
						<div class="col-md-auto">
						<label class="white">우편번호</label> 
							<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" name="checkaddr" id="checkaddr" value="우편번호찾기" required>
						</div>
						<div class="col-md-11 mb-3">
							<input type="text" class="form-control" name="addr1" id="addr1" placeholder="주소" required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>
						<div class="col-md-11 mb-3">
							<input type="text" class="form-control" name="addr2" id="addr2" placeholder="상세주소" required>
							<div class="invalid-feedback">상세주소를 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>이메일</label> 
							<input type="text" class="form-control" name="email" id="email" placeholder="id@domain.com">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>홈페이지</label> 
							<input type="text" class="form-control" name="website" id="website" placeholder="http://website.com">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>비고</label> 
							<input type="text" class="form-control" name="remark" id="remark">
						</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>담당자</label> 
							<input type="text" class="form-control" name="sales_name" id="sales_name" required>
							<div class="invalid-feedback">담당자를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label>담당자 연락처</label> 
							<input type="tel" class="form-control" name="sales_tel" id="sales_tel" placeholder="000-0000-0000" required>
							<div class="invalid-feedback">담당자 연락처를 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>담당자 이메일</label> 
							<input type="text" class="form-control" name="sales_email" id="sales_email">
						</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>은행명</label> 
							<input type="text" class="form-control" name="bank_name" id="bank_name">
						</div>
						<div class="col-md-5 mb-3">
							<label>예금주명</label> 
							<input type="tel" class="form-control" name="account_holder" id="account_holder">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>계좌번호</label> 
							<input type="text" class="form-control" name="account_number" id="account_number">
						</div>
					</div>
						
					<hr class="mb-4">
					<div class="mb-4"></div>
					<button class="btn btn-set btn-lg btn-block" type="submit">수정</button>
					<button class="btn btn-set btn-lg btn-block" type="submit">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>