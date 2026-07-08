
package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.Model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {
	Connection con = DBConnection.getConnection();

    @Override
    public void addRestaurant(Restaurant restaurant) {

        String INSERT_QUERY = "INSERT INTO restaurant(name,cuisineType,deliveryTime,address,adminUserId,rating,isActive,imagePath) VALUES(?,?,?,?,?,?,?,?)";


        try {
            PreparedStatement psmt = con.prepareStatement(INSERT_QUERY);

            psmt.setString(1, restaurant.getName());
            psmt.setString(2, restaurant.getCuisineType());
            psmt.setInt(3, restaurant.getDeliveryTime());
            psmt.setString(4, restaurant.getAddress());
            psmt.setInt(5, restaurant.getAdminUserId());
            psmt.setDouble(6, restaurant.getRating());
            psmt.setBoolean(7, restaurant.isActive());
            psmt.setString(8, restaurant.getImagePath());

            psmt.executeUpdate();

            // System.out.println("Restaurant Added Successfully");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        String sql = "SELECT * FROM Restaurant WHERE RestaurantID = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, restaurantId);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    Restaurant restaurant = new Restaurant();

                    restaurant.setRestaurantId(rs.getInt("restaurantID"));
                    restaurant.setName(rs.getString("name"));
                    restaurant.setCuisineType(rs.getString("cuisineType"));
                    restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
                    restaurant.setAddress(rs.getString("address"));
                    restaurant.setAdminUserId(rs.getInt("adminUserId"));
                    restaurant.setRating(rs.getDouble("rating"));
                    restaurant.setActive(rs.getBoolean("isActive"));
                    restaurant.setImagePath(rs.getString("imagePath"));

                    return restaurant;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving restaurant with ID : " + restaurantId, e);
        }

        return null;
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        String sql = "UPDATE Restaurant SET Name = ?, CuisineType = ?, DeliveryTime = ?, "
                + "Address = ?, AdminUserId = ?, Rating = ?, IsActive = ?, "
                + "ImagePath = ? WHERE RestaurantID = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, restaurant.getName());
            stmt.setString(2, restaurant.getCuisineType());
            stmt.setInt(3, restaurant.getDeliveryTime());
            stmt.setString(4, restaurant.getAddress());
            stmt.setInt(5, restaurant.getAdminUserId());
            stmt.setDouble(6, restaurant.getRating());
            stmt.setBoolean(7, restaurant.isActive());
            stmt.setString(8, restaurant.getImagePath());
            stmt.setInt(9, restaurant.getRestaurantId());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Updating restaurant failed, no rows affected.");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error updating restaurant.", e);
        }
    }

  
    @Override
    public void deleteRestaurant(int restaurantId) {

        String sql = "DELETE FROM Restaurant WHERE RestaurantID = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, restaurantId);

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Deleting restaurant failed, no rows affected.");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting restaurant.", e);
        }
    }
    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurants = new ArrayList<>();

        String sql = "SELECT * FROM restaurant";

        try {

            System.out.println("Connection = " + con);

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                System.out.println("Restaurant Found : " + rs.getString("name"));

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setName(rs.getString("name"));
                restaurant.setCuisineType(rs.getString("cuisineType"));
                restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setAdminUserId(rs.getInt("adminUserId"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setActive(rs.getBoolean("isActive"));
                restaurant.setImagePath(rs.getString("imagePath"));

                restaurants.add(restaurant);
            }

            System.out.println("Total Restaurants = " + restaurants.size());

        } catch (Exception e) {
            e.printStackTrace();
        }

       
        return restaurants;
    }

}
