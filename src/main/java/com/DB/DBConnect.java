package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnect {
	
	public static Connection getsqlConnection() {
		String dbSecrets = Dbsecret.getSecret();
		String password = dbSecrets.split(",")[1].split(":")[1].replace("\"", "");
		String username = password.substring(5);
		String host = dbSecrets.split(",")[3].split(":")[1].replace("\"", "");
		String port = dbSecrets.split(",")[4].split(":")[1].replace("\"", "");
		Connection con = null;
		try {
				con = DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/ebookaws", username,password);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
