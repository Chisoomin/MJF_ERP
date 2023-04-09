<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
Connection conn_chart3 = null;
Statement stmt_chart3 = null;
PreparedStatement pstmt_chart3 = null;
ResultSet rs_chart3 = null;
int columnCount_chart3 = 0;
int rowCount_chart3 = 0;

String url_chart3 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user_chart3 = "MJFdbRoot";
String password_chart3 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn_chart3 = DriverManager.getConnection(url_chart3, user_chart3, password_chart3);
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
						String sql = "select member_name, member_id, sum(total_price) from MJFdb.sales_table group by member_id order by sum(total_price) desc Limit 5;";

						stmt_chart3 = conn_chart3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						rs_chart3 = stmt_chart3.executeQuery(sql);
						ResultSetMetaData rsmd_chart3 = rs_chart3.getMetaData();
						columnCount_chart3 = rsmd_chart3.getColumnCount();
						rs_chart3.last(); //커서의 위치를 제일 뒤로 이동
						rowCount_chart3 = rs_chart3.getRow(); //현재 커서의 Row Index 값을 저장
						String chart3_rs[][] = new String[rowCount_chart3][columnCount_chart3];
						int i = 0;
						int j = 0;
						rs_chart3.first();
						for (i = 0; i < rowCount_chart3; i++) {
							for (j = 0; j < columnCount_chart3; j++) {
						chart3_rs[i][j] = rs_chart3.getString((j + 1));
							}
							rs_chart3.next();
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
						out.println("<input style=\"display:none;\" id=\"rowc3\" type=\"text\" value=\"" + rowCount_chart3 + "\" readonly>");
						
						for(int y=0;y<rowCount_chart3;y++){
							out.println("<input style=\"display:none;\" id=\"start_m3"+y+"\" type=\"text\" value=\"" +  chart3_rs[y][0]+ "\" readonly>");
							out.println("<input style=\"display:none;\" id=\"gab3"+y+"\" type=\"text\" value=\"" +  chart3_rs[y][2]+ "\" readonly>");
						}
						

					} catch (SQLException ex) {
						out.println("SQLException " + ex.getMessage());
					} finally {
						if (rs_chart3 != null)
							rs_chart3.close();
						if (stmt_chart3 != null)
							stmt_chart3.close();
						if (conn_chart3 != null)
							conn_chart3.close();
					}
					
					%>
				</div>
				<i class="fas fa-chart-bar me-1"></i> TOP 5 영업사원별 매출 그래프
			</div>
			<div class="card-body col-md-12" >
				<canvas id="myBarChart4" style="width:1000px;"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			new Chart(document.getElementById('myBarChart4'), myLineChart4);

		});

		var ctx4 = document.getElementById("myBarChart4");
		var rowCount = document.getElementById("rowc3").value;
		const arr31 = [];
		const arr32 = [];
		if(parseInt(rowCount)<5){
			//alert("kdkdkd");
			var j=0,i=0;
			for(j=0;j<5-parseInt(rowCount);j++){
				arr31[j]='사원없음';
				arr32[j]=0;
				//alert(j);
			}
			for(i=0;i<parseInt(rowCount);i++){
				//alert(i);
				var g;
				if(i==0){
					arr31[i+j]='👑'+document.getElementById("start_m3"+i).value;
				}else{
					arr31[i+j]=document.getElementById("start_m3"+i).value;
				}
				arr32[i+j]=document.getElementById("gab3"+i).value;
			}
		}else{
			for(var i=0;i<parseInt(rowCount);i++){
				if(i==0){
					arr31[i]='👑'+document.getElementById("start_m3"+i).value;
				}else{
					arr31[i]=document.getElementById("start_m3"+i).value;
				}
				arr32[i]=document.getElementById("gab3"+i).value;
			}
		}
		
		
		var myLineChart4 = new Chart(ctx4, {
			type : 'bar',

			data : {
				labels :  arr31 ,
				datasets : [ {
					label : "sales amount",
					backgroundColor : "rgba(85,56,48,1)",
					borderColor : "rgba(85,56,48,1)",
					data :  arr32 ,
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