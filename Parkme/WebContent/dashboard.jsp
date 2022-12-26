<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%
					int count_today_vehentries = 0;
						Connection con = DatabaseConnection.getConnection();
						Statement statement = con.createStatement();
						ResultSet resultset = statement
								.executeQuery("select count(*) from tblvehicle where date(InTime)=CURDATE()");
						while (resultset.next()) {
							count_today_vehentries = resultset.getInt(1);
						}
				%>
<%
						int count_yesterday_vehentries = 0;
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select count(*) from tblvehicle where date(InTime)=CURDATE()-1 ");
							while (rs.next()) {
								count_yesterday_vehentries = rs.getInt(1);
							}
					%>
				
<%
						int count_lastsevendays_vehentries = 0;
							Statement stmt = con.createStatement();
							ResultSet rst = stmt.executeQuery(
									"select count(*) from tblvehicle where date(InTime)>=(DATE(NOW()) - INTERVAL 7 DAY)");
							while (rst.next()) {
								count_lastsevendays_vehentries = rst.getInt(1);
							}
					%>
					
	<%
						int count_total_vehentries = 0;
							Statement allstmt = con.createStatement();
							ResultSet allrst = allstmt.executeQuery("select count(*) from tblvehicle");
							while (allrst.next()) {
								count_total_vehentries = allrst.getInt(1) ;
								count_total_vehentries = count_total_vehentries ;
								
							}
					%>

<%
						 int booking_seats = 0;
							Statement booking_seatsbookingstmt = con.createStatement();
							ResultSet bookingrst = allstmt.executeQuery("select count(*) from tblvehicle where status=''");
							while (bookingrst.next()) {
								booking_seats = bookingrst.getInt(1);
							}
					%>
<%
						 	int ParingSeatCapactiy=0;
							Statement ParingCapactiyStmt = con.createStatement();
							ResultSet ParingCapactiyrst = allstmt.executeQuery("select * from tblparkingseatcapacity");
							while (ParingCapactiyrst.next()) {
								ParingSeatCapactiy = ParingCapactiyrst.getInt(1);
								ParingSeatCapactiy = ParingSeatCapactiy - booking_seats;
							}
					%>
<!--  pie chart -->
<%

Gson gsonObj = new Gson();

Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

map = new HashMap<Object,Object>(); map.put("label", "Đã đặt"); map.put("y", booking_seats); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Chỗ trống"); map.put("y",ParingSeatCapactiy); list.add(map);



String dataPoints = gsonObj.toJson(list);

%>
<!--  colum  chart -->

<%
Gson gsonObj1 = new Gson();
Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

map1 = new HashMap<Object,Object>();   map1.put("label", "7 ngày"); map1.put("y", count_lastsevendays_vehentries); list1.add(map1);
map1 = new HashMap<Object,Object>();   map1.put("label", "Hôm qua"); map1.put("y", count_yesterday_vehentries); list1.add(map1);
map1 = new HashMap<Object,Object>();   map1.put("label", "Hôm nay"); map1.put("y", count_today_vehentries); list1.add(map1);


 
String dataPoints1 = gsonObj1.toJson(list1);
%>

<!doctype html>

<html class="no-js" lang="">
<head>

<title >ParkMe - Bảng tin quản lý</title>


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


<style><%@include file="/assets/css/screen.css"%></style>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />

<style>
.sub-menu{
right: -200px;
}
	


/* Styles */




</style>


<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Số lượng chỗ đậu xe",
	      fontFamily: "Times New Roman",
	      fontWeight: "normal",
	},

	data: [{
		  
		type: "pie",
		showInLegend: true,
		 labelFontSize: 20,
		indexLabelFontSize: 20, 
		legendText: "{label}",
		toolTipContent: "{label} <strong>{y}</strong>",
		indexLabel: "{label} {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
}


);
var chart1 = new CanvasJS.Chart("chartContainer1", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		
		text: "Số lượng đặt xe ",
	      fontFamily: "Times New Roman",
	      fontWeight: "normal",
	},
	axisX:{
		
		   labelFontSize: 18,
		includeZero: true
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		//indexLabel: "{y}", //Shows y value on all Data Points
	
		
		
		indexLabel: "{1} {y}",
		dataPoints: <%out.print(dataPoints1);%>
	}]
});

