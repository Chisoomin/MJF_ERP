<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<%
Connection conn_chart4 = null;
Statement stmt_chart4 = null;
PreparedStatement pstmt_chart4 = null;
ResultSet rs_chart4 = null;
int columnCount_chart4 = 0;
int rowCount_chart4 = 0;
String pro_code[] = new String[5];

String url_chart4 = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user_chart4 = "MJFdbRoot";
String password_chart4 = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn_chart4 = DriverManager.getConnection(url_chart4, user_chart4, password_chart4);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<style>
	/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
/*body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}*/


#wrapper{
  width:600px;
  margin:50px auto;
  height:400px;
  position:relative;
  color:#000;
  text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;  
}

#slider-wrap{
  width:600px;
  height:400px;
  position:relative;
  overflow:hidden;
}

#slider-wrap ul#slider{
  width:100%;
  height:100%;
  
  position:absolute;
  top:0;
  left:0;   
}

#slider-wrap ul#slider li{
  float:left;
  position:relative;
  width:600px;
  height:400px; 
}

#slider-wrap ul#slider li > div{
  position:absolute;
  top:20px;
  left:35px;  
}

#slider-wrap ul#slider li > div h3{
  font-size:36px;
  text-transform:uppercase; 
}

#slider-wrap ul#slider li > div span{
  font-family: Neucha, Arial, sans serif;
  font-size:21px;
}

#slider-wrap ul#slider li img{
  display:block;
  width:100%;
  height: 100%;
}


/*btns*/
.btns{
  position:absolute;
  width:50px;
  height:60px;
  top:50%;
  margin-top:-25px;
  line-height:57px;
  text-align:center;
  cursor:pointer; 
  background:rgba(0,0,0,0.1);
  z-index:100;
  
  
  -webkit-user-select: none;  
  -moz-user-select: none; 
  -khtml-user-select: none; 
  -ms-user-select: none;
  
  -webkit-transition: all 0.1s ease;
  -moz-transition: all 0.1s ease;
  -o-transition: all 0.1s ease;
  -ms-transition: all 0.1s ease;
  transition: all 0.1s ease;
}

.btns:hover{
  background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
  top: 30px; 
  right:35px; 
  width:auto;
  position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
  min-width:20px;
  margin-top:350px;
  margin-left: auto; 
  margin-right: auto;
  height:15px;
  position:relative;
  text-align:center;
}

#pagination-wrap ul {
  width:100%;
}

#pagination-wrap ul li{
  margin: 0 4px;
  display: inline-block;
  width:5px;
  height:5px;
  border-radius:50%;
  background:#000;
  opacity:0.5;
  position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
  opacity:1;
  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}








/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
  -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}
