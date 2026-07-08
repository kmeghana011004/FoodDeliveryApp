package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.Model.User;
import com.food.utility.DBConnection;

public class userDAOImpl implements UserDAO{
  
	Connection con= DBConnection.getConnection();
	@Override
	public int addUser(User user) {
		String INSERT_QUERY="INSERT INTO user(userName,password,email,address,role,createdDate,lastLoginDate) Values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt=con.prepareStatement(INSERT_QUERY);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getEmail());
			psmt.setString(4, user.getAddress());
			psmt.setString(5, user.getRole());
			psmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			psmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			int i=psmt.executeUpdate();
			//System.out.println("res");
			return i;
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
		
		
	}

	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void daleteUser(int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserByEmail(String email) {
		String query = "select * from user where email = ?";
		User user = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				int userId = res.getInt("userId");
				String name = res.getString("userName");
				String pwd = res.getString("password");
				String emailId = res.getString("email");
				String address = res.getString("address");
				String role = res.getString("role");
				
				user = new User(name, pwd, emailId, address, role);
				user.setUserId(userId);
				
				
			}
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
		
	}

}
