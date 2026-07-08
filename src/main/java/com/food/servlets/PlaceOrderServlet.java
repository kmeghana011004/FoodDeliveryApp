package com.food.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.Order;
import com.food.Model.OrderItem;
import com.food.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		String paymentMode = req.getParameter("paymentMode");
		Double amount = (Double)session.getAttribute("grandTotal");
		
		if(user == null) {
			RequestDispatcher rd = req.getRequestDispatcher("login.html");
			rd.forward(req, resp);
		}
		
		
		if(user!=null && cart!=null && !(cart.getItems().isEmpty())) {
			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setRestaurantId(restaurantId);
			order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			order.setPaymentMethod(paymentMode);
			order.setStatus("Completed");
			order.setTotalAmount(amount);
			
			OrderDAOImpl odao = new OrderDAOImpl();
			int orderId = odao.addOrder(order);			
			
			System.out.println("Generated Order ID = " + orderId);
			
			
			OrderItemDAOImpl oidao = new OrderItemDAOImpl();
			
			for(CartItem item : cart.getItems().values()) {

				OrderItem orderItem = new OrderItem();
				
				orderItem.setOrderId(orderId);
				orderItem.setMenuId(item.getMenuId());
				orderItem.setQuantity(item.getQuantity());
				orderItem.setPrice(item.getPrice());
				
				oidao.addOrderItem(orderItem);
			}
			
			session.removeAttribute("cart");
			session.removeAttribute("restaurantId");
			session.removeAttribute("grandTotal");
			
			resp.sendRedirect("orderConfirmed.jsp");
			
		}
		else {
			resp.sendRedirect("Cart.jsp");
		}
	}
}