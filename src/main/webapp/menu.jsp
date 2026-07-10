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
    padding:18px 60px;
    background:rgba(255,255,255,.95);
    backdrop-filter:blur(10px);
    box-shadow:0 4px 20px rgba(0,0,0,.08);
}

.logo{
    font-size:30px;
    font-weight:700;
    color:#ff5a3c;
}

nav input{
    width:360px;
    height:45px;
    padding:0 18px;
    border:none;
    outline:none;
    border-radius:30px;
    background:#f1f3f6;
    transition:.3s;
    font-size:15px;
}

nav input:focus{
    background:#fff;
    box-shadow:0 0 0 3px rgba(255,90,60,.18);
}

/* ================= RESTAURANT ================= */

.restaurant{
    width:90%;
    margin:35px auto;
    background:#fff;
    padding:35px;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.restaurant h1{
    font-size:42px;
    color:#222;
    margin-bottom:10px;
}

.restaurant p{
    color:#666;
    font-size:18px;
}

.info{
    margin-top:25px;
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

.info span{
    padding:10px 18px;
    border-radius:25px;
    background:#fff4f1;
    color:#ff5a3c;
    font-weight:600;
}

/* ================= TITLE ================= */

.section-title{
    width:90%;
    margin:20px auto 25px;
    font-size:34px;
    color:#222;
}

/* ================= MENU ================= */

.menu{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
    gap:30px;
    padding-bottom:60px;
}

/* ================= CARD ================= */

.card{
    background:#fff;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
    transition:.35s;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 18px 35px rgba(0,0,0,.15);
}

.card img{
    width:100%;
    height:230px;
    object-fit:cover;
    transition:.4s;
}

.card:hover img{
    transform:scale(1.06);
}

.details{
    padding:20px;
}

.badges{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:15px;
}

.veg,
.nonveg,
.rating{
    padding:6px 14px;
    border-radius:20px;
    color:#fff;
    font-size:13px;
    font-weight:600;
}

.veg{
    background:#27ae60;
}

.nonveg{
    background:#e74c3c;
}

.rating{
    background:#16a34a;
}

.details h2{
    font-size:24px;
    margin-bottom:10px;
    color:#222;
}

.price{
    color:#ff5a3c;
    font-size:28px;
    font-weight:700;
    margin-bottom:12px;
}

.desc{
    color:#666;
    line-height:24px;
    min-height:70px;
}

.bottom{
    display:flex;
    justify-content:flex-end;
    align-items:center;
    margin-top:20px;
}

/* ================= BUTTON ================= */

button{
    border:none;
    cursor:pointer;
    background:#ff5a3c;
    color:#fff;
    padding:12px 28px;
    border-radius:30px;
    font-size:15px;
    font-weight:600;
    transition:.3s;
}

button:hover{
    background:#e84a2d;
    transform:translateY(-2px);
    box-shadow:0 8px 20px rgba(255,90,60,.30);
}

button:disabled{
    background:#bdbdbd;
    cursor:not-allowed;
    box-shadow:none;
}

/* ================= FOOTER ================= */

footer{
    background:#222;
    color:#fff;
    text-align:center;
    padding:40px 20px;
}

footer h2{
    margin-bottom:10px;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

nav{
    flex-direction:column;
    gap:18px;
    padding:20px;
}

nav input{
    width:100%;
}

.restaurant{
    width:94%;
    padding:25px;
}

.restaurant h1{
    font-size:32px;
}

.section-title{
    width:94%;
    font-size:28px;
}

.menu{
    width:94%;
}

.card img{
    height:210px;
}

}
</style>

</head>

<body>

	<nav>

		<div class="logo">🍽️ QuickBite</div>

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