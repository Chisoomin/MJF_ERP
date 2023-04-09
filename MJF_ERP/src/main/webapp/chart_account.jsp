<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int columnCount = 0;
int rowCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
%>
<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>

</head>
<body>
	<form action="bill_loadpage.jsp" method="get" class="validation-form"
		novalidate>
		<div style="margin-top: 20px; margin-left: 15px; margin-right: 15px;"
			class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 매출 내역
			</div>
			<div class="card-body">
				<table id="datatablesSimple2">
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
							String sql = "SELECT * from MJFdb.sales_table";

							stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rs = stmt.executeQuery(sql);
							ResultSetMetaData rsmd = rs.getMetaData();
							columnCount = rsmd.getColumnCount();
							rs.last(); //커서의 위치를 제일 뒤로 이동
							rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
							String sales_rs[][] = new String[rowCount][columnCount];
							int i = 0;
							int j = 0;
							rs.first();
							for (i = 0; i < rowCount; i++) {
								for (j = 0; j < columnCount; j++) {
							sales_rs[i][j] = rs.getString((j + 1));
								}
								rs.next();
							}
							int num = 1;
							for (int b = 0; b < rowCount; b++) {

								if (sales_rs[b][21] == null) {
							sales_rs[b][21] = "";
								}
								if ((b - 1 >= 0) && (sales_rs[b][20].equals(sales_rs[b - 1][20]))) {
							out.println("<tr>");
							out.println("<td nowrap align=\"center\"> </td>");
							out.println("<td nowrap class=\"ct\">" + " " + "</td>");
							out.println("<td nowrap>" + " " + "</td>");
							out.println("<td nowrap>" + " " + "</td>");
							out.println("<td nowrap>" + " " + "</td>");
							out.println("<td nowrap>" + " " + "</td>");
							out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
							//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
							//out.println("거래명세서 인쇄</button></td>");
							out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
							//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
							//out.println("세금계산서 인쇄</button></td>");
							out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
							out.println("</tr>");
								} else {
							out.println("<tr>");
							out.println("<td nowrap align=\"center\"><input type=\"radio\" name=\"rdch\" value='" + sales_rs[b][19]
									+ "'></td>");
							out.println("<td nowrap class=\"ct\">" + (num) + "</td>");
							out.println("<td nowrap>" + sales_rs[b][17] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][18] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][5] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][6] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][7] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][8] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][10] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][11] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][12] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][2] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][1] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][4] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][15] + "</td>");
							out.println("<td nowrap>" + sales_rs[b][19] + "</td>");
							//out.println("<button onclick=\"popup('trading.jsp',window.screen.width /2,window.screen.height)\">");
							//out.println("거래명세서 인쇄</button></td>");
							out.println("<td nowrap>" + sales_rs[b][20] + "</td>");
							//out.println("<button onclick=\"popup('bill.jsp',window.screen.width /2,window.screen.height)\">");
							//out.println("세금계산서 인쇄</button></td>");
							out.println("<td nowrap>" + sales_rs[b][21] + "</td>");
							out.println("</tr>");
							num++;
								}

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
				//out.println("<button style=\"float: right;\" class=\"btn btn-set\" onclick=\"pop('bill.jsp',window.screen.width /2,window.screen.height)\">");
				out.println(
						"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"세금\" type=\"submit\" class=\"btn btn-set\">");

				out.println("세금계산서 인쇄</button>");
				out.println(
						"<button style=\"float: right;\" id=\"btn_val\" name=\"btn_val\" value=\"거래\" type=\"submit\" class=\"btn btn-set\">");
				out.println("거래명세서 인쇄</button>");
				%>
			</div>
		</div>
	</form>
</body>
</html>