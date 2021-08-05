<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- get session -->
<% String agentid = (String) session.getAttribute("sessionId");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="css/styles.css" rel="stylesheet" />
 <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <style>
    
             .bg-dark
      {
        background-color:#212529 !important;
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
.center {
    margin: auto;
    width: 70%;
    padding: 20px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}


    
    </style>
  </head>
  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-2 me-5" href="index.html"
        >Agent Management System</a
      >
      <!-- Sidebar Toggle-->
      <button
        class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
        id="sidebarToggle"
        href="#!"
      >
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
        "
      ></form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            ><i class="fas fa-user fa-fw"></i
          ></a>
          <ul
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="navbarDropdown"
          >
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
                            <a class="nav-link" href="ViewOrderController?id=<%= agentid %>">
                                <div class="sb-nav-link-icon"><i class="fas fa-truck"></i></div>
                                View Order
                            </a>
                            <a class="nav-link" href="viewProductController">
                                <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i></div>
                                Create Order
                            </a>
                            <a class="nav-link" href="cart.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                View Cart <span class="badge badge-danger ml-2"><c:out value=" ${cart.size()}">  </c:out>  </span>
                            </a>
                            <a class="nav-link" href="viewReturnOrderForAgent?id=<%= agentid %>">
                                <div class="sb-nav-link-icon"><i class="fas fa-exchange-alt"></i></div>
                                View Return Order
                            </a>
    
                        </div>
                    </div>

          <div class="sb-sidenav-footer">
            <div class="small">Logged in as: </div>
           <%= agentid %> <c:out value="${ag.agentname}" />
          </div>
        </nav>
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Receipt</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
           <div class="agileinfo-ads-display col-md-13 "  >
                    <div class="wrapper center" >
                        <!-- first section -->
                        <div class="product-sec2" id="print">
                            <p align="center" style="color: #000000;"> Your order will be ready after our representative validate your payment.</p>
                            <p align="center" style="color: #000000;"> Thank you for Shopping with us!</p>
                            <div class="table-responsive">
                                <p style="color: #575757;"><b>Order ID:</b> <c:out value="${od.orderid}" /> 
                                <p style="color: #575757;"><b>Payment ID:</b> <c:out value="${od.paymentid}"/>
                                <p style="color: #575757;"><b>Name:</b> <c:out value="${od.agentname}"/>
                                <p style="color: #575757;"><b>Address:</b> <c:out value="${od.agentaddress}"/>
                                <p style="color: #575757;"><b>Phone No:</b> <c:out value="${od.agentphoneno}"/>
                                <table class="timetable_pay">
                                    <tr>
                                        <th> Item Name </th>
                                        <th> Unit Price </th>
                                        <th> Quantity </th>
                                        <th> Total Price (RM)</th>
                                        <th> Action</th>
                                    </tr>
											<c:forEach items="${roList}" var="ro">
                                        <tr>
                                            <td><c:out value="${ro.productName}"/></td>   
                                            <td>RM <c:out value="${ro.productPrice}"/></td>
                                            <td><c:out value="${ro.cart.productquantity}" /></td>
                                            <td><c:set var="totalprice" value="${totalprice+ro.productPrice*ro.cart.productquantity}"/>
											<c:out value="${totalprice}"/></td>
											<td><a href="CreateReturnOrderController?id=${ro.productId}">
											<button type="submit" value="Return">Return</button></a></td>
                                            										                                           
                                        </tr>
                                        </c:forEach>	
                                
                                      <tr>
                                        <th colspan=2 class="timetable_pay2"> TOTAL </th>
                                         <th><c:out value="${od.orderquantity}" /></th>
                                        <th>RM<c:out value="${od.ordertotalprice}" /></th>
                                        <th></th>
                                    </tr>		
                                </table>
                            </div>
                            <br><br>
                             
                        </div>
                        <!-- //first section -->
                    </div>
                </div>
          
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">
                Copyright &copy; Agent Management System
              </div>
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="js/datatables-simple-demo.js"></script>
    <script>
        function printDiv() {
            var divContents = document.getElementById("print").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
      
            a.document.write(divContents);
            a.document.close();
            a.print();
        }
    </script>
  </body>
</html>
