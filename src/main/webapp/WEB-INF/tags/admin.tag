<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="navigation" fragment="true"%>
<%@ attribute name="customjs" fragment="true" required="false"%>
<%@ attribute name="pageTitle" required="true" type="java.lang.String"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${pageTitle}</title>
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
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:invoke fragment="navigation" />
			<div class="right_col" role="main">
				<div></div>
				<c:if test="${alertMess !=null }">
					<div
						class="alert ${alertType } hide col-sm-2 text-center pull-right"
						id="alertMess">${alertMess }</div>
				</c:if>
				<jsp:doBody />
			</div>
			<footer>
				<div class="text-center">Copyright by Sanero &copy; 2018</div>
				<div class="clearfix"></div>
			</footer>
		</div>
	</div>
	<!-- jQuery -->
	<script
		src='<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js"/>'></script>
	<!-- Bootstrap -->
	<script
		src='<c:url value="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js"/>'></script>
	<!-- Custom Theme Scripts -->
	<script src='<c:url value="/resources/admin/build/js/custom.min.js"/>'></script>
	<jsp:invoke fragment="customjs" />
	<script type="text/javascript">
		$(function() {
			$('#alertMess').removeClass('hide');
			$('#alertMess').delay(1000).slideUp(500);
		});
	</script>
</body>
</html>