<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Cấu hình laptop">
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
							<h3>Sửa thông tin Cấu hình</h3>
						</div>
					</div>
				</div>
				<br />
				<form action="/Store/admin/config/edit" method="POST"
					accept-charset="UTF-8">
					<input type="text" name="id" class="form-control hide"
						value=${config.getId() }>
				      <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Nhà sản xuất</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="producerId">
				      		<c:forEach items="${lsProducer }" var="producer">
				      			<option value="${producer.getId() }"
										<c:if test="${config.getProducer().getId() == producer.getId() }">selected</c:if>>${producer }</option>
				      		</c:forEach>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">CPU</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="cpuId">
				      		<c:forEach items="${lsCPU }" var="cpu">
				      			<option value="${cpu.getId() }"
										<c:if test="${config.getCpu().getId() == cpu.getId() }">selected</c:if>>${cpu }</option>
				      		</c:forEach>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Ổ cứng</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="disk">
					       <c:forTokens
									items="HDD 512GB,HDD 1TB,SSD 120GB,SSD 128GB,SSD 256GB,SSD 512GB,SSD 1TB"
									delims="," var="disk">
				      			<option value="${disk }"
										<c:if test="${config.getDisk()==disk }">selected</c:if>>${disk }</option>
				      		</c:forTokens>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">RAM</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="ramId">
				      		<c:forEach items="${lsRAM }" var="ram">
				      			<option value="${ram.getId() }"
										<c:if test="${config.getRam().getId()==ram.getId() }">selected</c:if>>${ram }</option>
				      		</c:forEach>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Số khe cắm RAM</label>
				      <div class="col-sm-6">
				      	<input type="number" class="form-control"
								name="memorySocketCount" required="required"
								value="${config.getMemorySocketCount() }">
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Cổng kết nối</label>
				      <div class="col-sm-6">
				      	<input type="text" class="form-control" name="portConnect"
								required="required" value="${config.getPortConnect() }">
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Màn hình</label>
				      <div class="col-sm-6">
				      	<input type="text" class="form-control" name="screen"
								required="required" value="${config.getScreen() }">
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Kích thước</label>
				      <div class="col-sm-6">
				      	<input type="text" class="form-control" name="dimension"
								required="required" value="${config.getDimension() }">
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Pin (cell)</label>
				      <div class="col-sm-6">
				      	<input type="number" class="form-control" name="battery"
								required="required" value="${config.getBattery() }">
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				    	<div class="col-sm-2"></div>
				    	<div class="col-sm-6">
				    		<input type="submit" value="Cập nhật" class="btn btn-success">
				    	</div>
				    </div>
				</form>
			</div>
		</div>
	</jsp:body>
</t:admin>