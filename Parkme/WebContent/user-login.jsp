<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>

<!doctype html>
<html class="no-js" lang="">
<head>

<title>Parkme - Trang đăng nhập khách hàng </title>


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
<style type="text/css">
body{
	background-color: #f1f2f7;
}
</style>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body style="background-image: url(images/VehicleParkingLogo.gif); background-size: 1150px;">
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.jsp">
						<h4 style="color: #FFFFFF">Hệ thống Quản lý bãi đậu xe - ParkMe</h4>
					</a>
				</div>
				<div class="login-form">
					<p>
						<%
							String message = (String) session.getAttribute("message");
							if (message != null) {
								session.removeAttribute("message");
						%>
					
					<h6>
						<center>Tài khoản hoặc mật khẩu không hợp lệ, xin thử lại.</center>
					</h6>
					<%
						}
					%>
					</p>
					<form action="UserLogin" method="post">
						<p class="text-center font-weight-bold text-primary">Vui lòng đăng nhập tài khoản của bạn</p>
						<div class="form-group">
							<input class="form-control" type="text"
								placeholder="Tên đăng nhập" required="true" name="username">
						</div>
					
						<div class="form-group">
							<input type="password"
								class="form-control" name="password" placeholder="Mật khẩu"
								required="true">
						</div>
						
						<div class="text-center text-lg-start mt-2 pt-2">
							<button type="submit" name="login" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Bạn chưa có tài khoản ? <a href="user-register.jsp" class="text-danger font-weight-bold">Đăng ký tại đây</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
