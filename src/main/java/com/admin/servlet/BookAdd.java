package com.admin.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.Book_Dao_Impl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/addbooks")
@MultipartConfig
public class BookAdd  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			double price =Double.parseDouble( req.getParameter("price"));
			String category = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String imageName= part.getSubmittedFileName();
		
			
			BookDetails book = new BookDetails(bookName, author, price, category, status, imageName, "admin@gmail.com");
			
			Book_Dao_Impl bookToDb = new Book_Dao_Impl(DBConnect.getsqlConnection());
			
			boolean isAdded = bookToDb.addBook(book);
			HttpSession session = req.getSession();
			if(isAdded) {
				String path = getServletContext().getRealPath("")+"book";
				File file = new File(path);
				part.write(path+File.separator+imageName);
				session.setAttribute("success", "Book Added Successfully");
				res.sendRedirect("admin/add_books.jsp");
			}
			else {
				session.setAttribute("fail", "Something Went wong while adding");
				res.sendRedirect("admin/add_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
