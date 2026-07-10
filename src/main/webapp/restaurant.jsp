<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
  page import="java.util.List, com.food.Model.Restaurant"%>
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
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}

body{
    background:#f5f6fa;
    color:#333;
}

/* ================= NAVBAR ================= */

nav{
    position:sticky;
    top:0;
    z-index:1000;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px 60px;
    background:rgba(255,255,255,.95);
    backdrop-filter:blur(12px);
    box-shadow:0 3px 20px rgba(0,0,0,.08);
}

.logo{
    font-size:30px;
    font-weight:700;
    color:#ff5a3c;
    letter-spacing:.5px;
}

.search-box{
    flex:1;
    display:flex;
    justify-content:center;
}

.search-box form{
    width:100%;
    display:flex;
    justify-content:center;
}

.search-box input{
    width:380px;
    height:45px;
    padding:0 18px;
    border:none;
    border-radius:30px;
    background:#f1f3f6;
    font-size:15px;
    transition:.3s;
    outline:none;
}

.search-box input:focus{
    background:#fff;
    box-shadow:0 0 0 3px rgba(255,90,60,.18);
}

.nav-links{
    display:flex;
    align-items:center;
    gap:28px;
}

.nav-links a{
    text-decoration:none;
    color:#444;
    font-size:15px;
    font-weight:600;
    transition:.3s;
}

.nav-links a:hover{
    color:#ff5a3c;
}

/* ================= PROFILE ================= */

/* ================= PROFILE DROPDOWN ================= */

.dropdown{
    position:relative;
    display:flex;
    align-items:center;
}

/* Invisible bridge between button and menu */
.dropdown::after{
    content:"";
    position:absolute;
    top:44px;
    left:0;
    width:100%;
    height:18px;
}

.dropbtn{
    border:none;
    background:#fff;
    border-radius:30px;
    padding:10px 22px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
    transition:.3s;
    position:relative;
    z-index:2;
}

.dropbtn:hover{
    background:#ff5a3c;
    color:#fff;
}

.dropdown-content{
    position:absolute;
    top:48px;
    right:0;
    width:260px;
    background:#fff;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 10px 35px rgba(0,0,0,.15);

    opacity:0;
    visibility:hidden;
    transform:translateY(10px);
    transition:all .25s ease;
    z-index:999;
}

.dropdown:hover .dropdown-content,
.dropdown-content:hover{
    opacity:1;
    visibility:visible;
    transform:translateY(0);
}

.user-info{
    background:#fff4f1;
    padding:20px;
}

.user-info h4{
    margin-bottom:5px;
    color:#222;
}

.user-info p{
    font-size:13px;
    color:#777;
}

.dropdown-content a{
    display:block;
    padding:15px 20px;
    color:#444;
    text-decoration:none;
    font-size:15px;
    transition:.3s;
}

.dropdown-content a:hover{
    background:#f8f8f8;
    color:#ff5a3c;
    padding-left:28px;
}

/* ================= HERO ================= */

.hero{
    height:430px;
    background:
    linear-gradient(rgba(0,0,0,.45),rgba(0,0,0,.45)),
    url("images/hero.bg.jfif");
    background-size:cover;
    background-position:center;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
    color:#fff;
}

.hero h1{
    font-size:52px;
    font-weight:700;
    margin-bottom:18px;
    text-shadow:0 4px 10px rgba(0,0,0,.35);
}

.hero p{
    font-size:19px;
    opacity:.95;
}

/* ================= FILTER ================= */

.filters{
    display:flex;
    justify-content:center;
    gap:18px;
    flex-wrap:wrap;
    padding:35px 20px;
}

.filter-btn{
    border:none;
    background:#fff;
    padding:12px 24px;
    border-radius:30px;
    cursor:pointer;
    font-size:14px;
    font-weight:600;
    box-shadow:0 4px 15px rgba(0,0,0,.08);
    transition:.3s;
}

.filter-btn:hover{
    background:#ff5a3c;
    color:#fff;
    transform:translateY(-3px);
}

