<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- get session -->
<% String suppliername = (String) session.getAttribute("sessioname");%>
<% String supplierposition = (String) session.getAttribute("sessionPosition"); %>
<% String sessionid = (String)session.getAttribute("sessionId"); %>
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
<script>
window.onload = function() {

	var request = new XMLHttpRequest();
	request.open("GET", "https://microservicess.herokuapp.com/", true);
	request.onload = function() {
	    var order = JSON.parse(this.response);
	    var col = [];
	    for (var i = 0; i < order.length; i++) {
	        for (var key in order[i]) {
	            if (col.indexOf(key) === -1) {
	                col.push(key);
	            }
	        }
	    }

	    // CREATE DYNAMIC TABLE.
	    var table = document.createElement("table");

	    // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

	    var tr = table.insertRow(-1);                   // TABLE ROW.

	    for (var i = 0; i < col.length; i++) {
	        var th = document.createElement("th");      // TABLE HEADER.
	        th.innerHTML = col[i];
	        tr.appendChild(th);
	    }

	    // ADD JSON DATA TO THE TABLE AS ROWS.
	    for (var i = 0; i < order.length; i++) {

	        tr = table.insertRow(-1);

	        for (var j = 0; j < col.length; j++) {
	            var tabCell = tr.insertCell(-1);
	            if(j==0) {
	              var a = document.createElement("a");
	              a.href = "ViewDetailOrderController?id="+order[i][col[j]];
	              a.innerHTML = order[i][col[j]];
	              tabCell.appendChild(a);
	            }
	            else {
	              tabCell.innerHTML = order[i][col[j]];
	            }
	        }
	    }

	    // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
	    var divContainer = document.getElementById("showData");
	    divContainer.innerHTML = "";
	    divContainer.appendChild(table);
	}
	request.send();
	}
</script>
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

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	margin-left: 100px;
	text-align: center;
	left: 0;
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
					<%
             if (supplierposition.equals("Admin"))
             {
             %>
					<div hidden="hidden">
						<li><a class="dropdown-item"
							href="viewSupplierInformation?id=<%=sessionid%>">Profile</a></li>
						<li><hr class="dropdown-divider" /></li>

					</div>
					<%
             }
             else
             {
             %>
					<li><a class="dropdown-item"
						href="viewSupplierInformation?id=<%=sessionid%>">Profile</a></li>
					<li><hr class="dropdown-divider" /></li>
					<%
             }
             %>
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
						<div class="sb-sidenav-menu-heading">Supplier</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-truck"></i>
							</div> Order
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="ListOrderController">List Order</a>
								<a class="nav-link" href="ListPaymentController">List
									Payment</a> <a class="nav-link" href="ViewReturnOrder">List
									Return Order</a>
							</nav>
						</div>
					</div>
					<div class="nav">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cubes"></i>
							</div> Product
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="viewProductSupplier">List Product</a>
								<a class="nav-link" href="addProduct.jsp">Add Product</a>
							</nav>
						</div>
					</div>
					<div class="nav">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-users"></i>
							</div> Agent
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="ListAgentController">List Agent</a> <a
									class="nav-link" href="addAgent.jsp">Add Agent</a>
								<%
				//Remove '@' 
			               if (supplierposition.equals("supplier")) {
			                  %>
								<div hidden="hidden">
									<a class="nav-link" href="addSupplier.jsp">Add Supplier</a>

								</div>
								<% 
			               }
			               else
			               {
			            	 %>
								<a class="nav-link" href="addSupplier.jsp">Add Supplier</a>
								<%
			               }
			              %>
								<%
				//Remove '@' 
			               if (supplierposition.equals("supplier")) {
			                  %>
								<div hidden="hidden">
									<a class="nav-link" href="ListSupplierController">List
										Supplier</a>

								</div>
								<% 
			               }
			               else
			               {
			            	 %>
								<a class="nav-link" href="ListSupplierController">List
									Supplier</a>
								<%
			               }
			              %>

							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<%= sessionid %>
					<%= suppliername %>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">View Order</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Order Table
						</div>
						<div class="card-body">
							<p id="showData"></p>
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
	<c:choose>
						<c:when test="${success.equals('success')}">
							<script>
                            alert("Login Success");
							 </script>
						</c:when>
					</c:choose>
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
