package com.food.servlets;

import java.io.IOException;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.Order;
import com.food.Model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callOrderServlet")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("Cart.jsp");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        String payment = request.getParameter("payment");

        double total = Double.parseDouble(request.getParameter("grandTotal"));

        Order order = new Order();

        order.setUserId(userId);
        order.setRestaurantId(restaurantId);
        order.setPaymentMethod(payment);
        order.setStatus("Confirmed");
        order.setTotalAmount(total);

        OrderDAOImpl orderDAO = new OrderDAOImpl();

        int orderId = orderDAO.addOrder(order);

        OrderItemDAOImpl itemDAO = new OrderItemDAOImpl();

        for (CartItem cartItem : cart.getItems().values()) {

            OrderItem item = new OrderItem();

            item.setOrderId(orderId);
            item.setMenuId(cartItem.getMenuId());
            item.setQuantity(cartItem.getQuantity());
            item.setPrice(cartItem.getPrice());

            itemDAO.addOrderItem(item);
        }

        session.removeAttribute("cart");

        response.sendRedirect("orderConfirmed.jsp");
    }
}