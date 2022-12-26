<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title>Parkme - Tìm xe</title>


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
<link rel="stylesheet" href="assets/css/style.css">
<style><%@include file="/assets/css/screen.css"%></style><link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<style type="text/css">
body{
	background-color: #f1f2f7;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>

	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>

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
								<li><a href="dashboard.jsp">Bảng tin</a></li>
								<li class="active">Tìm kiếm xe</li>
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



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Tìm xe</strong>
						</div>
						<div class="card-body">
							<form action="search-vehicle.jsp" method="post">
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Tìm kiếm theo mã gửi xe</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="searchdata" name="searchdata"
											class="form-control" required="required"
											autofocus="autofocus">
									</div>
								</div>
								<p style="text-align: center;">
									<button type="submit" class="btn btn-primary btn-md"
										style="padding-left: 2.5rem; padding-right: 2.5rem;"
										name="search">Tìm kiếm</button>
								</p>
							</form>
							<table class="table">
								<thead>
									<tr>
										<th class="text-center">Số thứ tự</th>
										<th>Mã gửi xe</th>
										<th>Tên người gửi</th>
										<th>Biển số xe</th>
										<th class="text-center">Tương tác</th>
									</tr>
								</thead>
								<%
										String parkNumber = request.getParameter("searchdata");
										Connection con = DatabaseConnection.getConnection();
										Statement statement = con.createStatement();
										ResultSet resultset = statement
												.executeQuery("select * from  tblvehicle where ParkingNumber='" + parkNumber + "'");
										if (resultset.next()) {
								%>
								<tr>
									<td class="text-center">
										<%=resultset.getInt(1)%>
									</td>
									<td>
										<%=resultset.getString(2)%>
									</td>
									<td>
										<%=resultset.getString(6)%>
									</td>
									<td>
										<%=resultset.getString(5)%>
									</td>

									<td class="text-center"><a
										href="view-incomingvehicle-detail.jsp?viewid=<%=resultset.getInt(1)%>">Xem</a></td>
								</tr>

								<%
									}
								%>
							</table>

						</div>
					</div>
				</div>



			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
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
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
