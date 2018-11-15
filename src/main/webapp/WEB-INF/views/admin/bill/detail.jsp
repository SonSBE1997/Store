<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Hoá đơn">
	<jsp:attribute name="customjs">
		<script>
			$('.btn-status').off('click').on('click', function(e) {
				e.preventDefault();
				var btn = $(this);
				var id = btn.data('id');
				$.ajax({
					url : "/Store/admin/bill/changeStatus",
					data : {
						id : id
					},
					type : "POST",
					success : function(response) {
						if (response == "true") {
							$("#order" + id).text("Đã thanh toán");
						} else {
							$("#order" + id).text("Chưa thanh toán");
						}
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:attribute name="navigation">
		<%@include file="../navigation.jsp"%>
		<%@include file="../top.jsp"%>
	</jsp:attribute>
	<jsp:body>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 bg-white">
				<div class="dashboard_graph">
					<div class="row x_title">
						<div class="col-md-6">
							<h3>Danh sách hoá đơn trong ${date }</h3>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${lsOrder.size()==0 }">
						<h3 class="text-center center">Không có hoá đơn nào</h3>
					</c:when>
					<c:otherwise>
						<c:set var="totalPrice" value="0" target="java.lang.Integer" />
						<table class="table table-striped table-hover table-bordered">
						<thead>
						      <tr>
						        <td>ID</td>
						        <td>Ngày lập hoá đơn</td>
						        <td>Nhân viên</td>
						        <td>Khách hàng</td>
						        <td>Trạng thái</td>
						        <td>Thành Tiền (VNĐ)</td>
						      </tr>
					    </thead>
					    <tbody>
					    	<c:forEach items="${lsOrder}" var="order">
					    		<c:set var="totalPrice"
										value="${totalPrice + order.getTotalBillPrice()}" />
					    		<tr id='row${order.getId()}'>
						    		<td>${order.getId()}</td>
					    			<td>
					    				<fmt:formatDate value="${order.getOrderDate() }"
												pattern="dd/MM/yyyy" />
									</td>
						    		<td>${order.getEmployee().getName() }</td>
						    		<td>${order.getCustomer().getName() }</td>
						    		<td>
										<a href="#" id='order${order.getId()}' class="btn-status"
											data-id=${order.getId() }>
							    			<c:choose>
							    				<c:when test="${order.isStatus() }">Đã thanh toán</c:when>
							    				<c:otherwise>Chưa thanh toán</c:otherwise>
							    			</c:choose>
						    			</a>
									</td>
						    		<td>
						    			<fmt:formatNumber type="number" maxFractionDigits="3">${order.getTotalBillPrice() }</fmt:formatNumber> 
						    		</td>
					    		</tr>
					    	</c:forEach>
					    </tbody>
						</table>
						<div class="form-group clearfix">
							<div class="col-sm-6"></div>
						    <label class="col-sm-3 control-label">Tổng cộng:</label>
						    <div class="col-sm-3">
						     	<fmt:setLocale value="vi_VN" scope="session" />
			    				<fmt:formatNumber type="currency">${totalPrice }</fmt:formatNumber>
						    </div>
					  	</div>
					</c:otherwise>
				</c:choose>
				<div>
					<a href="/Store/admin/bill/statistic/${now.getYear()+1900 }"
						class="btn btn-default">Quay lại</a>
				</div>
			</div>
		</div>
	</jsp:body>
</t:admin>