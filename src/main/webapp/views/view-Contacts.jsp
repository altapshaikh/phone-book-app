<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="eng">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		  body {
  background-image: url("img/abc.jpg");

}
	</style>

</head>

<body>
	<br>
	<br>
	<div class="container">
		<center>
			<h4 style="text-decoration: underline;">All Contacts</h4>
		</center>
		<c:if test="${not empty succMag}">
			<div class="alert alert-success">
				<strong>${succMag}</strong>
			</div>
		</c:if>
		<h3 class="bg-dark">
			<a href="/register">+ Add New Contact</a>
		</h3>
		<table class="table table-striped " style="border: 1px solid black"
			border="1px" id="myTable" description="render data">
			<thead style="color: black; background-color: orange">
				<tr>
					<th>S.NO</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>PHNO</th>
					<th>ACTION</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="contact" items="${contactlist}" varStatus="index">
					<tr>
						<td>${index.count}</td>
						<td>${contact.contactName}</td>
						<td>${contact.contactEmail}</td>
						<td>${contact.contactNumber}</td>
						<td width="50px">
							<h3>
								<a href="/edit/${contact.contactId}"><i class="fa fa-edit"
									style="font-size: 20px; color: green"></i></a> <a
									href="/delete/${contact.contactId}"  onclick="return confirm('Are you sure you want to continue')"><i
									class="fa fa-trash-o" style="font-size: 20px; color: red"></i></a>
							</h3>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

	<script>
$(document).ready( function () {
    $('#myTable').DataTable();
} );
</script>


</body>
</html>