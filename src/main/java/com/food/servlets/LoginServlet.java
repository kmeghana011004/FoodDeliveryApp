package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.userDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callLoginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		userDAOImpl udao = new userDAOImpl();
		User u = udao.getUserByEmail(email);
		
		if(u != null && BCrypt.checkpw(password, u.getPassword())) {

		    session.setAttribute("user", u); 
		    session.setAttribute("userId", u.getUserId());  // Store complete user object
		    session.setAttribute("name", u.getUserName()); // Optional

		    String redirectPage = (String) session.getAttribute("redirectPage");

		    if(redirectPage != null){
		        session.removeAttribute("redirectPage");
		        resp.sendRedirect(redirectPage);
		    }else{
		        resp.sendRedirect("callRestaurantServlet");
		    }

		}
		else{
		    resp.sendRedirect("login.html");
		}
	}
}
