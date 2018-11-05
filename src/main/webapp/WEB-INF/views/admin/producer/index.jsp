<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:admin pageTitle="Nhà sản xuất">
	<jsp:attribute name="customjs">
		<script>
			$('.btn-delete').off('click').on('click',function(e) {
				e.preventDefault();
				var btn = $(this);
				var id = btn.data('id');
				var result = confirm("Bạn có muốn xoá nhà sản xuất có mã "
						+ id + " không?");
				if (result == true) {
					$.ajax({
						url : "/Store/admin/producer/delete",
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
							<h3>Danh sách nhà sản xuất</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/producer/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Tên nhà sản xuất</td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsProducer}" var="producer">
			    		<tr id='row${producer.getId()}'>
				    		<td>${producer.getId()}</td>
			    			<td>${producer.getName() }</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${producer.getId() }>Xoá</a> | <a
									href="/Store/admin/producer/edit/${producer.getId()}">Sửa</a>
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