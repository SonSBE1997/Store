<%@ page import="dev.sanero.utils.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header id="header" id="home">
	<div class="container">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="/Store"><img
					src='<c:url value="/resources/user/img/logo.png" />' alt=""
					title="" /></a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="/Store">Trang chủ</a></li>
					<li class="menu-has-children"><a id="tradeMark" href="#">Thương
							hiệu</a>
						<ul>
							<c:forEach items="${lsProducer }" var="producer">
								<li><a href="/Store/category/${producer.getId()}">${producer.getName() }</a></li>
							</c:forEach>
							<li><a href="/Store/laptop/1">Tất cả sản phẩm</a></li>
						</ul></li>
					<li><a href="/Store/aboutUs">Giới thiệu</a></li>
					<li>
						<div class="dropdown">
							<a href="#" class="dropdown-toggle btnShoppingCart"
								id="btnShoppingCart">Giỏ hàng <i class="fa fa-shopping-cart"></i>
								<span id="shoppingCartBadge">${cart.size() }</span>
							</a>
							<ul class="dropdown-menu" id="dropdownShoppingCart">
								<c:choose>
									<c:when test="${cart.size()==0 }">
										<li>Không có sản phẩm nào</li>
									</c:when>
									<c:otherwise>
										<c:forEach items="${cart }" var="item">
											<li class="cartItem" id="bageItem${item.getLaptopId() }">
												<div>
													<div>
														<b>Tên SP:</b> ${item.getName() } <span> <a
															class="pull-right removeCartItem removeCart"
															data-id="${item.getLaptopId() }" href="">x </a>
														</span>
													</div>
													<div>
														<b>Đơn giá:</b><span> <fmt:formatNumber
																type="number" maxFractionDigits="3">
															${item.getPrice() }
															</fmt:formatNumber>
														</span><span> <b>- SL:</b> <span
															id="badgeQuantity${item.getLaptopId() }">${item.getQuantity() }</span>
														</span>
													</div>
													<div>
														<fmt:setLocale value="vi_VN" scope="session" />
														<b>Giảm giá:</b> ${item.getDiscount() } % <span
															class="pull-right"> <b>TT:</b> <span
															id="badgePrice${item.getLaptopId() }">
																${item.getTotalPrice() } </span><span>&#8363;</span>
														</span>
													</div>
												</div>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<li><a href="/Store/shopping-cart" class="goCart">Đi
										đến giỏ hàng</a></li>
							</ul>
						</div>
					</li>
					<c:choose>
						<c:when test="${loginName==null }">
							<li><a href="/Store/login">Đăng nhập<span id="login"></span></a></li>
							<li><a href="/Store/login/signup">Đăng ký</a></li>
						</c:when>
						<c:otherwise>
							<li class="menu-has-children"><a id="login" href="">${loginName }</a>
								<ul>
									<li><a href="/Store/logout">Đăng xuất</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>