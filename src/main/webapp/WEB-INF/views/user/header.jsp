<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<li><a href="/Store/laptop">Tất cả sản phẩm</a></li>
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
										<li>Nothing to show</li>
									</c:when>
									<c:otherwise>
										<c:forEach items="cart" var="item">
											<li>item</li>
										</c:forEach>
										<li></li>
									</c:otherwise>
								</c:choose>
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