package com.food.DAO;

import java.util.List;

import com.food.Model.Menu;

public interface MenuDAO {

    void addMenu(Menu menu);

    void updateMenu(Menu menu);

    void deleteMenu(int menuId);

    Menu getMenu(int menuId);

    List<Menu> getAllMenu();

    List<Menu> getMenuByRestaurantId(int restaurantId);

}