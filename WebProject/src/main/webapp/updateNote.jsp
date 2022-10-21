<%@page import="com.pojo.Note"%>
<%@page import="com.helper.ConnectionManager"%>
<%@page import="com.dao.NoteDao"%>
<%@page import="com.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
<%@ include file="navbar.jsp" %>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	NoteDao noteDao = new NoteDao(ConnectionManager.getConnection());
	Note note = noteDao.getNoteById(id);
	%>
	<div class="container mt-4">
		<div class="row">
			<div class=" col-md-6 offset-md-3">
				<div class="card mt-4 fadeInDown">
					<div class="card-body">

						<div class="text-center">
							<h1 class="card-title mb-4">Update Note</h1>
						</div>

						<form action="updateNote" method="post">

							<div class="mb-3">
								<input type="number" class="form-control" name="id"
									value="<%=note.getId()%>" hidden="true"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label fadeIn first">Title
									address</label> <input type="text" class="form-control" name="title"
									value="<%=note.getTitle()%>" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1"
									class="form-label fadeIn second">Date</label> <input
									type="date" class="form-control" name="date" required
									value="<%=note.getDate()%>" id="exampleInputPassword1">
							</div>

							<div class="form-floating">
								<textarea class="form-control" name="description"
									placeholder="Leave a comment here" id="floatingTextarea2"
									style="height: 100px"><%=note.getDesc()%></textarea>
								<label for="floatingTextarea2">Description</label>
							</div>

							<div class="mb-3">
								<input type="number" class="form-control" name="userId"
									value="<%=note.getUserId()%>" hidden="true"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary fadeIn third">Submit</button>
							</div>

						</form>
						<div class="text-center mt-4">
							<a class="btn btn-primary fadeIn fourth" href="home.jsp">Home</a>
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