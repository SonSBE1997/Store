<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="CPU">
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
							<h3>Sửa thông tin CPU</h3>
						</div>
					</div>
				</div>
				<br />
				<form action="/Store/admin/cpu/edit" method="POST"
					accept-charset="UTF-8">
					<input type="text" name="id" class="form-control hide"
						value=${cpu.getId() }>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Tên CPU</label>
				      <div class="col-sm-6">
				        <input type="text" name="name" class="form-control"
								required="required" value='${cpu.getName() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Socket</label>
				      <div class="col-sm-6">
				        <input type="text" name="socket" class="form-control"
								required="required" value='${cpu.getSocket() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Vi xử lý</label>
				      <div class="col-sm-6">
				        <input type="text" name="processor" class="form-control"
								required="required" value='${cpu.getProcessor() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Xung cơ bản (GHz)</label>
				      <div class="col-sm-6">
				        <input type="number" step=0.1 name="speed"
								class="form-control" required="required"
								value='${cpu.getSpeed() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Xung tối đa (GHz)</label>
				      <div class="col-sm-6">
				        <input type="number" step=0.1 name="maxSpeed"
								class="form-control" required="required"
								value='${cpu.getSpeed() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Cache (MB)</label>
				      <div class="col-sm-6">
				        <input type="number" name="cache" class="form-control"
								required="required" value='${cpu.getCache() }'>
				      </div>
				    </div>
				    <div class="form-group col-sm-12">
				      <label class="col-sm-2 control-label">Tích hợp đồ hoạ</label>
				      <div class="col-sm-6">
				        <input type="text" name="integratedGraphic"
								class="form-control" value='${cpu.getIntegratedGraphic() }'>
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