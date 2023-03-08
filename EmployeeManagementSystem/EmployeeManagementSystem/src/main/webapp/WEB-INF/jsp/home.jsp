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
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">welcome to home page</span>
			</a>

			<ul class="nav nav-pills">
				<li class="nav-item"><a
					href="http://localhost:8080/EmployeeMangementSystem/"
					class="nav-link active" aria-current="page">Home</a></li>
				<li class="nav-item"><a href="empform" class="nav-link">Add
						Employee</a></li>
				<li class="nav-item"><a href="viewemp" class="nav-link">View</a></li>
				<li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>

			</ul>
		</header>

		<h2 style="text-align : center;">Employee Management System</h2>
		<div class="row text-center">
		 <div class="col">
			<h1>Employee Management System</h1><br></br>
		</div>
		
	

		<div class="row row-cols-1 row-cols-md-2 mb-3 text-center" >
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-white bg-primary border-primary">
						<h4 class="my-0 fw-normal">Add Employee</h4>
					</div>
					<div class="card-body">

						<ul class="list-unstyled mt-3 mb-4">
							<li>Register New User</li>
							<li>It's Free to add</li>
							<li>Email support</li>
							<li>Help center access</li>
						</ul>
						<a href="empform"><button type="button"
								class="w-100 btn btn-lg btn-primary">Sign up Employee</button></a>
					</div>
				</div>
			</div>


			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-white bg-primary border-primary">
						<h4 class="my-0 fw-normal">View Employee</h4>
					</div>
					<div class="card-body">

						<ul class="list-unstyled mt-3 mb-4">
							<li>Show All employee</li>
							<li>its free to add</li>
							<li>Phone and email support</li>
							<li>Help center access</li>
						</ul>
						<a href="viewemp">
							<button type="button" class="w-100 btn btn-lg btn-primary">Show</button>
						</a>
					</div>
				</div>
			</div>
		</div>

</div>


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
</div>
</body>
</html>

