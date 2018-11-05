<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Ram">
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
							<h3>Thêm Ram mới</h3>
						</div>
					</div>
				</div>
				<br />
				<form action="" method="POST" accept-charset="UTF-8">
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Dung lượng bộ nhớ</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="memoryCapacity">
					       <c:forTokens items="2,4,8,16,32" delims="," var="capacity">
				      			<option value="${capacity }">${capacity } GB</option>
				      		</c:forTokens>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Loại RAM</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="type">
					      <c:forTokens items="DDR3,DDR3L,DDR4" delims="," var="type">
				      			<option value="${type }">${type }</option>
				      		</c:forTokens>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Bus</label>
				      <div class="col-sm-6">
				      	<select class="form-control" name="bus">
					     	<c:forTokens items="1333,1600,2133,2400,2666,3000,3200"
									delims="," var="bus">
				      			<option value="${bus }">${bus }</option>
				      		</c:forTokens>
					  	</select>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				    	<div class="col-sm-2"></div>
				    	<div class="col-sm-6">
				    		<input type="submit" value="Thêm mới" class="btn btn-success">
				    	</div>
				    </div>
				</form>
			</div>
		</div>
	</jsp:body>
</t:admin>