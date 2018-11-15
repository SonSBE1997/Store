<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Laptop">
	<jsp:attribute name="navigation">
		<%@include file="../navigation.jsp"%>
		<%@include file="../top.jsp"%>
	</jsp:attribute>
	<jsp:attribute name="customjs">
		<script>
			$('#configId').change(function() {
				var config = $(this).find(':selected');
				console.log(config);
				$('#cpu').text(config.data('cpu'));
				$('#ram').text(config.data('ram'));
				$('#disk').text(config.data('disk'));
				$('#port').text(config.data('port'));
				$('#screen').text(config.data('screen'));
				$('#battery').text(config.data('battery'));
				$('#dimension').text(config.data('dimension'));
			})

			$('#image').change(
					function(e) {
						var files = e.target.files;
						var forms = new FormData();
						forms.append('file', files[0]);
						$.ajax({
							url : "/Store/admin/laptop/uploadFile",
							data : forms,
							type : "POST",
							contentType : false,
							processData : false,
							enctype : "multipart/form-data",
							success : function(response) {
								console.log(response);
								if (response == "true")
									$('#imgUpload').attr(
											'src',
											"/Store/resources/image/"
													+ files[0].name);
							}
						});

					})
		</script>
	</jsp:attribute>
	<jsp:body>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 bg-white">
				<div class="dashboard_graph">
					<div class="row x_title">
						<div class="col-md-6">
							<h3>Sửa thông tin</h3>
						</div>
					</div>
				</div>
				<br />
				<form action="/Store/admin/laptop/edit" method="POST"
					accept-charset="UTF-8">
				    <div class="col-md-8 col-sm-8 col-xs-8">
						<div class="form-group col-sm-12">
						 <input type="text" name="id" class="hidden"
								value="${laptop.getId() }">
					      <label class="col-sm-2 control-label">Tên laptop</label>
					      <div class="col-sm-8">
					       	 <input type="text" name="name" class="form-control"
									required="required" value="${laptop.getName() }">
					      </div>
					    </div>
					    <div class="form-group col-sm-12">
					    	<label class="col-sm-2 control-label">Đơn giá</label>
					      	<div class="col-sm-8">
					        	<input type="number" name="price" class="form-control"
									required="required" value="${laptop.getPrice() }">
					      	</div>
					    </div>
					    <div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">Phụ kiện</label>
					      <div class="col-sm-8">
					       <input type="text" name="accessories" class="form-control"
									required="required" value="${laptop.getAccessories() }">
					      </div>
					    </div>
					    <div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">Trọng lượng</label>
					      <div class="col-sm-8">
					       <input type="number" name="weight" step=0.1
									class="form-control" required="required"
									value="${laptop.getWeight() }">
					      </div>
					    </div>
					    <div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">Hệ điều hành</label>
					      <div class="col-sm-8">
					        <input type="text" class="form-control" name="os"
									required="required" value="${laptop.getOs() }">
					      </div>
					    </div>
					    <div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">Bảo hành</label>
					      <div class="col-sm-8">
					        <input type="text" class="form-control" name="warranty"
									required="required" value="${laptop.getWarranty() }">
					      </div>
					    </div>
					     <div class="form-group col-sm-12">
					     	<label class="col-sm-2 control-label">Chức vụ</label>
					      	<div class="col-sm-8">
					      		<label class="checkbox-inline"><input
									type="checkbox" name="hot" value="true"
									<c:if test="${laptop.isHot() }">checked</c:if>>Bán chạy</label>
					      	</div>
					      	
					    </div>
					    <div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">Giảm giá</label>
					      <div class="col-sm-8">
					        <input type="number" class="form-control" name="discount"
									step=0.1 required="required" value="${laptop.getDiscount() }">
					      </div>
					    </div>
					    <h4>Cấu hình</h4>		
				    	<div class="form-group col-sm-12">
					      <label class="col-sm-2 control-label">ID cấu hình</label>
					      <div class="col-sm-8">
					        <select class="form-control" name="configId" id="configId">
					        	<c:forEach items="${lsConfig }" var="config">
					        		<option data-cpu="${config.getCpu() }"
											data-ram="${config.getRam() }"
											data-disk="${config.getDisk() }"
											data-port="${config.getPortConnect() }"
											data-screen="${config.getScreen() }"
											data-battery="${config.getBattery() }"
											data-dimension="${config.getDimension() }"
											value='${config.getId() }'
											<c:if test="${config.getId()==lapConfig.getId() }">selected</c:if>>${config.getId() }</option>
								</c:forEach>
					        </select>
					      </div>
					    </div>	 
					    <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">CPU</label>
					      	<div class="col-sm-8" id="cpu">${lapConfig.getCpu()}</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">RAM</label>
					      	<div class="col-sm-8" id='ram'>${lapConfig.getRam()}</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">Ổ cứng</label>
					      	<div class="col-sm-8" id='disk'>${lapConfig.getDisk()}</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">Cổng kết nối</label>
					      	<div class="col-sm-8" id='port'>${lapConfig.getPortConnect()}</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">Màn hình</label>
					      	<div class="col-sm-8" id='screen'>${lapConfig.getScreen()}</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">Pin</label>
					      	<div class="col-sm-8" id='battery'>${lapConfig.getBattery()} cell</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-2 control-label">Kích thước</label>
					      	<div class="col-sm-8" id='dimension'>${lapConfig.getDimension()}</div>
						</div>   	
				    </div>
				    <div class="col-sm-4 col-sm-4 col-xs-4">
				    	<input type="text" name="lastImage"
							value="${laptop.getImage() }" class="hidden">
				    	<input id="image" type="file" name="image" accept=".jpg,.png"
							value="${laptop.getImage() }">
				    	<br />
				    	<img alt="" id="imgUpload"
							src='<c:url value="/resources/image/${laptop.getImage() }"/>'
							height="200px">
				    </div>
				    <div class="form-group col-sm-12">
				    	<div class="col-sm-2"></div>
				    	<div class="col-sm-8 input-group">
				    		<input type="submit" value="Cập nhật" class="btn btn-success">
				    		<a href="/Store/admin/laptop/1" class="btn btn-default">Huỷ bỏ</a>
				    	</div>
				    </div>
				</form>
				</div>
			</div>
	</jsp:body>
</t:admin>