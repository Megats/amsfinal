<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


 	<!-- get session -->
	<% String agentid = (String) session.getAttribute("sessionId");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- JavaScript Bundle with Popper -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <style>
    	.bg-secondary{
				background-color:white !important;
				box-shadow: 0px 5px 10px #212121;
			    margin-bottom:20px;
			    padding:10px;
			    display:flex;
			    align-items:center;
			    text-align:center;
			    padding-bottom:30px;
			    flex-direction:column;
			}
			
			.btn-info {
    color:white;
    background-color: black;
box-shadow: 0px 5px 10px #212121;
border-color:black;
}
			.btn-info:hover
			{
			 color:black;
          background-color: white;
          border-color:black;
          
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
                padding:20px;
            }
            table.search-sec input[type=search] {
                width:400px;
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
    
    </style>
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-2 me-5" href="index.html">Agent Management System</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="ViewAgentForAgentViewController?id=<%= agentid %>">Profile</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="LogoutController">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
              <div class="sb-sidenav-menu-heading">Agent</div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseLayouts"
                aria-expanded="false"
                aria-controls="collapseLayouts"
              >
                <div class="sb-nav-link-icon"><i class="fas fa-truck"></i></div>
                Order
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseLayouts"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="ViewOrderController?id=<%= agentid %>">View Order</a>
                  <a class="nav-link" href="viewProductController"
                    >Create Order</a
                  >
                  <a class="nav-link" href="cart.jsp"
                    >View Cart</a
                  >
                  <a class="nav-link" href="viewReturnOrderForAgent?id=<%= agentid %>"
                    >View Return Order</a
                  >
                </nav>
              </div>
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
                        <h1 class="mt-4">Create Order</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                     <div class="row">
                                    <c:forEach var="p" items="${prod}">
                                        <div class="col-2 col-sm-3">
                                            <div class="card bg-secondary text-white">
                                                <div class="card-border">
                                                    <div class="item-img">
                                                        <img class="card-img-top" src="data:image/jpg;base64,${p.base64Image}" alt="Card image" width="150" height="200">
                                                    </div>
                                                    <div class="card-body"  style="height:50%; color:black;">
                                                        <c:out value="${p.productId}" /><br>
                                                        <div class="item-caption">                                                           
                                                            <b><c:out value="${p.productName}"/></b>
                                                        </div>
                                                        <div class="item-price">RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${p.productPrice}"/></div>
                                                        <br>
                                                        <div class="item-caption-2">Type: <i><c:out value="${p.productType}"/></i>
                                                        <br>  
                                                            <c:out value="${p.productDescription}"/><br><br>
                                                            <c:out value="${p.productQuantity}"/> more left
                                                        </div>
                                                        <br><br><br>
                                                        <c:if test="${p.productQuantity >= 1}">
                                                            <a href="CustomerAddCartController?id=${p.productId}"><button class="btn btn-info" onclick="showAlertSuccessfulAdd()">Add To Cart</button></a>
                                                        </c:if>
                                                        <c:if test="${p.productQuantity < 1}">
                                                            <center><div class="item-status sold-out">SOLD OUT</div></center>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div> 
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Agent Management System</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
	