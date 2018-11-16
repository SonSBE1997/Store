<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
					<c:choose>
						<c:when test="${loginMess !=null}">
							<div class="text-danger center hide" id="loginMess">
								<h4>${loginMess }</h4>
							</div>
						</c:when>
						<c:otherwise>
							<div class="text-danger center">
								<h4 id="messContent"></h4>
							</div>
						</c:otherwise>
					</c:choose>
					<form action="" method="POST">
						<h1>Login Form</h1>
						<div>
							<input id="username" type="text" name="username"
								class="form-control" placeholder="Username" required="required" />
						</div>
						<div>
							<input type="password" name="password" class="form-control"
								placeholder="Password" required="required" />
						</div>
						<div>
							<button class="btn btn-default submit">Đăng nhập</button>
							<a class="reset_pass" href="#">Quên mật khẩu?</a>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script
		src='<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js"/>'></script>
	<!-- Bootstrap -->
	<script
		src='<c:url value="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js"/>'></script>
	<script type="text/javascript">
		$(function() {
			$('#loginMess').removeClass('hide');
			$('#loginMess').delay(3000).fadeOut();
			$("#username").change(
					function() {
						var username = $(this).val();
						$.ajax({
							url : "/Store/login/exist",
							data : {
								username : username
							},
							type : "POST",
							success : function(response) {
								if (response != "")
									$('#messContent').text(
											"Tên đăng nhập không tồn tại");
								else
									$('#messContent').text("");
							}
						});
					});
		});
	</script>
</body>
</html>