<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 	<!-- get session -->
	<% String agentid = (String) session.getAttribute("sessionId");%>
	
	
<!DOCTYPE html>
<html>
<title>AGENT MANAGEMENT SYSTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}

body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

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
.kelas-baru{
	background-color: pink;
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
<script>
	function productCheck(that) {
    if (that.value == "serunding") {
		document.getElementById("choose").style.display = "block";
        document.getElementById("quantity").min = "30";
    } 
	else if (that.value == "cordial1") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "15";
    }
	else if (that.value == "cordial2") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "15";
    }
	else if (that.value == "jam") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "24";
    }
	else if (that.value == "sambal") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "24";
    }
	else if (that.value == "dried") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "30";
    }
	else if (that.value == "originalscones") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "20";
    }
	else if (that.value == "assortedscones") {
		document.getElementById("choose").style.display = "none";
        document.getElementById("quantity").min = "20";
    }
	
	else {
        document.getElementById("quantity").min = "0";
    }
}
	function total(){
		alert('Order submitted');
	}
</script>
<body>

<!-- Sidenav/menu -->
<nav class="w3-sidenav w3-collapse w3-top w3-large w3-padding kelas-baru" style="z-index:3;width:300px;font-weight:bold;" id="mySidenav"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-padding-xlarge w3-hide-large w3-display-topleft w3-hover-white" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
      <img height="180px" src="picture/company_logo-removebg-preview.png"/>
    <h3 class="w3-padding-64"><b><u>AGENT MANAGEMENT SYSTEM</u></b></h3>
  </div>
 
  <a href="ViewOrderController?id=<%= agentid %>" onclick="w3_close()" class="w3-padding w3-hover-white">Home</a>
  <div class="w3-padding w3-hover-white" onclick="myAccFunc()" style="cursor:pointer">
  Order <i class="fa fa-caret-down"></i></div>
  <div id="demoAcc" class="w3-hide w3-blue-pale w3-card-4">
    <a href="ViewOrderController?id=<%=agentid%>" class="w3-padding w3-hover-white" >View Order</a>
    <a href="viewProductController">Create Order</a>
    <a href="cart.jsp" class="w3-padding w3-hover-white" >View Cart</a>
    <a href="viewReturnOrderForAgent?id=<%= agentid %>" class="w3-padding w3-hover-white" >View Return Order</a>
    

  </div>
<div class="w3-padding w3-hover-white" onclick="myAccFunc1()" style="cursor:pointer">
	Agent <i class="fa fa-caret-down"></i></div>
  			<div id="demoAcc1" class="w3-hide w3-blue-pale w3-card-4">
			<a href="ViewAgentForAgentViewController?id=<%= agentid %>" class="w3-padding w3-hover-white" >View Agent</a>
		</div>
		<a onclick='confirmationLogout(this);return false;' href="LogoutController" class="w3-padding w3-hover-white">Logout</a>
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

  
   <fieldset>
  <legend>My cart</legend>
<br>
	<table><tr>
			<th>Product id</th>
			<th>Product name</th>	
			<th>Product price</th>
			<th>Quantity</th>
			<th>Action</th>
	<tr><c:set var="count" value="0" scope="page" />
<form action="AddToCartController" method="post">
	  <c:forEach var="c" items="${cart}">
			 <input type="hidden" name="productid" value="${c.productid}">
			 <td><c:out value="${c.productid}" /></td>
			 <td><c:out value="${c.productname}" /></td>
			 <td><c:out value="${c.productprice}" /></td>
			 <c:set var="totalprice" value="${totalprice+c.productprice*c.productquantity}"/>
			 <c:set var="totalquantity" value="${totalquantity+c.productquantity}"/>
			 
			 <td>			
			 					<div class="form-group d-flex justify-content-between">
							
								<a href="quantity-inc-dec?action=dec&productid=${c.productid}">
								<i class="fas fa-minus-square"></i>
								</a>
								<input type="number" name="quantity"  value="${c.productquantity}" > 
							
								<a href="quantity-inc-dec?action=inc&productid=${c.productid}">
								<i class="fas fa-plus-square"></i></a>
								

							</div>
			 </td>
			 <td><a href="RemoveCartController?id=${count}" rel="tooltip" class="w3-btn w3-red w3-round-large">Remove</a></td>
			  <c:set var="count" value="${count+1}" scope="page"/>
			 </tr>
	</c:forEach>
	</table>
	<input type="hidden" name="totalquantity" value="${totalquantity}" />
	<input type="hidden" name="agentid" value="<%= agentid %>">
	<input type="hidden" name="orderdate" id="formdate"><br>
	Total Price is : RM<c:out value="${totalprice}"/>0
	<input type="hidden" name="totalprice" value="${totalprice}"/><br><br>
	<button type="submit" value="Checkout" value="Checkout" position="right"/>Checkout</a>
	<br>
		
</form> 
</fieldset>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-8 footer" style="margin-top:45px;padding-right:58px"><p class="w3-right"><p align="center">© 2020 Agent Management System</p>

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
function confirmationLogout(anchor)
{
	var conf = confirm('Are you sure want to Logout?');
	if(conf)
	window.location=anchor.attr("href");
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}


</script>
</div>
</body>
</html>
