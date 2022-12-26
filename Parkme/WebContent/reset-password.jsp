<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>

<title>VPMS-Reset Page</title>


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
<style><%@include file="/assets/css/screen.css"%></style><style type="text/css">
body{
	background-color: #f1f2f7;
}
</style>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
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
				<%
					String mobileNo = request.getParameter("contactno");
					Connection con = DatabaseConnection.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select password from tbladmin where MobileNumber='" + mobileNo + "'");
					if (rs.next()) {
				%>
				<div class="login-form">
					<div class="form-group">
						<label class="font-weight-bold text-danger">Mật khẩu của bạn :</label>
						<lable><%=rs.getString(1)%></lable>
					</div>
					<div>
						<a class="btn btn-primary" href="admin-login.jsp" role="button">Đăng nhập</a>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="login-form">
					<div class="form-group">
						<label>Xin lỗi ! Tài khoản của bạn không có trong hệ thống.</label>
					</div>
				</div>
				<%
					}
				%>
				
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
