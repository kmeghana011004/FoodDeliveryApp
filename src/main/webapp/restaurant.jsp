<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
  page import= "java.util.List, com.food.Model.Restaurant"


 %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Food Delivery App</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f8f8f8;
}

/* Navbar */
nav{
    background:#fff;
    padding:15px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
    position:sticky;
    top:0;
    z-index:100;
}

.logo{
    font-size:28px;
    font-weight:bold;
    color:#e23744;
}

.nav-links{
    display:flex;
    gap:25px;
}

.nav-links a{
    text-decoration:none;
    color:#333;
    font-weight:600;
}

.search-box input{
    width:300px;
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
}

/* Hero Section */
.hero{
    background:url('https://images.unsplash.com/photo-1504674900247-0877df9cc836');
    background-size:cover;
    background-position:center;
    height:350px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    color:white;
    text-align:center;
}

.hero h1{
    font-size:45px;
    margin-bottom:15px;
}

.hero p{
    font-size:20px;
}

/* Filters */
.filters{
    display:flex;
    justify-content:center;
    gap:15px;
    padding:25px;
    flex-wrap:wrap;
}

.filter-btn{
    background:white;
    border:1px solid #ddd;
    padding:10px 20px;
    border-radius:25px;
    cursor:pointer;
}

/* Restaurant Section */
.section-title{
    text-align:center;
    margin:20px 0;
    font-size:32px;
    color:#333;
}

.restaurant-container{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:25px;
    padding-bottom:50px;
}

.card{
    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.card-content{
    padding:15px;
}

.top{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.rating{
    background:green;
    color:white;
    padding:5px 10px;
    border-radius:8px;
    font-size:14px;
}

.cuisine{
    color:gray;
    margin:8px 0;
}

.bottom{
    display:flex;
    justify-content:space-between;
    margin-top:10px;
    color:#555;
    font-size:14px;
}

footer{
    background:#222;
    color:white;
    text-align:center;
    padding:20px;
}

@media(max-width:768px){
    nav{
        flex-direction:column;
        gap:15px;
    }

    .search-box input{
        width:100%;
    }

    .hero h1{
        font-size:32px;
    }
}
</style>
</head>

<body>

<nav>
    <div class="logo">FoodieExpress</div>

    <div class="search-box">
        <input type="text" placeholder="Search for restaurants...">
    </div>

    <div class="nav-links">
        <a href="#">Home</a>
        <a href="#">Restaurants</a>
        <a href="#">Offers</a>
        <a href="login.html">Login</a>
        <a href="Register.html">Sign Up</a>
        <a href="#">Profile</a>
    </div>
</nav>

<section class="hero">
    <h1>Discover the Best Food Near You</h1>
    <p>Order from top-rated restaurants</p>
</section>

<div class="filters">
    <button class="filter-btn">Fast Delivery</button>
    <button class="filter-btn">Rating 4.0+</button>
    <button class="filter-btn">Pure Veg</button>
    <button class="filter-btn">Offers</button>
    <button class="filter-btn">Under ₹300</button>
</div>

<h2 class="section-title">Popular Restaurants</h2>

<div class="restaurant-container">
<%
    List<Restaurant> allRestaurants=(List<Restaurant>)request.getAttribute("allRestaurants");
    
    for(Restaurant restaurant: allRestaurants)
    {
 %>
    	<a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>">
    	<div class="card">
    	<img src="<%= request.getContextPath() %>/<%= restaurant.getImagePath() %>"
     alt="<%= restaurant.getName() %>">
    	<div class="card-content">
    	<div class="top"><h3><%= restaurant.getName() %></h3><span class="rating"><%= restaurant.getRating() %></span></div>
    	<p class="cuisine"><%= restaurant.getAddress() %></p>
    	<div class="bottom"><span><%= restaurant.getCuisineType() %></span><span><%= restaurant.getDeliveryTime()  %></span></div>
    	</div>
    	</div>
    	
    	</a>
 <%
    }
%>

<!-- Card 1 -->




</div>

<footer>
    <h3>FoodieExpress © 2026</h3>
    <p>Delivering Happiness at Your Doorstep</p>
</footer>

</body>
</html>