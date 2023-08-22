package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.User_Dao_Impl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			User_Dao_Impl user = new User_Dao_Impl(DBConnect.getsqlConnection());
			HttpSession session = req.getSession();

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("admin");
				session.setAttribute("userObj", us);
				res.sendRedirect("admin/home.jsp");
			}
			else {
				User userValue = user.login(email, password);
				
				if (userValue != null) {
					session.setAttribute("userObj", userValue);
					res.sendRedirect("home.jsp");
				} else {
					session.setAttribute("fail", "Invalid Email or Password");
					res.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
