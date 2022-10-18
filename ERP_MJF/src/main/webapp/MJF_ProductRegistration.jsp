<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>품목 등록</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;
      background: #EFE7DB
    }

    .input-form {
      max-width: device-width;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">품목 등록</h4>
        <form action="MJF_Product_Process.jsp" class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="productType">품목 분류</label>
              <select class="custom-select d-block w-100" id="productType" name="productType" onchange="productTypeChange(this)">
                <option>선택해주세요</option>
                <option value="원재료">원재료</option>
                <option value="반제품">반제품</option>
                <option value="완제품">완제품</option>
              </select>
              </div>  
             
              
              
              <div class="col-md-4 mb-3">
            	<label for="productCode">물품코드 (소분류)</label>
            	<select class="form-control" id="productCode" name="productCode">
            	<!-- input type="text" class="form-control" id="productCode" placeholder="물품코드 정의표에 따라 물품코드를 입력해주세요" value="" required>-->
            	<option>선택해주세요</option>
            
         		</select>
              </div>
          </div>
		


          <div class="mb-3">
            <label for="productName">품목명</label>
            <input type="text" class="form-control" id="productName" name="productName" placeholder="품목명을 입력하세요" value="" required>
          </div>
           


          <div class="mb-3">
            <label for="productColor">색상</label>
           <!-- <input type="color" class="form-control" id="productColor" placeholder="품목 색상을 입력하세요" value="" required>-->
            <select class="custom-select d-block w-100" id="productColor" name="productColor">
                <option>물품 색상을 선택해주세요</option>
                <option value="하얀색">하얀색</option> <!-- DB 키워드 : WH-->
                <option value="검은색">검은색</option> <!-- DB 키워드 : BK-->
                <option value="갈색">갈색</option> <!-- DB 키워드 : BR-->
                <option value="빨간색">빨간색</option> <!-- DB 키워드 : RD-->
                <option value="주황색">주황색</option> <!-- DB 키워드 : OG-->
                <option value="노란색">노란색</option> <!-- DB 키워드 : YW-->
                <option value="초록색">초록색</option> <!-- DB 키워드 : GR-->
                <option value="파란색">파란색</option> <!-- DB 키워드 : BL-->
                <option value="보라색">보라색</option> <!-- DB 키워드 : PU-->
              </select>
          </div>

        
          <div class="mb-3">
            <label for="productMeasure">품목 단위</label>
            <br>
            <!--<input type="text" class="form-control" id="productName" placeholder="품목 단위를 입력하세요" value="" required>-->
            <input id="productMSingle" name="productMeasure" type="radio" value="낱개">
            <label for="productSingle">낱개</label>
            <input id="productMBox" name="productMeasure" type="radio" value="박스">
            <label for="productMBox">박스</label>
          </div>
           
          <div class="row">
          	<div class="col-md-4 mb-3" >
  				<label for="productSize">품목 규격</label>
  				<br>
	            		<input type="text" class="form-control" id="productSize1" name="productSize1" placeholder="가로 (mm)" value="" required>
	            		x
	            		<input type="text" class="form-control" id="productSize2" name="productSize2" placeholder="세로 (mm)" value="" required>
	            		x
	            		<input type="text" class="form-control" id="productSize3" name="productSize3" placeholder="높이 (mm)" value="" required>
          	</div>
          </div>
           
           
          <div class="mb-3">
            <label for="productAmount">품목 수량</label>
            <input type="number" class="form-control" id="productAmount" name="productAmount" placeholder="품목 수량을 입력하세요" value="" required>
          </div>
           
           
            <div class="mb-3">
            	<label for="productPrice">입고 단가</label>
           		<input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="입고 단가를 입력하세요" value="" required>
          	</div>


			<div class="mb-3">
            	<label for="productStorage">보관 창고</label>
           		<select class="custom-select d-block w-100" id="productStorage" name="productStorage">
                <option>창고를 선택해주세요</option>
                <option value="제1창고">제1창고</option>
                <option value="제2창고">제2창고</option>
                <option value="제3창고">제3창고</option>
              </select>
          </div>



		<div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">등록 완료</button>

        </form>

      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 MJF</p>
    </footer>
  </div>
  <script>
	// 물품코드 자동분류

	function productTypeChange(e) {
		var typeR = ["01 원목", "02 가죽", "03 유리", "04 천", "05 솜", "06 조립부품"];
		var typeH = ["11 선반", "12 트레이", "13 수납함", "14 책꽂이", "15 동물가구", "16 무드등"];
		var typeF = ["21 쇼파",  "22 책상", "23 의자", "24 책장", "25 서랍", "26 침대"];
		var target = document.getElementById("productCode");
		
		if(e.value == "원재료") var d = typeR;
		else if(e.value == "반제품") var d = typeH;
		else if(e.value == "완제품") var d = typeF;

		target.options.length = 0;
		
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}   
	}
                            
	</script>
  
  <script>
	function productTypeCode(e){
		if(e.value == "typeF") 
			var typeCode = "F-";
		else if(e.value == "typeH")
			var typeCode = "H-";
		else if(e.value == "typeR")
			var typeCode = "R-";
		
		return typeCode;
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