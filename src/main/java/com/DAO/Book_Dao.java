package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface Book_Dao {

	public boolean addBook(BookDetails book);
	
	public List<BookDetails> allBook();
	
	public BookDetails getBookById(int id);
	public boolean editBook(BookDetails book);
	
	public boolean deleteBook(int id);
	
	public List<BookDetails> fourBook(String type);
	
}
