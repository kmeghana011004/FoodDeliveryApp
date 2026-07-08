package com.food.DAOImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.Model.Menu;
import com.food.utility.DBConnection;



public class MenuDAOImpl implements MenuDAO {

    Connection con = DBConnection.getConnection();

    private final String INSERT_QUERY =
            "INSERT INTO menu(restaurantId,itemName,description,price,rating,isAvailable,imagePath) VALUES(?,?,?,?,?,?,?)";

    private final String SELECT_QUERY =
            "SELECT * FROM menu WHERE menuId = ?";

    private final String UPDATE_QUERY =
            "UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, rating=?, isAvailable=?, imagePath=? WHERE menuId=?";

    private final String DELETE_QUERY =
            "DELETE FROM menu WHERE menuId=?";

    private final String SELECT_ALL_MENU =
            "SELECT * FROM menu";

    private final String SELECT_BY_RESTAURANT =
            "SELECT * FROM menu WHERE restaurantId=?";
    @Override
    public void addMenu(Menu m) {

        try {

            PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, m.getRestaurantId());
            pstmt.setString(2, m.getItemName());
            pstmt.setString(3, m.getDescription());
            pstmt.setDouble(4, m.getPrice());
            pstmt.setDouble(5, m.getRating());
            pstmt.setBoolean(6, m.isAvailable());
            pstmt.setString(7, m.getImagePath());

            int i = pstmt.executeUpdate();

            System.out.println(i + " rows affected");

        }
        catch(SQLException e) {

            e.printStackTrace();

        }

    }
     @Override
        public Menu getMenu(int menuId) {

            Menu m = null;

            try {

                PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);

                pstmt.setInt(1, menuId);

                ResultSet res = pstmt.executeQuery();

                while(res.next()) {

                    int id = res.getInt("menuId");
                    int restaurantId = res.getInt("restaurantId");
                    String itemName = res.getString("itemName");
                    String description = res.getString("description");
                    double price = res.getDouble("price");
                    double rating = res.getDouble("rating");
                    boolean isAvailable = res.getBoolean("isAvailable");
                    String imagePath = res.getString("imagePath");

                    m = new Menu(id, restaurantId, itemName,
                            description, price, rating,
                            isAvailable, imagePath);

                }

            }
            catch(SQLException e) {

                e.printStackTrace();

            }

            return m;

        }
     @Override
     public void updateMenu(Menu m) {

         try {

             PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);

             pstmt.setInt(1, m.getRestaurantId());
             pstmt.setString(2, m.getItemName());
             pstmt.setString(3, m.getDescription());
             pstmt.setDouble(4, m.getPrice());
             pstmt.setDouble(5, m.getRating());
             pstmt.setBoolean(6, m.isAvailable());
             pstmt.setString(7, m.getImagePath());
             pstmt.setInt(8, m.getMenuId());

             int i = pstmt.executeUpdate();

             System.out.println(i + " rows affected");

         }
         catch(SQLException e) {

             e.printStackTrace();

         }

     }
     @Override
     public void deleteMenu(int menuId) {

         try {

             PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);

             pstmt.setInt(1, menuId);

             int i = pstmt.executeUpdate();

             System.out.println(i + " rows affected");

         }
         catch(SQLException e) {

             e.printStackTrace();

         }

     }
     @Override
     public List<Menu> getAllMenu() {

         Menu m = null;

         ArrayList<Menu> list = new ArrayList<>();

         try {

             Statement stmt = con.createStatement();

             ResultSet res = stmt.executeQuery(SELECT_ALL_MENU);

             while(res.next()) {

                 int id = res.getInt("menuId");
                 int restaurantId = res.getInt("restaurantId");
                 String itemName = res.getString("itemName");
                 String description = res.getString("description");
                 double price = res.getDouble("price");
                 double rating = res.getDouble("rating");
                 boolean isAvailable = res.getBoolean("isAvailable");
                 String imagePath = res.getString("imagePath");

                 m = new Menu(id, restaurantId, itemName,
                         description, price, rating,
                         isAvailable, imagePath);

                 list.add(m);

             }

         }
         catch(SQLException e) {

             e.printStackTrace();

         }

         return list;

     }
     @Override
     public List<Menu> getMenuByRestaurantId(int restaurantId) {

         Menu m = null;

         ArrayList<Menu> list = new ArrayList<>();

         try {

             PreparedStatement pstmt = con.prepareStatement(SELECT_BY_RESTAURANT);

             pstmt.setInt(1, restaurantId);

             ResultSet res = pstmt.executeQuery();

             while(res.next()) {

                 int id = res.getInt("menuId");
                 String itemName = res.getString("itemName");
                 String description = res.getString("description");
                 double price = res.getDouble("price");
                 double rating = res.getDouble("rating");
                 boolean isAvailable = res.getBoolean("isAvailable");
                 String imagePath = res.getString("imagePath");

                 m = new Menu(id, restaurantId, itemName,
                         description, price, rating,
                         isAvailable, imagePath);

                 list.add(m);

             }

         }
         catch(SQLException e) {

             e.printStackTrace();

         }

         return list;

     }

 }
