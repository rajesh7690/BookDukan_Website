package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class User_Dao_Impl implements User_Dao {
	private Connection con;

	public User_Dao_Impl(Connection con) {
		this.con = con;
	}

	@Override
	public boolean userRegister(User us) {
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into ebook.user (name,email,password,phno) value(?,?,?,?)");
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			ps.setString(4, us.getPhno());

			int sucess = ps.executeUpdate();
			if (sucess == 1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User login(String email, String password) {
		String sql = "select * from ebook.user where email=(?) and password=(?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				User us = new User();
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPassword(rs.getString(4));
				us.setPhno(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
				
				return us;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
