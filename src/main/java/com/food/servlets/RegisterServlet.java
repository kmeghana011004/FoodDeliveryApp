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

@WebServlet("/callRegisterServlet")
public class RegisterServlet extends  HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =req.getParameter("username");
		String password =req.getParameter("password");
		String email =req.getParameter("email");
		String address =req.getParameter("address");
		String role =req.getParameter("role");
		
		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(8));
		User user=new User(name,hashpw,email,address,role);
		userDAOImpl userDAOImpl= new userDAOImpl();
		int res=userDAOImpl.addUser(user);
		if(res==1)
		{
			resp.sendRedirect("login.jsp");
		}
		else
		{
			resp.sendRedirect("Register.html");
		}

	}
}