/* ================= TITLE ================= */

.section-title{
    text-align:center;
    font-size:36px;
    margin:10px 0 40px;
    color:#222;
}

/* ================= RESTAURANTS ================= */

/* ================= RESTAURANTS ================= */

.restaurant-container{
    width:90%;
    max-width:1400px;
    margin:40px auto;
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:30px;
    padding-bottom:60px;
}

.restaurant-container a{
    text-decoration:none;
    color:inherit;
}

.card{
    background:#fff;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
    transition:.35s ease;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 18px 40px rgba(0,0,0,.15);
}

.card img{
    width:100%;
    height:220px;
    object-fit:cover;
    transition:.4s;
}

.card:hover img{
    transform:scale(1.05);
}

.card-content{
    padding:18px;
}

.top{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.top h3{
    font-size:21px;
    color:#222;
    font-weight:600;
}

.rating{
    background:#28a745;
    color:#fff;
    padding:6px 10px;
    border-radius:8px;
    font-size:13px;
    font-weight:600;
}

.cuisine{
    color:#777;
    margin:12px 0;
    font-size:15px;
}

.bottom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-top:1px solid #eee;
    padding-top:12px;
    font-size:14px;
    color:#555;
}

/* ================= RESPONSIVE ================= */

@media(max-width:992px){

    .restaurant-container{
        grid-template-columns:repeat(2,1fr);
    }

}

@media(max-width:768px){

    .restaurant-container{
        width:95%;
        grid-template-columns:1fr;
        gap:25px;
    }

}

/* ================= FOOTER ================= */

footer{
    background:#222;
    color:#fff;
    text-align:center;
    padding:35px 20px;
}

footer h3{
    margin-bottom:8px;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

nav{
    flex-direction:column;
    padding:20px;
    gap:20px;
}

.search-box input{
    width:100%;
}

.hero{
    height:340px;
}

.hero h1{
    font-size:34px;
}

.hero p{
    font-size:16px;
}

.section-title{
    font-size:28px;
}

.restaurant-container{
    width:94%;
}

}
</style>
</head>

<body>

	<nav>
		<div class="logo">QuickBite</div>

		<div class="search-box">

    <form action="callRestaurantServlet" method="get">

        <input type="text"
               name="search"
               placeholder="Search for restaurants..."
               value="<%= request.getParameter("search") == null ? "" : request.getParameter("search") %>">

    </form>

</div>
		<%@ page import="com.food.Model.User" %>

<div class="nav-links">

    <a href="callRestaurantServlet">Home</a>

    

<%
User user = (User)session.getAttribute("user");

if(user==null){
%>

    <a href="login.jsp">Login</a>

    <a href="Register.html">Sign Up</a>

<%
}
else{
%>

<div class="dropdown">

    <button class="dropbtn">

         Profile

    </button>

    <div class="dropdown-content">

        <div class="user-info">

            <h4><%=user.getUserName()%></h4>

            <p><%=user.getEmail()%></p>

        </div>

        <hr>

        <a href="OrderHistoryServlet">
            📦 My Orders
        </a>

        <a href="LogoutServlet">
            🚪 Logout
        </a>

    </div>

</div>

<%
}
%>

</div>
	</nav>

	<section class="hero">
		<h1>Discover Delicious Meals, Delivered Fresh</h1>
		<p>Explore restaurants and order in minutes.</p>
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
				<img
					src="<%= request.getContextPath() %>/<%= restaurant.getImagePath() %>"
					alt="<%= restaurant.getName() %>">
				<div class="card-content">
					<div class="top">
						<h3><%= restaurant.getName() %></h3>
						<span class="rating"><%= restaurant.getRating() %></span>
					</div>
					<p class="cuisine"><%= restaurant.getAddress() %></p>
					<div class="bottom">
						<span><%= restaurant.getCuisineType() %></span><span><%= restaurant.getDeliveryTime()  %></span>
					</div>
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