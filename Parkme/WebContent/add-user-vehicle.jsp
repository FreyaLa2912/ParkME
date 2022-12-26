<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>Parkme - Thêm xe</title>
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
<style><%@include file="/assets/css/screen.css"%></style>

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style type="text/css">
body{
	background-color: #f1f2f7;
}




.navbar .main-menu{
    background-color: #104269;
}

.navbar .navbar-nav li > a {

    color: #FAFAF8;

}
.navbar .navbar-nav > li.active {
 	background-color: #104269;
}

.left-panel {
    background-color:  #104269  !important;


}
.navbar .navbar-nav li.menu-item-has-children.show .sub-menu {
 background-color:  #104269  !important;

}
.navbar {
 background-color:  #104269  !important;

}
.count{
font-size: 30px;
}

.right-panel header.header{
    background: #0a2b45;
     border-bottom: 1px solid #0a2b45;
}


.right-panel .navbar-header{
background-color: #0a2b45;
   
}
.menutoggle{
color: #FAFAF8 !important;
}
.navbar .navbar-nav li > a .menu-icon{
color: #FAFAF8 !important ;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="includes/user-sidebar.jsp"></jsp:include>

	<jsp:include page="includes/user-header.jsp"></jsp:include>

	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Danh mục</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="user-dashboard.jsp">Bảng tin</a></li>
								<li class="active">Đặt chỗ gửi phương tiện</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">


			<div class="row">
				<div class="col-lg-6">
					<div class="card"></div>
					<!-- .card -->

				</div>
				<!--/.col-->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong>Đặt xe </strong> 
						</div>
							<p>
								<%
									String message = (String) session.getAttribute("message");
										if (message != null) {
											session.removeAttribute("message");
								%>
							
							<h6><center>Bãi đậu xe đã đầy, xin phải chờ đợi.</center></h6>
							<%
								}
							%>
							</p>
							<div class="card-body card-block">
							<form action="AddOwnVehicle" method="post">
								<p style="font-size: 16px; color: red" align="center">
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="select" class=" form-control-label">Loại phương tiện</label>
									</div>
									<div class="col-12 col-md-9">
										<select name="catename" id="catename" class="form-control">
											<option value="0">Chọn loại phương tiện</option>
											<%
												Connection con = DatabaseConnection.getConnection();
													Statement statement = con.createStatement();
													ResultSet resultset = statement.executeQuery("select * from tblcategory");
													while (resultset.next()) {
											%>
											<option value="<%=resultset.getString(2)%>"><%=resultset.getString(2)%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Hãng phương tiện</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="vehcomp" name="vehcomp"
											class="form-control" placeholder="Nhập hãng phương tiện"
											required="true">
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Biển số phương tiện</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="vehreno" name="vehreno"
											class="form-control" placeholder="Nhập biển số phương tiện"
											required="true">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Tên người gửi</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="ownername" name="ownername"
											class="form-control" placeholder="Nhập tên người gửi"
											value="<%=session.getAttribute("fullName")%>" required="true"
											readonly>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Số điện thoại người gửi</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="ownercontno" name="ownercontno"
											class="form-control" placeholder="Nhập số điện thoại người gửi"
											required="true" maxlength="10" value="<%=session.getAttribute("mobileNo")%>" readonly>
									</div>
									
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Tên tài khoản</label>
									</div>
									
									<div class="col-12 col-md-9">
										<input type="text" id="uname" name="uname"
											class="form-control" placeholder=""
											required="true" maxlength="10" value="<%=session.getAttribute("uname")%>" readonly>
									</div>
								</div>
								
								<p style="text-align: center;">
										<button type="submit" name="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đặt chỗ</button>
								</p>
							</form>
						</div>

					</div>

				</div>
				<div class="col-lg-6"></div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

	<%
		} else {
			response.sendRedirect("user-login.jsp");
		}
	%>
</body>
</html>