</style>
</head>
<body>
	<div class="col-md-12 mx-auto" style="width: 1086px; margin: 0 auto;">
		<div class="card mb-4">
			<div class="card-header">
				<div>
					<%
					try {
						String sql = "select product_name, product_code, sum(total_price) from MJFdb.sales_table group by product_name ORDER BY sum(total_price) desc LIMIT 5;";

						stmt_chart4 = conn_chart4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						rs_chart4 = stmt_chart4.executeQuery(sql);
						ResultSetMetaData rsmd_chart4 = rs_chart4.getMetaData();
						columnCount_chart4 = rsmd_chart4.getColumnCount();
						rs_chart4.last(); //커서의 위치를 제일 뒤로 이동
						rowCount_chart4 = rs_chart4.getRow(); //현재 커서의 Row Index 값을 저장
						String chart4_rs[][] = new String[rowCount_chart4][columnCount_chart4];
						int i = 0;
						int j = 0;
						rs_chart4.first();
						for (i = 0; i < rowCount_chart4; i++) {
							for (j = 0; j < columnCount_chart4; j++) {
						chart4_rs[i][j] = rs_chart4.getString((j + 1));
							}
							rs_chart4.next();
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
						out.println(
						"<input style=\"display:none;\" id=\"rowc4\" type=\"text\" value=\"" + rowCount_chart4 + "\" readonly>");

						for (int y = 0; y < rowCount_chart4; y++) {
							out.println("<input style=\"display:none;\" id=\"start_m4" + y + "\" type=\"text\" value=\"" + chart4_rs[y][0]
							+ "\" readonly>");
							pro_code[y] = chart4_rs[y][1] + ".jpg";
							out.println("<input style=\"display:none;\" id=\"gab4" + y + "\" type=\"text\" value=\"" + chart4_rs[y][2]
							+ "\" readonly>");
						}

					} catch (SQLException ex) {
						out.println("SQLException " + ex.getMessage());
					} finally {
						if (rs_chart4 != null)
							rs_chart4.close();
						if (stmt_chart4 != null)
							stmt_chart4.close();
						if (conn_chart4 != null)
							conn_chart4.close();
					}
					%>
				</div>
				<i class="fas fa-chart-bar me-1"></i> TOP 5 상품별 매출 그래프
			</div>
			<div class="card-body col-md-12">
				<canvas id="myBarChart5" style="width: 1000px;"></canvas>
			</div>

		</div>
		<div id="wrapper">
			<div id="slider-wrap">
				<ul id="slider">
					<li>
						<div>
							<h4>👑<br>RANK 1</h4>
						</div> <img src="./product_img/<%=pro_code[0]%>" style="width:500px;">
					</li>

					<li>
						<div>
							<h4>👑<br>RANK 2</h4>
						</div> <img src="./product_img/<%=pro_code[1]%>" style="width:500px;">
					</li>

					<li>
						<div>
							<h4>👑<br>RANK 3</h4>
						</div> <img src="./product_img/<%=pro_code[2]%>" style="width:500px;">
					</li>

				</ul>

				<!--controls-->
				<div class="btns" id="next">
					<i class="fa fa-arrow-right"></i>
				</div>
				<div class="btns" id="previous">
					<i class="fa fa-arrow-left"></i>
				</div>
				<div id="counter"></div>

				<div id="pagination-wrap">
					<ul>
					</ul>
				</div>
				<!--controls-->

			</div>

		</div>
	</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			new Chart(document.getElementById('myBarChart5'), myLineChart5);

		});

		var ctx5 = document.getElementById("myBarChart5");
		var rowCount = document.getElementById("rowc4").value;
		//var start = document.getElementById("start_m4").value;
		const arr41 = [];
		const arr42 = [];
		if (parseInt(rowCount) < 5) {
			//alert("kdkdkd");
			var j = 0, i = 0;
			for (j = 0; j < 5 - parseInt(rowCount); j++) {
				arr41[j] = '상품없음';
				arr42[j] = 0;
				//alert(j);
			}
			for (i = 0; i < parseInt(rowCount); i++) {
				//alert(i);
				if (i == 0) {
					arr41[i + j] = '👑'
							+ document.getElementById("start_m4" + i).value;
				} else {
					arr41[i + j] = document.getElementById("start_m4" + i).value;
				}
				arr42[i + j] = document.getElementById("gab4" + i).value;
			}
		} else {
			for (var i = 0; i < parseInt(rowCount); i++) {
				if (i == 0) {
					arr41[i] = '👑'
							+ document.getElementById("start_m4" + i).value;
				} else {
					arr41[i] = document.getElementById("start_m4" + i).value;
				}
				arr42[i] = document.getElementById("gab4" + i).value;
			}
		}

		/*for(var j=0;j<arr41.length;j++){
			switch(arr41[j]){
				case 1: arr41[j]="January"; break;
				case 2: arr41[j]="February"; break;
				case 3: arr41[j]="March"; break;
				case 4: arr41[j]="April"; break;
				case 5: arr41[j]="May"; break;
				case 6: arr41[j]="June"; break;
				case 7: arr41[j]="July"; break;
				case 8: arr41[j]="August"; break;
				case 9: arr41[j]="September"; break;
				case 10: arr41[j]="October"; break;
				case 11: arr41[j]="November"; break;
				case 12: arr41[j]="December"; break;
			}
			
		}*/
		var myLineChart5 = new Chart(ctx5, {
			type : 'bar',

			data : {
				labels : arr41,
				datasets : [ {
					label : "sales amount",
					backgroundColor : "rgba(85,56,48,1)",
					borderColor : "rgba(85,56,48,1)",
					data : arr42,
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
	<script type="text/javascript">
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();


	$(document).ready(function(){
	  
	  
	  /*****************
	   BUILD THE SLIDER
	  *****************/
	  //set width to be 'x' times the number of slides
	  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	  
	    //next slide  
	  $('#next').click(function(){
	    slideRight();
	  });
	  
	  //previous slide
	  $('#previous').click(function(){
	    slideLeft();
	  });
	  
	  
	  
	  /*************************
	   //*> OPTIONAL SETTINGS
	  ************************/
	  //automatic slider
	  var autoSlider = setInterval(slideRight, 3000);
	  
	  //for each slide 
	  $.each($('#slider-wrap ul li'), function() { 

	     //create a pagination
	     var li = document.createElement('li');
	     $('#pagination-wrap ul').append(li);    
	  });
	  
	  //counter
	  countSlides();
	  
	  //pagination
	  pagination();
	  
	  //hide/show controls/btns when hover
	  //pause automatic slide when hover
	  $('#slider-wrap').hover(
	    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
	  );
	  
	  

	});//DOCUMENT READY
	  


	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	  pos--;
	  if(pos==-1){ pos = totalSlides-1; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
	  
	  //*> optional
	  countSlides();
	  pagination();
	}


	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	  pos++;
	  if(pos==totalSlides){ pos = 0; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	  
	  //*> optional 
	  countSlides();
	  pagination();
	}



	  
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	  $('#counter').html(pos+1 + ' / ' + totalSlides);
	}

	function pagination(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	</script>
</body>

</html>