<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
     	<!-- get session -->
	<% String suppliername = (String) session.getAttribute("sessioname");%>
	<% String supplierposition = (String) session.getAttribute("sessionPosition"); %>
	<% String sessionid = (String)session.getAttribute("sessionId"); %>
	
<!DOCTYPE html>
<html>
<title>AGENT MANAGEMENT SYSTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <!--pop-up-box-->
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!--//pop-up-box-->
    <!-- price range -->
    <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
    <!-- fonts -->
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
<style>
			.bg-secondary{
				background-color:#ddffff!important;
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
                height: 25px;
                font-size: 20px;
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
                padding: 10px;
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
    <h1 class="w3-jumbo"><b>List of Product</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>
  

 
 <div class="ads-grid">
 <center>
            <div class="container">
                <!-- tittle heading -->
				<span style="margin-right:1100px;margin-bottom:20px; text-align:left; display: inline-table;">               
                </span>    
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                                <div class="row">
                                    <c:forEach var="p" items="${prod}">
                                        <div class="col-6 col-sm-4">
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
                                                        <div class="item-price">RM<c:out value="${p.productPrice}"/>0</div>
                                                        <br>
                                                        <div class="item-caption-2">Type: <i><c:out value="${p.productType}"/></i>
                                                        <br>  
                                                            <c:out value="${p.productDescription}"/><br><br>
                                                            <c:out value="${p.productQuantity}"/> more left
                                                        </div>
                                                        <br><br><br>
                                                        <c:if test="${p.productQuantity >= 1}">
                                                        <a href="updateProductController?id=${p.productId}"><button class="btn btn-info" onclick="showAlertSuccessfulAdd()">Update</button></a>
                                                        
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
</body>   
 <!-- Photo grid (modal) 
	<div class="w3-row-padding">
		<div class="w3-half">
		<img src="../pictures/group.jpg" style="width:100%" onclick="onClick(this)" alt="Signature Liberty Hotel">
		<img src="../pictures/hotel.gif" style="width:100%" onclick="onClick(this)" alt="Hotel.gif">
		</div>
    <div class="w3-half">
		<img src="../pictures/bed.jpg" style="width:100%" onclick="onClick(this)" alt="Bed">
		<img src="../pictures/toilet.jpg" style="width:100%" onclick="onClick(this)" alt="Kids.jpg">
    </div></div>
	
Modal for full size images on click
  <div id="modal01" class="w3-modal w3-black w3-padding-0" onclick="this.style.display='none'">
    <span class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div> -->

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-8" style="margin-top:45px;padding-right:58px"><p class="w3-right"><p align="center">© 2020 Agent Management System</p>

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