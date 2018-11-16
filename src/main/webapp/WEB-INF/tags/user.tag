<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pageTitle" required="true" type="java.lang.String"%>
<%@ attribute name="customjs" fragment="true" required="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<!-- Site Title -->
<title>${pageTitle }</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/linearicons.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/font-awesome.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/bootstrap.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/magnific-popup.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/nice-select.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/animate.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/owl.carousel.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/user/css/main.css"/>'>
<!-- 	Custom -->
<link rel="stylesheet"
	href='<c:url value="/resources/user/custom/style.css"/>'>
</head>
<body>
	<!-- Start Header -->
	<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
	<!-- End Header -->

	<!-- 	Body -->
	<jsp:doBody />
	<!-- 	End Body -->

	<!-- Start Footer -->
	<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
	<!-- End Footer -->
	<script
		src='<c:url value="/resources/user/js/vendor/jquery-2.2.4.min.js"/>'>
		
	</script>
	<script
		src='<c:url value="/resources/user/js/vendor/bootstrap.min.js" />'></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src='<c:url value="/resources/user/js/easing.min.js" />'></script>
	<script src='<c:url value="/resources/user/js/hoverIntent.js" />'></script>
	<script src='<c:url value="/resources/user/js/superfish.min.js" />'></script>
	<script
		src='<c:url value="/resources/user/js/jquery.ajaxchimp.min.js" />'></script>
	<script
		src='<c:url value="/resources/user/js/jquery.magnific-popup.min.js" />'></script>
	<script src='<c:url value="/resources/user/js/owl.carousel.min.js" />'></script>
	<script src='<c:url value="/resources/user/js/jquery.sticky.js" />'></script>
	<script
		src='<c:url value="/resources/user/js/jquery.nice-select.min.js" />'></script>
	<script src='<c:url value="/resources/user/js/parallax.min.js" />'></script>
	<script src='<c:url value="/resources/user/js/mail-script.js" />'></script>
	<script src='<c:url value="/resources/user/js/main.js" />'></script>
	<script type="text/javascript">
		document.getElementById("btnShoppingCart").addEventListener(
				"click",
				function(event) {
					event.preventDefault();
					document.getElementById("dropdownShoppingCart").classList
							.toggle("show");
				})

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.btnShoppingCart')) {

				var dropdowns = document
						.getElementsByClassName("dropdown-menu");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>
	<jsp:invoke fragment="customjs"></jsp:invoke>
</body>
</html>