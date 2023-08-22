package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class Book_Dao_Impl implements Book_Dao {
	private Connection con;
	
	public Book_Dao_Impl(Connection con) {
		this.con=con;
	}
	
@Override
public boolean addBook(BookDetails book) {
	
	try {
		
		String query = "insert into book_details (bookname,author,price,bookCatagory,status,photo,user_email) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setString(1, book.getBookName());
		ps.setString(2, book.getAuthor());
		ps.setDouble(3, book.getPrice());
		ps.setString(4, book.getBookCategory());
		ps.setString(5, book.getStatus());
		ps.setString(6, book.getImage() );
		ps.setString(7, book.getEmail());
		
		int result = ps.executeUpdate();
		
		if(result ==1)
			return true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return false;
}

@Override
public List<BookDetails> allBook() {
	
	List<BookDetails> book = new ArrayList<>();
	try {
		String query="select * from book_details";
		PreparedStatement ps = con.prepareStatement(query);
		
		ResultSet rs = ps.executeQuery();
		BookDetails b=null;
		while(rs.next()) {
			b=new BookDetails();
			b.setBookId(rs.getInt(1));
			b.setBookName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getDouble(4));
			b.setBookCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setImage(rs.getString(7));
			b.setEmail(rs.getString(8));
			
			book.add(b);
		}
		return book;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}


@Override
public boolean editBook(BookDetails book) {
	try {
		
		String query="update book_details set bookname=?,author=?,price=?,status=? where bookid=?";
		
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, book.getBookName());
		ps.setString(2, book.getAuthor());
		ps.setDouble(3, book.getPrice());
		ps.setString(4, book.getStatus());
		ps.setInt(5, book.getBookId());
		
		int result = ps.executeUpdate();
		
		if(result==1)
			return true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}

@Override
public BookDetails getBookById(int id) {
	
	try {
		
		String query= "select * from book_details where bookid=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		BookDetails book=null;
		if(rs.next()) {
			book= new BookDetails();
			book.setBookName(rs.getString(2));
			book.setAuthor(rs.getString(3));
			book.setPrice(rs.getDouble(4));
			book.setStatus(rs.getString(6));
		}
		return book;
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return null;
}

@Override
public boolean deleteBook(int id) {
	try {
		String query = "delete from book_details where bookid=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		
		int result = ps.executeUpdate();
		
		if(result==1)
			return true;
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}

@Override
public List<BookDetails> fourBook(String type) {
	List<BookDetails> book = new ArrayList<>();
	try {
		String query=null;
		if("recent".equals(type))
			query="select * from book_details where  status = 'Active' order by bookid  desc limit 4";
		else if("New".equals(type))
			query="select * from book_details where bookCatagory='New' and status = 'Active' limit 4 ";
		else if("Old".equals(type))
			query="select * from book_details where bookCatagory='Old' and status = 'Active' limit 4 ";
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		BookDetails b=null;
		
		while(rs.next()) {
			b=new BookDetails();
			b.setBookId(rs.getInt(1));
			b.setBookName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getDouble(4));
			b.setBookCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setImage(rs.getString(7));
			b.setEmail(rs.getString(8));
			
			book.add(b);
		}
		return book;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}
	
}
