<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Nhân viên">
	<jsp:attribute name="customjs">
		<script src='<c:url value="/resources/admin/custom.js"/>'></script>
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
							<h3>Danh sách nhân viên</h3>
						</div>
					</div>
				</div>
				<div class="input-group">
					<a href="/Store/admin/employee/create" class="btn btn-primary">Thêm mới</a>
				</div>
				<table class="table table-striped table-hover table-bordered">
				<thead>
				      <tr>
				        <td>ID</td>
				        <td>Họ và tên</td>
				        <td>Giới tính</td>
				        <td>Ngày sinh</td>
				        <td>SĐT</td>
				        <td>Địa chỉ</td>
				        <td>Email</td>
				        <td>Username</td>
				        <td>Chức vụ</td>
				        <td></td>
				      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${lsEmployee}" var="emp">
			    		<tr id='row${emp.getId()}'>
				    		<td>${emp.getId()}</td>
			    			<td>${emp.getName() }</td>
				    		<td>
				    			<c:choose>
				    				<c:when test="${emp.isGender() }">Nam</c:when>
				    				<c:otherwise>Nữ</c:otherwise>
				    			</c:choose>
				    		</td>
				    		<td><fmt:formatDate value="${emp.getDateOfBirth() }"
										pattern="dd/MM/yyyy" /></td>
				    		<td>${emp.getPhoneNumber() }</td>
				    		<td>${emp.getAddress() }</td>
				    		<td>${emp.getEmail() }</td>
				    		<td>${emp.getUsername() }</td>
				    		<td>
				    			<a href="#" id='role${emp.getId()}' class="btn-role"
									data-id=${emp.getId() }>
					    			<c:choose>
					    				<c:when test="${emp.isRole() }">Quản lý</c:when>
					    				<c:otherwise>Nhân viên</c:otherwise>
					    			</c:choose>
				    			</a>
				    		</td>
				    		<td>
				    			<a href="#" class="btn-delete" data-id=${emp.getId() }>Xoá</a>| <a
									href="/Store/admin/employee/edit/${emp.getId()}">Sửa</a>
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