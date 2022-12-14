
<%@page import="com.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page isErrorPage="true" %>
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
				<div class="card mt-4 fadeInDown">
					<div class="card-body">

						

						<div class="text-center">
							<h1 class="card-title mb-4 text-danger">Error</h1>
							
							<h3>Error has occured</h3>
							<h2 class="text-warn"><%=exception %></h2>
						</div>

				
						<div class="text-center mt-4">
							    <a class="btn btn-primary fadeIn fourth" href="login.jsp">Login</a>
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