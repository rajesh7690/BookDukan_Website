package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.Book_Dao_Impl;
import com.DB.DBConnect;
@WebServlet("/deletebook")
public class DeleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		try {
			int id = Integer.parseInt( req.getParameter("id"));
			String image=req.getParameter("image");
			
			Book_Dao_Impl bookToDB = new Book_Dao_Impl(DBConnect.getsqlConnection());
			
			boolean isSuccess = bookToDB.deleteBook(id);
			
			HttpSession session = req.getSession();
			if(isSuccess) {
				String path = getServletContext().getRealPath("")+"book";
				File file = new File(path+File.separator+image);
				file.delete();
				session.setAttribute("success", "Book deleted Successfully...");
				res.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("fail", "Something Went wong while deleting..");
				res.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
