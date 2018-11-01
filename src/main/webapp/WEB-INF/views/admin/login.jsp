<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href='<c:url value="/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css"/>'
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href='<c:url value="/resources/admin/vendors/font-awesome/css/font-awesome.min.css"/>'
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href='<c:url value="/resources/admin/build/css/custom.min.css"/>'
	rel="stylesheet">
</head>
<body class="login">
	<div>
		<div class="login_wrapper">
			<div class="form login_form">
				<section class="login_content">
					<form action="login" method="POST">
						<h1>Login Form</h1>
						<div>
							<input type="text" name="username" class="form-control"
								placeholder="Username" required="required" />
						</div>
						<div>
							<input type="password" name="password" class="form-control"
								placeholder="Password" required="required" />
						</div>
						<div>
							<button class="btn btn-default submit">Login</button>
							<a class="reset_pass" href="#">Forget your password?</a>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>