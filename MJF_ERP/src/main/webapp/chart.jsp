<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
Connection conn0 = null;
Statement stmt0 = null;
PreparedStatement pstmt0 = null;
ResultSet rs0 = null;
int columnCount0 = 0;
int rowCount0 = 0;

String url0 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user0 = "MJFdbRoot";
String password0 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn0 = DriverManager.getConnection(url0, user0, password0);


%>
<style>
button + button {

 margin-right: 10px;

}
</style>
<meta charset="UTF-8">
</head>
<body>
<script>
function pop(url,width,height){
	var chac=$('input[name=rdch]:checked').val();
	var selected = document.querySelector('input[type=radio][name=rdch]:checked');
    var form = document.createElement('form'); // 폼객체 생성
		var objs;
		objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
		objs.setAttribute('type', 'radio'); // 값이 들어있는 녀석의 type
		objs.setAttribute('name', 'rdch'); // 객체이름
		objs.setAttribute('value',  chac); //객체값
		form.appendChild(objs);
		form.setAttribute('method', 'post'); //get,post 가능
		form.setAttribute('action', url); //보내는 url
		document.body.appendChild(form);
		form.submit();
    var sst = window.open(url,'popwin','top='+((screen.availHeight - height)/2 - 40) +', left='+(screen.availWidth - width)/2+', width='+width+', height='+height+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
  	if(sst){
    	sst.focus();
  	}
  	
}
</script>


<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-table col-md-12 mx-auto">
			<form action="bill_loadpage.jsp" method="get"
					class="validation-form" novalidate>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 매출 내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th nowrap rowspan="2">선택</th>
									<th nowrap rowspan="2">No.</th>
									<th nowrap colspan="2">담당사원정보</th>
									<th nowrap rowspan="2">거래처코드</th>
									<th nowrap rowspan="2">거래처명</th>
									<th nowrap rowspan="2">품목코드</th>
									<th nowrap rowspan="2">품목명</th>
									<th nowrap rowspan="2">단위</th>
									<th nowrap rowspan="2">수량</th>
									<th nowrap rowspan="2">단가</th>
									<th nowrap rowspan="2">수주일</th>
									<th nowrap rowspan="2">수주번호</th>
									<th nowrap rowspan="2">수주금액</th>
									<th nowrap rowspan="2">매출일</th>
									<th nowrap rowspan="2">매출액</th>																		
									<th nowrap rowspan="2">거래명세서</th>
									<th nowrap rowspan="2">세금계산서번호</th>
									<th nowrap rowspan="2">비고</th>
								</tr>
								<tr>
									<th nowrap>사원번호</th>
									<th nowrap>사원명</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th nowrap rowspan="2">선택</th>
									<th nowrap rowspan="2">No.</th>
									<th nowrap colspan="2">담당사원정보</th>
									<th nowrap rowspan="2">거래처코드</th>
									<th nowrap rowspan="2">거래처명</th>
									<th nowrap rowspan="2">품목코드</th>
									<th nowrap rowspan="2">품목명</th>
									<th nowrap rowspan="2">단위</th>
									<th nowrap rowspan="2">수량</th>
									<th nowrap rowspan="2">단가</th>
									<th nowrap rowspan="2">수주일</th>
									<th nowrap rowspan="2">수주번호</th>
									<th nowrap rowspan="2">수주금액</th>
									<th nowrap rowspan="2">매출일</th>
									<th nowrap rowspan="2">매출액</th>																		
									<th nowrap rowspan="2">거래명세서</th>
									<th nowrap rowspan="2">세금계산서번호</th>
									<th nowrap rowspan="2">비고</th>
								</tr>
								<tr>
									<th>사원번호</th>
									<th>사원명</th>
								</tr>
							</tfoot>
							<tbody>
								<%
								try {
									String sql = "SELECT * from MJFdb.sales_table order by order_num, sales_note";

									stmt0 = conn0.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
									rs0 = stmt0.executeQuery(sql);
									ResultSetMetaData rsmd0 = rs0.getMetaData();
									columnCount0 = rsmd0.getColumnCount();
									rs0.last(); //커서의 위치를 제일 뒤로 이동
									rowCount0 = rs0.getRow(); //현재 커서의 Row Index 값을 저장
									String sales_rs[][] = new String[rowCount0][columnCount0];
									int i = 0;
									int j = 0;
									rs0.first();
									for (i = 0; i < rowCount0; i++) {
										for (j = 0; j < columnCount0; j++) {
											sales_rs[i][j] = rs0.getString((j + 1));
										}
										rs0.next();
									}
									int num=1;
									for(int b=0;b<rowCount0;b++){
										
									if(sales_rs[b][21]==null){
										sales_rs[b][21]="";
									}
									if((b-1>=0)&&(sales_rs[b][20].equals(sales_rs[b-1][20]))){
										out.println("<tr>");
										out.println("<td nowrap align=\"center\"> </td>");
										out.println("<td nowrap class=\"ct\">"+" "+"</td>");
										out.println("<td nowrap>"+" "+"</td>");
										out.println("<td nowrap>"+" "+"</td>");
										out.println("<td nowrap>"+" "+"</td>");
										out.println("<td nowrap>"+" "+"</td>");
										out.println("<td nowrap>"+sales_rs[b][7]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][8]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][10]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][11]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][12]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][2]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][1]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][15]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][4]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][15]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][19]+"</td>");
										//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
										//out.println("거래명세서 인쇄</button></td>");
										out.println("<td nowrap>"+sales_rs[b][20]+"</td>");
										//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
										//out.println("세금계산서 인쇄</button></td>");
										if(sales_rs[b][22]==null){
											out.println("<td nowrap>"+sales_rs[b][21]+"</td>");
										}else{
											out.println("<td nowrap>"+sales_rs[b][21]+" / "+sales_rs[b][22]+"</td>");
										}
										out.println("</tr>");
									}else{
										out.println("<tr>");
										out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='"+sales_rs[b][20]+"'></td>");
										out.println("<td nowrap class=\"ct\">"+(num)+"</td>");
										out.println("<td nowrap>"+sales_rs[b][17]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][18]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][5]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][6]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][7]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][8]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][10]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][11]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][12]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][2]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][1]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][15]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][4]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][15]+"</td>");
										out.println("<td nowrap>"+sales_rs[b][19]+"</td>");
										//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
										//out.println("거래명세서 인쇄</button></td>");
										out.println("<td nowrap>"+sales_rs[b][20]+"</td>");
										//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
										//out.println("세금계산서 인쇄</button></td>");
										if(sales_rs[b][22]==null){
											out.println("<td nowrap>"+sales_rs[b][21]+"</td>");
										}else{
											out.println("<td nowrap>"+sales_rs[b][21]+" / "+sales_rs[b][22]+"</td>");
										}										out.println("</tr>");
										num++;
									}
									
									}
									
								} catch (SQLException ex) {
									out.println("SQLException " + ex.getMessage());
								} finally {
									if (rs0 != null)
										rs0.close();
									if (stmt0 != null)
										stmt0.close();
									if (conn0 != null)
										conn0.close();
								}
								
								%>
								
							</tbody>
						</table>
						<%
						//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
						out.println("<div style=\"margin-top:20px\"><button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

						out.println("세금계산서 인쇄</button>");
						out.println("<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
						out.println("거래명세서 인쇄</button></div>");
						
						%>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>