<%@page import="com.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionManager"%>
<%@page import="com.dao.NoteDao"%>
<%@page import="com.pojo.Note"%>
<%@page import="com.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<style>
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
<title>Register</title>
</head>
<body>



	<%
	User users = (User) session.getAttribute("user");
	UserDao userdao=new UserDao(ConnectionManager.getConnection());
	User user =userdao.getUserById(users.getId());


	if (user.getEmail() == null || session == null) {
	%>
	<div class="container text-center mt-4">
		<div class="card mt-4">
			<div class="card-body">
				<h1 class="card-title mb-4 text-danger">Incorrect details.
					Please enter correct details</h1>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-primary mb-4" href="login.jsp">Login</a>
			</div>
		</div>
	</div>


	<%
	} else {
	NoteDao noteDao = new NoteDao(ConnectionManager.getConnection());

	List<Note> noteList = (List<Note>) noteDao.getPost(user.getId());
	%>
	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Note App</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>


				</ul>
				<div id="snackbar">Some text some message..</div>
				<div class="d-flex">
					<input class="form-control me-2" id="callAjax" type="search"
						placeholder="Search" aria-label="Search"> <a
						style="border-radius: 30px" class="btn btn-dark "
						aria-current="page" href="#" data-bs-toggle="modal"
						data-bs-target="#exampleModal"><%=user.getFirst_name()%></a> <a
						class="btn btn-light mx-2" href="logout.jsp">Logout</a>

				</div>
			</div>
		</div>
	</nav>
	<!-- NavBar end -->
	<div class="text-center">


		<h1 id="htag"></h1>


		<a class="btn btn-primary mb-4"
			href="createNote.jsp?userId=<%=user.getId()%>">Create Note</a>
	</div>

	<div class="container">
		<div class="row">
			<%
			for (Note note : noteList) {
			%>
			<div class="col-md-4">
				<div class="card mb-3">
					<div class="card-body">

						<h5 class="card-title">
							Title:
							<%=note.getTitle()%></h5>

						<h6 class="card-subtitle mb-2 text-muted">
							Name:
							<%=user.getFirst_name()%></h6>
						<h6 class="card-subtitle mb-2 text-muted">
							Date:
							<%=note.getDate()%></h6>

						<p class="truncate">
							Content:
							<%=note.getDesc()%></p>

						<a class="btn btn-primary mb-2"
							href="updateNote.jsp?id=<%=note.getId()%>">Update Note</a> <a
							class="btn btn-primary mx-4"
							href="deleteNote?id=<%=note.getId()%>">Delete Note</a>
					</div>
				</div>


			</div>
			<%
			}
			%>
		</div>
	</div>

	<%
	}
	%>




	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header ">
					<div class="container text-center">
						<img alt="" class="img" style="width: 120px; height: 120px; border-radius: 30px"
							src="img/<%=user.getImage()%>">
						<h3 class="modal-title" id="exampleModalLabel"><%=user.getFirst_name() + " " + user.getLast_name()%></h3>

					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div id="profile-details">
						<table class="table ">

							<tbody>
								<tr>

									<td>Email</td>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>

									<td>Password</td>
									<td><%=user.getPassword()%></td>

								</tr>
								<tr>

									<td>Gender</td>
									<td><%=user.getGender()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="profile-edit" style="display: none;">
						

						
								<form action="Update?id=<%=user.getId() %>" method="post">
							<div class="mb-3">
								<label for="first_name" class="form-label"> First_Name</label> <input
									type="text" class="form-control" id="first_name" value="<%=user.getFirst_name() %>"
									name="first_name" aria-describedby="nameHelp">

							</div>
							<div class="mb-3">
								<label for="last_name" class="form-label"> Last_Name</label> <input
									type="text" class="form-control" id="last_name" value="<%=user.getLast_name() %>"
									name="last_name" aria-describedby="nameHelp">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email" value="<%=user.getEmail() %>"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password" value="<%=user.getPassword() %>"
									id="exampleInputPassword1">
							</div>

							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>
				
							
					
					</div>
					<div id="changeImage" style="display: none;">

						<form action="ChangeImage?id=<%=user.getId()%>" method="post" enctype="multipart/form-data">

							<div class="input-group mb-3">
								<input type="file" class="form-control" name="image" required
									id="inputGroupFile02">

							</div>
							<div class="container text-center">
							<button type="submit" class="btn btn-primary" onclick="myFunction()">Upload</button>
							</div>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="dp">Change
						Picture</button>
					<button type="button" class="btn btn-primary"
						id="edit-profile-button">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal end -->
	<script>
		$(document).ready(function() {
			let editStatus = false;
			let dpstatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide()
					$("#profile-edit").show();
					$("#changeImage").hide();

					editStatus = true;
					$(this).text("show")
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide();
					$("#changeImage").hide();

					editStatus = false;
					$(this).text("Edit")
				}
			});

			$('#dp').click(function() {

				$("#profile-details").hide()
				$("#profile-edit").hide();
				$('#changeImage').show();

			})

		});
		
		function myFunction() {
			  var x = document.getElementById("snackbar");
			  x.className = "show";
			  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
			}
	</script>

	<script>
		window.location.hash = "no-back-button";

		// Again because Google Chrome doesn't insert
		// the first hash into the history
		window.location.hash = "Again-No-back-button";

		window.onhashchange = function() {
			window.location.hash = "no-back-button";
		}
	</script>

	<!-- Optional JavaScript; choose one of the two! -->
	<script type="text/javascript" src="javaScript/script.js"></script>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>