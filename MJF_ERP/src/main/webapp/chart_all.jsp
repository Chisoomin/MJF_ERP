<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
Connection conn_chart1 = null;
Statement stmt_chart1 = null;
PreparedStatement pstmt_chart1 = null;
ResultSet rs_chart1 = null;
int columnCount_chart1 = 0;
int rowCount_chart1 = 0;

String url_chart1 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user_chart1 = "MJFdbRoot";
String password_chart1 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn_chart1 = DriverManager.getConnection(url_chart1, user_chart1, password_chart1);
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
						String sql = "SELECT MONTH(sales_date) AS Month, sum(supply_price)+sum(vat) AS Total from MJFdb.sales_table GROUP BY Month;";

						stmt_chart1 = conn_chart1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						rs_chart1 = stmt_chart1.executeQuery(sql);
						ResultSetMetaData rsmd_chart1 = rs_chart1.getMetaData();
						columnCount_chart1 = rsmd_chart1.getColumnCount();
						rs_chart1.last(); //커서의 위치를 제일 뒤로 이동
						rowCount_chart1 = rs_chart1.getRow(); //현재 커서의 Row Index 값을 저장
						String chart1_rs[][] = new String[rowCount_chart1][columnCount_chart1];
						int i = 0;
						int j = 0;
						rs_chart1.first();
						for (i = 0; i < rowCount_chart1; i++) {
							for (j = 0; j < columnCount_chart1; j++) {
						chart1_rs[i][j] = rs_chart1.getString((j + 1));
							}
							rs_chart1.next();
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
						out.println("<input style=\"display:none;\" id=\"rowc\" type=\"text\" value=\"" + rowCount_chart1 + "\" readonly>");
						out.println("<input style=\"display:none;\" id=\"start_m\" type=\"text\" value=\"" +  chart1_rs[0][0]+ "\" readonly>");
						for(int y=0;y<rowCount_chart1;y++){
							out.println("<input style=\"display:none;\" id=\"gab"+y+"\" type=\"text\" value=\"" +  chart1_rs[y][1]+ "\" readonly>");
						}
						

					} catch (SQLException ex) {
						out.println("SQLException " + ex.getMessage());
					} finally {
						if (rs_chart1 != null)
							rs_chart1.close();
						if (stmt_chart1 != null)
							stmt_chart1.close();
						if (conn_chart1 != null)
							conn_chart1.close();
					}
					
					%>
				</div>
				<i class="fas fa-chart-bar me-1"></i> 월별 매출 그래프
			</div>
			<div class="card-body col-md-12" >
				<canvas id="myBarChart2" style="width:1000px;"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			new Chart(document.getElementById('myBarChart2'), myLineChart2);

		});

		var ctx2 = document.getElementById("myBarChart2");
		var rowCount = document.getElementById("rowc").value;
		var start = document.getElementById("start_m").value;
		const arr1 = [];
		const arr2 = [];
		if(parseInt(rowCount)<6){
			//alert("kdkdkd");
			var j=0,i=0;
			for(j=0;j<6-parseInt(rowCount);j++){
				arr1[j]=parseInt(start) - (6-parseInt(rowCount)-j);
				arr2[j]=0;
				//alert(j);
			}
			for(i=0;i<parseInt(rowCount);i++){
				//alert(i);
				arr1[i+j]=parseInt(start) + i;
				arr2[i+j]=document.getElementById("gab"+i).value;
			}
		}else{
			for(var i=0;i<parseInt(rowCount);i++){
				arr1[i]=parseInt(start) + i;
				arr2[i]=document.getElementById("gab"+i).value;
			}
		}
		
		for(var j=0;j<arr1.length;j++){
			switch(arr1[j]){
				case 1: arr1[j]="January"; break;
				case 2: arr1[j]="February"; break;
				case 3: arr1[j]="March"; break;
				case 4: arr1[j]="April"; break;
				case 5: arr1[j]="May"; break;
				case 6: arr1[j]="June"; break;
				case 7: arr1[j]="July"; break;
				case 8: arr1[j]="August"; break;
				case 9: arr1[j]="September"; break;
				case 10: arr1[j]="October"; break;
				case 11: arr1[j]="November"; break;
				case 12: arr1[j]="December"; break;
			}
			
		}
		var myLineChart2 = new Chart(ctx2, {
			type : 'bar',

			data : {
				labels :  arr1 ,
				datasets : [ {
					label : "sales amount",
					backgroundColor : "rgba(85,56,48,1)",
					borderColor : "rgba(85,56,48,1)",
					data :  arr2 ,
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