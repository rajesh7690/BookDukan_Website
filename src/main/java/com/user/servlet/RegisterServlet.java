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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String Phno = req.getParameter("phno");
		String password = req.getParameter("password");
		String check = req.getParameter("check");
		
		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(Phno);
		us.setPassword(password);
		HttpSession session =req.getSession();
		if(check !=null) {
			User_Dao_Impl dao = new User_Dao_Impl(DBConnect.getsqlConnection());
			Boolean isExecuted= dao.userRegister(us);
			if(isExecuted) {
				session.setAttribute("success", "Registered successfully...");
				res.sendRedirect("register.jsp");
			}
			else {
				session.setAttribute("fail", "Something went wrong..");
				res.sendRedirect("register.jsp");
				}
		}
		else {
			session.setAttribute("fail", "Please check Agree Terms & condition");
			res.sendRedirect("register.jsp");
		}
	}
}
