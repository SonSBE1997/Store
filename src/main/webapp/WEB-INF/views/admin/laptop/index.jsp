<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Laptop">
	<jsp:attribute name="customjs">
		<script src='<c:url value="/resources/admin/laptop.js"/>'></script>
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
							<h3>Danh sách laptop</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/laptop/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Tên laptop</td>
				        <td>Giá tiền (VNĐ)</td>
				        <td>Bán chạy</td>
				        <td></td>
				        <td></td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsLaptop}" var="laptop">
			    		<tr id='row${laptop.getId()}'>
				    		<td>${laptop.getId()}</td>
			    			<td>${laptop.getName() }</td>
			    			<td>
<%-- 			    				<fmt:formatNumber type="number" maxFractionDigits="3">${laptop.getPrice() }</fmt:formatNumber> --%>
								<fmt:setLocale value="vi_VN" scope="session" />
			    				<fmt:formatNumber type="currency">${laptop.getPrice() }</fmt:formatNumber>
			    			</td>
			    			<td>
			    				<a href="#" id='status${laptop.getId()}' class="btn-status"
									data-id=${laptop.getId() }>
					    			<c:choose>
					    				<c:when test="${laptop.isHot() }">Có</c:when>
					    				<c:otherwise>Không</c:otherwise>
					    			</c:choose>
				    			</a>
			    			</td>
			    			<td>
				    			<a href="/Store/admin/laptop/detail/${laptop.getId()}">Chi tiết</a>
							</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${laptop.getId() }>Xoá</a>
				    		</td>
				    		<td>
				    			<a href="/Store/admin/laptop/edit/${laptop.getId()}">Sửa</a>
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