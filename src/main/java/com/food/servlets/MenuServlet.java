package com.food.servlets;



import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Menu;
import com.food.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MenuDAOImpl mdao = new MenuDAOImpl();
		RestaurantDAOImpl rdao = new RestaurantDAOImpl();
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		List<Menu> allMenuById = mdao.getMenuByRestaurantId(restaurantId);
		Restaurant restaurant = rdao.getRestaurant(restaurantId);
		
//		for (Menu menu : allMenuById) {
//			System.out.println(menu);
//		}
		
		req.setAttribute("allMenuById", allMenuById);
		req.setAttribute("restaurant", restaurant);
		
		RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
		
	}
}
