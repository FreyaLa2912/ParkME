<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>ParkMe - Trang chủ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
body{
	background-color: #f1f2f7;
}
.modal-body {
    max-height:700px; 
    overflow-y: auto;
    width:auto;
}

.modal-dialog{
width:700px; 
padding-top: 7%;
max-width: 800px;
}
.

</style>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body style="background-image: url(images/VehicleParkingLogo.gif); background-size: 1150px;">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="index.jsp">Hệ thống Quản lý bãi đậu xe - ParkMe</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="user-login.jsp">Khách hàng đăng nhập</a></li>
			<li class="nav-item"><a class="nav-link" href="admin-login.jsp">Quản lý đăng nhập</a></li>
		     
		</ul>
		 <button type="button" class="btn btn-primary ml-auto  " data-toggle="modal" data-target="#myModal">
		      Vị trí của bãi đậu xe
      </button>
	</nav>
	 <div class="modal " id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">Vị trí của bãi đậu xe</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <!-- Modal body -->
               <div class="modal-body">
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.9928845436457!2d105.07800835066298!3d10.01744517544636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0b39e099caa09%3A0x8bc40404746cbfda!2sVNPT%20Ki%C3%AAn%20Giang!5e0!3m2!1svi!2s!4v1671453434704!5m2!1svi!2s" width="700" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
               </div>
               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
               </div>
            </div>
         </div>
      </div>
</body>
</html>
