<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int columnCount = 0;
int rowCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);


%>
<head>
<meta charset="utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="./image/logo_rmbg.png">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MyongJi Furniture ERP</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="./css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
.stackstatus{
	display: inline-block;
 	margin-left: auto;
  	transition: transform 0.15s ease;
  	text-align: center;
  	background-color: #7D766D;
  	color:#FFF;
  	font-weight:bold;
  	width:25px;
  	height:25px;
  	border-radius:15px;
  	border:none;
  	outline:none;
}
</style>
</head>
<body class="sb-nav-fixed">
	<%
	String select = request.getParameter("pageChange");
	if (select == null) {
		select = "main.jsp";
	}
	%>


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="MJF_Layout.jsp">MyongJi Furniture ERP</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<!-- <input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button"> -->
					<i class="fas fa-search"></i>
				
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">기준정보</div>
						<a class="nav-link" href="?pageChange=MJF_MasterdataRegister.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>기준정보관리
						</a>
						<a class="nav-link" href="?pageChange=MJF_EmployeeInformationRegistration.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>영업사원관리
						</a>
						<a class="nav-link" href="?pageChange=MJF_ProductRegistration.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>품목등록
						</a>
						
						<div class="sb-sidenav-menu-heading">거래처</div>
						<a class="nav-link" href="?pageChange=MJF_AccountRegistration.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>거래처등록
						</a>
						<a class="nav-link" href="?pageChange=MJF_AccountList.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div>거래처조회
						</a>
						<div class="sb-sidenav-menu-heading">수주</div>
						<a class="nav-link" href="?pageChange=orderRegistration.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>수주등록
						</a> <a class="nav-link" href="?pageChange=orderListCheck.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div>수주조회
						</a>
						
						

						<div class="sb-sidenav-menu-heading">재고</div>
						<a class="nav-link" href="?pageChange=MJF_ProductSearch.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 재고관리
						</a> <a class="nav-link" href="?pageChange=MJF_BadProductList.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 불량재고관리
							<%
							int su=0;
							try {
								String sql = "SELECT count(*) from MJFdb.return_product where return_trash IS NULL;";
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								//String su;
								while(rs.next()){
									su = rs.getInt(1);
								}
								System.out.print(su);
								
								out.println("<input type=\"text\" class=\"stackstatus\" value=\""+su+"\">");

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
							
						</a>

						<div class="sb-sidenav-menu-heading">매출</div>
						<a class="nav-link" href="?pageChange=MJF_SalesRegistration2.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 매출등록
						</a>
						<a class="nav-link" href="?pageChange=MJF_SalesAggregation.jsp?tab=tab-1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 매출조회
						</a>
						<a class="nav-link" href="?pageChange=MJF_SalesStatus.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-bar"></i>
							</div> 매출현황
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:&nbsp;<%=session.getAttribute("member_name") %></div>
					
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<jsp:include page="<%=select%>" flush="true"></jsp:include>
				</div>
			</main>
			
		</div>
	</div>
	<script
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
	<script src="./js/datatables-simple-demo.js"></script>
</body>
</html>