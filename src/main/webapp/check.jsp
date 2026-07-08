<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.Cart"%>
<%@ page import="com.food.Model.CartItem"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

double itemTotal=0;
double deliveryCharge=50;
double gst=55;

if(cart!=null){
    for(CartItem item:cart.getItems().values()){
        itemTotal += item.getItemTotalAmount();
    }
}

double grandTotal=itemTotal+deliveryCharge+gst;
session.setAttribute("grandTotal", grandTotal);
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Secure Checkout | CraveNest</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

/*==========================
 NAVBAR
===========================*/

nav{
height:75px;
background:white;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 70px;
box-shadow:0 5px 18px rgba(0,0,0,.08);
position:sticky;
top:0;
z-index:999;
}

.logo{
font-size:34px;
font-weight:bold;
color:#ff5a00;
}

nav ul{
display:flex;
list-style:none;
gap:35px;
}

nav a{
text-decoration:none;
font-size:18px;
font-weight:600;
color:#444;
transition:.3s;
}

nav a:hover{
color:#ff5a00;
}

/*==========================
 PAGE HEADER
===========================*/

.header{
width:90%;
margin:40px auto 20px;
}

.header h1{
font-size:40px;
color:#222;
margin-bottom:10px;
}

.header p{
font-size:18px;
color:#666;
}

/*==========================
 STEPS
===========================*/

.steps{
width:90%;
margin:25px auto 40px;
display:flex;
justify-content:center;
align-items:center;
}

