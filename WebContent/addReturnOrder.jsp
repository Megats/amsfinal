<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- get session -->
<% String agentid = (String) session.getAttribute("sessionId");%>
<% 
  //prevent Caching of JSP pages
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  //get the session and check if session is null, redirect to login page
  if(session.getAttribute("currentSessionUser")==null){
	  System.out.println("No session");
      response.sendRedirect("index.jsp");
  }
  
  
  %>

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
<!-- CSS only -->
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
	box-shadow: 0px 10px 15px 0px #d6d6d6;
	padding: 30px 20px;
	margin-bottom: 14px;
}

* {
	box-sizing: border-box;
}

table.item-list tr td {
	padding: 20px;
}

table.search-sec input[type="search"] {
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
	font-family: "Balsamiq Sans", cursive;
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

.label {
	font-weight: bold;
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
						href="ViewAgentForAgentViewController?id=<%= agentid %>">Profile</a>
					</li>
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
					Username
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Create Return Order</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<form action="AddReturnOrderController" method="post"
						enctype="multipart/form-data">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Agent
								ID:</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="inputPassword"
									name="orderid" value="<c:out value="${c.orderid}"/>" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Product
								ID:</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="inputPassword"
									name="productid" value="<c:out value="${c.productid}"/>"
									readonly>

							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Return
								Order Quantity:</label>
							<div class="col-sm-2">
								<input type="number" class="form-control" id="inputPassword"
									name="returnOrderQuantity" min="1" max="${c.productquantity}">

							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Return
								Order Status:</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="inputPassword"
									name="returnOrderStatus" value="Not approved yet" readonly>

							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Return
								Order Image:</label>
							<div class="col-sm-3">
								<input type="file" class="form-control" id="inputPassword"
									name="returnOrderImage">

							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label label">Return
								Order Description:</label>
							<div class="col-sm-4">

								<textarea class="form-control" name="returnOrderDescription"
									id="exampleFormControlTextarea1" rows="3"></textarea>

							</div>
						</div>
						<button type="submit" class="btn btn-outline-dark mt-2">Submit</button>
						<div
							class="alert alert-success alert-dismissible fade show mt-3 col-sm-4"
							id="notice" style="display: none;">
							<strong>Success!</strong> Your information has been successfully
							submit.
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
					</form>
					<c:choose>
						<c:when test="${success.equals('Update success')}">
							<script>
       $("#notice").show();
       setTimeout(function(){ 
    	      $("#notice").fadeOut();
    	}, 5000);</script>
						</c:when>
					</c:choose>
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