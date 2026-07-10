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
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}

body{
    background:#f7f8fa;
    color:#333;
}

/*================ NAVBAR ================*/

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

nav ul{
    display:flex;
    list-style:none;
    gap:28px;
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

/*================ HEADER ================*/

.header{
    width:90%;
    margin:40px auto 25px;
}

.header h1{
    font-size:42px;
    color:#222;
    margin-bottom:10px;
}

.header p{
    color:#666;
    font-size:18px;
}

/*================ STEPS ================*/

.steps{
    width:90%;
    margin:30px auto 40px;
    display:flex;
    justify-content:center;
    align-items:center;
}

.step{
    background:#fff;
    padding:12px 28px;
    border-radius:30px;
    font-weight:600;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.step.active{
    background:#ff5a3c;
    color:#fff;
}

.line{
    width:90px;
    height:3px;
    background:#ddd;
}

/*================ LAYOUT ================*/

.checkout{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:35px;
    padding-bottom:60px;
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

/*================ CARD ================*/

.card{
    background:#fff;
    border-radius:20px;
    padding:30px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
    transition:.3s;
}

.card:hover{
    transform:translateY(-3px);
}

.card h2{
    margin-bottom:25px;
    color:#222;
}

/*================ FORM ================*/

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
    border:1px solid #ddd;
    border-radius:10px;
    background:#fafafa;
    font-size:15px;
    transition:.3s;
}

.form-group input:focus,
.form-group textarea:focus{
    outline:none;
    background:#fff;
    border-color:#ff5a3c;
    box-shadow:0 0 0 4px rgba(255,90,60,.15);
}

textarea{
    resize:none;
    height:120px;
}

.row{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

/*================ PAYMENT ================*/

.payment-box{
    display:flex;
    align-items:center;
    gap:15px;
    padding:18px;
    border:1px solid #ddd;
    border-radius:12px;
    margin-bottom:15px;
    cursor:pointer;
    transition:.3s;
}

.payment-box:hover{
    background:#fff6f3;
    border-color:#ff5a3c;
    transform:translateY(-2px);
}

.payment-box input{
    accent-color:#ff5a3c;
}

.payment-box span{
    font-weight:600;
}

/*================ COUPON ================*/

.coupon{
    display:flex;
    gap:15px;
}

.coupon input{
    flex:1;
}

.apply-btn{
    border:none;
    background:#222;
    color:#fff;
    padding:15px 25px;
    border-radius:10px;
    cursor:pointer;
    transition:.3s;
}

.apply-btn:hover{
    background:#000;
}

/*================ SUMMARY ================*/

.summary{
    background:#fff;
    padding:30px;
    border-radius:20px;
    border-top:5px solid #ff5a3c;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.summary h2{
    margin-bottom:25px;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    margin:18px 0;
    color:#555;
}

.summary-total{
    display:flex;
    justify-content:space-between;
    margin-top:25px;
    padding-top:20px;
    border-top:2px dashed #ddd;
    font-size:26px;
    font-weight:700;
    color:#ff5a3c;
}

/*================ BUTTONS ================*/

.place-order{
    width:100%;
    border:none;
    background:linear-gradient(135deg,#ff5a3c,#ff7b42);
    color:#fff;
    padding:16px;
    margin-top:25px;
    border-radius:12px;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.place-order:hover{
    transform:translateY(-3px);
    box-shadow:0 12px 28px rgba(255,90,60,.28);
}

.back-cart{
    display:block;
    text-align:center;
    margin-top:15px;
    padding:15px;
    border:2px solid #ff5a3c;
    color:#ff5a3c;
    border-radius:12px;
    text-decoration:none;
    font-weight:600;
    transition:.3s;
}

.back-cart:hover{
    background:#ff5a3c;
    color:#fff;
}

/*================ INFO BOXES ================*/

.delivery-card{
    margin-top:25px;
    padding-top:20px;
    border-top:1px solid #eee;
}

.delivery-card h3{
    margin-bottom:15px;
    color:#222;
}

.delivery-card p{
    color:#666;
    margin:10px 0;
    line-height:24px;
}

/*================ FOOTER ================*/

footer{
    margin-top:50px;
    background:#222;
    color:#fff;
    padding:45px 20px;
}

footer a{
    color:#bbb;
    text-decoration:none;
}

footer a:hover{
    color:#fff;
}

footer hr{
    border:none;
    border-top:1px solid #444;
    margin:35px 0;
}

/*================ RESPONSIVE ================*/

@media(max-width:900px){

.checkout{
    grid-template-columns:1fr;
}

.right{
    position:static;
}

.row{
    grid-template-columns:1fr;
}

nav{
    flex-direction:column;
    gap:20px;
    padding:20px;
}

nav ul{
    gap:18px;
}

.header,
.steps,
.checkout{
    width:94%;
}

.header h1{
    font-size:34px;
}

}
</style>

</head>

<body>

<nav>

<div class="logo">🍽 QuickBite</div>

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