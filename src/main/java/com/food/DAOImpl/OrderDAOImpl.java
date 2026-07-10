package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
//
//	@Override
//	public List<Order> getaAllOrderByUser(int orderId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	@Override
	public List<Order> getaAllOrderByUser(int userId) {

	    List<Order> orders = new ArrayList<>();

	    String sql = "SELECT * FROM orders WHERE userId=? ORDER BY orderDate DESC";

	    try {

	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, userId);

	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()) {

	            Order order = new Order();

	            order.setOrderId(rs.getInt("orderId"));
	            order.setUserId(rs.getInt("userId"));
	            order.setRestaurantId(rs.getInt("restaurantId"));
	            order.setOrderDate(rs.getTimestamp("orderDate"));
	            order.setTotalAmount(rs.getDouble("totalPrice")); // or totalAmount
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMethod(rs.getString("paymentMode"));

	            orders.add(order);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return orders;
	}
}