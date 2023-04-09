<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="USER.UserDao"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"
	shrink-to-fit=no />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Business Casual - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="mainassets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="maincss/styles.css" rel="stylesheet" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="css/styles.css" rel="stylesheet" />
</head>


<body>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block">
			<span class="site-heading-lower">space to be together, MJF</span>
		</h1>
	</header>


	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
		<div class="container">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="index.html">Home</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="about.html">Monthly
							sales</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="products.html">Sales by
							salesperson</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="store.html">Sales by
							item</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<section class="page-section about-heading">
		<div class="container">
			<img class="img-fluid rounded about-heading-img mb-3 mb-lg-0"
				src="mainassets/img/main1.jpg" alt="..." />
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-9 col-lg-10 mx-auto">
						<div class="bg-faded rounded p-5">
							<h2 class="section-heading mb-4">
								<span class="section-heading-lower">About Our MJF</span>
							</h2>
							<p>A global mattress and furniture company focused on online
								sales. Establish global vertical integration across all areas
								from production to sales.</p>
							<P>The company manufactures almost all of its products
								in-house at overseas plants. It has specialized production
								facilities in China, Indonesia and the United States.</P>
							<P>The company pioneered an online sales channel in the bed
								market, which had been monopolized by bed and furniture stores,
								and marked the beginning of a radical change in the distribution
								market.</P>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<main>
	
		<!--<div id="chartContainer" style="height: 370px; width: 100%;"></div>-->
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area me-1"></i> 일별 매출 현황
			</div>
			<div class="card-body">
				<canvas id="myAreaChart" width="100%" height="30"
					src="assets/demo/chart-area-demo.js"></canvas>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 영업사원별 매출 현황
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="50"
							src="assets/demo/chart-bar-demo.js"></canvas>
					</div>

				</div>
			</div>
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 품목별 매출 현황
					</div>
					<div class="card-body">
						<canvas id="myPieChart" width="100%" height="50"
							src="assets/demo/chart-pie-demo.js"></canvas>
					</div>

				</div>
			</div>
		</div>
		</div>
	</main>












	<footer class="footer text-faded text-center py-5">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="mainjs/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-pie-demo.js"></script>

</body>
</html>