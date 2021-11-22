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
			class="
          d-none d-md-inline-block
          form-inline
          ms-auto
          me-0 me-md-3
          my-2 my-md-0
        "></form>
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
					<c:out value="${ag.agentname}" />
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">View Return Order</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Return Order Table
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>RETURN ORDER ID</th>
										<th>RETURN ORDER QUANTITY</th>
										<th>RETURN ORDER STATUS</th>
										<th>RETURN ORDER IMAGE</th>
										<th>RETURN ORDER DESCRIPTION</th>
										<th>ORDER ID</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${roList}" var="ro">
										<tr>
											<td><c:out value="${ro.returnOrderId}" /></td>
											<td><c:out value="${ro.returnOrderQuantity}" /></td>
											<td><c:out value="${ro.returnOrderStatus}" /></td>
											<td><img src="data:image/jpg;base64,${ro.base64Image}"
												width="80" height="80" /></td>
											<td><c:out value="${ro.returnOrderDescription}" /></td>
											<td><c:out value="${ro.orderId}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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
</body>
</html>
