<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
     	<!-- get session -->
	<% String suppliername = (String) session.getAttribute("sessioname");%>
	<% String supplierposition = (String) session.getAttribute("sessionPosition"); %>
	<% String sessionid = (String)session.getAttribute("sessionId"); %>
	
<!DOCTYPE html>
<html>
<title>AGENT MANAGEMENT SYSTEM</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}

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
div.a{
border: solid;
padding:15px;
width:50%;
border-width: thin;
margin-left: auto;
margin-right: auto;
background-color:white;
text-align:center;
border-color:white;
}

.oval {
                width: 85px;
                height: 50px;
                background: yellow;
                border-radius: 100px;
                float:left;
                margin-right:2%;
                }
.ovala {
                width: 85px;
                height: 50px;
                background: #32CD32;
                border-radius: 100px;
                float:left;
                }

.classbaru {
				display:flex;
				justify-content:center;
}

.footer
{
  position:absolute;
  bottom:0;
  width:100%;
  margin-left:100px;
  text-align:center;
  left:0;
}

</style>

<body>

<!-- Sidenav/menu -->
	<nav
		class="w3-sidenav w3-pale-blue w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold;" id="mySidenav">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-padding-xlarge w3-hide-large w3-display-topleft w3-hover-white"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container">
			<img height="180px" src="picture/company_logo-removebg-preview.png" />
			<h3 class="w3-padding-64">
				<b><u>AGENT MANAGEMENT SYSTEM</u></b>
			</h3>
		</div>

		<a href="ListOrderController" onclick="w3_close()"
			class="w3-padding w3-hover-white">Home</a>
		<div class="w3-padding w3-hover-white" onclick="myAccFunc()"
			style="cursor: pointer">
			Order <i class="fa fa-caret-down"></i>
		</div>
		<div id="demoAcc" class="w3-hide w3-blue-pale w3-card-4">
			<a href="ListOrderController" class="w3-padding w3-hover-white">View
				Order</a> <a href="ListPaymentController"
				class="w3-padding w3-hover-white">View Payment</a> <a
				href="ViewReturnOrder" class="w3-padding w3-hover-white">View
				Return Order</a>
		</div>
		<div class="w3-padding w3-hover-white" onclick="myAccFunc1()"
			style="cursor: pointer">
			Product <i class="fa fa-caret-down"></i>
		</div>
		<div id="demoAcc1" class="w3-hide w3-blue-pale w3-card-4">
			<a href="viewProductSupplier" class="w3-padding w3-hover-white">View
				Product</a> <a href="addProduct.jsp" class="w3-padding w3-hover-white">Add
				Product</a>
		</div>
		<div class="w3-padding w3-hover-white" onclick="myAccFunc2()"
			style="cursor: pointer">
			Agent <i class="fa fa-caret-down"></i>
		</div>
		<div id="demoAcc2" class="w3-hide w3-blue-pale w3-card-4">
			<a href="ListAgentController" class="w3-padding w3-hover-white">View
				Agent</a> <a href="addAgent.jsp" class="w3-padding w3-hover-white">Add
				Agent</a>

			<%
				//Remove '@' 
			if (supplierposition.equals("supplier")) {
			%><div hidden="hidden">
				<a href="addSupplier.jsp" class="w3-padding w3-hover-white">Add
					Supplier</a>
			</div>
			<%
				} else {
			%>
			<a href="addSupplier.jsp" class="w3-padding w3-hover-white">Add
				Supplier</a>
			<%
				}
			%>
			<%
				//Remove '@' 
			if (supplierposition.equals("supplier")) {
			%><div hidden="hidden">
				<a href="ListSupplierController" class="w3-padding w3-hover-white">View
					Supplier</a>
			</div>
			<%
				} else {
			%>
			<a href="ListSupplierController" class="w3-padding w3-hover-white">ViewSupplier</a>
			<%
				}
			%>
		</div>
		<%
			//Update supplier info 
		if (supplierposition.equals("Admin")) {
		%><div hidden="hidden">
			<div class="w3-padding w3-hover-white" onclick="myAccFunc3()"
				style="cursor: pointer">
				Supplier <i class="fa fa-caret-down"></i>
			</div>
			<div id="demoAcc3" class="w3-hide w3-blue-pale w3-card-4">
				<a href="viewSupplierInformation?id=<%=sessionid%>"
					class="w3-padding w3-hover-white">View Supplier</a>
				<%
					} else {
				%>
				<div class="w3-padding w3-hover-white" onclick="myAccFunc3()"
					style="cursor: pointer">
					Supplier <i class="fa fa-caret-down"></i>
				</div>
				<div id="demoAcc3" class="w3-hide w3-blue-pale w3-card-4">
					<a href="viewSupplierInformation?id=<%=sessionid%>"
						class="w3-padding w3-hover-white">View Supplier</a>
					<%
						}
					%>
				</div></div></div>
				<a onclick='confirmationLogout(this);return false;'
					href="LogoutController" class="w3-padding w3-hover-white">Logout</a>
	</nav>

	<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-pale-blue w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-pale-blue w3-margin-right" onclick="w3_open()">☰</a>
  <span>AGENT MANAGEMENT SYSTEM</span>
