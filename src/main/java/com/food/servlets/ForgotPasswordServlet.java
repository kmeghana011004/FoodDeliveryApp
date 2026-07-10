package com.food.servlets;

import java.io.IOException;
import java.util.Random;

import com.food.DAOImpl.userDAOImpl;
import com.food.Model.User;
import com.food.utility.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");

        userDAOImpl dao = new userDAOImpl();

        User user = dao.getUserByEmail(email);

        if(user == null) {

            req.setAttribute("error", "Email is not registered.");

            req.getRequestDispatcher("forgotPassword.jsp")
               .forward(req, resp);

            return;
        }

        // Generate 6-digit OTP
        Random random = new Random();

        int otp = 100000 + random.nextInt(900000);

        HttpSession session = req.getSession();

        session.setAttribute("otp", String.valueOf(otp));

        session.setAttribute("email", email);

        // Send OTP to Gmail
        EmailUtil.sendOTP(email, String.valueOf(otp));

        resp.sendRedirect("verifyOtp.jsp");

    }

}