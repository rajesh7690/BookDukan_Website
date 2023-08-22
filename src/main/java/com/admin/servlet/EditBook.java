package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.Book_Dao_Impl;
import com.DB.DBConnect;
import com.entity.BookDetails;
@WebServlet("/editbooks")
public class EditBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			int bookid =Integer.parseInt( req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			double price =Double.parseDouble( req.getParameter("price"));
			String status = req.getParameter("bstatus");
		
			
			BookDetails book = new BookDetails();
			book.setBookId(bookid);
			book.setBookName(bookName);
			book.setAuthor(author);
			book.setPrice(price);
			book.setStatus(status);
			
			Book_Dao_Impl bookToDb = new Book_Dao_Impl(DBConnect.getsqlConnection());
			
			boolean isSuucess = bookToDb.editBook(book);
			HttpSession session = req.getSession();
			if(isSuucess) {
				session.setAttribute("success", "Book updated Successfully...");
				res.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("fail", "Something Went wong while update..");
				res.sendRedirect("admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
