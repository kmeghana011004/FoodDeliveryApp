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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String email = req.getParameter("email");
	    String password = req.getParameter("password");

	    HttpSession session = req.getSession();

	    userDAOImpl udao = new userDAOImpl();

	    User user = udao.getUserByEmail(email);

	    // Email doesn't exist
	    if(user == null) {

	        req.setAttribute("error", "Account not found. Please register first.");

	        req.getRequestDispatcher("login.jsp").forward(req, resp);

	    }

	    // Password incorrect
	    else if(!BCrypt.checkpw(password, user.getPassword())) {

	        req.setAttribute("error", "Incorrect Password. Please try again.");

	        req.getRequestDispatcher("login.jsp").forward(req, resp);

	    }

	    // Login Success
	    else {

	        session.setAttribute("user", user);
	        session.setAttribute("userId", user.getUserId());
	        session.setAttribute("name", user.getUserName());

	        String redirectPage=(String)session.getAttribute("redirectPage");

	        if(redirectPage!=null){

	            session.removeAttribute("redirectPage");

	            resp.sendRedirect(redirectPage);

	        }

	        else{

	            resp.sendRedirect("callRestaurantServlet");

	        }

	    }

	}
}
