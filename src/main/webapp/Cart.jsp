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
    backdrop-filter:blur(12px);
    box-shadow:0 5px 20px rgba(0,0,0,.08);
}

.logo{
    font-size:30px;
    font-weight:700;
    color:#ff5a3c;
}

nav div:last-child{
    display:flex;
    gap:25px;
}

nav a{
    text-decoration:none;
    color:#444;
    font-weight:600;
    transition:.3s;
}

nav a:hover{
    color:#ff5a3c;
}

/* ================= HEADING ================= */

.heading{
    width:90%;
    margin:35px auto;
    font-size:38px;
    color:#222;
}

/* ================= MAIN CONTAINER ================= */

.container{
    width:90%;
    margin:auto;
    display:flex;
    gap:35px;
    align-items:flex-start;
}

/* ================= CART ================= */

.cart-items{
    flex:2;
}

.cart-card{
    background:#fff;
    display:flex;
    align-items:center;
    gap:22px;
    padding:22px;
    margin-bottom:22px;
    border-radius:18px;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
    transition:.35s;
}

.cart-card:hover{
    transform:translateY(-5px);
    box-shadow:0 18px 35px rgba(0,0,0,.15);
}

.cart-card img{
    width:150px;
    height:130px;
    object-fit:cover;
    border-radius:14px;
    transition:.4s;
}

.cart-card:hover img{
    transform:scale(1.05);
}

.item-details{
    flex:1;
}

.item-details h2{
    font-size:24px;
    color:#222;
    margin-bottom:10px;
}

.item-details p{
    color:#777;
}

.price{
    color:#ff5a3c;
    font-size:28px;
    font-weight:700;
    margin:12px 0;
}

/* ================= QUANTITY ================= */

.quantity{
    display:flex;
    align-items:center;
    gap:15px;
    margin-top:15px;
}

.quantity button{
    width:40px;
    height:40px;
    border:none;
    border-radius:50%;
    background:#ff5a3c;
    color:#fff;
    font-size:18px;
    cursor:pointer;
    transition:.3s;
}

.quantity button:hover{
    background:#e64a2d;
    transform:scale(1.08);
}

.quantity span{
    font-size:18px;
    font-weight:600;
}

/* ================= REMOVE BUTTON ================= */

.remove-btn{
    border:none;
    background:#ef4444;
    color:#fff;
    padding:12px 20px;
    border-radius:10px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.remove-btn:hover{
    background:#dc2626;
}

/* ================= BILL ================= */

.bill{
    flex:1;
    background:#fff;
    padding:30px;
    border-radius:18px;
    position:sticky;
    top:100px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.bill h2{
    margin-bottom:20px;
    color:#222;
}

.bill-row{
    display:flex;
    justify-content:space-between;
    margin:18px 0;
    font-size:17px;
    color:#555;
}

.total{
    margin-top:20px;
    padding-top:20px;
    border-top:2px solid #eee;
    font-size:23px;
    font-weight:700;
    color:#222;
}

/* ================= CHECKOUT ================= */

.checkout{
    display:block;
    width:100%;
    margin-top:25px;
    background:#ff5a3c;
    color:#fff;
    padding:15px;
    border-radius:12px;
    text-align:center;
    text-decoration:none;
    font-size:17px;
    font-weight:600;
    transition:.3s;
}

.checkout:hover{
    background:#e64a2d;
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(255,90,60,.28);
}

/* ================= EMPTY CART ================= */

.empty-cart{
    width:100%;
    background:#fff;
    padding:60px 30px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.empty-cart img{
    width:180px;
    margin-bottom:25px;
}

.empty-cart h2{
    margin-bottom:12px;
    color:#222;
}

.empty-cart p{
    color:#777;
    margin-bottom:30px;
}

/* ================= FOOTER ================= */

footer{
    margin-top:60px;
    background:#222;
    color:#fff;
    text-align:center;
    padding:40px 20px;
}

footer h2{
    margin-bottom:10px;
}

/* ================= MOBILE ================= */

@media(max-width:900px){

.container{
    flex-direction:column;
    width:94%;
}

.bill{
    width:100%;
    position:static;
}

nav{
    flex-direction:column;
    gap:18px;
    padding:20px;
}

nav div:last-child{
    gap:18px;
}

.cart-card{
    flex-direction:column;
    text-align:center;
}

.cart-card img{
    width:100%;
    height:220px;
}

.quantity{
    justify-content:center;
    flex-wrap:wrap;
}

.heading{
    width:94%;
    font-size:32px;
}

}
</style>

</head>
<body>

	<nav>

		<div class="logo">🍽️ QuickBite</div>

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

            <img src="<%=request.getContextPath()%>/<%=item.getImagePath()%>"
     alt="<%=item.getName()%>">

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