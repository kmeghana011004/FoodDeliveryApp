package com.food.Model;

import java.util.HashMap;
import java.util.Map;

public  class Cart {
	public Map<Integer, CartItem> getItems() {
		return items;
	}

	

	 Map<Integer,CartItem> items;
	
	public Cart()
	{
		 items= new HashMap<Integer,CartItem>();
	}

	public  void addItem(CartItem cartItem) {
		  
		int menuId= cartItem.getMenuId();
		if(items.containsKey(menuId))
		{
			CartItem existingItem=items.get(menuId);
			existingItem.setQuantity(existingItem.getQuantity()+1);
		}
		else
		{
		items.put(menuId,cartItem);
		}
	}
	public  void updateItem(int itemId,int quantity)
	{
		if(items.containsKey(itemId))
		{
			if(quantity>0) {
				CartItem existingCartItem = items.get(itemId);
				existingCartItem.setQuantity(quantity);
			}
			else {
				items.remove(itemId);
			}
		
		}
	}

	public void removeItem(int menuId) {
		items.remove(menuId);
		
	}

	
	
	 
	

}
