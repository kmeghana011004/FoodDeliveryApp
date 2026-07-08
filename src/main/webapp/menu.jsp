<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page
	import="java.util.List, com.food.Model.Restaurant, com.food.Model.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Menu</title>

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

nav {
	background: #ff5200;
	padding: 18px 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
	position: sticky;
	top: 0;
}

.logo {
	font-size: 30px;
	font-weight: bold;
}

nav input {
	width: 350px;
	padding: 10px 18px;
	border: none;
	border-radius: 30px;
	outline: none;
}

.restaurant {
	width: 90%;
	margin: 30px auto;
	background: white;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .1);
}

.restaurant h1 {
	font-size: 36px;
}

.restaurant p {
	margin-top: 10px;
	font-size: 17px;
	color: #555;
}

.info {
	margin-top: 20px;
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.info span {
	background: #f1f1f1;
	padding: 10px 18px;
	border-radius: 25px;
	font-weight: 600;
}

.section-title {
	width: 90%;
	margin: 30px auto 15px;
	font-size: 30px;
}

.menu {
	width: 90%;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
	gap: 25px;
	padding-bottom: 40px;
}

.card {
	background: white;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .12);
	transition: .3s;
}

.card:hover {
	transform: translateY(-8px);
}

.card img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.details {
	padding: 20px;
}

.badges {
	display: flex;
	justify-content: space-between;
	margin-bottom: 12px;
}

.veg {
	background: #0a8f3d;
	color: white;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
}

.nonveg {
	background: #d62828;
	color: white;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
}

.rating {
	background: #0a8f3d;
	color: white;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
}

.price {
	font-size: 24px;
	font-weight: bold;
	color: #ff5200;
	margin-top: 10px;
}

.desc {
	margin-top: 12px;
	color: #666;
	line-height: 24px;
}

.bottom {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

button {
	background: #ff5200;
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 30px;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
}

button:hover {
	background: #e64a00;
}

footer {
	background: #222;
	color: white;
	padding: 35px;
	text-align: center;
}
</style>

</head>

<body>

	<nav>

		<div class="logo">🍽️ CraveNest</div>

		<input type="text" placeholder="Search Food">

	</nav>
	<% Restaurant r=(Restaurant)request.getAttribute("restaurant"); %>
	<div class="restaurant">

		<h1><%=r.getName() %></h1>

		<p><%= r.getCuisineType() %></p>

		<div class="info">

			<span><%= r.getRating() %></span> <span><%= r.getDeliveryTime() %></span> <span><%= r.getAddress() %></span> <span>₹200 for one</span>

		</div>

	</div>

	<h2 class="section-title">Recommended</h2>

	<div class="menu">
		<%--
	<%
		List<Menu> menuById=(List<Menu>)request.getAttribute("allMenuById");
		for(Menu m: menuById)
		{
	%>
		<div class="card">

			<img
				src="https://images.unsplash.com/photo-1563379091339-03246963d96c">

			<div class="details">

				<div class="badges">

					<span class="nonveg">Non Veg</span> <span class="rating"><%=m.getRating()  %></span>

				</div>

				<h2><%=m.getItemName() %></h2>

				<p class="price"><%=m.getPrice() %></p>

				<p class="desc"><%=m.getDescription() %></p>

				<div class="bottom">

					<button>ADD</button>

				</div>

			</div>

		</div>
	<%
		}
	%>
	 This is a JSP comment --%>
		<%
		List<Menu> menuList = (List<Menu>) request.getAttribute("allMenuById");

		for (Menu m : menuList) {
		%>

		<div class="card">

			<img src="<%=m.getImagePath()%>" alt="<%=m.getItemName()%>">

			<div class="details">

				<div class="badges">

					<%
					if (m.isAvailable()) {
					%>
					<span class="veg">Available</span>
					<%
					} else {
					%>
					<span class="nonveg">Not Available</span>
					<%
					}
					%>

					<span class="rating">⭐ <%=m.getRating()%></span>

				</div>

				<h2><%=m.getItemName()%></h2>

				<p class="price">
					₹<%=m.getPrice()%></p>

				<p class="desc"><%=m.getDescription()%></p>

				<div class="bottom">

					<%
					if (m.isAvailable()) {
					%>
					<form action="cartServlet" >
					<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">
					<input type="hidden" name="restaurantId" value="<%=m.getRestaurantId()%>">
					<input type="hidden" name="quantity" value="1">
					<input type="hidden" name="action" value="add">
					<button>ADD</button>
					
					
					</form>
					<%
					} else {
					%>
					<button disabled>OUT OF STOCK</button>
					<%
					}
					%>

				</div>
			

			</div>

		</div>

		<%
		}
		%>

	</div>

	<footer>

		<h2>CraveNest</h2>

		<p>Good Food | Fast Delivery | Happy Customers</p>

	</footer>

</body>
</html>