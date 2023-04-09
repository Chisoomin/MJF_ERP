<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
Connection conn_chart2 = null;
Statement stmt_chart2 = null;
PreparedStatement pstmt_chart2 = null;
ResultSet rs_chart2 = null;
int columnCount_chart2 = 0;
int rowCount_chart2 = 0;

String url_chart2 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user_chart2 = "MJFdbRoot";
String password_chart2 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn_chart2 = DriverManager.getConnection(url_chart2, user_chart2, password_chart2);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
</head>
<body>
	<div class="col-md-12 mx-auto" style="width:1086px;margin: 0 auto;" >
		<div class="card mb-4">
			<div class="card-header">
				<div>
					<%
					try {
						String sql = "select account_name, account_code, sum(total_price) from MJFdb.sales_table group by account_name ORDER BY sum(total_price) DESC Limit 5;";

						stmt_chart2 = conn_chart2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						rs_chart2 = stmt_chart2.executeQuery(sql);
						ResultSetMetaData rsmd_chart2 = rs_chart2.getMetaData();
						columnCount_chart2 = rsmd_chart2.getColumnCount();
						rs_chart2.last(); //커서의 위치를 제일 뒤로 이동
						rowCount_chart2 = rs_chart2.getRow(); //현재 커서의 Row Index 값을 저장
						String chart2_rs[][] = new String[rowCount_chart2][columnCount_chart2];
						int i = 0;
						int j = 0;
						rs_chart2.first();
						for (i = 0; i < rowCount_chart2; i++) {
							for (j = 0; j < columnCount_chart2; j++) {
						chart2_rs[i][j] = rs_chart2.getString((j + 1));
							}
							rs_chart2.next();
						}

						/*for(i=0;i<rowCount_chart1;i++){
							switch(chart1_rs[i][0]){
							case "1": chart1_rs[i][0]="January"; break;
							case "2": chart1_rs[i][0]="February"; break;
							case "3": chart1_rs[i][0]="March"; break;
							case "4": chart1_rs[i][0]="April"; break;
							case "5": chart1_rs[i][0]="May"; break;
							case "6": chart1_rs[i][0]="June"; break;
							case "7": chart1_rs[i][0]="July"; break;
							case "8": chart1_rs[i][0]="August"; break;
							case "9": chart1_rs[i][0]="September"; break;
							case "10": chart1_rs[i][0]="October"; break;
							case "11": chart1_rs[i][0]="November"; break;
							case "12": chart1_rs[i][0]="December"; break;
							}
						}*/
						out.println("<input style=\"display:none;\" id=\"rowc2\" type=\"text\" value=\"" + rowCount_chart2 + "\" readonly>");
						
						for(int y=0;y<rowCount_chart2;y++){
							out.println("<input style=\"display:none;\" id=\"start_m2"+y+"\" type=\"text\" value=\"" +  chart2_rs[y][0]+ "\" readonly>");
							out.println("<input style=\"display:none;\" id=\"gab2"+y+"\" type=\"text\" value=\"" +  chart2_rs[y][2]+ "\" readonly>");
						}
						

					} catch (SQLException ex) {
						out.println("SQLException " + ex.getMessage());
					} finally {
						if (rs_chart2 != null)
							rs_chart2.close();
						if (stmt_chart2 != null)
							stmt_chart2.close();
						if (conn_chart2 != null)
							conn_chart2.close();
					}
					
					%>
				</div>
				<i class="fas fa-chart-bar me-1"></i> TOP 5 거래처별 매출 그래프
			</div>
			<div class="card-body col-md-12" >
				<canvas id="myBarChart3" style="width:1000px;"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			new Chart(document.getElementById('myBarChart3'), myLineChart3);

		});

		var ctx3 = document.getElementById("myBarChart3");
		var rowCount = document.getElementById("rowc2").value;
		const arr21 = [];
		const arr22 = [];
		if(parseInt(rowCount)<5){
			//alert("kdkdkd");
			var j=0,i=0;
			for(j=0;j<5-parseInt(rowCount);j++){
				arr21[j]='거래처없음';
				arr22[j]=0;
				//alert(j);
			}
			for(i=0;i<parseInt(rowCount);i++){
				//alert(i);
				if(i==0){
					arr21[i+j]='👑'+document.getElementById("start_m2"+i).value;
				}else{
					arr21[i+j]=document.getElementById("start_m2"+i).value;
				}
				arr22[i+j]=document.getElementById("gab2"+i).value;
			}
		}else{
			for(var i=0;i<parseInt(rowCount);i++){
				if(i==0){
					arr21[i]='👑'+document.getElementById("start_m2"+i).value;
				}else{
					arr21[i]=document.getElementById("start_m2"+i).value;
				}
				arr22[i]=document.getElementById("gab2"+i).value;
			}
		}
		
		var myLineChart3 = new Chart(ctx3, {
			type : 'bar',

			data : {
				labels :  arr21 ,
				datasets : [ {
					label : "sales amount",
					backgroundColor : "rgba(85,56,48,1)",
					borderColor : "rgba(85,56,48,1)",
					data :  arr22 ,
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'month'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 6
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 15000,
							maxTicksLimit : 5
						},
						gridLines : {
							display : true
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>
</body>

</html>