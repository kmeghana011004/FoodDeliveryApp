package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/callRestaurantServlet")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

        try {

            RestaurantDAOImpl dao = new RestaurantDAOImpl();

            String keyword = req.getParameter("search");

            List<Restaurant> allRestaurants;

            if (keyword != null && !keyword.trim().isEmpty()) {

                allRestaurants = dao.searchRestaurants(keyword);

            } else {

                allRestaurants = dao.getAllRestaurants();

            }

            req.setAttribute("allRestaurants", allRestaurants);

            RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");

            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}