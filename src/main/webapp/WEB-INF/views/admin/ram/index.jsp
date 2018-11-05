<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Ram">
	<jsp:attribute name="customjs">
		<script>
			$('.btn-delete').off('click').on(
					'click',
					function(e) {
						e.preventDefault();
						var btn = $(this);
						var id = btn.data('id');
						var result = confirm("Bạn có muốn xoá RAM có mã " + id
								+ " không?");
						if (result == true) {
							$.ajax({
								url : "/Store/admin/ram/delete",
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
							<h3>Danh sách RAM</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/ram/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Dung lượng (GB)</td>
				        <td>Loại ram</td>
				        <td>Bus</td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsRam}" var="ram">
			    		<tr id='row${ram.getId()}'>
				    		<td>${ram.getId()}</td>
			    			<td>${ram.getMemoryCapacity() }</td>
			    			<td>${ram.getType() }</td>
			    			<td>${ram.getBus() }</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${ram.getId() }>Xoá</a> | <a
									href="/Store/admin/ram/edit/${ram.getId()}">Sửa</a>
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