package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderDAOImpl;
import com.food.Model.Order;
import com.food.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.html");
            return;
        }

        OrderDAOImpl dao = new OrderDAOImpl();

        List<Order> orders = dao.getaAllOrderByUser(user.getUserId());

        req.setAttribute("orders", orders);

        RequestDispatcher rd = req.getRequestDispatcher("orderHistory.jsp");

        rd.forward(req, resp);
    }
}