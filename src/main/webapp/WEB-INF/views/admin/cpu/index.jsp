<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="CPU">
	<jsp:attribute name="customjs">
		<script>
			$('.btn-delete').off('click').on(
					'click',
					function(e) {
						e.preventDefault();
						var btn = $(this);
						var id = btn.data('id');
						var result = confirm("Bạn có muốn xoá CPU có mã " + id
								+ " không?");
						if (result == true) {
							$.ajax({
								url : "/Store/admin/cpu/delete",
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
							<h3>Danh sách CPU</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/cpu/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Tên CPU</td>
				        <td>Socket</td>
				        <td>Vi xử lý</td>
				        <td>Xung cơ bản (GHz)</td>
				        <td>Xung tối đa (GHz)</td>
				        <td>Cache (MB)</td>
				        <td>Tích hợp đồ hoạ</td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsCPU}" var="cpu">
			    		<tr id='row${cpu.getId()}'>
				    		<td>${cpu.getId()}</td>
			    			<td>${cpu.getName() }</td>
			    			<td>${cpu.getSocket() }</td>
			    			<td>${cpu.getProcessor() }</td>
			    			<td>${cpu.getSpeed() }</td>
			    			<td>${cpu.getMaxSpeed() }</td>
			    			<td>${cpu.getCache() }</td>
			    			<td>${cpu.getIntegratedGraphic() }</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${cpu.getId() }>Xoá</a> | <a
									href="/Store/admin/cpu/edit/${cpu.getId()}">Sửa</a>
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