.step{
padding:12px 30px;
background:white;
border-radius:30px;
font-weight:bold;
box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.step.active{
background:#ff5a00;
color:white;
}

.line{
width:90px;
height:4px;
background:#d7d7d7;
}

/*==========================
 MAIN
===========================*/

.checkout{
width:90%;
margin:auto;
display:grid;
grid-template-columns:2fr 1fr;
gap:35px;
padding-bottom:50px;
}

.left{
display:flex;
flex-direction:column;
gap:30px;
}

.right{
position:sticky;
top:100px;
height:fit-content;
}

/*==========================
 CARD
===========================*/

.card{
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
}

.card h2{
margin-bottom:25px;
font-size:28px;
color:#333;
}

/*==========================
 FORM
===========================*/

.form-group{
margin-bottom:20px;
}

.form-group label{
display:block;
margin-bottom:8px;
font-weight:600;
color:#444;
}

.form-group input,
.form-group textarea{
width:100%;
padding:15px;
font-size:16px;
border:2px solid #ececec;
border-radius:10px;
transition:.3s;
}

.form-group input:focus,
.form-group textarea:focus{
outline:none;
border-color:#ff5a00;
box-shadow:0 0 10px rgba(255,90,0,.2);
}

textarea{
resize:none;
height:120px;
}

/*==========================
 TWO COLUMN
===========================*/

.row{
display:grid;
grid-template-columns:1fr 1fr;
gap:20px;
}

/*==========================
 PAYMENT
===========================*/

.payment-box{
display:flex;
align-items:center;
gap:15px;
padding:18px;
border:2px solid #ececec;
border-radius:14px;
margin-bottom:15px;
cursor:pointer;
transition:.3s;
}

.payment-box:hover{
border-color:#ff5a00;
background:#fff6f1;
transform:translateY(-2px);
}

.payment-box input[type=radio]{
accent-color:#ff5a00;
width:20px;
height:20px;
}

.payment-box span{
font-size:18px;
font-weight:600;
color:#444;
}

/*==========================
 COUPON
===========================*/

.coupon{
display:flex;
gap:15px;
}

.coupon input{
flex:1;
padding:15px;
border-radius:10px;
border:2px solid #ddd;
font-size:16px;
}

.apply-btn{
background:#222;
color:white;
padding:15px 25px;
border:none;
border-radius:10px;
font-size:16px;
cursor:pointer;
transition:.3s;
}

.apply-btn:hover{
background:#000;
}
/*==========================
 ORDER SUMMARY
===========================*/

.summary{
background:#ffffff;
padding:30px;
border-radius:20px;
box-shadow:0 12px 25px rgba(0,0,0,.08);
border-top:6px solid #ff5a00;
}

.summary h2{
font-size:30px;
margin-bottom:25px;
color:#333;
}

.summary-row{
display:flex;
justify-content:space-between;
margin:18px 0;
font-size:18px;
color:#555;
}

.summary-total{
margin-top:20px;
padding-top:20px;
border-top:2px dashed #ddd;
display:flex;
justify-content:space-between;
font-size:28px;
font-weight:bold;
color:#ff5a00;
}

.place-order{
display:block;
width:100%;
text-align:center;
padding:18px;
margin-top:30px;
background:linear-gradient(90deg,#ff5a00,#ff7a00);
color:white;
text-decoration:none;
font-size:20px;
font-weight:bold;
border-radius:12px;
transition:.3s;
}

.place-order:hover{
transform:translateY(-2px);
box-shadow:0 10px 25px rgba(255,90,0,.35);
}

.back-cart{
display:block;
width:100%;
text-align:center;
padding:16px;
margin-top:15px;
border:2px solid #ff5a00;
color:#ff5a00;
font-weight:bold;
font-size:18px;
text-decoration:none;
border-radius:12px;
transition:.3s;
}

.back-cart:hover{
background:#ff5a00;
color:white;
}

/*==========================
 DELIVERY INFO
===========================*/

.delivery-card{
margin-top:25px;
padding-top:20px;
border-top:1px solid #ddd;
}

.delivery-card h3{
margin-bottom:15px;
color:#333;
}

.delivery-card p{
margin:10px 0;
color:#666;
font-size:16px;
}

/*==========================
 FOOTER
===========================*/

footer{
background:#1e1e1e;
color:white;
text-align:center;
padding:35px;
margin-top:60px;
}

footer h2{
margin-bottom:10px;
}

footer p{
color:#bfbfbf;
margin-top:8px;
}

/*==========================
 RESPONSIVE
===========================*/

@media(max-width:900px){

.checkout{
grid-template-columns:1fr;
}

.right{
position:relative;
top:0;
}

.row{
grid-template-columns:1fr;
}

nav{
padding:0 25px;
}

nav ul{
gap:15px;
}

.logo{
font-size:28px;
}

}

</style>

</head>

<body>

<nav>

<div class="logo">🍽 CraveNest</div>

<ul>

<li><a href="#">Home</a></li>

<li><a href="callRestaurantServlet">Restaurants</a></li>

<li><a href="Cart.jsp">Cart</a></li>

</ul>

</nav>

<div class="header">

<h1>Secure Checkout</h1>

<p>Complete your order by providing delivery details and selecting your preferred payment method.</p>

</div>

<div class="steps">

<div class="step active">Cart</div>

<div class="line"></div>

<div class="step active">Checkout</div>

<div class="line"></div>

<div class="step">Confirmation</div>

</div>

<div class="checkout">

<div class="left">

<form action="callOrderServlet" method="post">

<div class="card">

<h2>📍 Delivery Information</h2>

<div class="row">

<div class="form-group">

<label>Full Name</label>

<input
type="text"
name="fullName"
placeholder="Enter your full name"
required>

</div>

<div class="form-group">

<label>Phone Number</label>

<input
type="tel"
name="phone"
pattern="[0-9]{10}"
placeholder="Enter 10 digit mobile number"
required>

</div>

</div>

<div class="form-group">

<label>Email Address</label>

<input
type="email"
name="email"
placeholder="Enter email address"
required>

</div>

<div class="form-group">

<label>Delivery Address</label>

<textarea
name="address"
placeholder="House No, Street, Area, Landmark, City"
required></textarea>

</div>

<div class="row">

<div class="form-group">

<label>City</label>

<input
type="text"
name="city"
placeholder="Enter City"
required>

</div>

<div class="form-group">

<label>Pincode</label>

<input
type="text"
name="pincode"
pattern="[0-9]{6}"
placeholder="6 digit pincode"
required>

</div>

</div>

</div>
<!-- ==========================
     PAYMENT SECTION
=========================== -->

<div class="card">

    <h2>💳 Payment Method</h2>

    <label class="payment-box">
        <input type="radio" name="payment" value="Cash on Delivery" checked required>
        <span>💵 Cash on Delivery</span>
    </label>

    <label class="payment-box">
        <input type="radio" name="payment" value="UPI">
        <span>📱 UPI Payment</span>
    </label>

    <label class="payment-box">
        <input type="radio" name="payment" value="Credit Card">
        <span>💳 Credit Card</span>
    </label>

    <label class="payment-box">
        <input type="radio" name="payment" value="Debit Card">
        <span>💳 Debit Card</span>
    </label>

    <label class="payment-box">
        <input type="radio" name="payment" value="Net Banking">
        <span>🏦 Net Banking</span>
    </label>

    <label class="payment-box">
        <input type="radio" name="payment" value="Wallet">
        <span>👛 Wallet</span>
    </label>

</div>

<!-- ==========================
     COUPON
=========================== -->

<div class="card">

    <h2>🎁 Apply Coupon</h2>

    <div class="coupon">

        <input
        type="text"
        name="coupon"
        placeholder="Enter Coupon Code">

        <button
        type="button"
        class="apply-btn">
        Apply
        </button>

    </div>

</div>

</div>

<!-- ==========================
      RIGHT SIDE
=========================== -->

<div class="right">

<div class="summary">

<h2>🧾 Order Summary</h2>

<div class="summary-row">
<span>Item Total</span>
<span>₹ <%=itemTotal%></span>
</div>

<div class="summary-row">
<span>Delivery Fee</span>
<span>₹ <%=deliveryCharge%></span>
</div>

<div class="summary-row">
<span>GST</span>
<span>₹ <%=gst%></span>
</div>

<div class="summary-row">
<span>Discount</span>
<span style="color:green;">₹ 0</span>
</div>

<div class="summary-total">

<span>Total</span>

<span>₹ <%=grandTotal%></span>

</div>

<input
type="hidden"
name="grandTotal"
value="<%=grandTotal%>">

<button
type="submit"
class="place-order">

🍽 Place Order

</button>

<a
href="Cart.jsp"
class="back-cart">

← Back to Cart

</a>
<!-- ==========================
     DELIVERY INFORMATION
=========================== -->

<div class="delivery-card">

    <h3>🚚 Delivery Information</h3>

    <p>⏱ Estimated Delivery Time :
        <b>25 - 35 Minutes</b>
    </p>

    <p>✅ Your food will be prepared fresh after your order is confirmed.</p>

    <p>🛵 Delivery partner will contact you before arrival.</p>

    <p>📦 Safe & Hygienic Packaging Guaranteed.</p>

    <p>🔒 Secure Payment & Fast Checkout.</p>

    <p>❌ Free cancellation before restaurant starts preparing your order.</p>

</div>

<!-- ==========================
      ORDER NOTE
=========================== -->

<div class="delivery-card">

    <h3>📝 Order Note</h3>

    <p>

    • Please keep your phone reachable.

    </p>

    <p>

    • Cash on Delivery customers are requested to keep exact change if possible.

    </p>

    <p>

    • Your order status can be viewed after confirmation.

    </p>

</div>

<!-- ==========================
      WHY ORDER FROM US
=========================== -->

<div class="delivery-card">

    <h3>❤️ Why Choose CraveNest?</h3>

    <p>🍔 Freshly Prepared Meals</p>

    <p>⚡ Lightning Fast Delivery</p>

    <p>⭐ Highly Rated Restaurants</p>

    <p>🛡 100% Secure Payments</p>

    <p>😊 Trusted by Thousands of Customers</p>

</div>

<!-- ==========================
      CUSTOMER SUPPORT
=========================== -->

<div class="delivery-card">

    <h3>📞 Need Help?</h3>

    <p>Email : support@cravenest.com</p>

    <p>Phone : +91 98765 43210</p>

    <p>Available : 24 × 7 Customer Support</p>

</div>

</div>

</div>

</form>

</div>
<footer>

    <div style="width:90%;margin:auto;display:flex;justify-content:space-between;flex-wrap:wrap;gap:30px;">

        <div>

            <h2 style="color:#ff5a00;font-size:32px;">🍽 CraveNest</h2>

            <p style="margin-top:15px;line-height:28px;">
                Delicious food delivered at your doorstep.<br>
                Fresh Ingredients • Fast Delivery • Great Taste
            </p>

        </div>

        <div>

            <h3>Quick Links</h3>

            <p style="margin-top:15px;">
                <a href="#" style="color:#bfbfbf;text-decoration:none;">Home</a>
            </p>

            <p>
                <a href="callRestaurantServlet" style="color:#bfbfbf;text-decoration:none;">Restaurants</a>
            </p>

            <p>
                <a href="Cart.jsp" style="color:#bfbfbf;text-decoration:none;">My Cart</a>
            </p>

        </div>

        <div>

            <h3>Contact</h3>

            <p style="margin-top:15px;">📧 support@cravenest.com</p>

            <p>📞 +91 98765 43210</p>

            <p>📍 Hyderabad, India</p>

        </div>

    </div>

    <hr style="margin:35px 0;border:0;border-top:1px solid #444;">

    <p style="text-align:center;color:#999;">
        © 2026 CraveNest. All Rights Reserved.
    </p>

</footer>

<script>

// Highlight selected payment option
const paymentOptions = document.querySelectorAll(".payment-box");

paymentOptions.forEach(option => {

    option.addEventListener("click", function(){

        paymentOptions.forEach(box=>{

            box.style.border="2px solid #ececec";
            box.style.background="#fff";

        });

        this.style.border="2px solid #ff5a00";
        this.style.background="#fff6f1";

    });

});

// Coupon Button

const applyBtn=document.querySelector(".apply-btn");

if(applyBtn){

applyBtn.addEventListener("click",function(){

alert("Coupon feature will be available soon!");

});

}

</script>

</body>

</html>