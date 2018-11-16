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
					<li><a href="index.html#about">About</a></li>
					<li><a href="index.html#service">Service</a></li>
					<li><a href="index.html#unique">Unique Feature</a></li>
					<li><a href="index.html#review">Review</a></li>
					<li><a href="index.html#faq">Faq</a></li>
					<li class="menu-has-children"><a href="">Pages</a>
						<ul>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul></li>
					<li>
						<div class="dropdown">
							<a href="#" class="dropdown-toggle btnShoppingCart"
								id="btnShoppingCart">Giỏ hàng <i class="fa fa-shopping-cart"></i>
								<span id="shoppingCartBadge">2</span>
							</a>
							<ul class="dropdown-menu" id="dropdownShoppingCart">
								<li>Nothing to show</li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>