<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ACME - Login</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body class="bg-dark text-white">
	<form method="post" action="login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="mb-3">
			<label for="username" class="form-label">Login :</label> 
			<input type="text" class="form-control" id="username" name="username" placeholder="Login or Email">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Password :</label> 
			<input type="password" class="form-control" id="password" name="password" placeholder="Password">
		</div>
		<button type="submit" class="btn btn-primary">Envoyer</button>
		<button type="reset" class="btn btn-outline-primary">Annuler</button>
	</form>
</body>
</html>