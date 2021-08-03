<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form action="InsertImageController" name="form1"  method="post" enctype = "multipart/form-data">
		
		Please enter id
		<input type="text" name="id">
		Please enter pictures
		<input type="file" name="image"><br><br>
		
		<input type="submit" name="submit" value="Submit">
		</form>
</body>
<a href="InsertImageController">View</a>
</html>