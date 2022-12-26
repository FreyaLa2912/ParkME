package com.vehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ViewIncomingVehicleDetails
 */
@WebServlet("/ViewIncomingVehicleDetails")
public class ViewIncomingVehicleDetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String category = request.getParameter("category");
		String intime = request.getParameter("intime");
		String remark = request.getParameter("remark");
		String status = request.getParameter("status");
		
		int parkingcharge = 0;
		Date d1 = null;
		Date d2 = null;
		long differenceHours = 0;
		HttpSession session = request.getSession();
		System.out.println("category  " + category);
		// HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			d1 = format.parse(intime);
			d2 = format.parse(format.format(new Date()));
			long timeDifference = d2.getTime() - d1.getTime();
			differenceHours = (timeDifference / (60 * 60 * 1000));
			System.out.println("timeDiff  " + timeDifference);

			System.out.println("Hours  " + differenceHours);

			if ("Truck".equals(category) && differenceHours < 8) {
				parkingcharge = 400000;
			} else if ("Truck".equals(category) && differenceHours > 8 && differenceHours < 16) {
				parkingcharge = 600000;
			} else if ("Truck".equals(category) && differenceHours > 16 && differenceHours < 24) {
				parkingcharge = 1000000;
			} else if ("Truck".equals(category) && differenceHours > 24) {
				parkingcharge = 1500000;
			} else if ("Car".equals(category) && differenceHours < 8) {
				parkingcharge = 300000;
			} else if ("Car".equals(category) && differenceHours > 8 && differenceHours < 16) {
				parkingcharge = 500000;
			} else if ("Car".equals(category) && differenceHours > 16 && differenceHours < 24) {
				parkingcharge = 800000;
			} else if ("Car".equals(category) && differenceHours > 24) {
				parkingcharge = 1200000;
			} else if ("Motorbike".equals(category) && differenceHours < 8) {
				parkingcharge = 15000;
			} else if ("Motorbike".equals(category) && differenceHours > 8 && differenceHours < 16) {
				parkingcharge = 20000;
			} else if ("Motorbike".equals(category) && differenceHours > 16 && differenceHours < 24) {
				parkingcharge = 25000;
			} else if ("Motorbike".equals(category) && differenceHours > 24) {
				parkingcharge = 45000;
			} else if ("Bicycle".equals(category) && differenceHours < 8) {
				parkingcharge = 2000;
			} else if ("Bicycle".equals(category) && differenceHours > 8 && differenceHours < 16) {
				parkingcharge = 5000;
			} else if ("Bicycle".equals(category) && differenceHours > 16 && differenceHours < 24) {
				parkingcharge = 10000;
			} else if ("Bicycle".equals(category) && differenceHours > 24) {
				parkingcharge = 12000;
			} else {
				System.out.println("Tạm biệt");
			}

			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int updateinfo = statement.executeUpdate("update  tblvehicle set Remark='" + remark + "',Status='" + status
					+ "',ParkingCharge='" + parkingcharge + "' where ID='" + session.getAttribute("cid") + "' and vehiclecategory='"+category+"'");
			if (updateinfo > 0) {
				response.sendRedirect("manage-incomingvehicle.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
