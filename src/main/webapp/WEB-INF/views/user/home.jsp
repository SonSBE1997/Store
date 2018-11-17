<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:user pageTitle="Trang chủ">
	<jsp:body>
		<section class="banner-area" id="home">	
			<div class="container">
				<div
					class="row fullscreen d-flex align-items-center justify-content-center"
					style="height: 657px;">
					<div class="banner-content col-lg-10">
						<h5 class="text-white text-uppercase">Now you can feel the Heat</h5>
						<h1>
							Smart New Future				
						</h1>
						<a href="#" class="primary-btn text-uppercase">Buy Now</a>
					</div>											
				</div>
			</div>
		</section>
		<!-- End banner Area -->
		
		<!-- About Generic Start -->
		<div class="main-wrapper">
			<!-- Start unique-feature Area -->
			<section class="unique-feature-area section-gap" id="unique">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h1 class="mb-10 text-white">Sản phẩm bán chạy</h1>
							</div>
						</div>
					</div>
					<div class="row">
						<fmt:setLocale value="vi_VN" scope="session" />
						<c:choose>
							<c:when test="${laptopHot.size()<4 }">
								<c:set var="hotNum" value="${laptopHot.size() }"
									target="java.lang.Integer" />
							</c:when>
							<c:otherwise>
								<c:set var="hotNum" value="3" target="java.lang.Integer" />
							</c:otherwise>
						</c:choose>
						<c:forEach begin="0" end='${hotNum }' var="i">
							<div class="col-lg-3 col-md-6">
							<div class="single-unique-product">
								<img class="img-fluid"
										src='<c:url value="/resources/image/${laptopHot.get(i).getImage() }" />'
										alt="">
								<div class="desc">
									<h4>${laptopHot.get(i).getName() }</h4>
									<h6>
										<fmt:formatNumber type="currency">${laptopHot.get(i).getPrice() }</fmt:formatNumber>
									</h6>
									<a class="text-uppercase primary-btn addCart"
											data-id="${laptopHot.get(i) }" href="#">Thêm vào giỏ hàng</a>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<br />
				<div>
					<a href="/Store/category/hot/1"
						class="genric-btn primary circle arrow float-right btnSeeAll">Xem tất cả<span
						class="lnr lnr-arrow-right"></span></a>
				</div>
			</section>
			<!-- End unique-feature Area -->
			
			
			<!-- Start about-generic-area Area -->
			<section class="about-generic-area section-gap" id="unique">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h1 class="mb-10 text-black">Sản phẩm đang giảm giá</h1>
							</div>
						</div>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${laptopDiscount.size()<4 }">
								<c:set var="discountNum" value="${laptopDiscount.size() }"
									target="java.lang.Integer" />
							</c:when>
							<c:otherwise>
								<c:set var="discountNum" value="3" target="java.lang.Integer" />
							</c:otherwise>
						</c:choose>
						<c:forEach begin="0" end='${discountNum }' var="i">
							<div class="col-lg-3 col-md-6">
								<div class="single-unique-product product2">
									<img class="img-fluid"
										src='<c:url value="/resources/image/${laptopDiscount.get(i).getImage() }" />'
										alt="">
									<div class="desc">
										<h4>${laptopDiscount.get(i).getName() }</h4>
										<h6>
											<fmt:formatNumber type="currency">${laptopDiscount.get(i).getPrice() }</fmt:formatNumber>
										</h6>
										<a class="text-uppercase primary-btn addCart"
											data-id="${laptopDiscount.get(i) }" href="#">Thêm vào giỏ hàng</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<br />
					<div>
						<a href="/Store/category/discount/1"
							class="genric-btn primary circle arrow float-right">Xem tất cả<span
							class="lnr lnr-arrow-right"></span></a>
					</div>
				</div>
			</section>
			<!-- End about-generic-area Area -->
		</div>
	</jsp:body>
</t:user>

