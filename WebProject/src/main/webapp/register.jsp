<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
 <link href="css/style.css" rel="stylesheet" type="text/css"/>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
body {
	background-color: gray;
}
</style>
<title>Register</title>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class=" col-md-6 offset-md-3">
				<div class="card mt-4  fadeInDown">
					<div class="card-body">

						<div class="text-center">
							<h1 class="card-title mb-4">Register</h1>
						</div>


						<form action="Register" method="post">
							<div class="mb-3">
								<label for="first_name" class="form-label"> First_Name</label> <input
									type="text" class="form-control" id="first_name"
									name="first_name" aria-describedby="nameHelp">

							</div>
							<div class="mb-3">
								<label for="last_name" class="form-label"> Last_Name</label> <input
									type="text" class="form-control" id="last_name"
									name="last_name" aria-describedby="nameHelp">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1">
							</div>

							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="male" value="Male"> <label class="form-check-label"
									for="male"> Male </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="female" value="Female"> <label
									class="form-check-label" for="female"> Femal</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>
				
						    <div class="text-center mt-4">
							    <a class="btn btn-primary" href="login.jsp">Login</a>
							</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>