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
<style type="text/css">
#signin {
	padding: 6px;
	margin: 0px 0px 5px 5px;
	height: 34px;
	color: #333;
	font-size: 14px;
}
</style>
</head>
<body class="login">
	<div>
		<div class="login_wrapper">
			<div class="form login_form">
				<section class="login_content">
					<div class="text-danger center">
						<h4 id="messContent"></h4>
					</div>
					<form action="" method="POST">
						<h1>Đăng ký</h1>
						<div>
							<input id="username" type="text" name="username"
								class="form-control" placeholder="Tên đăng nhập"
								required="required" />
						</div>
						<div>
							<input type="password" name="password" id="pass"
								class="form-control" placeholder="Mật khẩu" required="required" />
						</div>
						<div>
							<input type="password" name="repassword" id="repass"
								class="
								form-control" placeholder="Nhập lại mật khẩu"
								required="required" />
						</div>
						<div>
							<input id="name" type="text" name="name" class="form-control"
								placeholder="Tên người dùng" required="required" />
						</div>
						<div>
							<input id="phoneNumber" type="text" name="phoneNumber"
								class="form-control" placeholder="Số điện thoại"
								required="required" />
						</div>
						<div>
							<input id="email" type="email" name="email" class="form-control"
								placeholder="Email" required="required" />
						</div>
						<div>
							<button class="btn btn-default submit">Đăng ký</button>
							<a id="signin" class="btn btn-default" href="/Store/login">Đăng
								nhập</a>
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
			$("#username").change(function() {
				var username = $(this).val();
				$.ajax({
					url : "/Store/login/exist",
					data : {
						username : username
					},
					type : "POST",
					success : function(response) {
						if (response == "exist")
							$('#messContent').text("Tên đăng nhập đã tồn tại");
						else
							$('#messContent').text("");
					}
				});
			});

			$("#repass").change(function() {
				if ($(this).val() != $('#pass').val()) {
					$('#messContent').text("Hai mật khẩu không khớp");
				} else
					$('#messContent').text("");
			});
		});
	</script>
</body>
</html>