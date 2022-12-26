<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="dashboard.jsp"><i
						class="menu-icon fa fa-laptop"></i>Bảng tin</a></li>


				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Loại phương tiện
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="fa fa-table"></i><a href="add-category.jsp">Thêm loại phương tiện</a></li>
						<li><i class="fa fa-table"></i><a href="manage-category.jsp">Danh sách loại P.Tiện</a></li>
					</ul></li>
				<li><a href="add-vehicle.jsp"> <i
						class="menu-icon fa fa-plus-circle"></i>Thêm phương tiện </a></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Quản lý phương tiện</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-incomingvehicle.jsp">P.Tiện đang trong bãi</a></li>
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-outgoingvehicle.jsp">P.Tiện đã rời bãi</a></li>

					</ul></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Báo cáo</a>
					<ul class="sub-menu children dropdown-menu">
					<li><i class="menu-icon fa fa-th"></i><a
							href="bwdates-report-ds.jsp">Báo cáo ngày</a></li>
					</ul></li>
				<li><a href="search-vehicle.jsp"> <i
						class="menu-icon ti-search"></i>Tìm xe
				</a></li>
				<li><a href="parking-seat.jsp"> <i
						class="menu-icon fa fa-car"></i>Tổng chỗ đậu xe
				</a></li>
				<li><a href="user-membership.jsp"><i
						class="menu-icon fa fa-group"></i>Danh sách thành viên </a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>