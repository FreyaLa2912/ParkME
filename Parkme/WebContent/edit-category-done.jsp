<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
	String catename = request.getParameter("catename");
	try {
	   
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		int updateinfo = statement.executeUpdate("update tblcategory set VehicleCat='" + catename + "' where id='"+session.getAttribute("id")+"'");
		if (updateinfo > 0) {
			response.sendRedirect("manage-category.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>