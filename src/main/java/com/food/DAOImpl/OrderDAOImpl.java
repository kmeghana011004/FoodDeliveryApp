package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.food.DAO.OrderDAO;
import com.food.Model.Order;
import com.food.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO{

	private static final String INSERT_QUERY = "Insert into orders(userId,restaurantId,paymentMode,status,totalPrice) values(?,?,?,?,?)";
	Connection con = DBConnection.getConnection();

	@Override
	public int addOrder(Order order) {
		int orderId = 0;
		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setString(3, order.getPaymentMethod());
			pstmt.setString(4, order.getStatus());
			pstmt.setDouble(5, order.getTotalAmount());
			
			pstmt.executeUpdate();

			ResultSet res = pstmt.getGeneratedKeys();

			if(res.next()) {

				orderId = res.getInt(1);

			}

		}
		catch(Exception e) {

			e.printStackTrace();

		}

		return orderId;

	}

	@Override
	public Order getOrder(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOrder(int Order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> getaAllOrderByUser(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

}