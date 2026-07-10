package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.userDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        String email = (String) session.getAttribute("email");

        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {

            req.setAttribute("error", "Passwords do not match");

            req.getRequestDispatcher("resetPassword.jsp")
                    .forward(req, resp);

            return;
        }

        String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        userDAOImpl dao = new userDAOImpl();

        dao.updatePassword(email, encryptedPassword);

        session.removeAttribute("otp");
        session.removeAttribute("email");

        resp.sendRedirect("login.jsp?reset=success");
    }
    
}