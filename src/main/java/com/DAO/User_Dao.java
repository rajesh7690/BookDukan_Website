package com.DAO;

import com.entity.User;

interface User_Dao {
	boolean userRegister(User us);
	User login(String email,String password);
}
