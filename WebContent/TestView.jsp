<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>View</h1>

<table>
  <tr>
    <th>id</th>
    <th>Pictures</th>
  </tr>
 <c:forEach items="${ts}" var="t">

 <tr>
 	<td><c:out value="${t.id}" /></td><td>
  <img src="data:image/jpg;base64,${t.base64Image}" width="240" height="300" download/> Press this link to download 
</td> 
</tr>
</c:forEach>
</table>
</body>
</html>