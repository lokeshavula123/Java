<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee MNGT</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<style>
	html{
		background : skyblue;
	}
</style>
</head>
<body>
	<div class="container">
		<header
			class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
				<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Library Management System
					</span>
			</a>

			
		</header>
		<div style="width:800px; margin:0 auto;">
   
		<h1 >Add New Library User</h1>
		<form:form method="post" action="signup">
			<table class="center">
				<tr>
					<td>first Name :</td>
					<td><form:input class="form-control" path="first_name" name="firstname" /></td>
				</tr>
				<tr>
					<td>last name :</td>
					<td><form:input  class="form-control" path="last_name" /></td>
				</tr>
				<tr>
					<td>user id :</td>
					<td><form:input class="form-control" path="user_id" /></td>
				</tr>
				<tr>
					<td>password :</td>
					<td><form:input class="form-control" path="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td> <button type="submit" class="btn btn-primary">Submit</button> 	</td>
				</tr>
			</table>
		</form:form>
		
		  
    </div>
		
</body>
</html>
