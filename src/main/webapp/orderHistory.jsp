<%@page import="com.food.Model.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Order"%>


<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | CraveNest</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f6f9;
}

/* Navbar */

nav{
    background:#fff;
    padding:18px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 15px rgba(0,0,0,.08);
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:#ff5a3c;
}

nav ul{
    display:flex;
    list-style:none;
    gap:30px;
}

nav a{
    text-decoration:none;
    color:#444;
    font-weight:600;
}

nav a:hover{
    color:#ff5a3c;
}

/* Page */

.container{
    width:90%;
    margin:40px auto;
}

.heading{
    font-size:38px;
    color:#222;
    margin-bottom:30px;
}

/* Order Card */

.order-card{
    background:#fff;
    border-radius:12px;
    padding:20px 25px;
    margin-bottom:18px;
    border:1px solid #e5e5e5;
    transition:.3s;
}

.order-card:hover{
    border-left:6px solid #ff5a3c;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

/* Top */

.details h2{
    font-size:22px;
    color:#222;
    margin-bottom:15px;
}

/* Information */

.details{
    display:grid;
    grid-template-columns:repeat(5,1fr);
    gap:20px;
}

.details p{
    display:flex;
    flex-direction:column;
    color:#666;
    font-size:14px;
}

.details b{
    color:#999;
    margin-bottom:6px;
    font-size:13px;
}

/* Status */

.status{
    display:inline-block;
    padding:6px 15px;
    border-radius:20px;
    background:#e8f8ec;
    color:#28a745;
    font-weight:600;
    width:fit-content;
}

/* Price */

.total{
    font-size:26px;
    color:#ff5a3c;
    font-weight:bold;
}

/* Button */

.btn{
    margin-top:20px;
    background:#ff5a3c;
    color:#fff;
    border:none;
    padding:10px 25px;
    border-radius:25px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.btn:hover{
    background:#e84a2d;
}

/* Empty */

.empty{
    width:450px;
    margin:80px auto;
    background:#fff;
    padding:40px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

/* Responsive */

@media(max-width:900px){

.details{
    grid-template-columns:1fr;
}

nav{
    flex-direction:column;
    gap:15px;
}

}

</style>

</head>

<body>

<nav>

<div class="logo">
🍽 QuickBite
</div>

<ul>

<li><a href="callRestaurantServlet">Restaurants</a></li>

<li><a href="Cart.jsp">Cart</a></li>

<li><a href="OrderHistoryServlet">My Orders</a></li>

</ul>

</nav>

<div class="container">

<h1 class="heading">🛍 My Orders</h1>

<%

if(orders!=null && !orders.isEmpty()){

for(Order order:orders){

%>

<div class="order-card">

<div class="left">



<div class="details">

<h2>Restaurant #<%=order.getRestaurantId()%></h2>

<p><b>Order ID :</b> <%=order.getOrderId()%></p>

<p><b>Ordered On :</b> <%=order.getOrderDate()%></p>

<p>

Status :

<span class="status">

<%=order.getStatus()%>

</span>

</p>

<p>

Payment :

<%=order.getPaymentMethod()%>

</p>

</div>

</div>

<div class="right">

<div class="total">

₹ <%=order.getTotalAmount()%>

</div>

<form action="OrderDetailsServlet">

<input
type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">



</form>

</div>

</div>

<%

}

}

else{

%>

<div class="empty">

😔 No Orders Found

<br><br>

<a href="callRestaurantServlet">

<button class="btn">

Start Ordering

</button>

</a>

</div>

<%

}

%>

</div>

</body>

</html>