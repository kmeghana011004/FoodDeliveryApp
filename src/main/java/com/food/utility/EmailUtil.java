package com.food.utility;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtil {

    // Your Gmail
    private static final String FROM_EMAIL = "kashapogu.meghana@gmail.com";

    // Your 16-character App Password
    private static final String PASSWORD = "dqhgrktzbvgjzqim";

    public static void sendOTP(String toEmail, String otp) {

        Properties prop = new Properties();

        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop,

                new Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication(FROM_EMAIL, PASSWORD);

                    }

                });

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(FROM_EMAIL));

            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            message.setSubject("FoodieExpress Password Reset OTP");

            message.setText(
                    "Hello,\n\n"
                  + "Your OTP is : " + otp
                  + "\n\nThis OTP is valid for 5 minutes."
                  + "\n\nThank you,\nFoodieExpress");

            Transport.send(message);

            System.out.println("OTP Sent Successfully");

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}