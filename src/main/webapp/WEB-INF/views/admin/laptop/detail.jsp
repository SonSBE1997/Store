<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Laptop">
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
							<h3>Chi tiết</h3>
						</div>
					</div>
				</div>
				<img height="200px" alt="no image to show"
					src='<c:url value="/resources/image/${laptop.getImage() }"/>'>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="form-group">
						    <label class="col-md-4">Tên laptop</label>
					      	<span>${laptop.getName()}</span>
						 </div>
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
						    <label class="col-md-4">Đơn giá</label>
					      	<span>
					      		<fmt:setLocale value="vi_VN" scope="session" />
			    				<fmt:formatNumber type="currency">${laptop.getPrice() }</fmt:formatNumber>
			    			</span>
						 </div>
						
						<div class="form-group">
						    <label class="col-md-4">Giảm giá</label>
					      	<span>${laptop.getDiscount()} %</span>
						 </div>
						<div class="form-group">
						    <label class="col-md-4">Số lượng</label>
					      	<span>${laptop.getQuantity()}</span>
						 </div>
						 <div class="form-group">
						    <label class="col-md-4">Trạng thái sản phẩm</label>
					      	<span>
					      		<c:choose>
					      			<c:when test="${laptop.isHot() }">Bán chạy</c:when>
					      			<c:otherwise>Bình thường</c:otherwise>	
					      		</c:choose>
					      	</span>
						 </div>
						<div class="form-group">
						    <label class="col-md-4">Bảo hành</label>
					      	<span>${laptop.getWarranty()}</span>
						 </div>
						 
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
					    	<h4>Cấu hình</h4>
							<div class="form-group">
								<label class="col-md-4">CPU</label>
						      	<div>${config.getCpu()}</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">RAM</label>
						      	<div>${config.getRam()}</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">Ổ cứng</label>
						      	<div>${config.getDisk()}</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">Cổng kết nối</label>
						      	<div>${config.getPortConnect()}</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">Màn hình</label>
						      	<div>${config.getScreen()}</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">Pin</label>
						      	<div>${config.getBattery()} cell</div>
							 </div>
							<div class="form-group">
								<label class="col-md-4">Kích thước</label>
						      	<div>${config.getDimension()}</div>
							 </div>
					</div>
				</div>
				<div class="input-group clearfix">
					<br />
					<a href="/Store/admin/laptop/1" class="btn btn-default">Quay lại</a>
					<a href="/Store/admin/laptop/edit/${laptop.getId() }"
						class="btn btn-primary">Sửa</a>
					<a href="/Store/admin/laptop/delete/${laptop.getId() }"
						class="btn btn-danger">Xoá</a>
				</div>	
			</div>
		</div>
	</jsp:body>
</t:admin>