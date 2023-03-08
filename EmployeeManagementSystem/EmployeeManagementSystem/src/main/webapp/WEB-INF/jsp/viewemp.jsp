
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
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Employee
					Management System</span>
			</a>

			<ul class="nav nav-pills">
				<li class="nav-item"><a
					href="http://localhost:8080/EmployeeManagementSystem/home"
					class="nav-link active" aria-current="page">Home</a></li>
				<li class="nav-item"><a href="empform" class="nav-link">Add
						Employee</a></li>
				<li class="nav-item"><a href="viewemp" class="nav-link">View</a></li>
				<li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
			</ul>
		</header>


		<h1>Employees List</h1><br><br>
		<table class="table">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Name</th>
				<th scope="col">Salary</th>
				<th scope="col">Designation</th>
				<th scope="col">Edit</th>
				<th scope="col">Delete</th>
			</tr>
			<c:forEach var="emp" items="${list}">
				<tr>
					<td scope="row">${emp.id}</td>
					<td scope="row">${emp.name}</td>
					<td scope="row">${emp.salary}</td>
					<td scope="row">${emp.designation}</td>
					<td scope="row"><a href="editemp/${emp.id}">Edit</a></td>
					<td scope="row"><a href="deleteemp/${emp.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	

		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
					<svg class="bi" width="30" height="24">
						<use xlink:href="#bootstrap"></use></svg>
				</a> <span class="text-muted">© 2021 Company, Inc</span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#twitter"></use></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#instagram"></use></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#facebook"></use></svg></a></li>
			</ul>
		</footer>
</body>
</html>

