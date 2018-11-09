<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Laptop">
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
							<h3>Chi tiết</h3>
						</div>
					</div>
				</div>
				<div class="">
				
				</div>
				<div class="input-group">
					<a href="/Store/admin/laptop/1" class="btn btn-default">Quay lại</a>
					<a href="/Store/admin/laptop/edit/${laptop.getId() }"
						class="btn btn-primary">Sửa</a>
					<a href="/Store/admin/laptop/delete/${laptop.getId() }"
						class="btn btn-danger">Xoá</a>
				</div>				
			</div>
		</div>
	</jsp:body>
</t:admin>