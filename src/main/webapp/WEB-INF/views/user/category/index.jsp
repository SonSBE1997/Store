<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:user pageTitle="${producer.getName() }">
	<jsp:body>
		<div class="aboutUs">
		</div>
		<div class="main-wrapper">
				<!-- Start unique-feature Area -->
				<section class="about-generic-area section-gap" id="unique">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="menu-content pb-60 col-lg-10">
								<div class="title text-center">
									<h1 class="mb-10 text-black">Laptop ${producer.getName() }</h1>
								</div>
							</div>
						</div>
						<div class="row">
							<fmt:setLocale value="vi_VN" scope="session" />
							<c:forEach items="${lsLaptop }" var="laptop">
								<div class="col-lg-3 col-md-6">
								<div class="single-unique-product">
									<img class="img-fluid"
										src='<c:url value="/resources/image/${laptop.getImage() }" />'
										alt="">
									<div class="desc">
										<h4>
											<a href="/Store/laptop/detail/${laptop.getId()}">${laptop.getName() }</a>
											<span><i class="fa fa-star"></i></span>
										</h4>
										<h6>
											<fmt:formatNumber type="currency">${laptop.getPrice() }</fmt:formatNumber>
										</h6>
										<a class="text-uppercase primary-btn addCart"
											data-id=${laptop.getId() }
											data-quantity=${laptop.getQuantity() }>Thêm vào giỏ hàng</a>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						
						<!-- End unique-feature Area -->
						<div class="pull-right">
							<ul class="pagination page">
								<c:choose>
									<c:when test="${currentPage == 1}">
										<li class="active"><a href="1">1</a></li>
										<c:if test="${pageCount == 2 }">
											<li><a href="2">2</a></li>
										</c:if>		
										<c:if test="${pageCount > 2 }">
											<li><a href="2">2</a></li>
											<li><a href="3">3</a></li>
											<li class="active"><a href="${currentPage+1 }">&gt;</a></li>
										</c:if>					
									</c:when>
									<c:otherwise> <%--currentPage > 1 --%>
										<li class="active"><a href="1">&lt;&lt;</a></li>
										<li class="active"><a href="1">&lt;</a></li>
										<c:choose>
											<c:when test="${currentPage == pageCount && pageCount > 2 }">
												<li><a href="${currentPage-2 }">${currentPage-2 }</a></li>
												<li><a href="${currentPage-1 }">${currentPage-1 }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${currentPage-1 }">${currentPage-1 }</a></li>
											</c:otherwise>
										</c:choose>
										<li class="active"><a href="${currentPage }">${currentPage }</a></li>
										<c:if test="${currentPage < pageCount }">
											<li><a href="${currentPage+1 }">${currentPage+1 }</a></li>
											<li class="active"><a href="${currentPage+1 }">&gt;</a></li>
										</c:if>
									</c:otherwise>
								</c:choose>
								<c:if test="${pageCount >= 3 && currentPage < pageCount}">
									<li class="active"><a href="${pageCount }">&gt;&gt;</a></li>
								</c:if>
							</ul>
						</div>
						<div class="col-lg-6 pull-right text-black">
								Trang số ${currentPage } / ${pageCount }
						</div>
					</div>
				</section>
			</div>
	</jsp:body>
</t:user>