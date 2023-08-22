package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogOut extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("userObj");
			
			HttpSession session2 = req.getSession();
			session2.setAttribute("success", "Logout Successfully");
			res.sendRedirect("login.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
