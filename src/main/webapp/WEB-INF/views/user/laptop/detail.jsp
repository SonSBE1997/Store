<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<fmt:setLocale value="vi_VN" scope="session" />
<t:user pageTitle="Bán chạy">
	<jsp:attribute name="customjs">
		<script src='<c:url value="/resources/user/custom/custom.js" />'>
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<div class="aboutUs">
		</div>
		<div class="main-wrapper">
			<h2 class="text-center mt-5">Chi tiết sản phẩm</h2>
			<!-- Start unique-feature Area -->
			<section class="about-generic-area section-gap" id="unique">
				<div class="container">
					<div class="section-top-border">
						<fmt:setLocale value="vi_VN" scope="session" />
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<img height="400px" alt="no image to show"
									src='<c:url value="/resources/image/${laptop.getImage() }"/>'>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="form-group">
								    <label class="col-md-4">Tên laptop</label>
							      	<span>${laptop.getName()}</span>
							      	<span>
							      		<c:if test="${laptop.isHot() }">
											<i class="fa fa-star star-icon"></i>
										</c:if>
									</span>
								 </div>
								 <div class="form-group">
								    <label class="col-md-4">Đơn giá</label>
							      	<span>
					    				<c:choose>
											<c:when test="${laptop.getDiscount()>0 }">
												<span class="discount">
													<fmt:formatNumber type="currency">
														${laptop.getPrice() } 
													</fmt:formatNumber>
												</span>
												<span>
													<fmt:formatNumber type="currency">
													${laptop.getPrice() * (100 - laptop.getDiscount()) / 100 }
													</fmt:formatNumber>
												</span>
											</c:when>
											<c:otherwise>
												<span class="nondiscount"></span>
												<span>
													<fmt:formatNumber type="currency">
														${laptop.getPrice() }
													</fmt:formatNumber>
												</span>
											</c:otherwise>
										</c:choose>
					    			</span>
								 </div>
								 <div class="form-group">
								    <label class="col-md-4">Giảm giá</label>
							      	<span>${laptop.getDiscount()} %</span>
								 </div>
								 <div class="form-group">
								    <c:choose>
								    	<c:when test="${laptop.getQuantity()==0 }">
								    		<h4 class="outOfStock"> Sản phẩm đang hết hàng</h4>
								    	</c:when>
								    	<c:otherwise>
								    		<label class="col-md-4">Số lượng</label>
									      	<span>
									      		<input type="number" value="1" required="required"
												min="1" max="${laptop.getQuantity() }" class="text-center"
												name="quantity" id="buyQuantity" />
									      	</span>
								    	</c:otherwise>
								    </c:choose>
								 </div>
								 <div class="form-group">
								    <label class="col-md-4">Số lượng hiện còn</label>
							      	<span>${laptop.getQuantity()}</span>
								 </div>
								 <div class="form-group">
								    <label class="col-md-4">Bảo hành</label>
							      	<span>${laptop.getWarranty()}</span>
								 </div>
								 <div class="button-group-area mt-40">
								 	<a class="genric-btn danger radius" id="buy" href=""
										data-id="${laptop.getId() }">Mua ngay</a>
								 </div>
							</div>
						</div>
						<div>
							<h3>Các thông số cơ bản</h3>
							<br />
							<div>
								<div class="form-group">
								    <label class="col-md-4">Hãng sản xuất</label>
							      	<span>${config.getProducer()}</span>
								 </div>
								<div class="form-group">
								    <label class="col-md-4">Hệ điều hành</label>
							      	<span>${laptop.getOs()}</span>
								 </div>
								<div class="form-group">
								    <label class="col-md-4">Phụ kiện</label>
							      	<span>${laptop.getAccessories()}</span>
								 </div>
								<div class="form-group">
								    <label class="col-md-4">Trọng lượng</label>
							      	<span>${laptop.getWeight()} Kg</span>
								 </div>
								
								<div class="form-group">
								    <label class="col-md-4">Số lượng</label>
							      	<span>${laptop.getQuantity()}</span>
								 </div>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
							    	<h4>Cấu hình</h4>
							    	<br />
									<div class="form-group">
										<label class="col-md-4">CPU</label>
								      	<span>${config.getCpu()}</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">RAM</label>
								      	<span>${config.getRam()}</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">Ổ cứng</label>
								      	<span>${config.getDisk()}</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">Cổng kết nối</label>
								      	<span>${config.getPortConnect()}</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">Màn hình</label>
								      	<span>${config.getScreen()}</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">Pin</label>
								      	<span>${config.getBattery()} cell</span>
									 </div>
									<div class="form-group">
										<label class="col-md-4">Kích thước</label>
								      	<span>${config.getDimension()}</span>
									 </div>
							</div>
						</div>
						<div class="mt-5">
							<hr>
							<h2>Các sản phẩm liên quan</h2>
						</div>
						<div class="row">
							<c:choose>
								<c:when test="${relate.size() < 4 }">
									<c:set var="relateSize" value="${relate.size()-1 }"
										target="java.lang.Integer" />
								</c:when>
								<c:otherwise>
									<c:set var="relateSize" value="3" target="java.lang.Integer" />
								</c:otherwise>
							</c:choose>
							<c:forEach begin="0" end='${relateSize }' var="i">
								<div class="col-lg-3 col-md-6">
									<div class="single-unique-product">
										<img class="img-fluid"
											src='<c:url value="/resources/image/${relate.get(i).getImage() }" />'
											alt="">
										<div class="desc">
											<h4>
												<a href="/Store/laptop/detail/${relate.get(i).getId() }">${relate.get(i).getName() }</a>
												<span><i class="fa fa-star star-icon"></i></span>
											</h4>
											<h6>
												<fmt:formatNumber type="currency">${relate.get(i).getPrice() }</fmt:formatNumber>
											</h6>
											<a class="text-uppercase primary-btn addCart"
												href="/Store/shopping-cart/add/${relate.get(i).getId() }">Thêm vào giỏ hàng</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</div>
	</jsp:body>
</t:user>