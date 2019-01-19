<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<fmt:setLocale value="vi_VN" scope="session" />
<t:user pageTitle="Bán chạy">
	<jsp:attribute name="customjs">
		<script type="text/javascript"
			src='<c:url value="/resources/user/custom/custom.js"/>'></script>
	</jsp:attribute>
	<jsp:body>
		<div class="aboutUs">
		</div>
		<div class="main-wrapper">
				<h3 id="notify">${mess }</h3>
				<!-- Start unique-feature Area -->
				<h1 class="mb-10 mt-5 text-black text-center">Giỏ hàng</h1>
				<section class="about-generic-area mb-10" id="unique">
					<br />
					<div class="container mb-50" id="pageShoppingCart">
						<c:choose>
							<c:when test="${cart.size()==0 }">
								<h3>Không có sản phẩm nào trong giỏ hàng</h3>
							</c:when>
							<c:otherwise>
								<table class="table table-hover table-striped table-hover"
								id="cartTable">
								    <thead>
								      <tr>
								        <th></th>
								        <th>Tên sản phẩm</th>
								        <th>Đơn giá</th>
								        <th>Số lượng</th>
								        <th>Giảm giá</th>
								        <th>Thành tiền</th>
								        <th></th>
								      </tr>
								    </thead>
								    <tbody>
								    	<c:set var="totalPrice" value="0"
										target="java.lang.Integer" />
								     	<c:forEach items="${cart }" var="item">
							     			<c:set var="totalPrice"
											value="${totalPrice +  item.getTotalPrice() }"
											target="java.lang.Integer" />
								     		<tr id="row${item.getLaptopId() }">
								     			<td>	
								     				<img alt="" height="100px"
												src='<c:url value="/resources/image/${item.getImage() }" />' />
												</td>
												<td>
													<a href="/Store/laptop/detail/${item.getLaptopId() }">${item.getName() }</a>
												</td>
												<td>
													<span><span id="singlePrice${item.getLaptopId() }">${item.getPrice() }</span>
													<span>&#8363;</span></span>
												</td>
												<td>
													<input class="quantities" type="number" min="1"
												data-id="${item.getLaptopId() }"
												id="quantity${item.getLaptopId() }"
												value="${item.getQuantity() }" />
												</td>
												<td>
													<span id="discount${item.getLaptopId() }">${item.getDiscount() }
													</span> %
												</td>
												<td id="price${item.getLaptopId() }">${item.getTotalPrice() }</td>
												<td>
													<a class="remove" href="" data-id="${item.getLaptopId() }">x</a>
												</td>
								     		</tr>
								     	</c:forEach>
								    </tbody>
								</table>
								<div class="pull-right">Tổng tiền:
									<span id="billPrice">
										${totalPrice }
									</span>
									<span>&#8363;</span>
								</div>
								<br />
								<br />
								<br />
								<div class="container" id="order">
									<h3 class="text-center">Thông tin đặt hàng</h3>
									
									<form action="/Store/shopping-cart/order" method="post">
										<div class="mt-10">
											<input type="text" name="name"
											placeholder="Họ và tên người nhận hàng" class="single-input"
											required
											value='<c:if test="${customer!=null }">${customer.getName() }</c:if>'>
										</div>
										<div class="mt-10">
											<input type="text" name="phoneNumber"
											placeholder="Số điện thoại" class="single-input" required
											value='<c:if test="${customer!=null }">${customer.getPhoneNumber() }</c:if>'>
										</div>
										<div class="mt-10">
											<input type="email" name="email" placeholder="Email"
											class="single-input" required
											value='<c:if test="${customer!=null }">${customer.getEmail() }</c:if>'>
										</div>
										<div class="input-group-icon mt-10">
											<div class="icon">
												<i class="fa fa-thumb-tack" aria-hidden="true"></i>
											</div>
											<input id="address" type="text" name="address"
											placeholder="Địa chỉ giao hàng"
											onfocus="this.placeholder = ''" value="Ha Noi"
											onblur="this.placeholder = 'Address'" required
											class="single-input"
											value='<c:if test="${customer!=null }">${customer.getAddress() }</c:if>'>
										</div>
										<div class="input-group-icon mt-10">
											<input type="submit" class="genric-btn primary radius"
											value="Mua ngay" />										
										</div>
									</form>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</div>
	</jsp:body>
</t:user>