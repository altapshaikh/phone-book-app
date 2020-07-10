<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="eng">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  .form-group{
  width: 300px !important
  }
  body {
  background-image: url("img/abc.jpg");

}
  </style>
</head>
<body>

<div class="container-fluid "style="width: width: 750px!important;">
<br>
<br>
<c:if test="${not empty succMag}">
<div class="alert alert-success">
  <strong>${succMag}</strong> 
</div>
</c:if>
<c:if test="${not empty errMag}">
   <div class="alert alert-danger">
  <strong>${errMag}</strong> 
</div>
</c:if>

<div class="form-group" style="margin-left: 100px">
<h3 class="text-success" style="border: 1px;color: blue;;font-size:xx-large;font-weight: bold;">Contact Info</h3>
	<form:form action="/register"  method="post" modelAttribute="contact" >
	<div class="form-group">
    <label for="name">Name:</label>
    <form:input type="text" path="contactName" class="form-group" id="name"/> 
  </div>
  <div class="form-group">
  <label for="name">Email:</label>
  <form:input type="email"  path="contactEmail"  class="form-group" id="email"/>
    </div>
    <div class="form-group">
  <label for="name">Phone:</label>
  <form:input path="contactNumber" type="text" class="form-group" id="phone" />
    </div>
		        <input type="reset" value="reset"class="btn btn-danger" name="reset">
				<input type="submit" value="Register"  class="btn btn-primary"name="submit" id="submit">

				<h4><a href="/viewcontacts" class="text-dark">View All Contacts</a></h4>
		
		<form:input path="contactId" type="hidden" />
	</form:form>
</div>
</div>
 <p id="namemsg" style="color: red;"></p>
<script type="text/javascript">

$(document).ready(function () {
    $("#submit").click(function () {
    	var fname = $('#name').val();
    	var lname = $('#email').val();
    	var age = $('#phone').val();
    

        if (fname.length == 0) {
        		document.getElementById('name').value="Please enter name"
        	return false;
        } else if (lname.length == 0) {
        	document.getElementById('email').value="Please enter email"
            return false;
        } else if (age.length == 0) {
        	document.getElementById('phone').value="Please enter phone"
            return false;
        }
    });
});
</script>
</body>
</html>