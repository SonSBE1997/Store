<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Cấu hình laptop">
	<jsp:attribute name="customjs">
		<script>
			$('.btn-delete').off('click').on(
					'click',
					function(e) {
						e.preventDefault();
						var btn = $(this);
						var id = btn.data('id');
						var result = confirm("Bạn có muốn xoá cấu hình có mã "
								+ id + " không?");
						if (result == true) {
							$.ajax({
								url : "/Store/admin/config/delete",
								data : {
									id : id
								},
								type : "POST",
								success : function(response) {
									if (response == "del") {
										$("#row" + id).remove();
									}
								}
							});
						}
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
							<h3>Danh sách Cấu hình</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/config/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Nhà sản xuất</td>
				        <td>CPU</td>
				        <td>RAM</td>
				        <td>số khe cắm RAM</td>
				        <td>Ổ cứng</td>
				        <td>Cổng kết nối</td>
				        <td>Màn hình</td>
				        <td>Kích thước</td>
				        <td>Pin (cell)</td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsConfig}" var="config">
			    		<tr id='row${config.getId()}'>
				    		<td>${config.getId()}</td>
				    		<td>${config.getProducer()}</td>
				    		<td>${config.getCpu()}</td>
				    		<td>${config.getRam()}</td>
			    			<td>${config.getMemorySocketCount() }</td>
			    			<td>${config.getDisk() }</td>
			    			<td>${config.getPortConnect() }</td>
			    			<td>${config.getScreen() }</td>
			    			<td>${config.getDimension() }</td>
			    			<td>${config.getBattery() }</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${config.getId() }>Xoá</a> | <a
									href="/Store/admin/config/edit/${config.getId()}">Sửa</a>
				    		</td>
			    		</tr>
			    	</c:forEach>
			    </tbody>
				</table>
				<ul class="pagination">  
				  <c:forEach var="i" begin="1" end="${pageCount}">
				  	<li class='<c:if test="${currentPage==i}">active</c:if>'>
				  		<a href="${i }">${i }</a>
					</li>
				  </c:forEach>
				</ul>
			</div>
		</div>
	</jsp:body>
</t:admin>