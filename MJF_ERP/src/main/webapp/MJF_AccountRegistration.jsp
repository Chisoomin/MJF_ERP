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
	
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title md-auto mx-auto">
				<h1>거래처등록</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form md-auto mx-auto">
				<form action="MJF_Layout.jsp?pageChange=MJF_AccountReigstration_process.jsp" method="post" class="validation-form" novalidate>
				
					<div class="row">
						<div class="col-md-7 mb-3">
							<label>사업자등록번호 (*)</label> 
							<input type="text" class="form-control" name="code" maxlength="12" placeholder="000-00-00000" required>
							<div class="invalid-feedback">사업자등록번호를 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label>업체구분 (*)</label>
							<select class="form-control custom-select d-block w-100" name="type" id="type" required>
								<option value="">-선택-</option>
								<option value="매입처">매입처</option>
								<option value="매출처">매출처</option>
								<option value="기타">기타</option>
							</select>
							<div class="invalid-feedback">업체구분을 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-7 mb-3">
							<label>거래처명 (*)</label> 
							<input type="text" class="form-control" name="name" required>
							<div class="invalid-feedback">거래처명을 입력해주세요.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label>거래시작일 (*)</label> 
							<input type="date" class="form-control" id="begin_date" name="begin_date" required>
							<div class="invalid-feedback">거래시작일을 입력해주세요.</div>
						</div>
					</div>
					
						<div class="row">
						<div class="col-md-7 mb-3">
							<label>대표자</label> 
							<input type="text" class="form-control" name="ceo">
						</div>
						<div class="col-md-4 mb-3">
							<label>거래현황 (*)</label> 
							<select class="form-control custom-select d-block w-100" name="vailable" id="vailable" required>
								<option value="">-선택-</option>
								<option value="사용중">사용중</option>
								<option value="미사용">미사용</option>
							</select>
							<div class="invalid-feedback">거래현황을 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label>업태 (*)</label> 
							<select class="form-control custom-select d-block w-100" name="type_of_business" id="type_of_business" required>
								<option value="">-선택-</option>
								<option value="제조업">제조업</option>
								<option value="도매 및 소매업">도매 및 소매업</option>
								<option value="운수 및 창고업">운수 및 창고업</option>
								<option value="서비스업">서비스업</option>
								<option value="기타">기타</option>
							</select>
							<div class="invalid-feedback">업태를 입력해주세요.</div>
						</div>
						<div class="col-md-7 mb-3">
							<label>종목</label> 
							<input type="text" class="form-control" name="items_of_business">
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>연락처 (*)</label> 
							<input type="tel" class="form-control" name="tel" placeholder="000-0000-0000" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label>FAX</label> 
							<input type="tel" class="form-control" name="fax" >
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4 mb-3">
							<label>주소 (*)</label> 
							<input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호" required readonly>
						</div>
						<div class="col-md-auto">
						<label class="white">우편번호 (*)</label> 
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
							<input type="text" class="form-control" name="email" placeholder="id@domain.com">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>홈페이지</label> 
							<input type="text" class="form-control" name="website" placeholder="http://website.com">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>비고</label> 
							<input type="text" class="form-control" name="remark">
						</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>담당자 (*)</label> 
							<input type="text" class="form-control" name="sales_name" required>
							<div class="invalid-feedback">담당자를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label>담당자 연락처 (*)</label> 
							<input type="tel" class="form-control" name="sales_tel" placeholder="000-0000-0000" required>
							<div class="invalid-feedback">담당자 연락처를 입력해주세요.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>담당자 이메일</label> 
							<input type="text" class="form-control" name="sales_email">
						</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label>은행명</label> 
							<input type="text" class="form-control" name="bank_name">
						</div>
						<div class="col-md-5 mb-3">
							<label>예금주명</label> 
							<input type="tel" class="form-control" name="account_holder">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-11 mb-3">
							<label>계좌번호</label> 
							<input type="text" class="form-control" name="account_number">
						</div>
					</div>
						
					<hr class="mb-4">
					<div>
					<input class="btn btn-set btn-block" type="submit" value="등록">
					<input class="btn btn-set btn-block" type="button" value="취소" onclick="location.href='MJF_Layout.jsp?pageChange=MJF_AccountList.jsp'">
					</div>
				</form>
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
  </script>
  <script type="text/javascript">
	    window.onload = function() {
			today = new Date();
			today = today.toISOString().slice(0, 10);
			document.getElementById("begin_date").value = today;
		}
  </script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
  </script>
</body>
</html>