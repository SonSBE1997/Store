<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin pageTitle="Hoá đơn">
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
							<h3>Thống kê</h3>
						</div>
					</div>
				</div>
				<h4>Năm ${currentYear }</h4>
				<table class="table table-striped table-hover table-bordered">
					<thead>
					      <tr>
					        <td>Tháng</td>
					        <td>Tổng tiền (VNĐ)</td>
					        <td></td>
					      </tr>
				    </thead>
				    <tbody>
				    	<c:set var="totalPrice" value="0" target="java.lang.Integer" />
				    	<c:forEach begin="0" end="11" var="i">
				    		<tr>
					    		<td>Tháng ${i+1 }</td>
					    		<td>
					    			<c:set var="totalPrice"
										value="${totalPrice + lsBillPrice[i]}"></c:set>
				    				<fmt:formatNumber type="number" maxFractionDigits="3">${lsBillPrice[i] }</fmt:formatNumber>
								</td>
								<td><a
									href="/Store/admin/bill/detail/${currentYear }/${i+1 }">Chi tiết</a></td>
							</tr>
				    	</c:forEach>
				    </tbody>
				</table>
				
				<div class="form-group">
					<div class="col-sm-6"></div>
				    <label class="col-sm-3 control-label">Tổng cộng:</label>
				    <div class="col-sm-3">
				     	<fmt:setLocale value="vi_VN" scope="session" />
	    				<fmt:formatNumber type="currency">${totalPrice }</fmt:formatNumber>
				    </div>
			  	</div>
			  	<div class="clearfix">
			  		<div></div>
				  	<table class="table table-striped table-hover table-bordered">
						<thead>
					     	<tr>
					        <td>Năm</td>
					        <td>Tổng tiền (VNĐ)</td>
					        <td></td>
					      </tr>
					    </thead>
					    <tbody>
				    		<tr>
					    		<td>Năm ${currentYear-1 }</td>
					    		<td>
				    				<fmt:formatNumber type="number" maxFractionDigits="3">${last }</fmt:formatNumber>
								</td>
								<td>
									<a href="/Store/admin/bill/statistic/${currentYear-1 }">Chi tiết</a>
								</td>
				    		</tr>
				    		
				    		<tr>
					    		<td>Năm ${currentYear-2 }</td>
					    		<td>
				    				<fmt:formatNumber type="number" maxFractionDigits="3">${lastOfLast }</fmt:formatNumber>
								</td>
								<td>
									<a href="/Store/admin/bill/statistic/${currentYear-2 }">Chi tiết</a>
								</td>
				    		</tr>
					    </tbody>
					</table>
			  	</div>
			</div>
		</div>
	</jsp:body>
</t:admin>