<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="/Store/admin" class="site_title"><i class="fa fa-home"></i>
				<span>Sam Store</span></a>
		</div>

		<div class="clearfix"></div>
		<!-- /menu profile quick info -->

		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<h3>Danh mục</h3>
				<ul class="nav side-menu">
					<li><a href="/Store/admin"><i class="fa fa-home"></i>Trang
							chủ</a></li>
					<li><a href="/Store/admin/employee/1"> <i
							class="fa fa-edit"></i>Nhân viên
					</a></li>
					<li><a href="/Store/admin/customer/1"><i
							class="fa fa-desktop"></i>Khách hàng</a></li>
					<li><a href="/Store/admin/producer/1"><i
							class="fa fa-table"></i> Nhà sản xuất</a></li>
					<li><a href="/Store/admin/cpu/1"><i
							class="fa fa-bar-chart-o"></i>CPU</a></li>
					<li><a href="/Store/admin/ram/1"><i class="fa fa-clone"></i>RAM</a></li>
					<li><a href="/Store/admin/config/1"><i class="fa fa-cog"></i>Cấu
							hình</a></li>
					<li><a href="/Store/admin/laptop/1"><i
							class="fa fa-laptop"></i>Laptop</a></li>
					<jsp:useBean id="now" class="java.util.Date" />
					<li><a><i class="fa fa-database"></i>Hoá đơn <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="/Store/admin/bill/1">Đơn đặt hàng</a></li>
							<li><a
								href="/Store/admin/bill/statistic/${now.getYear()+1900 }">Thống
									kê</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /sidebar menu -->
	</div>
</div>