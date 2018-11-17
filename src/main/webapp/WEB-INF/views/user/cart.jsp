<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<fmt:setLocale value="vi_VN" scope="session" />
<t:user pageTitle="Bán chạy">
	<jsp:body>
		<div class="aboutUs">
		</div>
		<div class="main-wrapper">
				<!-- Start unique-feature Area -->
				<h1 class="mb-10 mt-5 text-black text-center">Giỏ hàng</h1>
				<section class="about-generic-area mb-10" id="unique">
					<br />
					<div class="container">
						<c:choose>
							<c:when test="${cart.size()==0 }">
								<h3>Không có sản phẩm nào trong giỏ hàng</h3>
							</c:when>
							<c:otherwise>
								<table class="table table-hover table-striped table-hover">
								    <thead>
								      <tr>
								        <th>Firstname</th>
								        <th>Lastname</th>
								        <th>Email</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <td>John</td>
								        <td>Doe</td>
								        <td>john@example.com</td>
								      </tr>
								      <tr>
								        <td>Mary</td>
								        <td>Moe</td>
								        <td>mary@example.com</td>
								      </tr>
								      <tr>
								        <td>July</td>
								        <td>Dooley</td>
								        <td>july@example.com</td>
								      </tr>
								    </tbody>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
				<div class="container mb-50">
					<h3>Thông tin đặt hàng</h3>
					<form action="#">
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="First Name"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'First Name'" required
							class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="last_name" placeholder="Last Name"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Last Name'" required
							class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="last_name" placeholder="Last Name"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Last Name'" required
							class="single-input">
						</div>
						<div class="mt-10">
							<input type="email" name="EMAIL" placeholder="Email address"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Email address'" required
							class="single-input">
						</div>
						<div class="input-group-icon mt-10">
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" name="address" placeholder="Address"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Address'" required
							class="single-input">
						</div>
					</form>
				</div>
			</div>
	</jsp:body>
</t:user>