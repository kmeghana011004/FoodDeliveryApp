<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.Cart"%>
<%@ page import="com.food.Model.CartItem"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Cart | CraveNest</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Segoe UI, sans-serif;
}

body {
	background: #f5f5f5;
}

/* Navbar */
nav {
	background: #ff5200;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 50px;
	position: sticky;
	top: 0;
}

.logo {
	font-size: 30px;
	font-weight: bold;
}

nav a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	margin-left: 20px;
}

/* Heading */
.heading {
	width: 90%;
	margin: 30px auto;
	font-size: 34px;
	font-weight: bold;
}

/* Cart Container */
.container {
	width: 90%;
	margin: auto;
	display: flex;
	gap: 30px;
	align-items: flex-start;
}

/* Left */
.cart-items {
	flex: 2;
}

/* Cart Card */
.cart-card {
	background: white;
	display: flex;
	align-items: center;
	gap: 20px;
	padding: 20px;
	margin-bottom: 20px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, .1);
}

.cart-card img {
	width: 140px;
	height: 120px;
	object-fit: cover;
	border-radius: 12px;
}

.item-details {
	flex: 1;
}

.item-details h2 {
	margin-bottom: 8px;
}

.item-details p {
	color: #666;
	margin-bottom: 10px;
}

.price {
	color: #ff5200;
	font-size: 22px;
	font-weight: bold;
}

/* Quantity */
.quantity {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-top: 15px;
}

.quantity button {
	width: 35px;
	height: 35px;
	border: none;
	background: #ff5200;
	color: white;
	border-radius: 50%;
	cursor: pointer;
	font-size: 18px;
}

.quantity span {
	font-size: 18px;
	font-weight: bold;
}

/* Remove */
.remove-btn {
	background: #dc3545;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
}

/* Right */
.bill {
	flex: 1;
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, .1);
	position: sticky;
	top: 100px;
}

.bill h2 {
	margin-bottom: 20px;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	margin: 15px 0;
	font-size: 18px;
}

.total {
	border-top: 2px solid #ddd;
	margin-top: 15px;
	padding-top: 15px;
	font-size: 24px;
	font-weight: bold;
}

/* Button */
.checkout {
	width: 100%;
	margin-top: 25px;
	padding: 15px;
	background: #ff5200;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	cursor: pointer;
}

.checkout:hover {
	background: #e64a00;
}

/* Footer */
footer {
	background: #222;
	color: white;
	text-align: center;
	padding: 30px;
	margin-top: 40px;
}
</style>

</head>
<body>

	<nav>

		<div class="logo">🍽️ CraveNest</div>

		<div>
			<a href="#">Home</a> <a href="callRestaurantServlet">Restaurants</a>
			<a href="Cart.jsp">Cart</a>
		</div>

	</nav>

	<h1 class="heading">🛒 My Cart</h1>

	<div class="container">

		<div class="cart-items">

			

<%
Cart cart = (Cart) session.getAttribute("cart");

double itemTotal = 0;
double deliveryCharge = 50;
double gst = 55;

if (cart == null || cart.getItems().isEmpty()) {
%>

<div class="empty-cart">
    <img src="https://cdn-icons-png.flaticon.com/512/2038/2038854.png"
         width="220">

    <h2>Your Cart is Empty</h2>

    <p>Add delicious food from your favourite restaurant.</p>

    <a href="callRestaurantServlet" class="checkout"
       style="display:inline-block;text-decoration:none;width:auto;padding:15px 30px;">
        Browse Restaurants
    </a>
</div>

<%
} else {
%>

<div class="container">

    <!-- Left Side -->
    <div class="cart-items">

    <%
    for(CartItem item : cart.getItems().values()){

        itemTotal += item.getItemTotalAmount();
    %>

        <div class="cart-card">

            <img src="https://images.unsplash.com/photo-1604908176997-125f25cc6f3d">

            <div class="item-details">

                <h2><%=item.getName()%></h2>

                <div class="price">
                    ₹<%=item.getPrice()%>
                </div>

                <div class="quantity">

                    <!-- Minus -->
                    <form action="cartServlet" method="post">
                        <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                        <input type="hidden" name="restaurantId" value="<%=item.getRetaurantId()%>">

                        <%
                        if(item.getQuantity()==1){
                        %>

                        <input type="hidden" name="action" value="delete">

                        <%
                        }else{
                        %>

                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="quantity" value="<%=item.getQuantity()-1%>">

                        <%
                        }
                        %>

                        <button type="submit">-</button>
                    </form>

                    <span><%=item.getQuantity()%></span>

                    <!-- Plus -->
                    <form action="cartServlet" method="post">
                        <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                        <input type="hidden" name="restaurantId" value="<%=item.getRetaurantId()%>">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="quantity" value="<%=item.getQuantity()+1%>">

                        <button type="submit">+</button>
                    </form>

                    <span>₹<%=item.getItemTotalAmount()%></span>

                </div>

            </div>

            <!-- Remove -->
            <form action="cartServlet" method="post">
                <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                <input type="hidden" name="restaurantId" value="<%=item.getRetaurantId()%>">
                <input type="hidden" name="action" value="delete">

                <button class="remove-btn" type="submit">
                    Remove
                </button>
            </form>

        </div>

    <%
    }
    %>

    </div>

    <!-- Right Side -->
    <div class="bill">

        <h2>Bill Details</h2>

        <div class="bill-row">
            <span>Item Total</span>
            <span>₹<%=itemTotal%></span>
        </div>

        <div class="bill-row">
            <span>Delivery Fee</span>
            <span>₹<%=deliveryCharge%></span>
        </div>

        <div class="bill-row">
            <span>GST</span>
            <span>₹<%=gst%></span>
        </div>

        <div class="bill-row total">
            <span>Total</span>
            <span>₹<%=itemTotal + deliveryCharge + gst%></span>
        </div>

        <a href="CheckOutServlet" class="checkout"
           style="display:block;text-align:center;text-decoration:none;">
            Proceed to Checkout
        </a>

    </div>

</div>

<%
}
%>

			<footer>

				<h2>CraveNest</h2>

				<p>Good Food | Fast Delivery | Happy Customers</p>

			</footer>
</body>
</html>