</header>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <!-- Header -->
  <div class="w3-container" style="margin-top:20px" id="home">
    <h1 class="w3-jumbo"><b>View Order Detail</b></h1>
    <h1 class="w3-xxxlarge w3-text-black">Order id:</u></b>
    <c:out value="${od.orderid}"/>    	</h1>
    
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>

<form action="UpdateOrderController" method="post">
 <div class="agileinfo-ads-display col-md-13 w3l-rightpro">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="product-sec2">

                            <div class="table-responsive">

                                <table class="timetable_pay">
                                    <tr>
                                        <th> Item Name </th>
                                        <th> Unit Price </th>
                                        <th> Quantity </th>
                                        <th> Total Price (RM)</th>
                                    </tr>
											<c:forEach items="${roList}" var="ro">
                                        <tr>
                                            <td><c:out value="${ro.productName}"/></td>   
                                            <td>RM <c:out value="${ro.productPrice}"/>0</td>
                                            <td><c:out value="${ro.cart.productquantity}" /></td>
                                            <td><c:set var="totalprice" value="${totalprice+ro.productPrice*ro.cart.productquantity}"/>
											<c:out value="${totalprice}"/>0</td>
											</c:forEach>
                                        </tr>
                                    <tr>
                                        <th colspan=2 class="timetable_pay2"> TOTAL </th>
                                         <th><c:out value="${od.orderquantity}" /></th>
                                        <th>RM<c:out value="${od.ordertotalprice}" />0</th>
                                   
                                    </tr>
                                </table><br>
                                <div class="classbaru">
                                <div class="oval"><c:out value="${od.orderstatus}"/></div>
								<div class="ovala"><c:out value="${od.paymentstatus}"/></div>
								
                                <input type="hidden" name="orderid" value="<c:out value="${od.orderid}"/>">
							    	 <select name="status" <c:if test="${od.paymentstatus.equals('Payment Pending')}"><c:out value="disabled='disabled'"/></c:if>">
							    	     	<option value="Pending">Pending</option>
							    			<option value="Dispatch">Dispatch</option>
							    			<option value="Delivered">Delivered</option>
							    	</select>
							    	<input type="submit" name="Submit">
                           		</div>
                            </div>
                            <br><br>

                        </div>
                        </div>
                  </div>
                  </form>
                  
<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-8 footer" style="margin-top:45px;padding-right:58px"><p class="w3-right"><p align="center">© 2020 Agent Management System</p></div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Accordion
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function myAccFunc1() {
    var x = document.getElementById("demoAcc1");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function myAccFunc2() {
    var x = document.getElementById("demoAcc2");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function myAccFunc3() {
    var x = document.getElementById("demoAcc3");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}

function confirmationLogout(anchor)
{
	var conf = confirm('Are you sure want to Logout?');
	if(conf)
	window.location=anchor.attr("href");
}

</script>

</body>
</html>