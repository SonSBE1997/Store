<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Nhân viên">
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
							<h3>Sửa nhân viên</h3>
						</div>
					</div>
				</div>
				<br />
				<form action="/Store/admin/employee/edit" method="POST"
					accept-charset="UTF-8">
					<input type="text" name="id" class="form-control hide"
						value=${emp.getId() }>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Họ và tên</label>
				      <div class="col-sm-6">
				        <input type="text" name="name" class="form-control"
								required="required" value='${emp.getName() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				    	<label class="col-sm-2 control-label">Giới tính</label>
				      	<div class="col-sm-6">
					    	<label class="radio-inline">
						  	<input type="radio" name="gender" value="true"
								<c:if test="${emp.isGender() }">checked</c:if>>Nam</label>
					  		<label class="radio-inline">
					 		<input type="radio" name="gender" value="false"
								<c:if test="${!emp.isGender() }">checked</c:if>>Nữ</label>
				    	</div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Ngày sinh</label>
				      <div class="col-sm-6">
				        <input type="date" class="form-control" name="dateOfBirth"
								required="required" value=${emp.getDateOfBirth() }>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Số điện thoại</label>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" name="phoneNumber"
								required="required" value='${emp.getPhoneNumber() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Địa chỉ</label>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" name="address"
								required="required" value='${emp.getAddress() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Email</label>
				      <div class="col-sm-6">
				        <input type="email" class="form-control" name="email"
								required="required" value='${emp.getEmail() }'>
				      </div>
				    </div>
				     <div class="form-group col-sm-12">
				     	<label class="col-sm-2 control-label">Chức vụ</label>
				      	<div class="col-sm-6">
				        	<select name="role" class="form-control">
				        		<option value="1"
									<c:if test="${emp.isRole() }">selected</c:if>>Quản lý</option>
				        		<option value="0"
									<c:if test="${!emp.isRole() }">selected</c:if>>Nhân viên</option>
				        	</select>
				      	</div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Username</label>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" name="username"
								required="required" value='${emp.getUsername() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Password</label>
				      <div class="col-sm-6">
				        <input type="password" class="form-control" name="password"
								required="required" value='${emp.getPassword() }'>
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