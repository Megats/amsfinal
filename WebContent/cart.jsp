<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- get session -->
<% String agentid = (String) session.getAttribute("sessionId");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style>
.bg-secondary {
	background-color: white !important;
	box-shadow: 0px 5px 10px #212121;
	margin-bottom: 20px;
	padding: 10px;
	display: flex;
	align-items: center;
	text-align: center;
	padding-bottom: 30px;
	flex-direction: column;
}

.btn-info {
	color: white;
	background-color: black;
	box-shadow: 0px 5px 10px #212121;
	border-color: black;
}

.btn-info:hover {
	color: black;
	background-color: white;
	border-color: black;
}

.product-sec2 {
	box-shadow: 0px 10px 15px 0px #D6D6D6;
	padding: 30px 20px;
	margin-bottom: 14px;
}

* {
	box-sizing: border-box;
}

table.item-list tr td {
	padding: 20px;
}

table.search-sec input[type=search] {
	width: 400px;
}

.item-img img {
	margin: 5px;
	width: 190px;
	height: 200px;
}

.item-caption {
	margin: 5px 5px;
	font-size: 1.1vw;
	color: black;
}

.item-caption-2 {
	margin: 5px 5px;
	height: 5px;
	font-size: 12px;
	color: black;
}

.item-price {
	height: 10px;
	padding-top: 0px;
	font-size: 20px;
	color: #3fbf48;
	margin: 10px 5px 0px 5px;
}

.card-border {
	margin: 10px;
	padding: 5%;
	height: 450px;
	border-radius: 10px;
}

.item-status {
	margin-top: 8px;
	font-family: 'Balsamiq Sans', cursive;
	border-radius: 4px;
	padding-top: 8px;
	border: 1px transparent;
	width: 100px;
	height: 35px;
}

.sold-out {
	font-size: 15px;
	color: white;
	background-color: #de4f35;
}

::placeholder {
	color: black;
}

input[type="search"]:active, input[type="search"]:focus {
	color: black;
}

.bg-dark {
	background-color: #212529 !important;
}

.breadcrumb {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	padding: 0 !important;
	margin-bottom: 1rem;
	list-style: none;
	background-color: transparent !important;
	border-radius: .25rem;
}

.inc-dec {
	font-size: 20px;
}

input[type="number"] {
	text-align: center;
}
</style>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-2 me-5" href="index.html">Agent
			Management System</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item"
						href="ViewAgentForAgentViewController?id=<%= agentid %>">Profile</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="LogoutController">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Agent</div>
						<a class="nav-link" href="ViewOrderController?id=<%= agentid %>">
							<div class="sb-nav-link-icon">
								<i class="fas fa-truck"></i>
							</div> View Order
						</a> <a class="nav-link" href="viewProductController">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cubes"></i>
							</div> Create Order
						</a> <a class="nav-link" href="cart.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-shopping-cart"></i>
							</div> View Cart <span class="badge badge-danger ml-2"><c:out
									value=" ${cart.size()}">
								</c:out> </span>
						</a> <a class="nav-link"
							href="viewReturnOrderForAgent?id=<%= agentid %>">
							<div class="sb-nav-link-icon">
								<i class="fas fa-exchange-alt"></i>
							</div> View Return Order
						</a>

					</div>
				</div>

				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<%= agentid %>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Cart</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">My Cart</li>
					</ol>
					<div class="row">
						<form action="AddToCartController" method="post">
							<div class="col-12">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">PRODUCT ID</th>
												<th scope="col">PRODUCT NAME</th>
												<th scope="col" class="text-center">PRODUCT PRICE (RM)</th>
												<th scope="col" class="text-center">QUANTITY</th>
												<th scope="col" class="text-center">ACTION</th>
												<th></th>
											</tr>
											<c:set var="count" value="0" scope="page" />
										</thead>
										<tbody>

											<c:forEach var="c" items="${cart}">
												<tr>
													<input type="hidden" name="productid"
														value="${c.productid}">
													<td><c:out value="${c.productid}" /></td>
													<td><c:out value="${c.productname}" /></td>
													<td class="text-center"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${c.productprice}" /></td>
													<c:set var="totalprice"
														value="${totalprice+c.productprice*c.productquantity}" />
													<c:set var="totalquantity"
														value="${totalquantity+c.productquantity}" />

													<td>
														<div class="form-group d-flex justify-content-center">

															<a class="inc-dec"
																href="quantity-inc-dec?action=dec&productid=${c.productid}">
																<i class="fas fa-minus-square"></i>
															</a>
															<div class="col-sm-3 mr-2 ml-2">
																<input type="number" name="quantity"
																	class="form-control" value="${c.productquantity}"
																	readonly>
															</div>
															<a class="inc-dec"
																href="quantity-inc-dec?action=inc&productid=${c.productid}">
																<i class="fas fa-plus-square"></i>
															</a>


														</div>
													</td>
													<td scope="col" class="text-center"><a
														href="RemoveCartController?id=${count}" rel="tooltip"
														class="w3-btn w3-red w3-round-large"><i
															style="color: red; font-size: 20px;" class="fas fa-trash"></i></a></td>
													<td></td>
													<c:set var="count" value="${count+1}" scope="page" />
												</tr>
											</c:forEach>
										<thead>
											<tr>
												<th></th>
												<th></th>
												<th></th>

												<th class="text-right"><strong></strong></th>
												<th class="text-center"><strong>Total : RM<fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${totalprice}" /></strong></th>
												<th></th>
											</tr>
										</thead>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col mb-2 ">
								<div class="row  d-flex justify-content-center">
									<div class="col-sm-5  col-md-2">
										<a href="viewProductController"><button
												class="btn btn-block btn-light">Continue Shopping</button></a>
									</div>
									<div class="col-sm-5 col-md-2 text-right">
										<input type="hidden" name="totalquantity"
											value="${totalquantity}" /> <input type="hidden"
											name="agentid" value="<%= agentid %>"> <input
											type="hidden" name="orderdate" id="formdate"> <input
											type="hidden" name="totalprice" value="${totalprice}" />
										<c:choose>
											<c:when test="${cart.size() == 0 }">
												<button type="submit"
													class="btn btn-lg btn-block btn-success text-uppercase"
													disabled>Checkout</button>
											</c:when>
											<c:otherwise>
												<button type="submit"
													class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>

											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Agent Management
							System</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script>
        var date = new Date();

        var day = date.getDate(),
            month = date.getMonth() + 1,
            year = date.getFullYear(),
            hour = date.getHours(),
            min  = date.getMinutes();

        month = (month < 10 ? "0" : "") + month;
        day = (day < 10 ? "0" : "") + day;
        hour = (hour < 10 ? "0" : "") + hour;
        min = (min < 10 ? "0" : "") + min;

        var today = year + "-" + month + "-" + day,
            displayTime = hour + ":" + min; 

        document.getElementById('formdate').value = today;
        document.getElementById("formtime").value = displayTime;

        </script>
</body>
</html>
