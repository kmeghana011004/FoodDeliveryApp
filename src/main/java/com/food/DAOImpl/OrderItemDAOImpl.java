package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.Model.OrderItem;
import com.food.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{

	private Connection con = DBConnection.getConnection();

	private static final String INSERT_QUERY = "Insert into orderItem(orderId,menuId,quantity,price) values(?,?,?,?)";
	@Override
	public void addOrderItem(OrderItem item) {

		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, item.getOrderId());
			pstmt.setInt(2, item.getMenuId());
			pstmt.setInt(3, item.getQuantity());
			pstmt.setDouble(4, item.getPrice());

			pstmt.executeUpdate();

		}
		catch(Exception e) {

			e.printStackTrace();

		}

	}
	@Override
	public OrderItem getOrderItem(int orderItemId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteOrderItem(int OrderItem) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<OrderItem> getaAllOrderItemByUser(int OrderItemId) {
		// TODO Auto-generated method stub
		return null;
	}
}