<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav>
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="javascript:;"
					class="user-profile dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img
						src='<c:url value="/resources/admin/production/images/img.jpg"/>'
						alt="">John Doe<span class=" fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li><a href="/Store/admin/login"><i
								class="fa fa-sign-out pull-right"></i> Log Out</a></li>
					</ul></li>

				<li role="presentation" class="dropdown"><a href="javascript:;"
					class="dropdown-toggle info-number" data-toggle="dropdown"
					aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span
						class="badge bg-green">6</span></a>
					<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
						role="menu">
						<li><a> <span class="image"> <img
									src='<c:url value="/resources/admin/production/images/img.jpg"/>'
									alt="Profile Image" />
							</span> <span><span>John Smith</span></span> <span class="time">3
									mins ago</span> <span class="message"> Film festivals used to
									be do-or-die moments for movie makers.</span>
						</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
</div>
<!-- /top navigation -->