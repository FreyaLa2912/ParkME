package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		String fullname = request.getParameter("fullname");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		String tokens = UUID.randomUUID().toString();
		String DbUserName = "";
		
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery("SELECT * FROM tbluser WHERE uname = '" + username +"'");
			
			if(resultset.next())
			{
				String message1 = "Username already exists";
				hs.setAttribute("message1", message1);
				response.sendRedirect("user-register.jsp");
			} else {
			
				int accountRegister = statement.executeUpdate("insert into tbluser(fullname,mobile,email,address,uname,password)values('"
								+ fullname + "','" + mobile + "','" + email + "','" + address + "','" + username
								+ "','" + password + "')");
				if (accountRegister > 0) {
					String message = "User register successfully, Please login.";
					hs.setAttribute("message", message);
					response.sendRedirect("user-register.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