chart1.render();
chart.render();
}
</script>

</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>

	<!-- Content -->
	<div class="content">
		<!-- Animated -->
		<div class="animated fadeIn">
			<!-- Widgets  -->
			<div class="row">
				

				<div class="col-lg-3 col-md-6 col-lg-6 col-xl-3">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-1">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"><%=count_today_vehentries%> </span>
										</div>
										<div class="stat-heading">Số lượng xe gửi hôm nay</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 col-lg-6 col-xl-3">
				
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib color1">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_yesterday_vehentries%>
											</span>
										</div>
										<div class="stat-heading">Số lượng xe gửi hôm qua</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 col-lg-6 col-xl-3">
					
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-3">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_lastsevendays_vehentries%>
											</span>
										</div>
										<div class="stat-heading">Số lượng xe trong 1 tuần</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 col-lg-6 col-xl-3">
				

					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-4">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_total_vehentries%>
											</span>
										</div>
										<div class="stat-heading">Tổng số xe đã gửi</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-lg-6 col-md-6 col-xl-6">
				

					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib color2">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=booking_seats%>
											</span>
										</div>
										<div class="stat-heading">Xe đang có trong bãi</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-xl-6">
			
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib color3">
									<i class="pe-7s-car"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=ParingSeatCapactiy%>
											</span>
										</div>
										<div class="stat-heading">Chỗ trống </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-lg-12 col-md-12 col-xl-6 ">
				
			<div id="chartContainer" style="height: 397.3px; width: 100%;"></div>
				</div>
				<div class="col-lg-12 col-md-12 col-xl-6">
			<div id="chartContainer1" style="height: 397.3px; "></div>
				</div>
			</div>
			<!-- /Widgets -->
			
		</div>
		<!-- .animated -->
	</div>
	<!-- /.content -->
	<div class="clearfix"></div>
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp"></jsp:include>

	<!-- /#right-panel -->

	<!-- Scripts -->
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

	<!--  Chart js -->
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

	<!--Chartist Chart-->
	<script
		src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
	<script src="assets/js/init/weather-init.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	<script src="assets/js/init/fullcalendar-init.js"></script>

	<!--Local Stuff-->
	<script>
		jQuery(document)
				.ready(
						function($) {
							"use strict";

							// Pie chart flotPie1
							var piedata = [ {
								label : "Desktop visits",
								data : [ [ 1, 32 ] ],
								color : '#5c6bc0'
							}, {
								label : "Tab visits",
								data : [ [ 1, 33 ] ],
								color : '#ef5350'
							}, {
								label : "Mobile visits",
								data : [ [ 1, 35 ] ],
								color : '#66bb6a'
							} ];

							$.plot('#flotPie1', piedata, {
								series : {
									pie : {
										show : true,
										radius : 1,
										innerRadius : 0.65,
										label : {
											show : true,
											radius : 2 / 3,
											threshold : 1
										},
										stroke : {
											width : 0
										}
									}
								},
								grid : {
									hoverable : true,
									clickable : true
								}
							});
							// Pie chart flotPie1  End
							// cellPaiChart
							var cellPaiChart = [ {
								label : "Direct Sell",
								data : [ [ 1, 65 ] ],
								color : '#5b83de'
							}, {
								label : "Channel Sell",
								data : [ [ 1, 35 ] ],
								color : '#00bfa5'
							} ];
							$.plot('#cellPaiChart', cellPaiChart, {
								series : {
									pie : {
										show : true,
										stroke : {
											width : 0
										}
									}
								},
								legend : {
									show : false
								},
								grid : {
									hoverable : true,
									clickable : true
								}

							});
							// cellPaiChart End
							// Line Chart  #flotLine5
							var newCust = [ [ 0, 3 ], [ 1, 5 ], [ 2, 4 ],
									[ 3, 7 ], [ 4, 9 ], [ 5, 3 ], [ 6, 6 ],
									[ 7, 4 ], [ 8, 10 ] ];

							var plot = $.plot($('#flotLine5'), [ {
								data : newCust,
								label : 'New Data Flow',
								color : '#fff'
							} ], {
								series : {
									lines : {
										show : true,
										lineColor : '#fff',
										lineWidth : 2
									},
									points : {
										show : true,
										fill : true,
										fillColor : "#ffffff",
										symbol : "circle",
										radius : 3
									},
									shadowSize : 0
								},
								points : {
									show : true,
								},
								legend : {
									show : false
								},
								grid : {
									show : false
								}
							});
							// Line Chart  #flotLine5 End
							// Traffic Chart using chartist
							if ($('#traffic-chart').length) {
								var chart = new Chartist.Line('#traffic-chart',
										{
											labels : [ 'Jan', 'Feb', 'Mar',
													'Apr', 'May', 'Jun' ],
											series : [
													[ 0, 18000, 35000, 25000,
															22000, 0 ],
													[ 0, 33000, 15000, 20000,
															15000, 300 ],
													[ 0, 15000, 28000, 15000,
															30000, 5000 ] ]
										}, {
											low : 0,
											showArea : true,
											showLine : false,
											showPoint : false,
											fullWidth : true,
											axisX : {
												showGrid : true
											}
										});

								chart
										.on(
												'draw',
												function(data) {
													if (data.type === 'line'
															|| data.type === 'area') {
														data.element
																.animate({
																	d : {
																		begin : 2000 * data.index,
																		dur : 2000,
																		from : data.path
																				.clone()
																				.scale(
																						1,
																						0)
																				.translate(
																						0,
																						data.chartRect
																								.height())
																				.stringify(),
																		to : data.path
																				.clone()
																				.stringify(),
																		easing : Chartist.Svg.Easing.easeOutQuint
																	}
																});
													}
												});
							}
							// Traffic Chart using chartist End
							//Traffic chart chart-js
							if ($('#TrafficChart').length) {
								var ctx = document
										.getElementById("TrafficChart");
								ctx.height = 150;
								var myChart = new Chart(
										ctx,
										{
											type : 'line',
											data : {
												labels : [ "Jan", "Feb", "Mar",
														"Apr", "May", "Jun",
														"Jul" ],
												datasets : [
														{
															label : "Visit",
															borderColor : "rgba(4, 73, 203,.09)",
															borderWidth : "1",
															backgroundColor : "rgba(4, 73, 203,.5)",
															data : [ 0, 2900,
																	5000, 3300,
																	6000, 3250,
																	0 ]
														},
														{
															label : "Bounce",
															borderColor : "rgba(245, 23, 66, 0.9)",
															borderWidth : "1",
															backgroundColor : "rgba(245, 23, 66,.5)",
															pointHighlightStroke : "rgba(245, 23, 66,.5)",
															data : [ 0, 4200,
																	4500, 1600,
																	4200, 1500,
																	4000 ]
														},
														{
															label : "Targeted",
															borderColor : "rgba(40, 169, 46, 0.9)",
															borderWidth : "1",
															backgroundColor : "rgba(40, 169, 46, .5)",
															pointHighlightStroke : "rgba(40, 169, 46,.5)",
															data : [ 1000,
																	5200, 3600,
																	2600, 4200,
																	5300, 0 ]
														} ]
											},
											options : {
												responsive : true,
												tooltips : {
													mode : 'index',
													intersect : false
												},
												hover : {
													mode : 'nearest',
													intersect : true
												}

											}
										});
							}
							//Traffic chart chart-js  End
							// Bar Chart #flotBarChart
							$.plot("#flotBarChart", [ {
								data : [ [ 0, 18 ], [ 2, 8 ], [ 4, 5 ],
										[ 6, 13 ], [ 8, 5 ], [ 10, 7 ],
										[ 12, 4 ], [ 14, 6 ], [ 16, 15 ],
										[ 18, 9 ], [ 20, 17 ], [ 22, 7 ],
										[ 24, 4 ], [ 26, 9 ], [ 28, 11 ] ],
								bars : {
									show : true,
									lineWidth : 0,
									fillColor : '#ffffff8a'
								}
							} ], {
								grid : {
									show : false
								}
							});
							// Bar Chart #flotBarChart End
						});
	</script>
	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
